%{
    #include <stdio.h>
    #include <string.h>
    #include "y.tab.h"
    
	int is_keyword(char* s);
	extern int yywrap();
	int LINECOUNT=1;

%}

comment ("#".*)
keywords (print|scan|func|if|else|elif|loop|return|void|char|int|double|boolean|break|continue)
letter_ 		[A-Za-z_]
digit		[0-9]
%%
{comment}								
{keywords}                              {printf("%s\n",yytext);return is_keyword(yytext);}
{digit}+					            {printf("%s\n",yytext);yylval.yint = atoi(yytext); return INT_CONST;}	
{digit}+"."{digit}+				        {printf("%s\n",yytext);yylval.ydou = atof(yytext); return FLOAT_CONST;}
"true"                                  {printf("%s\n",yytext);yylval.yint = 1; return BOOL_CONST;}
"false"									{printf("%s\n",yytext);yylval.yint = 0; return BOOL_CONST;}
['].[']                                 {printf("%s\n",yytext);strcpy(yylval.ystr, yytext); return STR_CONST;}

";"				{printf("%s\n",yytext); return ';';}

"+"				{printf("%s\n",yytext);
				 //strcpy(yylval.str, yytext);
				 return ADD;
				 }  
                     
"-"				{printf("%s\n",yytext);
				 //strcpy(yylval.str, yytext);
				 return SUB;
				 }

"*"				{printf("%s\n",yytext);
				 //strcpy(yylval.str, yytext);
				 return MUL;
				 }

"/"				{printf("%s\n",yytext);
				 //strcpy(yylval.str, yytext);
				 return DIV;
				 }

"="				{printf("%s\n",yytext);
				 //strcpy(yylval.str, yytext);
				 return ASSIGN;
				 }

"and" 				{printf("%s\n",yytext);
				 //strcpy(yylval.str, yytext);
				 return AND;
				 }        

"or"				{printf("%s\n",yytext);
				 //strcpy(yylval.str, yytext);
				 return OR;
				 }

"xor"				{printf("%s\n",yytext);
				 //strcpy(yylval.str, yytext);
				 return XOR;
				 }

"not"				{printf("%s\n",yytext);
				 //strcpy(yylval.str, yytext);
				 return NOT;
				 }

"<="				{printf("%s\n",yytext);
				 //strcpy(yylval.str, yytext);
				 return LTE;
				 }

">="				{printf("%s\n",yytext);
				 //strcpy(yylval.str, yytext);
				 return GTE;
				 }

"<"				return '<';

">"				return '>';

"=="			{printf("%s\n",yytext);
				 //strcpy(yylval.str, yytext);
				 return EQ;
				 }

"!="				{printf("%s\n",yytext);
				 //strcpy(yylval.str, yytext);
				 return NEQ;
				 }

"{"				return '{';
"}"				return '}';

"("				return '(';

")"				return ')';

"["				return '[';

"]"				return ']';

","				return ',';

{letter_}({letter_}|{digit})*                  {printf("Identifier %s\n",yytext);strcpy(yylval.ystr, yytext); return ID;}

[ \t]			{printf("LineCount:%d someChar %s\n",LINECOUNT,yytext);}
[\n]			{printf("LineCount:%d someChar %s\n",LINECOUNT,yytext);LINECOUNT++;}
.				{printf("someChar %s\n",yytext);}
%%
// [a-zA-Z_][a-zA-Z0-9_]*           {/*printf("Variable Identifier: %s\n", yytext);*/ strcpy(yylval.yid, yytext); return ID;}

// Reserved keywords list

char* keywordList[15] = {"print","scan","func","if","else","elif","loop","return","void","char","int","double","boolean","break","continue"};
// int keywordID[15] = {PRINT,SCAN,FUNC,IF,ELSE,ELIF,LOOP,RETURN,VOID,CHAR,INT,DOUBLE,BOOLEAN,BREAK,CONTINUE};
int keywordID[15] = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15};
int is_keyword(char* s){
	int i;
	for(i=0;i<15 && strcmp(s,keywordList[i])!=0;i++);
	if(i<15){
		// printf("%s\n",keywordList[i]);
		// return keywordID[i];
		return 1000+keywordID[i];
	}
	printf("None of these\n");
	return -1;
}

