inicio 
= reglas;

reglas 
= ((ε w)* regla)+;

regla 
= identificador w alias? comw "=" comw produccion (comw "/" comw produccion)* (comw ";")? (w ε)*  w_newline?;

alias="\"" [^"]* "\""
/ "'" [^']* "'";

produccion 
= secuencia (comw "/" comw secuencia)*;

secuencia 
= prefijo (com_ prefijo)*;

prefijo 
= "@"? nombrexp? _ ("$" / "!" / "&")? com_ sufijo;

sufijo 
= primario (comw operador_repeticion)?;
/*@[hola]*/

nombrexp= identificador w ":";



operador_repeticion 
= "*" / "+" / "?"
/ "|" w (numero / identificador ) w"|"
/ "|" w (numero / identificador )? w ".." w (numero / identificador )? w"|"
/ "|" w (numero / identificador )? w "," w produccion w "|"
/ "|" w (numero / identificador )? w ".." w (numero / identificador )? w "," w produccion w "|"
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
= '"' [^"]* '"' / "'" [^']* "'";

clase_caracteres 
= "[" [^\]]+ "]";

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