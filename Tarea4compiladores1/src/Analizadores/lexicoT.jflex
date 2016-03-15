/*----------------------------------------------------------------------------
----------------------------------------- Area de Codigo de Usuario
----------------------------------------------------------------------------*/

//-------------------> Importaciones 
//-------------------> Paquetes 
package Analizadores;
import java_cup.runtime.*;

%%

%{
    //-------------------> Codigo de usuario en sintaxis java
%}


/*----------------------------------------------------------------------------
----------------------------------------- Area de Opciones y Declaraciones
----------------------------------------------------------------------------*/

//-------------------> Directivas
%public
%class LexicoT
%cupsym Simbolos
%cup
%char
%column
%full
%ignorecase
%line
%unicode

//-------------------> Expresiones Regulares

digito = [0-9]
decimal = ("-")?{digito}+("." {digito}+)+
entero=("+")?{digito}+
tstring = "\"" ~"\""
tchar = "'" ~"'"
letra = [a-zA-ZñÑ]
id = ({letra}|{digito})+({letra}|{digito}|"_")*
idcorreo=({letra})+(@compi1.com)



//-------------------> Estados
%state COMENT_SIMPLE
%state COMENT_MULTI

%%
/*-------------------------------------------------------------------
----------------------------------------- Area de Reglas Lexicas
-------------------------------------------------------------------*/

//-------------------> Comentarios
<YYINITIAL> "/*"            {yybegin(COMENT_MULTI);}
<COMENT_MULTI> "*/"         {yybegin(YYINITIAL);}
<COMENT_MULTI> "*"          {}
<COMENT_MULTI>  .           {/* Omitir como es un comentario :D */}

<YYINITIAL> "//"            {yybegin(COMENT_SIMPLE);}
<COMENT_SIMPLE> [^"\n"]     {}
<COMENT_SIMPLE> "\n"        {yybegin(YYINITIAL);}
<COMENT_SIMPLE>  .          {/* Omitir como es un comentario :D */}


//-------------------> Palabras Reservadas
<YYINITIAL> "$request$"         {   System.out.println("Reconocido: <<"+yytext()+">>,inicio");
                                return new Symbol(Simbolos.inicio, yycolumn, yyline, yytext());}

<YYINITIAL> "$request-$"           {   System.out.println("Reconocido: <<"+yytext()+">>,fin");
                                return new Symbol(Simbolos.fin, yycolumn, yyline, yytext());}

<YYINITIAL> "$InicioUsuario$"        {   System.out.println("Reconocido: <<"+yytext()+">>,usuarioi");
                                return new Symbol(Simbolos.usuarioi, yycolumn, yyline, yytext());}

<YYINITIAL> "$InicioUsuario-$"      {   System.out.println("Reconocido: <<"+yytext()+">>, usuariof");
                                return new Symbol(Simbolos.usuariof, yycolumn, yyline, yytext());}

<YYINITIAL> "$id$"     {   System.out.println("Reconocido: <<"+yytext()+">>,idi");
                                return new Symbol(Simbolos.idi, yycolumn, yyline, yytext());}

<YYINITIAL> "$id-$"          {   System.out.println("Reconocido: <<"+yytext()+">>,idf");
                                return new Symbol(Simbolos.idf, yycolumn, yyline, yytext());}

<YYINITIAL> "$password$"         {   System.out.println("Reconocido: <<"+yytext()+">>,codigoi");
                                return new Symbol(Simbolos.codigoi, yycolumn, yyline, yytext());}

<YYINITIAL> "$password-$"         {   System.out.println("Reconocido: <<"+yytext()+">>,codigof");
                                return new Symbol(Simbolos.codigof, yycolumn, yyline, yytext());}

<YYINITIAL> "$CrearUsuario$"         {   System.out.println("Reconocido: <<"+yytext()+">>,creari");
                                return new Symbol(Simbolos.creari, yycolumn, yyline, yytext());}

