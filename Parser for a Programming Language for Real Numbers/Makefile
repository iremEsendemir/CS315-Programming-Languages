parser: y.tab.c lex.yy.c
	gcc -o parser lex.yy.c y.tab.c
	rm -f lex.yy.c y.tab.c y.tab.h
y.tab.c: CS315_S25_Team10.yacc lex.yy.c
	yacc -d CS315_S25_Team10.yacc
lex.yy.c: CS315_S25_Team10.lex
	lex CS315_S25_Team10.lex
