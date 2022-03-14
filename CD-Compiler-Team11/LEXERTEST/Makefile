lexer: lex.yy.c
	g++ lex.yy.c  -g -ll -o lexer
lex.yy.c: TestLexer.l
	lex TestLexer.l
clean:
	rm -f lex.yy.c lexer