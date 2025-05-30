%option main
newline 			\n
tab				\t
letter 				[a-zA-Z]
digit   			[0-9]
sign    			[+-]
int				{digit}+
float				{int}*(\.){digit}+

%%
\=				printf("ASSIGNMENT_OP ");
\+				printf("ADDITION_OP ");
\-				printf("SUBTRACTION_OP ");
\*				printf("MULTIPLICATION_OP ");
\/				printf("DIVISION_OP ");
\%				printf("MOD_OP ");
{digit}+                	printf("INTEGER ");
{digit}*(\.){digit}+    	printf("FLOAT_NUMBER ");
\(                             	printf("LP ");
\)                             	printf ("RP ");
\{                             	printf ("LBRACE ");
\}                             	printf ("RBRACE ");
\[                              printf ("LBRACKET ");
\]                              printf ("RBRACKET ");
\>				printf ("GRT ");
\<				printf ("LST ");
\=\<				printf("LST_EQ ");
\=\>				printf("GRT_EQ ");
"=="				printf("EQ ");
"!="				printf("NOT_EQ ");
"&&"				printf("AND ");
"\|\|"				printf("OR ");
"!"				printf("NOT ");
\,				printf("COMMA ");
\:				printf("COLON ");
\;				printf("SEMICOLON ");
"int_main"                      printf("MAIN_FUNCTION ");
"funct"                         printf("FUNC ");
"return"                        printf("RETURN ");
"const"                         printf("CONST ");
"if"                            printf("IF ");
"else"                          printf("ELSE ");
"else if"                       printf("ELSE_IF ");
"for"                           printf("FOR ");
"in"                            printf("IN ");
"while"                         printf("WHILE ");
"do"                            printf("DO ");
"read()"                        printf("INPUT_STATEMENT ");
"write"                         printf("OUTPUT_STATEMENT ");
"true"                          printf("BOOLEAN_TRUE ");
"false"                         printf("BOOLEAN_FALSE ");
"int"                           printf("INT ");
"float"                         printf("FLOAT ");
\"([^\"]*)\"                   	printf("STRING_LITERAL(%s) ", yytext);
[a-zA-Z][0-9a-zA-Z_]*		printf("IDENTIFIER(%s) ", yytext);
[a-zA-Z][0-9a-zA-Z_]*\-\-       printf("IDENTIFIER_DECREMENT_1 ");
[a-zA-Z][0-9a-zA-Z_]*\+\+       printf("IDENTIFIER_INCREMENT_1 ");
"##"([^#\n]\n)?([^#]*"##")  	printf("MULTILINE_COMMENT ");
"#".*                           printf("COMMENT ");
[ \t]+				;
