/*cs152 fall19 

Bradley Hayes
861270654

project phase 1

*/


	int currLine = 1, currPos = 1;



DIGIT	[0-9]
LETTER	[a-zA-Z]
IDENTIFIER {LETTER}|({LETTER}({LETTER}|{DIGIT}|_)*({LETTER}|{DIGIT})) 
FILE [{LETTER}{DIGIT}]*\.min
INVALIDB ({DIGIT}|_){IDENTIFIER}
INVALIDA {IDENTIFIER}_


%%

"function"	{currPos += yyleng; return FUNCTION;}
"beginparams"	{currPos += yyleng; return BEGIN_PARAMS;}
"endparams"	{currPos += yyleng; return END_PARAM;}
"beginlocals"	{currPos += yyleng; return BEGIN_LOCALS;}
"endlocals"	{currPos += yyleng; return END_LOCALS;}
"beginbody"     {currPos += yyleng; return BEGIN_BODY;}
"endbody"     	{currPos += yyleng; return END_BODY;}
"integer"     	{currPos += yyleng; return INTEGER;}
"array"     	{currPos += yyleng; return ARRAY;}
"of"     	{currPos += yyleng; return OF;}
"if"     	{currPos += yyleng; return IF;}
"then"     	{currPos += yyleng; return THEN;}
"endif"     	{currpos += yyleng; return ENDIF;}
"else"     	{currPos += yyleng; return ELSE;}
"while"     	{currPos += yyleng; return WHILE;}
"do"     	{currPos += yyleng; return DO;}
"beginloop"     {currPos += yyleng; return BEGINLOOP;}
"endloop"     	{currPos += yyleng; return ENDLOOP;}
"continue"     	{currPos += yyleng; return CONTINUE;}
"read"     	{currPos += yyleng; return READ;}
"write"     	{currPos += yyleng; return WRITE;}
"and"     	{currPos += yyleng; return AND;}
"or"     	{currPos += yyleng; return OR;}
"not"     	{currPos += yyleng; return NOT;}
"true"     	{currPos += yyleng; return TRUE;}
"false"     	{currPos += yyleng; return FALSE;}
"return"	{currPos += yyleng; return RETURN;}


"-"	{currPos += yyleng; return SUB;}
"+"     {currPos += yyleng; return ADD;}
"*"    	{currPos += yyleng; return MULT;}
"/"     {currPos += yyleng; return DIV;}
"%"     {currPos += yyleng; return MOD;}
"=="    {currPos += yyleng; return EQ;}
"<>"    {currPos += yyleng; return NEQ;}
"<"     {currPos += yyleng; return LT;}
">"     {currPos += yyleng; return GT;}
"<="    {currPos += yyleng; return LTE;}
">="    {currPos += yyleng; return GTE;}

";"     {currPos += yyleng; return SEMICOLON;}
":"     {currPos += yyleng; return COLON;}
","     {currPos += yyleng; return COMMA;}
"("     {currPos += yyleng; return L_PAREN;}
")"     {currPos += yyleng; return R_PAREN;}
"["     {currPos += yyleng; return L_SQUARE_BRACKET;}
"]"   	{currPos += yyleng; return R_SQUARE_BRACKET;}
":="	{currPos += yyleng; return ASSIGN;}
"\n"	{++currLine; currPos = 1;}
[\t]+	{currPos += yyleng;}
[ ]	{currPos += yyleng;}
"##".*	{++currLine; currPos = 1;}



{DIGIT}*        {printf("NUMBER %s\n", yytext); currPos += yyleng; return NUMBER;}
{IDENTIFIER}    {printf("IDENT %s\n", yytext); currPos += yyleng; return IDENT;}
{FILE}          {printf("FILE %s\n", yytext); yyin = fopen(yytext, "r");}
{INVALIDB}      {a;sldkfj;alskdjf;laskjfprintf("Error at line %d and column %d: identifier \"%s\" must begin with a letter\n", currLine, currPos - 1, yytext); exit(0);}
{INVALIDA}      {currPos += yyleng; printf("Error at line %d and column %d: identifier \"%s\" cannot end with an underscore\n", currLine, currPos - 1, yytext); exit(0);}
.       {printf("Error at line %d, column %d: unrecognized symbol \"%s\"\n", currLine, currPos, yytext); ++currLine; currPos += yyleng; exit(0);}





%%



int main()
{
	yylex();
}
