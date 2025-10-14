%option noyywrap
%{
    #include <stdio.h>
%}

%%

[A-Z]{4}[0-9]{6}[A-Z0-9]{3}    { printf("RFC Reconocido: %s\n", yytext); }
.|\n                           { /* Ignorar otros caracteres */ }

%%

int main(void)
{
    printf("Introduce posibles RFC:\n");
    yylex();
    return 0;
}