inicio 
= reglas;

reglas 
= ((ε w)* regla)+;

regla 
= identificador comw alias? comw "=" comw produccion (comw "/" comw produccion)* (comw ";")? (w ε)*  w_newline?;

alias="\"" [^"]* "\""
/ "'" [^']* "'";

produccion 
= secuencia (comw "/" comw secuencia)*;

secuencia 
= prefijo (com_ prefijo)*;

prefijo 
= "@"? nombrexp? com_ ("$" / "!" / "&")? com_ sufijo;

sufijo 
= primario (comw operador_repeticion)?;
/*@[hola]*/

nombrexp= identificador comw ":";



operador_repeticion 
= "*" / "+" / "?"
/ "|" comw (numero / identificador ) comw"|"
/ "|" comw (numero / identificador )? comw ".." comw (numero / identificador )? comw"|"
/ "|" comw (numero / identificador )? comw "," comw produccion comw "|"
/ "|" comw (numero / identificador )? comw ".." comw (numero / identificador )? comw "," comw produccion comw "|"
;

primario 
= identificador
    / literal
    / clase_caracteres
    / punto
    / "(" comw produccion comw ")"
    ;
punto=".";

agrupacion 
= [0-9] / [a-zA-Z];

numero
= [0-9]+;

literal 
= '"' litcd '"' / "'" litcs "'";

litcd=('\\"'/ [^"])*; //literal comillas dobles
litcs=("\\'"/ [^'] )*; //literal comillas simples

clase_caracteres 
= "[" ccc"]";

ccc= ('\\]'/ '\\[' /[^\]])+; //clase caracteres corhchetes


identificador 
= [_a-z]i[_a-z0-9]i*;

w_newline 
= (w_blank / newline)*;

newline 
= [\n\r]+;

_ 
= [ \t]*;

w 
= [ \t\n\r]*;

w_blank 
= [ \t]+;


comw=(w ε)* w;


com_=(_ ε2)* _;//dudas

ε = ε1 / ε2 ;
ε1="//" (![\n] .)*;
ε2="/*" (!("*/") .)* "*/";

xd="xd3";
//     _ "onlyspace"
//     = [ \t]*; // Manejo flexible de espacios en blanco y saltos de línea
//     w "whitespace"
//     = [ \t\n\r]*; // Manejo flexible de espacios en blanco y saltos de línea