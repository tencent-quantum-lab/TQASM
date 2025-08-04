lexer grammar tqasm_lexer;


TQASM: 'TQASM';
QREG: 'QREG';
GATE: 'GATE';
MEASZ: 'MEASZ';
DEFCAL: 'defcal';
FRAME: 'frame';
NEWFRAME: 'newframe';
PLAY: 'play';
PRAGMA: '#pragma';

// Gate operations
I: 'I';
X: 'X';
Y: 'Y';
Z: 'Z';
H: 'H';
S: 'S';
T: 'T';
TD: 'TD';
SD: 'SD';
WROOT: 'WROOT';
CX: 'CX';
SZ: 'SZ';
SWAP: 'SWAP';
CY: 'CY';
OX: 'OX';
OY: 'OY';
OZ: 'OZ';
TOFFOLI: 'TOFFOLI';
FREDKIN: 'FREDKIN';
RX: 'RX';
RY: 'RY';
RZ: 'RZ';
PHASE: 'PHASE';
RXX: 'RXX';
RYY: 'RYY';
RZZ: 'RZZ';
CRX: 'CRX';
CRY: 'CRY';
CRZ: 'CRZ';
ORX: 'ORX';
ORY: 'ORY';
ORZ: 'ORZ';
ISWAP: 'ISWAP';
UNITARY: 'UNITARY';
IMG: 'IMG';
PI: 'PI';

// Identifiers
ID : [a-z][a-zA-Z0-9_.]*;

// Numbers
REAL: [0-9]+ '.' [0-9]* 
    | '.' [0-9]+ 
    | [0-9]+ 
    | [0-9]+ '.' [0-9]* [eE][-+]?[0-9]+ 
    | '.' [0-9]+ [eE][-+]?[0-9]+ 
    | [0-9]+ [eE][-+]?[0-9]+;
NNINTEGER: [1-9][0-9]* | '0';

    


// Strings
STRING: '"' .*? '"';



// Operators
PLUS: '+';
MINUS: '-';
MUL: '*';
DIV: '/';
POW: '^';

// Brackets
LPAREN: '(';
RPAREN: ')';
LBRACK: '[';
RBRACK: ']';
LBRACE: '{';
RBRACE: '}';

// Separators
COMMA: ',';
SEMI: ';';
EQ: '=';

// Whitespace and comments
WS: [ \t\r\n]+ -> skip;
COMMENT: '//' ~[\r\n]* -> skip;
BLOCK_COMMENT: '/*' .*? '*/' -> skip;
		
