#include <stdio.h>
#include <stdlib.h>

int main() {
   printf("Content-type: text/plain\n\n");
// printf("%s\n", getenv("AUTH_TYPE"));
// printf("%s\n", getenv("CONTENT_LENGTH"));
// printf("%s\n", getenv("CONTENT_TYPE"));
printf("%s\n", getenv("DOCUMENT_ROOT"));
printf("%s\n", getenv("GATEWAY_INTERFACE"));
printf("%s\n", getenv("HTTP_ACCEPT"));
// printf("%s\n", getenv("HTTP_COOKIE"));
// printf("%s\n", getenv("HTTP_FROM"));
// printf("%s\n", getenv("HTTP_REFERER"));
printf("%s\n", getenv("HTTP_USER_AGENT"));
// printf("%s\n", getenv("PATH_INFO"));
// printf("%s\n", getenv("PATH_TRANSLATED"));
printf("%s\n", getenv("QUERY_STRING"));
printf("%s\n", getenv("REMOTE_ADDR"));
// printf("%s\n", getenv("REMOTE_HOST"));
// printf("%s\n", getenv("REMOTE_IDENT"));
// printf("%s\n", getenv("REMOTE_USER"));
printf("%s\n", getenv("REQUEST_METHOD"));
printf("%s\n", getenv("SCRIPT_NAME"));
printf("%s\n", getenv("SERVER_NAME"));
printf("%s\n", getenv("SERVER_PORT"));
printf("%s\n", getenv("SERVER_PROTOCOL"));
printf("%s\n", getenv("SERVER_SOFTWARE"));



return 0;



}

