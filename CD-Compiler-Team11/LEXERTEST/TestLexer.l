%{
    #include <stdio.h>
    #include <string.h>
    
	int is_keyword(char* s);
	//extern int yywrap();
	int LINECOUNT=1;

%}
%option noyywrap

comment ("#".*)
keywords (print|scan|func|if|else|elif|loop|return|void|char|int|double|boolean|break|continue)
letter_ 		[A-Za-z_]
digit		[0-9]

%%
{comment}								
{keywords}                              {printf("%s\n",yytext);}
{digit}+					            {printf("%s\n",yytext);}	
{digit}+"."{digit}+				        {printf("%s\n",yytext);}
"true"                                  {printf("%s\n",yytext);}
"false"									{printf("%s\n",yytext);}
['].[']                                 {printf("%s\n",yytext);}
\".*\"     								{printf("String %s", yytext);}
\'.*\'     								{printf("String %s", yytext);}


";"				{printf("%s\n",yytext);}

"+"				{printf("%s\n",yytext);
				 //strcpy(yylval.str, yytext);
				 
				 }  
                     
"-"				{printf("%s\n",yytext);
				 
				 }

"*"				{printf("%s\n",yytext);
				 
				 }

"/"				{printf("%s\n",yytext);
				
				 }

"="				{printf("%s\n",yytext);
				
				 }

"and" 				{printf("%s\n",yytext);
				 
				 }        

"or"				{printf("%s\n",yytext);
				
				 }

"xor"				{printf("%s\n",yytext);
				 
				 }

"not"				{printf("%s\n",yytext);
				
				 }

"<="				{printf("%s\n",yytext);
				 
				 }

">="				{printf("%s\n",yytext);}

"<"				{printf("%s\n",yytext);}

">"				{printf("%s\n",yytext);}

"=="			{printf("%s\n",yytext);
				 //strcpy(yylval.str, yytext);
				
				 }

"!="				{printf("%s\n",yytext);
				 //strcpy(yylval.str, yytext);
				 
				 }

"{"				{printf("%s\n",yytext);}
"}"				{printf("%s\n",yytext);}

"("				{printf("%s\n",yytext);}

")"				{printf("%s\n",yytext);}

"["				{printf("%s\n",yytext);}

"]"				{printf("%s\n",yytext);}

","				{printf("%s\n",yytext);}

{letter_}({letter_}|{digit})*                  {printf("Identifier %s\n",yytext);}

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

int main(int argc,char* argv[]){
    if(argc>1){
        FILE *fp = fopen(argv[1], "r");
        if(fp){
            yyin=fp;
        }
    }
    yylex();
    return 0;

}