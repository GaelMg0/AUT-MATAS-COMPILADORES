%option noyywrap
%{
	#include<stdio.h>
int lineas = 1;
int palabras = 0;
int caracteres = 0;
int palabras_ni = 0;
int palabras_num = 0;
int palabras_b_to = 0;
int palabras_jo =0;
int numeros = 0;
int total_digits = 0;
int total_carac = 0;

void imprimirResultados();
%}

%%
[Nn][iI][a-zA-Z0-9]*{total_carac += yyleng; palabras_ni++; }
[Nn][uU][0-9]*{total_carac += yyleng; palabras_num++; }
[Bb][a-zA-Z0-9]*[tT][oO]{total_carac += yyleng; palabras_b_to++; }
[a-zA-Z0-9]*[jJ][oO]{total_carac += yyleng; palabras_jo++; }
[0-9]+ {total_carac += yyleng; palabras_ni++; }
[a-zA-Z0-9]+{total_digits += yyleng; numeros++; }
\n       { lineas++; }
         { caracteres++;}
%%
int main()
{
	yyin = fopen("entrada.txt", "r");
    yylex();
    fclose(yyin);
    
    printf("Total de lineas: %ld\n", contador_lineas);
    printf("Total de palabras: %ld\n", palabras);
    printf("Palabras que inician con ni: %ld\n", palabras_ni);
    printf("Palabras que inician con num: %ld\n", palabras_num);
    printf("Palabras que inician con b y terminan con to: %ld\n", palabras_bto);
    printf("Palabras que terminan con jo: %ld\n", palabras_jo);
    return 0;
}