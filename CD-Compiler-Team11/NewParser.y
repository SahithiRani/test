%{
#include <iostream>
#include<stdlib.h>

int yyerror(char*);
int yylex();

extern int LINECOUNT;
extern FILE * yyin;
%}

%union{
      int yint;
      double ydou;
      char ystr[300];
}

%token ADD SUB MUL DIV ASSIGN AND OR XOR LTE GTE EQ NEQ NOT
%token <yint> INT_CONST BOOL_CONST
%token <ydou> FLOAT_CONST
%token <ystr> STR_CONST ID 
%token IF ELSE ELIF LOOP VOID 
%token INT DOUBLE BOOLEAN CHAR BREAK
%token PRINT SCAN FUNC RETURN CONTINUE 

%token ';' '<' '>' '{' '}' '(' ')' '[' ']' ','
// %token program functions function function_name data_type params param_list param
// %token stmts_list stmt withSemcol withoutSemcol
// %token array_decl return_stmt func_call func_type
// %token loop conditional conditions else_stmt boolean bi_logic_cond rel_op op
// %token expr array_assign assign_stmt assignment args_list args id_list
// %token constant arr value

%%
program:                         
      items_list              {printf("No Of Lines Parsed: %d\n",LINECOUNT);}
      
      |

      error 
      ;
items_list: item items_list

      |     
      
      ; 
item:
      function | stmt

function:                         
      FUNC function_name '{' stmts_list '}' ;

function_name:                    
      data_type ID '(' params ')' ;

params:                           
      param_list 
      
      | /* EMPTY */ 
      ;

param_list:                       
      param_list ',' param 
      
      | param
      ;

stmts_list:                       
      stmt stmts_list 
      
      | /* EMPTY */ 
      ;

stmt:                             
      {printf("LINECOUNT for Stmt is %d",LINECOUNT);} withSemcol ';'          
      
      | withoutSemcol 
      ;

withSemcol:                       
      param 
      
      | assign_stmt
      
      | array_decl 
      
      | return_stmt 
      
      | func_call 
      
      | BREAK 
      
      | CONTINUE 
      ;
      
withoutSemcol:                    
      loop 
      
      | conditional
      ;

assign_stmt:                      
      param assignment 
      
      | arr assignment
      ;

loop: LOOP ;

conditional:                      
      IF '(' conditions ')' '{' stmts_list '}' else_stmt;

else_stmt:                       
      ELSE '{' stmts_list '}' 
      
      | /* EMPTY */ 
      ;

conditions:                       
      boolean 
      
      | boolean bi_logic_cond conditions 
      
      | NOT conditions 
      ;

boolean:                          
      boolean  rel_op  expr 
      
      | expr 
      ;

return_stmt:                      
      RETURN expr 
      ;

array_decl:                       
      param '[' INT_CONST ']' array_assign 
      ;

func_call:                        
      ID '(' args_list ')' 
      ;
      

args_list:                        
      args 
      
      | /* EMPTY */ 
      ;

args:                             
      args ',' expr 
    
      | expr 
      ;

array_assign:                     
      ASSIGN '[' id_list ']'
      
      | /* EMPTY */ 
      ;

id_list:                          
      id_list ',' constant 
      
      | constant 
      ;

param: data_type ID ; 
    
assignment: ASSIGN expr ;

expr:                        
      expr op value
        
      | value
      ;

value:                            
      func_call 
      
      | constant 
    
      | arr
      ; 

arr:                              
      ID '[' expr ']' 
      
      | ID 
      ; 

data_type:                        
      INT 
      
      | BOOLEAN 
      
      | CHAR 
    
      | DOUBLE 
      
      | VOID
      ;


op:                               
      ADD 
      
      | SUB 
      
      | MUL 
      
      | DIV
      ; 

rel_op:                           
      LTE 
      
      | GTE 
      
      | '<' 
      
      | '>' 
      
      | EQ 
      
      | NEQ
      ;

bi_logic_cond:                    
      AND 
      
      | OR 
      
      | XOR
      ;

constant:                         
      INT_CONST 
      
      | SUB INT_CONST 
      
      | STR_CONST 
      
      | BOOL_CONST 
      
      | FLOAT_CONST
      
      | SUB FLOAT_CONST
      ;

%%

int yyerror(char *s) {
//   printf("\nError: %s...... LINECOUNT:%d\n",s,LINECOUNT);
  return 0;
}

int main(int argc,char* argv[]){

  FILE *fp = fopen(argv[1], "r");
  if(fp){
      yyin=fp;
  }
  yyparse();

}

