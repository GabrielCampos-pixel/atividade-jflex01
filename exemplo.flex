/* Alguns métodos e variáveis disponíveis:
 * int yyline: armazena o número da linha atual.
 * int yycolumn: armazena o número da coluna atual na linha atual.
 * String yytext(): método que retorna a sequência de caracteres que foi casada com a regra.
 * int yylength(): método que retorna o comprimento da sequência de caracteres que foi casada com a regra.
 */

/* Definição: seção para código do usuário. */

%%

/* Opções e Declarações: seção para diretivas e macros. */

// Diretivas:
%standalone         // Execução independente do analisador sintático.
%line               // Permite usar yyline.
%column             // Permite usar yycolumn.
%class Scanner      // Nome da classe gerada.

%{
    public String getLexema() {
        return yytext(); // Apenas retorna o valor de yytext().
    }
%}

// Macros:
letra              = [a-zA-Z]
numero             = [0-9]
digito             = {numero}+
identificador      = {letra}({letra}|{numero})*
hora               = ([01][0-9]|2[0-3]):[0-5][0-9]
telefone           = [0-9]{2}\+ \([0-9]{3}\) [0-9] [0-9]{4}-[0-9]{4}
cpf                = [0-9]{3}\.[0-9]{3}\.[0-9]{3}-[0-9]{2}
email              = [a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,10}
url                = https?://[a-zA-Z0-9.-]+(\.[a-zA-Z]{2,})+(/[a-zA-Z0-9._/-]*)?

%%

/* Regras e Ações Associadas: seção de instruções para 
 * o analisador léxico. 
 */
//regra para criar DATA
\([0-2][0-9]|30|31\)\/\(0[1-9]|1[0-2]\)\/[0-9]{4} {
    {System.out.println(" -> Encontrei um <Token: DATA, Lexema: "         + getLexema() + ", Tamanho: " + yylength() + ", Linha: " + yyline + ", Coluna: " + yycolumn + ">");}
}       
{hora}             {System.out.println(" -> Encontrei um <Token: HORA, Lexema: "         + getLexema() + ", Tamanho: " + yylength() + ", Linha: " + yyline + ", Coluna: " + yycolumn + ">");}
{telefone}         {System.out.println(" -> Encontrei um <Token: TELEFONE, Lexema: "     + getLexema() + ", Tamanho: " + yylength() + ", Linha: " + yyline + ", Coluna: " + yycolumn + ">");}
{cpf}              {System.out.println(" -> Encontrei um <Token: CPF, Lexema: "          + getLexema() + ", Tamanho: " + yylength() + ", Linha: " + yyline + ", Coluna: " + yycolumn + ">");}
{email}            {System.out.println(" -> Encontrei um <Token: EMAIL, Lexema: "        + getLexema() + ", Tamanho: " + yylength() + ", Linha: " + yyline + ", Coluna: " + yycolumn + ">");}
{url}              {System.out.println(" -> Encontrei um <Token: URL, Lexema: "          + getLexema() + ", Tamanho: " + yylength() + ", Linha: " + yyline + ", Coluna: " + yycolumn + ">");}

{digito}           {System.out.println(" -> Encontrei um <Token: DIGITO, Lexema: "       + getLexema() + ", Tamanho: " + yylength() + ", Linha: " + yyline + ", Coluna: " + yycolumn + ">");}
{identificador}    {System.out.println(" -> Encontrei um <Token: IDENTIFICADOR, Lexema: "+ getLexema() + ", Tamanho: " + yylength() + ", Linha: " + yyline + ", Coluna: " + yycolumn + ">");}

[ \t\r\n]+         { /* Ignorar espaços e quebras de linha */ }
.                  { System.out.println(" -> Caractere não reconhecido: '" + yytext() + "' (Linha: " + yyline + ", Coluna: " + yycolumn + ")"); }
