#include <stdio.h>
#include <stdlib.h>
#include <mysql.h>

void instructions(void);

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

	mysql_close(conn);

	return 0; }

// =======================================================================================
// ***************************************************************************************
void instructions() {
	puts("cookiecut_hero   \"name\"");
	puts("");
}
