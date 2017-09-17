
#ifndef FUNCTIONS_H
#define	FUNCTIONS_H

//Libraries
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
//Get filename
char *getName(char []);
//Get ID for parser
char *getID(char []);
//Delete a file
void deleteFile(char *);
//Get the size of the world
void captureWorld(double *,double *,double *);

#endif
