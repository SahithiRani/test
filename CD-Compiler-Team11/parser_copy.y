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
      function 
      | stmt
      ;
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

param: data_type ID arrayBRACKETS ; 

arrayBRACKETS: 
       arrayBRACKETS '['INT_CONST']'
      
      | 
      ;

stmts_list:                       
      stmt stmts_list 
      
      | /* EMPTY */ 
      ;

stmt:                             

      withSemcol ';'          
      
      | withoutSemcol 
      ;

withSemcol:                       
      DECLARATION
      
      | assign_stmt         
      
      | return_stmt 
      
      | func_call 
      
      | BREAK 
      
      | CONTINUE 

      | printSTMT
      ;
      
withoutSemcol:                    
      loop 
      
      | conditional
      ;

DECLARATION:
      data_type id_LIST;

id_LIST: 
      oneID ',' id_LIST 
      | oneID;

oneID : 
      ID arr_optional_assign;

// NON - WORKING VERSION
// IDEA -> if '=' => def opt_assign; else if 'arr[]' OR ID => arrayBRACKETS(which will expand to empty or brackets)
arr_optional_assign : 
      arrayBRACKETS     

      |

      opt_assign
      ;


opt_assign:
      ASSIGN expr

      ;
assign_stmt:                      
      LHS ASSIGN RHS
      ;
LHS: 
      ID isARRAY;

isARRAY: 
      arrayBRACKETS 
      ; 
RHS:  
      expr 
      | SCAN '(' data_type ')'
      ;


return_stmt:                      
      RETURN expr 
      ;

printSTMT:
      PRINT '(' printables ')'
      ;

printables: 
      printables '+' printable
      
      | printable
      ;
printable: 
      STR_CONST

      | LHS
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

expr:                        
      expr op value
        
      | value
      ;

value:                            
      func_call 
      
      | constant 
    
      | LHS

      | '(' expr ')'
      ; 

loop: 
      LOOP '(' conditions ')' '{' stmts_list '}';

conditional:                      
      IF '(' conditions ')' '{' stmts_list '}' else_stmt;

else_stmt:                       
      ELSE '{' stmts_list '}' 
      
      | /* EMPTY */ 
      ;

conditions:                       
      boolean 
      
      | boolean bi_logic_OP conditions 
      
      | NOT conditions 

      // How to deal with bracket conditions
      // | '(' conditions ')'
      ;

boolean:                          
      boolean rel_op expr 
      
      | expr 
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

bi_logic_OP:                    
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

