#include <stdio.h>
#include <stdlib.h>
#include <mysql.h>

void instructions(void);
void create_instance(MYSQL *, char *);
void fill_it(MYSQL*, int);

// ***************************************************************************************
int main (int argc, char* argv[]) {
	if ((argc == 1)
	| (argc > 2)) {
		instructions();
		return 0; }

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

	create_instance(conn, argv[1]);
	mysql_close(conn);

	return 0; }

// =======================================================================================
void create_instance(MYSQL* conn, char* name) {
	char stmt[256];
	int i = 0;

	for (i = 0; i < 20; i++) {
		sprintf(stmt, "insert into TheWorld (Id, Name, Tags) values (%d, '%s', '{}')", i, name);
		if (mysql_query(conn, stmt))
			continue;
		else {
			fill_it(conn, i);
			return; }}}

// ---------------------------------------------------------------------------------------
void fill_it(MYSQL* conn, int i) {
	if (mysql_query(conn, "select Definition from Stuffs where ClassType = 'Humanoid'")) {
		puts("error SELECTing");
      return; }

	MYSQL_RES *result = mysql_store_result(conn);
	MYSQL_ROW row;
	if (result == NULL) {
		puts("error RESULT");
		return; }

	row = mysql_fetch_row(result);
	char Definition[5280];  // 80 * 66 (1 page)
	sprintf(Definition, "update TheWorld set Definition = '%s' where Id = %d", row[0], i);
	if (mysql_query(conn, Definition))
		puts("error UPDATEing");

	sprintf(Definition, "update TheWorld set ClassType = 'Humanoid' where Id = %d", i);
	if (mysql_query(conn, Definition))
		puts("error UPDATEing");

	mysql_free_result(result); }

// ***************************************************************************************
void instructions() {
	puts("cookiecut_Hero   \"name\"");
	puts("");
}
















