
#include "filter.h"


/*
This function receives a file 
and determines if the file 
contains the extesion .py
*/
int isPY(char *path)
{
	char c='.';
	char *divide=strchr(path,c);
	//If the file not contains extension, the compilation ends and error sending 
	if(divide==NULL)
	{
		printf("%s: file not recognized: File truncated \n",path);
		printf("compilation terminated. \n");
		exit(-1);
	}
	//If the extension is .py then return 1 
	else if(!strcmp(divide,".py"))
	{
		return 1;
	}
	//If the extension is not .py, the compilation ends and error sending
	else
	{
		printf("%s : file not recognized: File truncated \n",path);
		printf("compilation terminated. \n");
		exit(-1);
	}
}

/*
This function checks if the 
input file exists, if file
exits called the funtion isPy. 
*/
int verEntry(char *path,int arg)
{
	FILE *file;
	//The input not contains any file 
	if(arg == 1)
	{
		printf ("Error: fatal error: no input files \n");
		printf("compilation terminated. \n");
		exit(-1);
	}
	//The input exists  
	else if (arg == 2)
	{
		file=fopen(path,"r");
		//The input not exists
		if(file==NULL)
		{
			printf("error: %s: No such file or directory\n",path);
			printf("fatal error: no input files\n");
			printf("compilation terminated.\n");
			exit(-1);
		}
		//The input exists and contains the extension .py
		else if(isPY(path))
			return 1;
	}
	else
		return 0;
}

/*
This function performs filtering
and returns a temporary file
with keywords to the
translation
*/
int filterInput(char *path,int arg)
{
	FILE *file;
	FILE *tmp;
	regex_t re;
	char sAux[1000]="";
	char *prueba;
	//Define regular expression
	regcomp(&re,".*Make.*",REG_EXTENDED|REG_NOSUB);
	//READING FILE 
	if(verEntry(path,arg))
	{
		//Open file for read
		file=fopen(path,"r");
		//The temporary file is created
		tmp=fopen("tmp","w");
		//Read the file line by line
		while(!feof(file))
		{
			fgets(sAux,1000,file);
			//search pattern matches and ignores
			if(!regexec(&re,sAux,(size_t)0,NULL,0))
			{
				fputs(sAux,tmp);	
			}
			else
				continue;
		}
		//close the file
		fclose(file);
		//close the temporary file
		fclose(tmp);
		return 1;
	}
}

