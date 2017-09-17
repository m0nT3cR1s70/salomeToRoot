
%{
	#include "scanner.c"
	#include "functions.h"
	//Define a file for output
	FILE *archSal;
	//name for the output file that will contain the geometry in ROOT
	char *name;
	//Function for the treatment of errors
	void yyerror(char const *);
%}
%union
{
	double typeReturn;
	char *string;
}

/*general tokens*/
%token <string>IDENTIFIER 
/*general tokens geometry*/
%token GEOMPY 
/*Numbers*/
%token <typeReturn> NUM
/*Tokens for a cube*/
%token MAKEBOXDXDYDZ 
/*Tokens for a cylinder*/
%token MAKECYLINDERRH
/*Tokens for a sphere*/
%token MAKESPHERER
/*Tokens for a cone*/
%token MAKECONER1R2H
/*Tokens for a torus*/
%token MAKETORUSRR
/*Tokens for a rectangle*/
%token MAKEFACEHW 
/*Tokens for a disc*/
%token MAKEDISKR
/*Token to recognize a mistake*/
%token <string>ERROR 

%%
/*Defined start symbol*/
start: input;

/*Define input*/
input:geometry aux|ERROR {yyerror("\n"); yyerrok; fprintf(stderr,"error: %s: unknown symbol \n",$1);};

/*Define aux*/
aux:/*cadena vacia*/|geometry aux;

/*We define geometry types*/
geometry : cube|cylinder|sphere|cone|torus|face|disc|error;

/*Grammar rule for a cube*/
cube:IDENTIFIER '=' GEOMPY '.' MAKEBOXDXDYDZ '(' NUM ',' NUM ',' NUM ')' 
{
	fprintf(archSal,"\t//We define a geometry \n");
	fprintf(archSal,"\tTGeoVolume *%s=gGeoManager->MakeBox(\"%s\",med,%lf,%lf,%lf); \n",getID($1),getID($1),$7,$9,$11);
	fprintf(archSal,"\ttop->AddNode(%s,0, transf);\n\n",getID($1));
};
    

/*Grammar rule for a cylinder*/
cylinder:IDENTIFIER '=' GEOMPY '.' MAKECYLINDERRH '(' NUM ',' NUM ')' 
{
	fprintf(archSal,"\t//We define a geometry \n");
	fprintf(archSal,"\tTGeoVolume *%s=gGeoManager->MakeTube(\"%s\",med,0,%lf,%lf); \n",getID($1),getID($1),$7,$9);
	fprintf(archSal,"\ttop->AddNode(%s,0, transf);\n\n",getID($1));
};

/*Grammar rule for a sphere*/
sphere:IDENTIFIER '=' GEOMPY '.' MAKESPHERER '(' NUM ')' 
{
	fprintf(archSal,"\t//We define a geometry \n");
	fprintf(archSal,"\tTGeoVolume *%s=gGeoManager->MakeSphere(\"%s\",med,0,%lf,0,180,0,360); \n",getID($1),getID($1),$7);
	fprintf(archSal,"\ttop->AddNode(%s,0,transf);\n\n",getID($1));
};

