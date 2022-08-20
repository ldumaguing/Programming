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
void fix_Secondaries(MYSQL*, char*, char*);
void fix_Secondaries_1(MYSQL*, char*, char*, char*);

void set_Damage(MYSQL*, char*);
void set_BL(MYSQL*, char*);
void set_Speed(MYSQL*, char*);
void set_Move(MYSQL*, char*);
void set_Dodge(MYSQL*, char*);

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

	set_Damage(conn, argv[2]);
	set_BL(conn, argv[2]);
	set_Speed(conn, argv[2]);
	set_Move(conn, argv[2]);
	set_Dodge(conn, argv[2]);

	// ********** Closing
	fclose(fp);
	mysql_close(conn);
	return 0; }

// ***************************************************************************************
void set_Dodge(MYSQL* conn, char* id) {
	char stmt[512];
	// ********** get HT
	char baseAttr[] = "HT";
	sprintf(stmt, "SELECT"
		" JSON_VALUE(Definition,"
		" '$.\"basic attributes\".\"%s\"')"
		" from TheWorld"
		" where Id = %s", baseAttr, id);
	if (mysql_query(conn, stmt)) {
		puts("error reading basic attribute");
		return; }
	MYSQL_RES *result = mysql_store_result(conn);
	if (result == NULL) {
		puts("Null result");
		return; }
	MYSQL_ROW row = mysql_fetch_row(result);
	int HT_val = atoi(row[0]);


	// ********** get DX
	char baseAttr1[] = "DX";
	sprintf(stmt, "SELECT"
		" JSON_VALUE(Definition,"
		" '$.\"basic attributes\".\"%s\"')"
		" from TheWorld"
		" where Id = %s", baseAttr1, id);
	if (mysql_query(conn, stmt)) {
		puts("error reading basic attribute");
		return; }
	result = mysql_store_result(conn);
	if (result == NULL) {
		puts("Null result");
		return; }
	row = mysql_fetch_row(result);
	int DX_val = atoi(row[0]);


	// ********** 
	char cmd[128];
	sprintf(cmd, "./calc_BasicMove %d %d", HT_val, DX_val);
	FILE* fp;
	char path[128];
	fp = popen(cmd, "r");
	if (fp == NULL) return;

	char bl[128];
	while (fgets(path, 128, fp) != NULL)
		sprintf(bl, "%s", path);
	pclose(fp);

	int lift = atoi(bl);
	sprintf(stmt, "UPDATE TheWorld"
		" SET Definition = JSON_REPLACE(Definition,"
		" '$.\"secondary characteristics\".\"dodge\"', %d)"
		" where Id = %s", lift + 3, id);
	if (mysql_query(conn, stmt))
		puts("error setting Speed"); }

// ***************************************************************************************
void set_Move(MYSQL* conn, char* id) {
	char stmt[512];
	char attr[] = "basic move";
	sprintf(stmt, "SELECT"
		" JSON_VALUE(Definition,"
		" '$.\"secondary characteristics\".\"%s\"')"
		" from TheWorld"
		" where Id = %s", attr, id);
	if (mysql_query(conn, stmt)) {
		puts("error reading secondary characteristic");
		return; }
	MYSQL_RES *result = mysql_store_result(conn);
	if (result == NULL) {
		puts("Null result");
		return; }
	MYSQL_ROW row = mysql_fetch_row(result);
	int val = atoi(row[0]);
	
	if (val != 0) return;
	
	// ********** get HT
	char baseAttr[] = "HT";
	sprintf(stmt, "SELECT"
		" JSON_VALUE(Definition,"
		" '$.\"basic attributes\".\"%s\"')"
		" from TheWorld"
		" where Id = %s", baseAttr, id);
	if (mysql_query(conn, stmt)) {
		puts("error reading basic attribute");
		return; }
	result = mysql_store_result(conn);
	if (result == NULL) {
		puts("Null result");
		return; }
	row = mysql_fetch_row(result);
	int HT_val = atoi(row[0]);


	// ********** get DX
	char baseAttr1[] = "DX";
	sprintf(stmt, "SELECT"
		" JSON_VALUE(Definition,"
		" '$.\"basic attributes\".\"%s\"')"
		" from TheWorld"
		" where Id = %s", baseAttr1, id);
	if (mysql_query(conn, stmt)) {
		puts("error reading basic attribute");
		return; }
	result = mysql_store_result(conn);
	if (result == NULL) {
		puts("Null result");
		return; }
	row = mysql_fetch_row(result);
	int DX_val = atoi(row[0]);


	// ********** 
	char cmd[128];
	sprintf(cmd, "./calc_BasicMove %d %d", HT_val, DX_val);
	FILE* fp;
	char path[128];
	fp = popen(cmd, "r");
	if (fp == NULL) return;

	char bl[128];
	while (fgets(path, 128, fp) != NULL)
		sprintf(bl, "%s", path);
	pclose(fp);

	int lift = atoi(bl);
	sprintf(stmt, "UPDATE TheWorld"
		" SET Definition = JSON_REPLACE(Definition,"
		" '$.\"secondary characteristics\".\"basic move\"', %d)"
		" where Id = %s", lift, id);
	if (mysql_query(conn, stmt))
		puts("error setting Speed"); }

