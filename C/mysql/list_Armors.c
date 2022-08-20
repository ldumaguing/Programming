#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <mysql.h>

void instructions(void);

// ***************************************************************************************
int main (int argc, char* argv[]) {
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


	// ********** SELECT
	char stmt[512];
	sprintf(stmt, "select Id, Name, "
		" json_query(Definition, '$.\"Locations\"') Protect"
		" from Stuffs where ClassType = 'Armor'");
	if (mysql_query(conn, stmt)) {
		puts("error SELECTing");
		exit(1); }
	MYSQL_RES *result = mysql_store_result(conn);
	MYSQL_ROW row;
	while((row = mysql_fetch_row(result)) != NULL) {
		printf("%s %s\n\t%s\n", row[0], row[1], row[2]); }


	// ********** Closing
	mysql_close(conn);
	return 0; }


