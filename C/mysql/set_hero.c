#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <mysql.h>

void instructions(void);
void dispatch(char*, MYSQL*, char*);
void set_name(char*, MYSQL*, char*);
void set_BasicAttributes(char*, MYSQL*, char*, char*);
void set_Secondaries(char*, MYSQL*, char*, char*);

void calc_Thrust(char*, MYSQL*);
void Thrust_1(int, MYSQL*, char*);
void Thrust_2(int, MYSQL*, char*);
void Thrust_3(int, MYSQL*, char*);
void Thrust_4(int, MYSQL*, char*);
void Thrust_5(int, MYSQL*, char*);
void Thrust_6(int, MYSQL*, char*);
void update_Thrust(char*, char*, MYSQL*);

// ***************************************************************************************
int main (int argc, char* argv[]) {
	if ((argc <= 2)
	| (argc > 3)) {
		instructions();
		return 0; }

	// ********** Database
	MYSQL *conn;
	if (!(conn = mysql_init(0))) {
		fprintf(stderr, "unable to initialize connection struct\n");
		exit(1); }

	if (!mysql_real_connect(
		conn,        // Connection
		"localhost", // Host
		"ayeka",     // User account
		"",          // User password
		"GURPS",     // Default database
		3306,        // Port number
		NULL,        // Path to socket file
		0            // Additional options
		)) {
		fprintf(stderr, "Error connecting to Server: %s\n", mysql_error(conn));
		mysql_close(conn);
		exit(1); }


	// ********** File reading
	char buffer[256];
	FILE *fp = fopen(argv[1], "r");
	if (fp == NULL) {
		instructions();
		fclose(fp);
		return 0; }

	while (fgets(buffer, 256, fp) != NULL) {
		dispatch(buffer, conn, argv[2]); }

	calc_Thrust(argv[2], conn);

	// ********** Closing
	fclose(fp);
	mysql_close(conn);
	return 0; }
	
// =======================================================================================
void calc_Thrust(char* id, MYSQL* conn) {
	char stmt[512];
	sprintf(stmt, "SELECT"
		" JSON_VALUE(Definition,"
		" '$.\"basic attributes\".\"ST\"')"
		" from TheWorld"
		" where Id = %s", id);
	if (mysql_query(conn, stmt)) {
		puts("error reading ST");
		return; }
	MYSQL_RES *result = mysql_store_result(conn);
	if (result == NULL) {
		puts("Null result");
		return; }
	MYSQL_ROW row = mysql_fetch_row(result);
	int val = atoi(row[0]);

	if ((val >= 1) & (val <= 18)) {
		Thrust_1(val, conn, id);
		return; }
	if ((val >= 19) & (val <= 34)) {
		Thrust_2(val, conn, id);
		return; }
	if ((val >= 35) & (val <= 44)) {
		Thrust_3(val, conn, id);
		return; }
	if ((val >= 45) & (val <= 59)) {
		Thrust_4(val, conn, id);
		return; }
	if ((val >= 60) & (val <= 109)) {
		Thrust_5(val, conn, id);
		return; }
	if (val >= 110) {
		Thrust_6(val, conn, id);
		return; }
}

// ---------------------------------------------------------------------------------------
void Thrust_6(int val, MYSQL* conn, char* id) {
	char dice[80];
	int num = trunc(val / 10) + 1;
	sprintf(dice, "%dd", num);

	update_Thrust(dice, id, conn); }

// ---------------------------------------------------------------------------------------
void Thrust_5(int val, MYSQL* conn, char* id) {
	char dice[80];
	int num = trunc(val / 10) + 1;
	int modifier = 0;
	if ((val >= 60) & (val <= 64))
		modifier = -1;
	if ((val >= 65) & (val <= 69))
		modifier = 1;
	if (((val >= 75) & (val <= 79))
		| ((val >= 85) & (val <= 89))
		| ((val >= 95) & (val <= 99)))
		modifier = 2;

	if (modifier < 0)
		sprintf(dice, "%dd%d", num, modifier);
	if (modifier == 0)
		sprintf(dice, "%dd", num);
	if (modifier > 0)
		sprintf(dice, "%dd+%d", num, modifier);

	update_Thrust(dice, id, conn); }

// ---------------------------------------------------------------------------------------
void Thrust_4(int val, MYSQL* conn, char* id) {
	char dice[80];
	if ((val >= 45) & (val <= 49))
		strcpy(dice, "5d");
	if ((val >= 50) & (val <= 54))
		strcpy(dice, "5d+2");
	if ((val >= 55) & (val <= 59))
		strcpy(dice, "6d");
		
	update_Thrust(dice, id, conn); }