/*Grammar rule for a cone*/
cone:IDENTIFIER '=' GEOMPY '.' MAKECONER1R2H '(' NUM ',' NUM ',' NUM ')' 
{
	fprintf(archSal,"\t//We define a geometry \n");
	fprintf(archSal,"\tTGeoVolume *%s=gGeoManager->MakeCone(\"%s\",med,%lf,0,%lf,0,%lf); \n",getID($1),getID($1),$11,$7,$9);
	fprintf(archSal,"\ttop->AddNode(%s,0,transf);\n\n",getID($1));
};
/*Grammar rule for a torus*/
torus:IDENTIFIER '=' GEOMPY '.' MAKETORUSRR '(' NUM ',' NUM ')' 
{
	fprintf(archSal,"\t//We define a geometry \n");
	fprintf(archSal,"\tTGeoVolume *%s=gGeoManager->MakeTorus(\"%s\",med,%lf,0,%lf,0,360); \n",getID($1),getID($1),$7,$9);
	fprintf(archSal,"\ttop->AddNode(%s,0,transf);\n\n",getID($1));
};
/*Grammar rule for a rectangle*/
face:IDENTIFIER '=' GEOMPY '.' MAKEFACEHW '(' NUM ',' NUM ',' NUM ')' 
{
	int tmp=$11;
	switch (tmp)
 	{
 		case 1:	
 			fprintf(archSal,"\t//We define a geometry \n");
			fprintf(archSal,"\tTGeoVolume *%s=gGeoManager->MakeBox(\"%s\",med,%lf,%lf,0); \n",getID($1),getID($1),$7,$9);
			fprintf(archSal,"\ttop->AddNode(%s,0, transf);\n\n",getID($1));
			break;
			
		case 2:
			fprintf(archSal,"\t//We define a geometry \n");
			fprintf(archSal,"\tTGeoVolume *%s=gGeoManager->MakeBox(\"%s\",med,0,%lf,%lf); \n",getID($1),getID($1),$7,$9);
			fprintf(archSal,"\ttop->AddNode(%s,0, transf);\n\n",getID($1));
			break;
			
		case 3:
			fprintf(archSal,"\t//We define a geometry \n");
			fprintf(archSal,"\tTGeoVolume *%s=gGeoManager->MakeBox(\"%s\",med,%lf,0,%lf); \n",getID($1),getID($1),$7,$9);
			fprintf(archSal,"\ttop->AddNode(%s,0, transf);\n\n",getID($1));
			break;
		default:
			printf("ERROR: %d: Invalid option \n",tmp);
			deleteFile(name);
			break;
 	}
};
/*Grammar rule for a disc*/
disc:IDENTIFIER '=' GEOMPY '.' MAKEDISKR '(' NUM ',' NUM ')' 
{
	int tmp=$9;
	switch(tmp)
	{
		case 1:
			fprintf(archSal,"\t//We define a geometry \n");
			fprintf(archSal,"\tTGeoVolume *%s=gGeoManager->MakeTorus(\"%s\",med,%lf,0,0,0,360); \n",getID($1),getID($1),$7);
			fprintf(archSal,"\ttop->AddNode(%s,0,transf);\n\n",getID($1));
			break;
		case 2:
			fprintf(archSal,"\t//We define a geometry \n");
			fprintf(archSal,"\tTGeoVolume *%s=gGeoManager->MakeTorus(\"%s\",med,%lf,0,0,0,360); \n",getID($1),getID($1),$7);
			fprintf(archSal,"\ttop->AddNode(%s,0,transf);\n\n",getID($1));
			break;
		case 3:
			fprintf(archSal,"\t//We define a geometry \n");
			fprintf(archSal,"\tTGeoVolume *%s=gGeoManager->MakeTorus(\"%s\",med,%lf,0,0,0,360); \n",getID($1),getID($1),$7);
			fprintf(archSal,"\ttop->AddNode(%s,0,transf);\n\n",getID($1));
			break;
		default:
            		printf("ERROR: %d: Invalid option \n",tmp);
			deleteFile(name);
            		break;
	
	}
};
%%
/*
Main function of the translator
*/
int main(int argc, char *argv[])
{
	double world[3];
	if(filterInput(argv[1],argc))
	{
		yyin=fopen("tmp","r");
		/*
		  It creates the file that will contain 
		  the geometry and is called as the input 
		  file but the extension is replaced .py by the of .c 
		*/
		archSal=fopen(strcat(getName(argv[1]),".c"),"w");
		if(yyin==NULL)
		{
			printf("\nERROR\n");
		}

		/*It stores some of the geometry and syntactic 
		analyzer is called which in turn calls the lexical analyzer*/
		else
		{
			//We define the output file

			name=strcat(getName(argv[1]),".c");
			//We define the size of world
			captureWorld(&world[1],&world[2],&world[3]);
			
			//Program structure in ROOT
			fprintf(archSal,"#include \"TGeoManager.h\" \n");
			fprintf(archSal,"void %s()\n",getName(argv[1]));
			fprintf(archSal,"{\n");
	
			fprintf(archSal,"\t //We call the admin. geometry\n");
			fprintf(archSal,"\t new TGeoManager(\"world\",\"simple\");\n\n");
			
			fprintf(archSal,"\t //We define the means and the material\n");
			fprintf(archSal,"\t TGeoMaterial *mat=new TGeoMaterial(\"Vacuum\",0,0,0);\n");
			fprintf(archSal,"\t TGeoMedium   *med=new TGeoMedium(\"Vacuum\",1,mat);\n\n");
			
			fprintf(archSal,"\t //Define the world \n");
			fprintf(archSal,"\t TGeoVolume *top=gGeoManager->MakeBox(\"top\",med,%f,%f,%f);\n",world[1],world[2],world[3]);
			fprintf(archSal,"\t gGeoManager->SetTopVolume(top);\n\n");
			////We define position
			fprintf(archSal,"\t //We define position \n");
			fprintf(archSal,"\t TGeoRotation    *rot = new TGeoRotation(\"rot\",0.,180,0); \n");
			fprintf(archSal,"\t TGeoCombiTrans  *transf = new TGeoCombiTrans(0,0,-100,rot); \n\n");
			
			//We call the parser, which in turn call the lexical analyzer
			yyparse();
	
			//Final part of the root file
			fprintf(archSal,"\t //We closed geometry\n");
			fprintf(archSal,"\t gGeoManager->CloseGeometry();\n\n");
			
			fprintf(archSal,"\t //Indicate the color cube\n");
			fprintf(archSal,"\t top->SetLineColor(kMagenta);\n\n");
			
			fprintf(archSal,"\t //We sent a draw the cube\n");
			fprintf(archSal,"\t gGeoManager->SetTopVisible();\n");
			fprintf(archSal,"\t top->Draw();\n");
			fprintf(archSal,"}\n");
		}
	}
	fclose(archSal);
	//delete the file temporary 
	deleteFile("tmp");
	return 0;
}
//Function for error handling, if you find one just send as message syntax error
void yyerror(char const *s)
{
	fprintf(stderr," %s \n",s);
	/*
	Remove the output file because if an 
	error is found, the translation shall 
	imcompleta and would send wrong file
	*/
	remove(strcat(name,".c"));
}