// ***************************************************************************************
void set_Speed(MYSQL* conn, char* id) {
	char stmt[512];
	char attr[] = "basic speed";
	sprintf(stmt, "SELECT"
		" JSON_VALUE(Definition,"
		" '$.\"secondary characteristics\".\"%s\"')"
		" from TheWorld"
		" where Id = %s", attr, id);
	if (mysql_query(conn, stmt)) {
		puts("error reading secondary characteristic");
		return; }
	MYSQL_RES *result = mysql_store_result(conn);
	if (result == NULL) {
		puts("Null result");
		return; }
	MYSQL_ROW row = mysql_fetch_row(result);
	int val = atoi(row[0]);
	
	if (val != 0) return;
	
	// ********** get HT
	char baseAttr[] = "HT";
	sprintf(stmt, "SELECT"
		" JSON_VALUE(Definition,"
		" '$.\"basic attributes\".\"%s\"')"
		" from TheWorld"
		" where Id = %s", baseAttr, id);
	if (mysql_query(conn, stmt)) {
		puts("error reading basic attribute");
		return; }
	result = mysql_store_result(conn);
	if (result == NULL) {
		puts("Null result");
		return; }
	row = mysql_fetch_row(result);
	int HT_val = atoi(row[0]);


	// ********** get DX
	char baseAttr1[] = "DX";
	sprintf(stmt, "SELECT"
		" JSON_VALUE(Definition,"
		" '$.\"basic attributes\".\"%s\"')"
		" from TheWorld"
		" where Id = %s", baseAttr1, id);
	if (mysql_query(conn, stmt)) {
		puts("error reading basic attribute");
		return; }
	result = mysql_store_result(conn);
	if (result == NULL) {
		puts("Null result");
		return; }
	row = mysql_fetch_row(result);
	int DX_val = atoi(row[0]);


	// ********** 
	char cmd[128];
	sprintf(cmd, "./calc_BasicSpeed %d %d", HT_val, DX_val);
	FILE* fp;
	char path[128];
	fp = popen(cmd, "r");
	if (fp == NULL) return;

	char bl[128];
	while (fgets(path, 128, fp) != NULL)
		sprintf(bl, "%s", path);
	pclose(fp);

	double lift = atof(bl);
	sprintf(stmt, "UPDATE TheWorld"
		" SET Definition = JSON_REPLACE(Definition,"
		" '$.\"secondary characteristics\".\"basic speed\"', %.2f)"
		" where Id = %s", lift, id);
	if (mysql_query(conn, stmt))
		puts("error setting Speed"); }

// ***************************************************************************************
void set_BL(MYSQL* conn, char* id) {
	char stmt[512];
	char attr[] = "basic lift";
	sprintf(stmt, "SELECT"
		" JSON_VALUE(Definition,"
		" '$.\"secondary characteristics\".\"%s\"')"
		" from TheWorld"
		" where Id = %s", attr, id);
	if (mysql_query(conn, stmt)) {
		puts("error reading secondary characteristic");
		return; }
	MYSQL_RES *result = mysql_store_result(conn);
	if (result == NULL) {
		puts("Null result");
		return; }
	MYSQL_ROW row = mysql_fetch_row(result);
	int val = atoi(row[0]);
	
	if (val != 0) return;
	
	// ********** get ST
	char baseAttr[] = "ST";
	sprintf(stmt, "SELECT"
		" JSON_VALUE(Definition,"
		" '$.\"basic attributes\".\"%s\"')"
		" from TheWorld"
		" where Id = %s", baseAttr, id);
	if (mysql_query(conn, stmt)) {
		puts("error reading basic attribute");
		return; }
	result = mysql_store_result(conn);
	if (result == NULL) {
		puts("Null result");
		return; }
	row = mysql_fetch_row(result);
	val = atoi(row[0]);


	// ********** 
	char cmd[128];
	sprintf(cmd, "./calc_BasicLift %d", val);
	FILE* fp;
	char path[128];
	fp = popen(cmd, "r");
	if (fp == NULL) return;

	char bl[128];
	while (fgets(path, 128, fp) != NULL)
		sprintf(bl, "%s", path);
	pclose(fp);

	double lift = atof(bl);
	sprintf(stmt, "UPDATE TheWorld"
		" SET Definition = JSON_REPLACE(Definition,"
		" '$.\"secondary characteristics\".\"basic lift\"', %.1f)"
		" where Id = %s", lift, id);
	if (mysql_query(conn, stmt))
		puts("error setting Swing"); }

