/* A Bison parser, made by GNU Bison 3.7.6.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2021 Free Software Foundation,
   Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <https://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* DO NOT RELY ON FEATURES THAT ARE NOT DOCUMENTED in the manual,
   especially those whose name start with YY_ or yy_.  They are
   private implementation details that can be changed or removed.  */

#ifndef YY_YY_Y_TAB_H_INCLUDED
# define YY_YY_Y_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token kinds.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    YYEMPTY = -2,
    YYEOF = 0,                     /* "end of file"  */
    YYerror = 256,                 /* error  */
    YYUNDEF = 257,                 /* "invalid token"  */
    ADD = 258,                     /* ADD  */
    SUB = 259,                     /* SUB  */
    MUL = 260,                     /* MUL  */
    DIV = 261,                     /* DIV  */
    ASSIGN = 262,                  /* ASSIGN  */
    AND = 263,                     /* AND  */
    OR = 264,                      /* OR  */
    XOR = 265,                     /* XOR  */
    LTE = 266,                     /* LTE  */
    GTE = 267,                     /* GTE  */
    EQ = 268,                      /* EQ  */
    NEQ = 269,                     /* NEQ  */
    NOT = 270,                     /* NOT  */
    INT_CONST = 271,               /* INT_CONST  */
    BOOL_CONST = 272,              /* BOOL_CONST  */
    FLOAT_CONST = 273,             /* FLOAT_CONST  */
    STR_CONST = 274,               /* STR_CONST  */
    ID = 275,                      /* ID  */
    IF = 276,                      /* IF  */
    ELSE = 277,                    /* ELSE  */
    ELIF = 278,                    /* ELIF  */
    LOOP = 279,                    /* LOOP  */
    VOID = 280,                    /* VOID  */
    INT = 281,                     /* INT  */
    DOUBLE = 282,                  /* DOUBLE  */
    BOOLEAN = 283,                 /* BOOLEAN  */
    CHAR = 284,                    /* CHAR  */
    BREAK = 285,                   /* BREAK  */
    PRINT = 286,                   /* PRINT  */
    SCAN = 287,                    /* SCAN  */
    FUNC = 288,                    /* FUNC  */
    RETURN = 289,                  /* RETURN  */
    CONTINUE = 290                 /* CONTINUE  */
  };
  typedef enum yytokentype yytoken_kind_t;
#endif
/* Token kinds.  */
#define YYEMPTY -2
#define YYEOF 0
#define YYerror 256
#define YYUNDEF 257
#define ADD 258
#define SUB 259
#define MUL 260
#define DIV 261
#define ASSIGN 262
#define AND 263
#define OR 264
#define XOR 265
#define LTE 266
#define GTE 267
#define EQ 268
#define NEQ 269
#define NOT 270
#define INT_CONST 271
#define BOOL_CONST 272
#define FLOAT_CONST 273
#define STR_CONST 274
#define ID 275
#define IF 276
#define ELSE 277
#define ELIF 278
#define LOOP 279
#define VOID 280
#define INT 281
#define DOUBLE 282
#define BOOLEAN 283
#define CHAR 284
#define BREAK 285
#define PRINT 286
#define SCAN 287
#define FUNC 288
#define RETURN 289
#define CONTINUE 290

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
union YYSTYPE
{
#line 12 "parser_copy.y"

      int yint;
      double ydou;
      char ystr[300];

#line 143 "y.tab.h"

};
typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
