
#ifndef Filtro_filter_h
#define Filtro_filter_h
//Define the necessary libraries for the filter
#include <stdio.h>
#include <stdlib.h>
#include <regex.h>
#include <string.h>
//Prototypes of the functions necessary
//Function to verify that the file exists
int verEntry(char *,int);
//Function to verify that the file containing the extension ".py"
int isPY(char *);
//Filter function returns certain words
int filterInput(char *,int);
#endif
