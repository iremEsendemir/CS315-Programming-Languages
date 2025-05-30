%{
#include "y.tab.h"
#include <stdio.h>
#include <stdlib.h>
%}

%option yylineno
tab                 \t
letter              [a-zA-Z]
digit               [0-9]
sign                [+-]
int                 {digit}+
float               {int}*(\.){digit}+

%%

\n                  { }

\=                  { return ASSIGNMENT_OP; }
\+                  { return ADDITION_OP; }
\-                  { return SUBTRACTION_OP; }
\*                  { return MULTIPLICATION_OP; }
\/                  { return DIVISION_OP; }
\%                  { return MOD_OP; }
\^                  { return EXPON_OP; }

{digit}+               { return INTEGER; }
{int}*(\.){digit}+     { return FLOAT_NUMBER; }

\(                  { return LP; }
\)                  { return RP; }
\{                  { return LBRACE; }
\}                  { return RBRACE; }
\[                  { return LBRACKET; }
\]                  { return RBRACKET; }

\>                  { return GRT; }
\<                  { return LST; }
"<="                { return LST_EQ; }
">="                { return GRT_EQ; }
"=="                { return EQ; }
"!="                { return NOT_EQ; }

"&&"                { return AND; }
"\|\|"              { return OR; }
"!"                 { return NOT; }

\,                  { return COMMA; }
\:                  { return COLON; }
\;                  { return SEMICOLON; }
"int_main"          { return MAIN_FUNCTION; }
"funct"             { return FUNC; }
"return"            { return RETURN; }
"const"             { return CONST; }
"if"                { return IF; }
"else"              { return ELSE; }
"else_if"           { return ELSE_IF; }
"for"               { return FOR; }
"in"                { return IN; }
"while"             { return WHILE; }
"do"                { return DO; }
"read"              { return INPUT_STATEMENT; }
"write"             { return OUTPUT_STATEMENT; }
"true"              { return BOOLEAN_TRUE; }
"false"             { return BOOLEAN_FALSE; }
"int"               { return INT; }
"float"             { return FLOAT; }

\"([^\"]*)\"        { return STRING_LITERAL; }
[a-zA-Z][0-9a-zA-Z_]*          { return IDENTIFIER; }
[a-zA-Z][0-9a-zA-Z_]*\-\-       { return IDENTIFIER_DECREMENT_1; }
[a-zA-Z][0-9a-zA-Z_]*\+\+       { return IDENTIFIER_INCREMENT_1; }

"##"([^#\n]\n)?([^#]*"##")  { return MULTILINE_COMMENT; }
"#".*                        { return COMMENT; }
[ \t]+      ;
%%

int yywrap() {
    return 1;
}




