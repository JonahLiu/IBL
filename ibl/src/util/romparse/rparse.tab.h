/* A Bison parser, made by GNU Bison 3.0.4.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015 Free Software Foundation, Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

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

#ifndef YY_YY_RPARSE_TAB_H_INCLUDED
# define YY_YY_RPARSE_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    LBRACE = 258,
    RBRACE = 259,
    SECTION = 260,
    EQU = 261,
    VALUE = 262,
    STRING = 263,
    BOOT_MODE = 264,
    PARAM_INDEX = 265,
    OPTIONS = 266,
    MULTI_I2C_ID = 267,
    MY_I2C_ID = 268,
    CORE_FREQ_MHZ = 269,
    I2C_CLK_FREQ_KHZ = 270,
    EXE_FILE = 271,
    PCI_PARMS = 272,
    NEXT_DEV_ADDR = 273,
    NEXT_DEV_ADDR_EXT = 274,
    ADDRESS_DELAY = 275,
    SWPLL = 276,
    DEV_ADDR_EXT = 277,
    DEV_ADDR = 278,
    LAYOUT = 279,
    ALIGN = 280,
    PAD = 281,
    LENGTH = 282,
    PAD_FILE_ID = 283,
    SWPLL_PREDIV = 284,
    SWPLL_MULT = 285,
    SWPLL_POSTDIV = 286,
    SWPLL_FLAGS = 287,
    ADDR_WIDTH = 288,
    N_PINS = 289,
    MODE = 290,
    C2T_DELAY = 291,
    BUS_FREQ_MHZ = 292,
    BUS_FREQ_KHZ = 293,
    CSEL = 294
  };
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_RPARSE_TAB_H_INCLUDED  */
