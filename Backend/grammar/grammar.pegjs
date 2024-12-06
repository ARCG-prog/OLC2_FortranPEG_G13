    inicio
    = reglas;

    reglas
    = regla+;

    regla
    = identificador w "=" w expresion _ (";" _)? n?;

    expresion
    = secuencia (w "/"w secuencia)*;

    secuencia
    = prefijo (_ prefijo)*;

    prefijo
    = ("&" / "!" / "^")? _ sufijo;

    sufijo
    = primario _ ("*" / "+" / "?")?;

    primario
    = identificador
    / literal
    / clase_caracteres
    / "(" w expresion w ")"
    / "[" w agrupacion+ w "]"
    ;
    
    agrupacion= [0-9]
    / [a-zA-Z]
    ;

    literal
    = '"' [^"]* '"'
    / "'" [^']* "'";

    clase_caracteres
    = "[" [^\]]+ "]";

    identificador
    = [_a-z][_a-z0-9]*;

    n "newline" 
    = [\n\r]*
    _ "onlyspace"
    = [ \t]*; // Manejo flexible de espacios en blanco y saltos de línea
    w "whitespace"
    = [ \t\n\r]*; // Manejo flexible de espacios en blanco y saltos de línea
