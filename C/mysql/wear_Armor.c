#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <mysql.h>

void instructions(void);
MYSQL* open_DB();
void don_Armor(MYSQL*, int, int);
int don_Armor1(MYSQL*, int, int);
void don_Armor2(MYSQL*, int, int);

// ***************************************************************************************
int main (int argc, char* argv[]) {
	if ((argc == 1)
	| (argc > 3)) {
		instructions();
		return 0; }

	int HeroID = atoi(argv[1]);
	int ArmorID = atoi(argv[2]);

	MYSQL* conn = 	open_DB();
	don_Armor(conn, HeroID, ArmorID);

	





	mysql_close(conn);
	return 0; }

// ***************************************************************************************
void don_Armor(MYSQL* conn, int HeroID, int ArmorID) {
	// check if ArmorID already exists
	if (don_Armor1(conn, HeroID, ArmorID) == 0)
		don_Armor2(conn, HeroID, ArmorID);

	// insert ArmorID to the armors array
	char stmt[256];
	sprintf(stmt, "update TheWorld set Definition = json_array_append( Definition,"
		" '$.\"armors\"',"
		" %d)"
		" where Id = %d"
	, ArmorID, HeroID);

	if (mysql_query(conn, stmt))
		puts("error UPDATEing");
}

// =======================================================================================
void don_Armor2(MYSQL* conn, int HeroID, int ArmorID) {
	// insert armor data


}

// =======================================================================================
int don_Armor1(MYSQL* conn, int HeroID, int ArmorID) {
	// is Hero wearing another
	char stmt[256];
	sprintf(stmt, "select json_search(bar.foo, 'one', %d) from"
		" (select json_extract(Definition, '$.armors' ) foo"
		" from TheWorld where Id = %d) bar"
		, ArmorID, HeroID);
	if (mysql_query(conn, stmt)) {
		puts("error SELECTing");
      return 0; }

	MYSQL_RES *result = mysql_store_result(conn);
	MYSQL_ROW row;
	if (result == NULL) {
		puts("error RESULT");
		return -1; }

	row = mysql_fetch_row(result);
	if (row[0] == NULL)
		return 0;
	else
		return 1; }

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
	puts("wear_Armor   HeroID   ArmorID");
	puts("");
}
