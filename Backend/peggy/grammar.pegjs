inicio
= reglas;

reglas
= ((ε w)* regla)+;

regla
= identificador comw "=" comw expresion (comw "/" comw expresion)* (comw ";")? (w ε)*  w_newline?;

expresion
= secuencia (comw "/" comw secuencia)*;

secuencia
= prefijo (com_ prefijo)*;

prefijo
= ("$" / "!" / "&")? com_ sufijo;

sufijo
= pluck? w primario (comw operador_repeticion)?;

pluck
= "@"? identificador w ":" w;

operador_repeticion
= "*" / "+" / "?";

primario
= identificador
    / literal
    / clase_caracteres
    / punto
    / "(" comw expresion comw ")"
    ;
punto=".";

agrupacion
= [0-9] / [a-zA-Z];

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