<YYINITIAL> "$CrearUsuario-$"         {   System.out.println("Reconocido: <<"+yytext()+">>,crearf");
                                return new Symbol(Simbolos.crearf, yycolumn, yyline, yytext());}

<YYINITIAL> "$nombre$"         {   System.out.println("Reconocido: <<"+yytext()+">>,nombrei");
                                return new Symbol(Simbolos.nombrei, yycolumn, yyline, yytext());}

<YYINITIAL> "$nombre-$"         {   System.out.println("Reconocido: <<"+yytext()+">>,nombref");
                                return new Symbol(Simbolos.nombref, yycolumn, yyline, yytext());}

<YYINITIAL> "$apellido$"         {   System.out.println("Reconocido: <<"+yytext()+">>,apellidoi");
                                return new Symbol(Simbolos.apellidoi, yycolumn, yyline, yytext());}

<YYINITIAL> "$apellido-$"         {   System.out.println("Reconocido: <<"+yytext()+">>,apellidof");
                                return new Symbol(Simbolos.apellidof, yycolumn, yyline, yytext());}

<YYINITIAL> "$telefono$"         {   System.out.println("Reconocido: <<"+yytext()+">>, telefonoi");
                                return new Symbol(Simbolos.telefonoi, yycolumn, yyline, yytext());}

<YYINITIAL> "$telefono-$"         {   System.out.println("Reconocido: <<"+yytext()+">>, telefonof");
                                return new Symbol(Simbolos.telefonof, yycolumn, yyline, yytext());}

<YYINITIAL> "$email$"         {   System.out.println("Reconocido: <<"+yytext()+">>,correoi");
                                return new Symbol(Simbolos.correoi, yycolumn, yyline, yytext());}

<YYINITIAL> "$email-$"         {   System.out.println("Reconocido: <<"+yytext()+">>,correof");
                                return new Symbol(Simbolos.correof, yycolumn, yyline, yytext());}

<YYINITIAL> "$direccion$"         {   System.out.println("Reconocido: <<"+yytext()+">>,direccioni");
                                return new Symbol(Simbolos.direccioni, yycolumn, yyline, yytext());}

<YYINITIAL> "$direccion-$"         {   System.out.println("Reconocido: <<"+yytext()+">>, direccionf");
                                return new Symbol(Simbolos.direccionf, yycolumn, yyline, yytext());}

<YYINITIAL> "tienda"         {   System.out.println("Reconocido: <<"+yytext()+">>,tipoT");
                                return new Symbol(Simbolos.tipoT, yycolumn, yyline, yytext());}

<YYINITIAL> "$codigo$"         {   System.out.println("Reconocido: <<"+yytext()+">>,codi");
                                return new Symbol(Simbolos.codi, yycolumn, yyline, yytext());}

<YYINITIAL> "$codigo-$"         {   System.out.println("Reconocido: <<"+yytext()+">>,codf");
                                return new Symbol(Simbolos.codf, yycolumn, yyline, yytext());}

<YYINITIAL> "$propietario$"         {   System.out.println("Reconocido: <<"+yytext()+">>,propii");
                                return new Symbol(Simbolos.propii, yycolumn, yyline, yytext());}

<YYINITIAL> "$propietario-$"         {   System.out.println("Reconocido: <<"+yytext()+">>,propif");
                                return new Symbol(Simbolos.propif, yycolumn, yyline, yytext());}

<YYINITIAL> "$img$"         {   System.out.println("Reconocido: <<"+yytext()+">>, imgi");
                                return new Symbol(Simbolos.imgi, yycolumn, yyline, yytext());}

<YYINITIAL> "$img-$"         {   System.out.println("Reconocido: <<"+yytext()+">>,imgf");
                                return new Symbol(Simbolos.imgf, yycolumn, yyline, yytext());}

<YYINITIAL> "$tienda-$"         {   System.out.println("Reconocido: <<"+yytext()+">>,tiendaf");
                                return new Symbol(Simbolos.tiendaf, yycolumn, yyline, yytext());}

