/* JFlex example: partial Java language lexer specification */
import java_cup.runtime.*;

/**
 * This class is a simple example lexer.
 */
%%

%class Scanner
%unicode
%cup
%line
%column

/* declarations */

%{
  StringBuffer string = new StringBuffer();

  private Symbol symbol(int type) {
	return new Symbol(type, yyline, yycolumn);
  }
  private Symbol symbol(int type, Object value) {
	return new Symbol(type, yyline, yycolumn, value);
  }
%}

/* macro Declarations */

LineTerminator = \r|\n|\r\n
WhiteSpace     = {LineTerminator} | [ \t\f]

Identifier = [:jletter:] [:jletterdigit:]*

%state STRING

%%

/* keywords */

<YYINITIAL> {

  \"                             { string.setLength(0); yybegin(STRING); }
  /* code */
  "if"							 { return symbol(sym.IF);}
  "else"					     { return symbol(sym.ELSE);}
  "prefix"						 { return symbol(sym.PREFIX);}
  "suffix"						 { return symbol(sym.SUFFIX);}
  
  /* operators */
  "+"                            { return symbol(sym.PLUS); }
  "-"							 { return symbol(sym.MINUS);}
  "*"							 { return symbol(sym.TIMES);}
  ","                            { return symbol(sym.COMMA);}
  
  /*code structure */
  "{" 							 {return symbol(sym.LBRACKET);}
  "}" 							 {return symbol(sym.RBRACKET);}
  "(" 							 {return symbol(sym.LPAR);}
  ")" 							 {return symbol(sym.RPAR);}
  ";" 							 {return symbol(sym.SEMICOLON);}
  {Identifier}                   { return symbol(sym.IDENTIFIER,yytext()); }

  /* whitespace */
  {WhiteSpace}                   { /* ignore */ }
}

<STRING> {
  \"                             { yybegin(YYINITIAL);
								   return symbol(sym.STRING_LITERAL,
								   string.toString()); }
  [^\n\r\"\\]+                   { string.append( yytext() ); }
  \\t                            { string.append('\t'); }
  \\n                            { string.append('\n'); }

  \\r                            { string.append('\r'); }
  \\\"                           { string.append('\"'); }
  \\                             { string.append('\\'); }
}

/* error fallback */
[^]                              { throw new Error("Illegal character <"+yytext()+">"); }