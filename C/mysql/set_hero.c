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


	// ********** Closing
	fclose(fp);
	mysql_close(conn);
	return 0; }

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
