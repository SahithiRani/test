%option noyywrap
%{
    #include <stdio.h>
    #include <string.h>
    #include "y.tab.h"
    
	int is_keyword(char* s);
	// extern int yywrap();
	int LINECOUNT=1;

// keywords (print|scan|func|if|else|elif|loop|return|void|char|int|double|boolean|break|continue)
%}

comment ("#".*)
letter_ 		[A-Za-z_]
digit		[0-9]
%%
{comment}		
"print"				{printf("KeyWord is %s\n",yytext);return PRINT;}
"scan"				{printf("KeyWord is %s\n",yytext);return SCAN;}
"func"				{printf("KeyWord is %s\n",yytext);return FUNC;}
"if"				{printf("KeyWord is %s\n",yytext);return IF;}
"else"				{printf("KeyWord is %s\n",yytext);return ELSE;}
"elif"				{printf("KeyWord is %s\n",yytext);return ELIF;}
"loop"				{printf("KeyWord is %s\n",yytext);return LOOP;}
"return"			{printf("KeyWord is %s\n",yytext);return RETURN;}
"void"				{printf("KeyWord is %s\n",yytext);return VOID;}
"char"				{printf("KeyWord is %s\n",yytext);return CHAR;}
"int"				{printf("KeyWord is %s\n",yytext);return INT;}
"double"			{printf("KeyWord is %s\n",yytext);return DOUBLE;}
"boolean"			{printf("KeyWord is %s\n",yytext);return BOOLEAN;}
"break"				{printf("KeyWord is %s\n",yytext);return BREAK;}
"continue"			{printf("KeyWord is %s\n",yytext);return CONTINUE;}						
{digit}+					{printf("%s\n",yytext);yylval.yint = atoi(yytext); return INT_CONST;}	
{digit}+"."{digit}+			{printf("%s\n",yytext);yylval.ydou = atof(yytext); return FLOAT_CONST;}
"true"                      {printf("%s\n",yytext);yylval.yint = 1; return BOOL_CONST;}
"false"						{printf("%s\n",yytext);yylval.yint = 0; return BOOL_CONST;}
['].[']                     {printf("%s\n",yytext);strcpy(yylval.ystr, yytext); return STR_CONST;}
\".*\"     					{printf("String %s", yytext);strcpy(yylval.ystr, yytext); return STR_CONST;}
\'.*\'     					{printf("String %s", yytext);strcpy(yylval.ystr, yytext);return STR_CONST;}
";"				{printf(";\n");return ';';}

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

"<"				{printf("<\n");return '<';}

">"				{printf(">\n");return '>';}


"=="			{printf("%s\n",yytext);
				 //strcpy(yylval.str, yytext);
				 return EQ;
				 }

"!="				{printf("%s\n",yytext);
				 //strcpy(yylval.str, yytext);
				 return NEQ;
				 }

"{"				{printf("{\n");return '{';}
"}"				{printf("}\n");return '}';}
"("				{printf("(\n");return '(';}
")"				{printf(")\n");return ')';}
"["				{printf("[\n");return '[';}
"]"				{printf("]\n");return ']';}
","				{printf(",\n");return ',';}


{letter_}({letter_}|{digit})*                  {printf("Identifier %s\n",yytext);strcpy(yylval.ystr, yytext); return ID;}

[ \t]			{printf("LineCount:%d WHITESPACE %d\n",LINECOUNT,yytext[0]);}
[\n]			{printf("LineCount:%d NEWLINE %d\n",LINECOUNT,yytext[0]);LINECOUNT++;}
.				{printf("INVALID CHAR %d\n",yytext[0]);}
%%

// char* keywordList[15] = {"print","scan","func","if","else","elif","loop","return","void","char","int","double","boolean","break","continue"};
// int keywordID[15] = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15};
// int is_keyword(char* s){
// 	int i;
// 	for(i=0;i<15 && strcmp(s,keywordList[i])!=0;i++);
// 	if(i<15){
// 		// printf("%s\n",keywordList[i]);
// 		// return keywordID[i];
// 		return 1000+keywordID[i];
// 	}
// 	printf("None of these\n");
// 	return -1;
// }