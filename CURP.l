%option noyywrap
%{
    #include <stdio.h>
%}

%%

[A-Z]{4}[0-9]{6}[HM]{1}[A-Z]{3}[0-9A-Z]{2} {
    printf("CURP Reconocida: %s\n", yytext);
}

.|\n   { /* Ignorar otros caracteres */ }

%%

int main(void)
{
    printf("Introduce CURP:\n");
    yylex();
    return 0;
}