<YYINITIAL> "codigo"         {   System.out.println("Reconocido: <<"+yytext()+">>, cod");
                                return new Symbol(Simbolos.cod, yycolumn, yyline, yytext());}

<YYINITIAL> "propietario"         {   System.out.println("Reconocido: <<"+yytext()+">>, pro");
                                return new Symbol(Simbolos.pro, yycolumn, yyline, yytext());}

<YYINITIAL> "nombre"         {   System.out.println("Reconocido: <<"+yytext()+">>, nom");
                                return new Symbol(Simbolos.nom, yycolumn, yyline, yytext());}

<YYINITIAL> "direccion"         {   System.out.println("Reconocido: <<"+yytext()+">>, dir");
                                return new Symbol(Simbolos.dir, yycolumn, yyline, yytext());}

<YYINITIAL> "telefono"         {   System.out.println("Reconocido: <<"+yytext()+">>,tel");
                                return new Symbol(Simbolos.tel, yycolumn, yyline, yytext());}

<YYINITIAL> "tipo"         {   System.out.println("Reconocido: <<"+yytext()+">>, tip");
                                return new Symbol(Simbolos.tip, yycolumn, yyline, yytext());}

<YYINITIAL> "$cantidad$"         {   System.out.println("Reconocido: <<"+yytext()+">>,cantidadi");
                                return new Symbol(Simbolos.cantidadi, yycolumn, yyline, yytext());}

<YYINITIAL> "$cantidad-$"         {   System.out.println("Reconocido: <<"+yytext()+">>,cantidadf");
                                return new Symbol(Simbolos.cantidadf, yycolumn, yyline, yytext());}

<YYINITIAL> "$marca$"         {   System.out.println("Reconocido: <<"+yytext()+">>,marcai");
                                return new Symbol(Simbolos.marcai, yycolumn, yyline, yytext());}

<YYINITIAL> "$marca-$"         {   System.out.println("Reconocido: <<"+yytext()+">>,marcaf");
                                return new Symbol(Simbolos.marcaf, yycolumn, yyline, yytext());}

<YYINITIAL> "$color$"         {   System.out.println("Reconocido: <<"+yytext()+">>, colori");
                                return new Symbol(Simbolos.colori, yycolumn, yyline, yytext());}

<YYINITIAL> "$color-$"         {   System.out.println("Reconocido: <<"+yytext()+">>, colorf");
                                return new Symbol(Simbolos.colorf, yycolumn, yyline, yytext());}

<YYINITIAL> "$tamano$"         {   System.out.println("Reconocido: <<"+yytext()+">>,tamanoi");
                                return new Symbol(Simbolos.tamanoi, yycolumn, yyline, yytext());}

<YYINITIAL> "$tamano-$"         {   System.out.println("Reconocido: <<"+yytext()+">>, tamanof");
                                return new Symbol(Simbolos.tamanof, yycolumn, yyline, yytext());}

<YYINITIAL> "$sucursal$"         {   System.out.println("Reconocido: <<"+yytext()+">>, sucursali");
                                return new Symbol(Simbolos.sucursali, yycolumn, yyline, yytext());}

<YYINITIAL> "$sucursal-$"         {   System.out.println("Reconocido: <<"+yytext()+">>, sucursalf");
                                return new Symbol(Simbolos.sucursalf, yycolumn, yyline, yytext());}

<YYINITIAL> "$producto-$"         {   System.out.println("Reconocido: <<"+yytext()+">>, productof");
                                return new Symbol(Simbolos.productof, yycolumn, yyline, yytext());}


<YYINITIAL> "sucursal"         {   System.out.println("Reconocido: <<"+yytext()+">>,sucur");
                                return new Symbol(Simbolos.sucur, yycolumn, yyline, yytext());}


