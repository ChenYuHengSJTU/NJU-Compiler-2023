%{
    #include <stdio.h>
    #include <unistd.h>

%}
digit [0-9]
hex [0-9a-fA-F]
oct [0-7]
letter [_a-zA-Z]
%%
"+" {printf("PLUS\n");}
"-" {printf("MINUS\n");}
"&&" {printf("AND\n");}
"||" {printf("OR\n");}
"." {printf("DOT\n");}
"!" {printf("NOT\n");}
"int"|"float" {printf("TYPE\n");}
"(" {printf("LP\n");}
")" {printf("RP\n");}
"[" {printf("LB\n");}
"]" {printf("RB\n");}
"{" {printf("LC\n");}
"}" {printf("RC\n");}
"struct" {printf("STRUCT\n");}
"return" {printf("RETURN\n");}
"if" {printf("IF\n");}
"else" {printf("ELSE\n");}
"while" {printf("WHILE\n");}
";" {printf("SEMI\n");}
"," {printf("COMMA\n");}
"=" {printf("ASSIGNOP\n");}
">"|"<"|">="|"<="|"=="|"!=" {printf("RELOP\n");}
0|[1-9]{digit}*|0[xX]{hex}+|0{oct}+ {printf("INT: %d\n", atoi(yytext));}
((0|[1-9]{digit}*)"."({digit}+))|({digit}*)"."({digit}+)[eE][-+]?[1-9]{digit}* {printf("FLOAT:%f\n", atof(yytext));}
{letter}({letter}|{digit})* {printf("ID:%s\n", yytext);}
. {}

%%
int main(int argc, char** argv){
    if(argc > 1){
        if(!(yyin = fopen(argv[1], "r"))){
            perror(argv[1]);
            return 1;
        }
        //printf("open %s successfully\n", argv[1]);
    }
    yylex();
    //while(yytext != 0);
    return 0;
}
