parser: y.tab.c lex.yy.c y.tab.h
	g++ y.tab.c lex.yy.c  -g -ll -o parser
lex.yy.c: lexer.l
	lex lexer.l
y.tab.c: NewParser.y
	yacc -v -d NewParser.y
clean:
	rm -f parser y.tab.c lex.yy.c y.tab.h y.output
