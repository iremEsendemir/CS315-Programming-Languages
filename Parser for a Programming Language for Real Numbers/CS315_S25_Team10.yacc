%{
#include <stdio.h>
#include <stdlib.h>

void yyerror(const char *s);
extern int yylineno;  
int yylex();

%}

%token ASSIGNMENT_OP ADDITION_OP SUBTRACTION_OP MULTIPLICATION_OP
%token DIVISION_OP MOD_OP EXPON_OP INTEGER FLOAT_NUMBER LP RP
%token LBRACE RBRACE LBRACKET RBRACKET GRT LST LST_EQ GRT_EQ
%token EQ NOT_EQ AND OR NOT COMMA COLON SEMICOLON
%token MAIN_FUNCTION FUNC RETURN CONST IF ELSE ELSE_IF
%token FOR IN WHILE DO INPUT_STATEMENT OUTPUT_STATEMENT
%token BOOLEAN_TRUE BOOLEAN_FALSE INT FLOAT STRING_LITERAL IDENTIFIER
%token IDENTIFIER_DECREMENT_1 IDENTIFIER_INCREMENT_1
%token MULTILINE_COMMENT COMMENT
%left ADDITION_OP SUBTRACTION_OP
%right UMINUS

%%

// Program 
program:
    MAIN_FUNCTION LBRACE stmts RBRACE function_decs { printf("Input program is valid\n"); }
    ;

function_decs:
    /* Empty */
    | function_dec comments function_decs
    ;

stmts:
    comments stmts_without_comment
    ;

stmts_without_comment:
    /* Empty */
    | stmt stmts_without_comment

stmt:
    dec_stmt SEMICOLON comments
    | assign_stmt SEMICOLON comments
    | condition_stmt comments
    | loop_stmt comments
    | return_stmt SEMICOLON comments
    | input_stmt SEMICOLON comments
    | output_stmt SEMICOLON comments
    ;

return_stmt:
    RETURN expr
    ;

// Constant Real Values
constant:
    INTEGER 
    | FLOAT_NUMBER
    ;

// Expressions
exprs: 
    expr
    | expr COMMA exprs
    ;

expr:
    or_expr
    ;

or_expr:
    and_expr
    | or_expr OR and_expr
    ;

and_expr:
    relational_expr
    | and_expr AND relational_expr
    ;

relational_expr:
    arithmetic_expr
    | arithmetic_expr relational_op arithmetic_expr
    ;

arithmetic_expr:
    term
    | arithmetic_expr sign term
    | sign arithmetic_expr %prec UMINUS // Negative numbers
    ;

term:
    factor
    | term multiplicative_op factor
    ;

factor:
    base
    | base EXPON_OP factor
    | NOT factor
    ;

base:
    operand
    | LP expr RP
    ;

operand:
    IDENTIFIER
    | constant
    | function_call
    | arr_variable
    ;

// Declarations and Assignments
dec_stmt:
    type dec_parts
    | CONST type dec_parts
    ;

dec_parts:
    dec_part
    | dec_part COMMA dec_parts
    ;

dec_part:
    IDENTIFIER
    | assign_stmt 
    | array_dec_part
    ;

array_dec_part:
    IDENTIFIER LBRACKET RBRACKET ASSIGNMENT_OP LBRACE exprs RBRACE
    | arr_variable
    | arr_variable ASSIGNMENT_OP LBRACE multi_exprs RBRACE
    ;

arr_size_decs:
    arr_size_dec arr_size_decs 
    | arr_size_dec
    ;

arr_size_dec:
    LBRACKET expr RBRACKET
    ;

multi_exprs:
    exprs
    | arr_exps
    ;

multi_expr_with_braces:
    LBRACE multi_exprs RBRACE
    ;

arr_exps:
    multi_expr_with_braces
    | multi_expr_with_braces COMMA arr_exps
    ;

assign_stmt:
    IDENTIFIER ASSIGNMENT_OP expr
    | IDENTIFIER_INCREMENT_1
    | IDENTIFIER_DECREMENT_1
    | arr_assign
    ;

arr_variable:
    IDENTIFIER arr_size_decs
    ;

arr_assign:
    arr_variable ASSIGNMENT_OP expr
    ;

// Relational Operators
relational_op:
    GRT | LST | LST_EQ | GRT_EQ | EQ | NOT_EQ
    ;

// Multiplicative Operators
multiplicative_op:
    MULTIPLICATION_OP | DIVISION_OP | MOD_OP
    ;

// Sign
sign: 
    ADDITION_OP | SUBTRACTION_OP
    ;

// Conditional Statements
condition_stmt:
    IF LP expr RP LBRACE stmts RBRACE
    | IF LP expr RP LBRACE stmts RBRACE ELSE LBRACE stmts RBRACE
    | IF LP expr RP LBRACE stmts RBRACE else_if_stmts
    | IF LP expr RP LBRACE stmts RBRACE else_if_stmts ELSE LBRACE stmts RBRACE
    ;

else_if_stmts:
    ELSE_IF LP expr RP LBRACE stmts RBRACE
    | ELSE_IF LP expr RP LBRACE stmts RBRACE else_if_stmts
    ;

// Loop Statements
loop_stmt:
    FOR LP type IDENTIFIER ASSIGNMENT_OP expr SEMICOLON expr SEMICOLON assign_stmt RP LBRACE stmts RBRACE
    | FOR LP type IDENTIFIER IN IDENTIFIER RP LBRACE stmts RBRACE
    | WHILE LP expr RP LBRACE stmts RBRACE
    | DO LBRACE stmts RBRACE WHILE LP expr RP 
    | FOR LP assign_stmt SEMICOLON expr SEMICOLON assign_stmt RP LBRACE stmts RBRACE
    ;

// Input Statement
input_stmt:
    IDENTIFIER ASSIGNMENT_OP INPUT_STATEMENT LP RP
    | arr_variable ASSIGNMENT_OP INPUT_STATEMENT LP RP
    ;

// Output Statement
output_stmt:
    OUTPUT_STATEMENT LP STRING_LITERAL RP
    | OUTPUT_STATEMENT LP expr RP
    ;

// Function Definitions
function_dec:
    FUNC IDENTIFIER LP parameters RP LBRACE stmts RBRACE;

parameters:
    /* Empty */
    | type IDENTIFIER
    | parameters COMMA type IDENTIFIER
    ;

function_call:
    IDENTIFIER LP arg_list RP 
    ;

arg_list:
    exprs
    | /* Empty */
    ;

// Data Types
type:
    INT | FLOAT
    ;

// Comments 
comments:
    /* Empty */
    | comment comments
    ;

comment:
    COMMENT
    | MULTILINE_COMMENT
    ;

%%


void yyerror(const char *s) {
    fprintf(stderr, "Syntax error on line %d!\n", yylineno);
}

int main() {
    yyparse();
    return 0;
}