// ---------------------------------------------------------------------------------------
void Thrust_3(int val, MYSQL* conn, char* id) {
	char dice[80];
	if ((val == 35) | (val == 36))
		strcpy(dice, "4d-1");
	if ((val == 37) | (val == 38))
		strcpy(dice, "4d");
	if ((val >= 39) & (val < 45))
		strcpy(dice, "4d+1");

	update_Thrust(dice, id, conn); }

// ---------------------------------------------------------------------------------------
void Thrust_2(int val, MYSQL* conn, char* id) {
	char dice[80];
	int num = 2;
	if (val >= 27) num = 3;
	int modifier = round(val / 2.0) - 11;
	if (val >= 27) modifier = modifier - 4;
	if (modifier < 0)
		sprintf(dice, "%dd%d", num, modifier);
	if (modifier == 0)
		sprintf(dice, "%dd", num);
	if (modifier > 0)
		sprintf(dice, "%dd+%d", num, modifier);

	update_Thrust(dice, id, conn); }

// ---------------------------------------------------------------------------------------
void Thrust_1(int val, MYSQL* conn, char* id) {
	char dice[80];
	int modifier = round(val / 2.0) - 7;
	if (modifier < 0)
		sprintf(dice, "1d%d", modifier);
	if (modifier == 0)
		sprintf(dice, "1d");
	if (modifier > 0)
		sprintf(dice, "1d+%d", modifier);

	update_Thrust(dice, id, conn); }

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
void update_Thrust(char* dice, char* id, MYSQL* conn) {
	char stmt[512];
	sprintf(stmt, "UPDATE TheWorld"
		" SET Definition = JSON_REPLACE(Definition,"
		" '$.\"secondary characteristics\".\"damage\".\"thrust\"',"
		" \"%s\")"
		" where Id = %s", dice, id);
	if (mysql_query(conn, stmt))
		puts("error thrust"); }

// =======================================================================================
void dispatch(char* line, MYSQL* conn, char* id) {
	if (strspn(line, "-n") == 2) {
		set_name(&line[3], conn, id);
		return; }

	if (strspn(line, "-ST") == 3) {
		set_BasicAttributes(&line[3], conn, id, "ST");
		return; }
	if (strspn(line, "-DX") == 3) {
		set_BasicAttributes(&line[3], conn, id, "DX");
		return; }
	if (strspn(line, "-IQ") == 3) {
		set_BasicAttributes(&line[3], conn, id, "IQ");
		return; }
	if (strspn(line, "-HT") == 3) {
		set_BasicAttributes(&line[3], conn, id, "HT");
		return; }

	if (strspn(line, "-HP") == 3) {
		set_Secondaries(&line[3], conn, id, "HP");
		return; }
	if (strspn(line, "-FP") == 3) {
		set_Secondaries(&line[3], conn, id, "FP");
		return; }
	if (strspn(line, "-Will") == 5) {
		set_Secondaries(&line[5], conn, id, "Will");
		return; }
	if (strspn(line, "-Per") == 4) {
		set_Secondaries(&line[4], conn, id, "Per");
		return; }}

// ---------------------------------------------------------------------------------------
void set_Secondaries(char* val, MYSQL* conn, char* id, char* attr) {
	int x = atoi(val);
	char stmt[512];
	sprintf(stmt, "UPDATE TheWorld"
		" SET Definition = JSON_REPLACE(Definition,"
		" '$.\"secondary characteristics\".\"%s\"', %d)"
		" where Id = %s", attr, x, id);
	if (mysql_query(conn, stmt))
		puts("error setting Secondary Characteristics"); }

// ---------------------------------------------------------------------------------------
void set_BasicAttributes(char* val, MYSQL* conn, char* id, char* attr) {
	int x = atoi(val);
	char stmt[512];
	sprintf(stmt, "UPDATE TheWorld"
		" SET Definition = JSON_REPLACE(Definition,"
		" '$.\"basic attributes\".\"%s\"', %d)"
		" where Id = %s", attr, x, id);
	if (mysql_query(conn, stmt))
		puts("error setting Basic Attributes"); }

// ---------------------------------------------------------------------------------------
void set_name(char* val, MYSQL* conn, char* id) {
	char name[160];
	for (int i=0; i<160; ++i) name[i] = 0;
	int len = strlen(val) - 1;  // removing newline
	strncpy(name, val, len);

	char stmt[512];
	sprintf(stmt, "update TheWorld set Name = '%s' where Id = %s", name, id);
	if (mysql_query(conn, stmt))
		puts("error UPDATEing"); }

// ***************************************************************************************
void instructions() {
	puts("set_hero   file.conf   Id");
	puts("");
}
