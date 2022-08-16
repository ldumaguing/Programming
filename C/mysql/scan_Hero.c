#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <mysql.h>

void instructions(void);
MYSQL* open_DB();
void default_scan(MYSQL*, int);
void opt_wearing(MYSQL*, int);
void opt_wearing1(MYSQL*, int);
void opt_rearrange(MYSQL*, int, char**);

// ***************************************************************************************
int main (int argc, char* argv[]) {
	if (argc == 1) {
		instructions();
		return 0; }

	MYSQL* conn = open_DB();
	int HeroID = atoi(argv[1]);
	if (HeroID <= 0) return 0;
	if (argc == 2) {
		default_scan(conn, HeroID);
		mysql_close(conn);
		return 0;}


	char option[512];
	sprintf(option, "%s", argv[2]);

	if (strcmp(option, "wearing") == 0) {
		opt_wearing(conn, HeroID); }

	if (strcmp(option, "rearrange") == 0) {
		opt_rearrange(conn, HeroID, argv); }
		



	mysql_close(conn);
	return 0; }

// ***************************************************************************************
void opt_rearrange(MYSQL* conn, int HeroID, char* argv[]) {
	int lay1 = atoi(argv[3]);
	int lay2 = atoi(argv[4]);
	char stmt[256];
	// ********** get array length
	sprintf(stmt, "SELECT JSON_LENGTH(Definition,"
		" '$.\"armors\"') from TheWorld where Id = %d"
	, HeroID);

	if (mysql_query(conn, stmt)) {
		puts("error SELECTing");
		return; }

	MYSQL_RES *result = mysql_store_result(conn);
	if (result == NULL) puts("result is null");
	MYSQL_ROW row;
	if (result == NULL) {
		puts("error RESULT");
		return; }
	row = mysql_fetch_row(result);
	int len = atoi(row[0]);        // <----------- len
	if (len <= 1) return;

	int bigNum = (lay1 > lay2) ? lay1 : lay2;
	printf("big: %d .. %d\n", bigNum, len);
	if (len > bigNum) return;
	
	
	
	
	
}

// ***************************************************************************************
void opt_wearing(MYSQL* conn, int HeroID) {
	char stmt[256];
	// ********** get array length
	sprintf(stmt, "SELECT JSON_LENGTH(Definition,"
		" '$.\"armors\"') from TheWorld where Id = %d"
	, HeroID);

	if (mysql_query(conn, stmt)) {
		puts("error SELECTing");
		return; }

	MYSQL_RES *result = mysql_store_result(conn);
	if (result == NULL) puts("result is null");
	MYSQL_ROW row;
	if (result == NULL) {
		puts("error RESULT");
		return; }
	row = mysql_fetch_row(result);
	int len = atoi(row[0]);

	// ********** get ArmorIDs
	int ArmorID;
	for (int i=0; i<len; ++i) {
		sprintf(stmt, "SELECT JSON_VALUE(Definition, '$.\"armors\"[%d]')"
		" from TheWorld where Id = %d"
		, i, HeroID);

		if (mysql_query(conn, stmt)) {
			puts("error loop SELECTing");
			exit(0); }

		result = mysql_store_result(conn);
		if (result == NULL) {
			puts("error RESULT");
			return; }
		row = mysql_fetch_row(result);
		ArmorID = atoi(row[0]);
		printf("Layer %d: ", i + 1);
		opt_wearing1(conn, ArmorID);
		}}

// =======================================================================================
void opt_wearing1(MYSQL* conn, int ArmorID) {
	char stmt[256];
	// ********** show detail
	sprintf(stmt, "select Name, json_query(Definition, '$.\"Locations\"'),"
		" json_value(Definition, '$.\"DR\"'),"
		" json_value(Definition, '$.\"Weight\"')"
		" from Stuffs where Id = %d"
	, ArmorID);

	if (mysql_query(conn, stmt)) {
		puts("error SELECTing");
		return; }

	MYSQL_RES *result = mysql_store_result(conn);
	if (result == NULL) puts("result is null");
	MYSQL_ROW row;
	if (result == NULL) {
		puts("error RESULT");
		return; }
	row = mysql_fetch_row(result);
	printf("%s\t%s\tDR:%s\t%s lbs.\n", row[0], row[1], row[2], row[3]); }

// ***************************************************************************************
void default_scan(MYSQL* conn, int HeroID) {
	char stmt[512];
	sprintf(stmt, "select Id, Name, json_detailed(Definition) Hero "
		" from TheWorld where Id = %d", HeroID);

	if (mysql_query(conn, stmt)) {
		puts("error SELECTing");
		return; }

	MYSQL_RES *result = mysql_store_result(conn);
	if (result == NULL) puts("result is null");
	MYSQL_ROW row;
	if (result == NULL) {
		puts("error RESULT");
		return; }
	row = mysql_fetch_row(result);
	puts("***********************************************************");
	printf("***** %s\n", row[1]);
	puts("***********************************************************");
	puts(row[2]); }

// ***************************************************************************************
MYSQL* open_DB() {
	MYSQL* conn;
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
		
		return conn; }

// ***************************************************************************************
void instructions() {
	puts("scan_Hero   HeroID   [what]");
	puts("   [what]:");
	puts("    wearing");
	puts("    rearrange   layer1   layer2");
	puts("");
}








