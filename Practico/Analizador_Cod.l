%option noyywrap
%{
    #include <stdio.h>
    #include <string.h>
    FILE *yyin;

    int contador_comentarios = 0;
%}

%%
|"int"|"float"|"double"|"char"|"void"|"bool"|"if"|"else"|"for"|"while"|"do"|"switch"|"case"|"break"|"return"|"class"|"struct"|"public"|"private"|"protected"|"using"|"include"|"typename"|"operator"|"enum"|"long"|"short"|"signed"|"unsigned"|"true"|"false"|"main"
    { printf("Palabra reservada: %s\n", yytext); }


//[^\n]*                        { contador_comentarios++; printf("Comentario simple: %s\n", yytext); }
"//".*                         { contador_comentarios++; printf("Comentario simple: %s\n", yytext); }
/\*([^*]|\*+[^*/])*\*+/        { contador_comentarios++; printf("Comentario multilínea\n"); }


[a-zA-Z_][a-zA-Z0-9_]*         { printf("Identificador: %s\n", yytext); }


[0-9]+\.[0-9]+                 { printf("Constante decimal: %s\n", yytext); }
[0-9]+                         { printf("Constante entera: %s\n", yytext); }


"++"|"--"|"+"|"-"|"*"|"/"|"%"  { printf("Operador aritmético: %s\n", yytext); }


"&&"|"||"|"!"                  { printf("Operador lógico: %s\n", yytext); }


"(" | ")" | "{" | "}" | "[" | "]" | ";" | "," | "." | ":" | "<" | ">" | "="
    { printf("Símbolo especial: %s\n", yytext); }


[ \t\r\n]+                     { /* Ignorar */ }

.                              { /* Ignorar */ }

%%

int main(int argc, char **argv)
{
    if (argc < 2) {
        printf("Uso: %s <archivo.cpp>\n", argv[0]);
        return 1;
    }

    FILE *archivo = fopen(argv[1], "r");
    if (!archivo) {
        printf("Error: No se pudo abrir el archivo %s\n", argv[1]);
        return 1;
    }

    yyin = archivo;
    yylex();
    fclose(archivo);

    printf("Total de comentarios encontrados: %d\n", contador_comentarios);
    return 0;
}