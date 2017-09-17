
#include "functions.h"
 
//get filename
char *getName(char name[])
{
   char temp[1] = ".";
   char *ptr;
   ptr = strtok( name,temp);  
   return ptr;    
}
//get ID for parser
char *getID(char name[])
{
   char temp[1] = "=";
   char *ptr;
   ptr = strtok( name,temp);  
   return ptr;    
}
//Funcion for delete a file
void deleteFile(char *name)
{
	if(remove(name)==-1)
		perror("\n Error deleting \n");
	else
		puts("\ntemporary file removed\n");
}

//Get the size of the world
void captureWorld(double *num1,double *num2,double *num3)
{
    printf("Dimensions of the world in ROOT \n");
    printf("size in x: \n");
    scanf("%lf",num1);
    printf("size in y: \n");
    scanf("%lf",num2);
    printf("size in z: \n");
    scanf("%lf",num3);

}
