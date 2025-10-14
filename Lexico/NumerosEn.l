%option noyywrap
%{
    #include <stdio.h>
%}

%%
[0-9]+   { printf("Número entero reconocido: %s\n",); }
%%

int main(void)
{
    
    yylex();
}