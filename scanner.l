
%{
/*Defines a lexer for SALOME*/
#include "parser.tab.h"
int lineno=1;
%}

/*Regural Expressions: GENERAL*/
digit [0-9]
letter  [A-Za-z]

/*Regural Expressions: NUMBERS*/
number [+-]?{digit}+("."{digit}+)?

/*Regural Expressions: IDENTIFIERS*/
id     ({letter}|_)({letter}|{digit}|_)*

/*Regural Expressions: BLANK*/
blank [ \t\n]


%%
#.*                 ;
{blank}             ;
"geompy"                     {
				return GEOMPY;
			     };
"MakeBoxDXDYDZ"              {
				return MAKEBOXDXDYDZ;
			     };
"MakeCylinderRH"             {
				return MAKECYLINDERRH;
			     };
"MakeSphereR"                {
				return MAKESPHERER;
			     };
"MakeConeR1R2H"              {
				return MAKECONER1R2H;
			     };
"MakeTorusRR"                {
				return MAKETORUSRR;
			     };
"MakeFaceHW"                 {
				return MAKEFACEHW;
			     };
"MakeDiskR"                  {
				return MAKEDISKR;
			     };
                

{id}              {
			yylval.string=yytext;
			return IDENTIFIER;
		  }

{number}          {
		      yylval.typeReturn=atof(yytext);	
		      return NUM;
		  };

"("	          {
		      return '(';
		  };
	  
")"	           {
		   	return ')';
		   };
	  
"," 	           {
		   	return ',';
		   };
	  
"."                {
		   	return '.';
		   };
             
"="                {
		   	return '=';
		   };
              

.		   {
			yylval.string=yytext;
			return ERROR;
		   };




