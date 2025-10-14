%option noyywrap
%{
    #include <stdio.h>
%}

%%
[0-9]+.[0-9]+  { printf("Reconocido %s\n"); }
%%

int main()
{
    
    return yylex();
}