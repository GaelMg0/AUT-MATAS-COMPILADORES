%option noyywrap
%{
    #include <stdio.h>
%}

%%

[a-z]{2}[0-9]{6}@uaeh\.edu\.mx    { printf("Cuenta Reconocida: %s\n", yytext); }

.|\n    { /* Ignorar otros caracteres */ }

%%

int main()
{
    printf("Introduce cuenta:\n");
    yylex();
    return 0;
}