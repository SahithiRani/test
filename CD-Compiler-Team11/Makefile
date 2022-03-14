parser: y.tab.c lex.yy.c y.tab.h
	g++ y.tab.c lex.yy.c  -g -ll -o parser
lex.yy.c: lexer.l
	lex lexer.l
y.tab.c: parser_copy.y
	yacc -v -d -Wcounterexamples parser_copy.y
clean:
	rm -f parser y.tab.c lex.yy.c y.tab.h y.output
