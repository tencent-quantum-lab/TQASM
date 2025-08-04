parser grammar tqasm_parser;

options {
    tokenVocab = tqasm_lexer;
}

// ====== Parser Rules ======
mainprogram
    : version_specifier macro_chiptop? program EOF
    | version_specifier macro_chiptop program EOF
    ;

version_specifier
    : TQASM real SEMI
    | TQASM real real SEMI
    ;

macro_chiptop
    : pragma_qubit_mapping
    | pragma_qubit_mapping pragma_qubit_coupling
    ;

pragma_qubit_mapping
    : PRAGMA MAPPINGID chip_topo
    ;

pragma_qubit_coupling
    : PRAGMA COUPLINGID chip_topo
    ;

program
    : statement*
    ;

statement
    : qdecl
    | gatedecl LBRACE goplist RBRACE
    | gatedecl RBRACE
    | MEASZ argument SEMI
    | gop
    | pulse
    ;

qdecl
    : QREG id LBRACK nninteger RBRACK SEMI
    ;

gatedecl
    : GATE id idlist LBRACE
    | GATE id LPAREN RPAREN idlist LBRACE
    | GATE id LPAREN idlist RPAREN idlist LBRACE
    ;

goplist
    : gop+
    ;

gop
    : stdgate
    | id anylist SEMI
    | id LPAREN RPAREN anylist SEMI
    | id LPAREN explist RPAREN anylist SEMI
    ;

argument
    : id
    | id LBRACK nninteger RBRACK
    ;

explist
    : exp (COMMA exp)*
    ;

anylist
    : idlist
    | mixedlist
    ;

mixedlist
    : (id | id LBRACK nninteger RBRACK) (COMMA (id | id LBRACK nninteger RBRACK))*
    ;

idlist
    : id (COMMA id)*
    ;

exp
    : real
    | nninteger
    | PI
    | exp PLUS exp
    | exp MINUS exp
    | exp MUL exp
    | exp DIV exp
    | exp POW exp
    | LPAREN exp RPAREN
    | MINUS exp
    ;

stdgate
    : I argument SEMI
    | X argument SEMI
    | Y argument SEMI
    | Z argument SEMI
    | H argument SEMI
    | S argument SEMI
    | T argument SEMI
    | TD argument SEMI
    | SD argument SEMI
    | WROOT argument SEMI
    | CX argument argument SEMI
    | SZ argument argument SEMI
    | SWAP argument argument SEMI
    | CY argument argument SEMI
    | OX argument argument SEMI
    | OY argument argument SEMI
    | OZ argument argument SEMI
    | TOFFOLI argument argument argument SEMI
    | FREDKIN argument argument argument SEMI
    | RX LPAREN explist RPAREN argument SEMI
    | RY LPAREN explist RPAREN argument SEMI
    | RZ LPAREN explist RPAREN argument SEMI
    | PHASE LPAREN explist RPAREN argument SEMI
    | RXX LPAREN explist RPAREN argument argument SEMI
    | RYY LPAREN explist RPAREN argument argument SEMI
    | RZZ LPAREN explist RPAREN argument argument SEMI
    | CRX LPAREN explist RPAREN argument argument SEMI
    | CRY LPAREN explist RPAREN argument argument SEMI
    | CRZ LPAREN explist RPAREN argument argument SEMI
    | ORX LPAREN explist RPAREN argument argument SEMI
    | ORY LPAREN explist RPAREN argument argument SEMI
    | ORZ LPAREN explist RPAREN argument argument SEMI
    | ISWAP LPAREN explist RPAREN argument argument SEMI
    | UNITARY LPAREN explist RPAREN argument SEMI
    ;

pulse
    : defcal
    ;

defcal
    : DEFCAL id idlist LBRACE calgrammar RBRACE
    ;

calgrammar
    : calstatement*
    ;

calstatement
    : framedecl
    | waveformplay
    ;

framedecl
    : FRAME id EQ NEWFRAME LPAREN idlist RPAREN SEMI
    ;

waveformplay
    : PLAY LPAREN id COMMA waveform RPAREN SEMI
    ;

waveform
    : id LPAREN explist RPAREN
    ;

chip_topo
    : LBRACK nnint_pairlist? RBRACK
    ;

nnint_pairlist
    : nnint_pair (COMMA nnint_pair)*
    ;

nnint_pair
    : LBRACK nninteger COMMA nninteger RBRACK
    ;

real : REAL;
nninteger : NNINTEGER;
id : ID;
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
