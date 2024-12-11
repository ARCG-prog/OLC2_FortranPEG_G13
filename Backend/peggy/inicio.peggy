inicio 
    = w comentarios* reglas;

comentarios
    = comentario_linea / comentario_multilinea;

comentario_linea
    = "//" [^\n\r]* newline;

comentario_multilinea
    = "/*" (!"*/" .)* "*/";

reglas 
    = regla+;

regla 
    = comentarios* identificador comentarios* etiqueta_descriptiva? w "=" comentarios* w expresion (w "/" w expresion)* (w ";")? comentarios* w_newline?;

etiqueta_descriptiva
    = w "\"" [^"]* "\"";

expresion 
    = comentarios* secuencia (w "/" w secuencia)* comentarios*;

secuencia 
    = comentarios* etiqueta? prefijo (comentarios* _ comentarios* etiqueta? prefijo)*;

etiqueta
    = identificador ":" w;

prefijo 
    = ("&" / "!" / "^")? _ sufijo;

sufijo 
    = primario (w operador_repeticion)?;

operador_repeticion 
    = "*" / "+" / "?";

primario 
    = comentarios* (
    identificador
    / literal
    / clase_caracteres
    / punto
    / "(" w comentarios* expresion w comentarios* ")"
    ) comentarios*;

punto
    =".";

agrupacion 
    = [0-9] / [a-zA-Z];

literal 
    = '"' [^"]* '"' / "'" [^']* "'";

clase_caracteres 
    = "[" [^\]]+ "]";

identificador 
    = [_a-zA-Z][_a-zA-Z0-9]*;

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
