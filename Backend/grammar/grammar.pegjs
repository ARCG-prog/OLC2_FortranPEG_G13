    inicio
    = reglas;

    reglas
    = regla+;

    regla
    = identificador _ "=" _ expresion _ (";" _)?;

    expresion
    = secuencia (_ "/" _ secuencia)*;

    secuencia
    = prefijo (_ prefijo)*;

    prefijo
    = (("&" / "!")? _)? sufijo;

    sufijo
    = primario _ ("*" / "+" / "?")?;

    primario
    = identificador
    / literal
    / clase_caracteres
    / "(" _ expresion _ ")";

    literal
    = '"' [^"]* '"'
    / "'" [^']* "'";

    clase_caracteres
    = "[" [^\]]+ "]";

    identificador
    = [_a-z][_a-z0-9]*;

    _ "whitespace"
    = [ \t\n\r]*; // Manejo flexible de espacios en blanco y saltos de línea