// ***************************************************************************************
void set_Damage(MYSQL* conn, char* id){
	char stmt[512];
	char baseAttr[] = "ST";
	sprintf(stmt, "SELECT"
		" JSON_VALUE(Definition,"
		" '$.\"basic attributes\".\"%s\"')"
		" from TheWorld"
		" where Id = %s", baseAttr, id);
	if (mysql_query(conn, stmt)) {
		puts("error reading basic attribute");
		return; }
	MYSQL_RES *result = mysql_store_result(conn);
	if (result == NULL) {
		puts("Null result");
		return; }
	MYSQL_ROW row = mysql_fetch_row(result);
	int val = atoi(row[0]);

	// ********** Swing
	char cmd[128];
	sprintf(cmd, "./calc_Swing %d", val);
	FILE* fp;
	char path[128];
	fp = popen(cmd, "r");
	if (fp == NULL) return;

	char dice[128];
	while (fgets(path, 128, fp) != NULL)
		sprintf(dice, "%s", path);
	pclose(fp);
	dice[strlen(dice) - 1] = 0;

	sprintf(stmt, "UPDATE TheWorld"
		" SET Definition = JSON_REPLACE(Definition,"
		" '$.\"secondary characteristics\".\"damage\".\"swing\"', \"%s\")"
		" where Id = %s", dice, id);
	if (mysql_query(conn, stmt))
		puts("error setting Swing");

	// ********** Thrust
	sprintf(cmd, "./calc_Thrust %d", val);
	fp = popen(cmd, "r");
	if (fp == NULL) return;

	while (fgets(path, 128, fp) != NULL)
		sprintf(dice, "%s", path);
	pclose(fp);
	dice[strlen(dice) - 1] = 0;

	sprintf(stmt, "UPDATE TheWorld"
		" SET Definition = JSON_REPLACE(Definition,"
		" '$.\"secondary characteristics\".\"damage\".\"thrust\"', \"%s\")"
		" where Id = %s", dice, id);
	if (mysql_query(conn, stmt))
		puts("error setting Swing"); }

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
		fix_Secondaries(conn, id, "HP");
		return; }
	if (strspn(line, "-FP") == 3) {
		set_Secondaries(&line[3], conn, id, "FP");
		fix_Secondaries(conn, id, "FP");
		return; }
	if (strspn(line, "-Will") == 5) {
		set_Secondaries(&line[5], conn, id, "Will");
		fix_Secondaries(conn, id, "Will");
		return; }
	if (strspn(line, "-Per") == 4) {
		set_Secondaries(&line[4], conn, id, "Per");
		fix_Secondaries(conn, id, "Per");
		return; }
	if (strspn(line, "-lift") == 5) {
		set_Secondaries(&line[5], conn, id, "basic lift");
		return; }
	if (strspn(line, "-speed") == 6) {
		set_Secondaries(&line[6], conn, id, "basic speed");
		return; }
	if (strspn(line, "-move") == 5) {
		set_Secondaries(&line[5], conn, id, "basic move");
		return; }}

// ---------------------------------------------------------------------------------------
void fix_Secondaries(MYSQL* conn, char* id, char* attr) {
	if (mysql_query(conn, "COMMIT"))
		puts("error commiting");

	char stmt[512];
	sprintf(stmt, "SELECT"
		" JSON_VALUE(Definition,"
		" '$.\"secondary characteristics\".\"%s\"')"
		" from TheWorld"
		" where Id = %s", attr, id);
	if (mysql_query(conn, stmt)) {
		puts("error reading secondary characteristic");
		return; }
	MYSQL_RES *result = mysql_store_result(conn);
	if (result == NULL) {
		puts("Null result");
		return; }
	MYSQL_ROW row = mysql_fetch_row(result);
	int val = atoi(row[0]);


	if (val <= 0) {
		if (strcmp(attr, "Will") == 0) fix_Secondaries_1(conn, id, "Will", "IQ");
		if (strcmp(attr, "Per") == 0) fix_Secondaries_1(conn, id, "Per", "IQ");
		if (strcmp(attr, "HP") == 0) fix_Secondaries_1(conn, id, "HP", "ST");
		if (strcmp(attr, "FP") == 0) fix_Secondaries_1(conn, id, "FP", "HT"); }}

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
void fix_Secondaries_1(MYSQL* conn, char* id, char* ndChar, char* baseAttr) {
	char stmt[512];
	sprintf(stmt, "SELECT"
		" JSON_VALUE(Definition,"
		" '$.\"basic attributes\".\"%s\"')"
		" from TheWorld"
		" where Id = %s", baseAttr, id);
	if (mysql_query(conn, stmt)) {
		puts("error reading basic attribute");
		return; }
	MYSQL_RES *result = mysql_store_result(conn);
	if (result == NULL) {
		puts("Null result");
		return; }
	MYSQL_ROW row = mysql_fetch_row(result);
	int val = atoi(row[0]);


	sprintf(stmt, "UPDATE TheWorld"
		" SET Definition = JSON_REPLACE(Definition,"
		" '$.\"secondary characteristics\".\"%s\"', %d)"
		" where Id = %s", ndChar, val, id);
	if (mysql_query(conn, stmt))
		puts("error setting Basic Attributes"); }

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
	puts("set_Hero   file.conf   Id");
	puts("");
}
