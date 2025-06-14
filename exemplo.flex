%%

%standalone
%line
%column
%class Scanner

%{
    public String getLexema() {
        return yytext();
    }
%}

// Macros:
letra              = [a-zA-Z]
numero             = [0-9]
digito             = {numero}+
identificador      = {letra}({letra}|{numero})*
data               = ([0-2][0-9]|3[0-1])\/(0[1-9]|1[0-2])\/[0-9]{4}
hora               = ([01][0-9]|2[0-3]):[0-5][0-9]
telefone           = [0-9]{2}\+\([0-9]{3}\)[0-9][0-9]{4}-[0-9]{4}
cpf                = [0-9]{3}\.[0-9]{3}\.[0-9]{3}-[0-9]{2}
email              = [a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,10}
url                = https?://([a-zA-Z0-9-]+\.)+[a-zA-Z]{2,}(/[a-zA-Z0-9._~:/?#@!$&'()*+,;=%-]*)?

%%

{url}              {System.out.println(" -> Encontrei um <Token: URL, Lexema: "          + getLexema() + ", Tamanho: " + yylength() + ", Linha: " + yyline + ", Coluna: " + yycolumn + ">");}
{data}             {System.out.println(" -> Encontrei um <Token: DATA, Lexema: "         + getLexema() + ", Tamanho: " + yylength() + ", Linha: " + yyline + ", Coluna: " + yycolumn + ">");}
{hora}             {System.out.println(" -> Encontrei um <Token: HORA, Lexema: "         + getLexema() + ", Tamanho: " + yylength() + ", Linha: " + yyline + ", Coluna: " + yycolumn + ">");}
{telefone}         {System.out.println(" -> Encontrei um <Token: TELEFONE, Lexema: "     + getLexema() + ", Tamanho: " + yylength() + ", Linha: " + yyline + ", Coluna: " + yycolumn + ">");}
{cpf}              {System.out.println(" -> Encontrei um <Token: CPF, Lexema: "          + getLexema() + ", Tamanho: " + yylength() + ", Linha: " + yyline + ", Coluna: " + yycolumn + ">");}
{email}            {System.out.println(" -> Encontrei um <Token: EMAIL, Lexema: "        + getLexema() + ", Tamanho: " + yylength() + ", Linha: " + yyline + ", Coluna: " + yycolumn + ">");}

{digito}           {System.out.println(" -> Encontrei um <Token: DIGITO, Lexema: "       + getLexema() + ", Tamanho: " + yylength() + ", Linha: " + yyline + ", Coluna: " + yycolumn + ">");}
{identificador}    {System.out.println(" -> Encontrei um <Token: IDENTIFICADOR, Lexema: "+ getLexema() + ", Tamanho: " + yylength() + ", Linha: " + yyline + ", Coluna: " + yycolumn + ">");}

[ \t\r\n]+         { /* Ignorar espaços e quebras de linha */ }
.                  { System.out.println(" -> Caractere não reconhecido: '" + yytext() + "' (Linha: " + yyline + ", Coluna: " + yycolumn + ")"); }
