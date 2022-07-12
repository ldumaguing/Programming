#include <stdio.h>
#include <stdlib.h>
#include <mysql.h>

int main (int argc, char* argv[])
{

   // Initialize Connection
   MYSQL *conn;
   if (!(conn = mysql_init(0)))
   {
      fprintf(stderr, "unable to initialize connection struct\n");
      exit(1);
   }

//   char* cafile = "/path/to/skysql_chain.pem";

   // Configure the TLS Certificate Authority. This may vary by hosting provider!
//   mysql_optionsv(conn, MYSQL_OPT_SSL_CA, cafile);

   // Connect to the database
   if (!mysql_real_connect(
         conn,                 // Connection
         "lxocalhost", // Host
         "root",            // User account
         "",   // User password
         "GURPS",               // Default database
         3306,                 // Port number
         NULL,                 // Path to socket file
         0                     // Additional options
      ))
   {
      // Report the failed-connection error & close the handle
      fprintf(stderr, "Error connecting to Server: %s\n", mysql_error(conn));
      mysql_close(conn);
      exit(1);
   }

   // Use the Connection
   // ...

   // Close the Connection
   mysql_close(conn);

   return 0;
}