<YYINITIAL> "cantidad"         {   System.out.println("Reconocido: <<"+yytext()+">>, cant");
                                return new Symbol(Simbolos.cant, yycolumn, yyline, yytext());}



<YYINITIAL> "$"         {   System.out.println("Reconocido: <<"+yytext()+">>,llavei");
                                return new Symbol(Simbolos.llavei, yycolumn, yyline, yytext());}

<YYINITIAL> "-$"         {   System.out.println("Reconocido: <<"+yytext()+">>, llavef");
                                return new Symbol(Simbolos.llavef, yycolumn, yyline, yytext());}


//-------------------> Simbolos
<YYINITIAL> ";"         {   System.out.println("Reconocido: <<"+yytext()+">>, pcoma");
                            return new Symbol(Simbolos.pcoma, yycolumn, yyline, yytext());}

<YYINITIAL> ","         {   System.out.println("Reconocido: <<"+yytext()+">>, coma");
                            return new Symbol(Simbolos.coma, yycolumn, yyline, yytext());}

<YYINITIAL> "="         {   System.out.println("Reconocido: <<"+yytext()+">>,igual");
                            return new Symbol(Simbolos.igual, yycolumn, yyline, yytext());}

<YYINITIAL> "("         {   System.out.println("Reconocido: <<"+yytext()+">>, apar");
                            return new Symbol(Simbolos.apar, yycolumn, yyline, yytext());}

<YYINITIAL> ")"         {   System.out.println("Reconocido: <<"+yytext()+">>, cpar");
                            return new Symbol(Simbolos.cpar, yycolumn, yyline, yytext());}

<YYINITIAL> "+"         {   System.out.println("Reconocido: <<"+yytext()+">>, mas");
                            return new Symbol(Simbolos.mas, yycolumn, yyline, yytext());}

<YYINITIAL> "-"         {   System.out.println("Reconocido: <<"+yytext()+">>, menos");
                            return new Symbol(Simbolos.menos, yycolumn, yyline, yytext());}

<YYINITIAL> "*"         {   System.out.println("Reconocido: <<"+yytext()+">>, por");
                            return new Symbol(Simbolos.por, yycolumn, yyline, yytext());}

<YYINITIAL> "/"        {   System.out.println("Reconocido: <<"+yytext()+">>, div");
                            return new Symbol(Simbolos.div, yycolumn, yyline, yytext());}



//-------------------> Dato

<YYINITIAL> {decimal}        {   System.out.println("Reconocido: <<"+yytext()+">>, rdecimal");
                                return new Symbol(Simbolos.rdecimal, yycolumn, yyline, new String (yytext()));}

<YYINITIAL> {entero}        {   System.out.println("Reconocido: <<"+yytext()+">>, rentero");
                                return new Symbol(Simbolos.rentero, yycolumn, yyline, new String( yytext()));}


<YYINITIAL> {tstring}       {   System.out.println("Reconocido: <<"+yytext()+">>, tstring ");
                                return new Symbol(Simbolos.tstring, yycolumn, yyline,new String( yytext()));}

<YYINITIAL> {tchar}         {   System.out.println("Reconocido: <<"+yytext()+">>, tchar ");
                                return new Symbol(Simbolos.tchar, yycolumn, yyline,new String( yytext()));}

<YYINITIAL> {id}            {   System.out.println("Reconocido: <<"+yytext()+">>, id ");
                                return new Symbol(Simbolos.id, yycolumn, yyline, new String (yytext()));}

<YYINITIAL> {idcorreo}            {   System.out.println("Reconocido: <<"+yytext()+">>, idc ");
                                return new Symbol(Simbolos.idc, yycolumn, yyline, new String (yytext()));}





//-------------------> Espacios
[ \t\r\n\f]                 {/* Espacios en blanco, se ignoran */ }
 
//-------------------> Errores Lexicos
.                           {   System.out.println("Error Lexico: <<"+yytext()+">> Linea: "+yyline+" ,Columna: "+yycolumn);}

