" Vim syntax file
" Language: SEBOL
" Version: 0.1

if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

syn case ignore

syn keyword sebolBoolean true false
syn keyword sebolConditional if else then case elsif compare
syn keyword sebolConditional end 
syn keyword sebolConstant %% % OPEN CLOSE ON OFF OK NG TMSTOP TMSTAT TMCONT TMPAUS
syn keyword sebolLabel goto errorsub
syn keyword sebolOperator and div mod not or shl shr xor
syn keyword sebolRepeat do for repeat while to until by of
syn keyword sebolRepeat next@
syn keyword sebolStatement wait
syn keyword sebolStruct struct
syn keyword sebolStruct end_struct
syn keyword sebolType array char
syn keyword sebolType string

" Todos
syn keyword sebolTodo contained TODO FIXME XXX DEBUG NOTE

" String
syn region  sebolString matchgroup=sebolString start=+'+ end=+'+ contains=sebolStringEscape
syn region  sebolString matchgroup=sebolString start=+"+ end=+"+ contains=sebolStringEscape

" Operator
syn match SymbolOperator "[+\-/*]"
syn match SymbolOperator "[<>]=\="
syn match SymbolOperator "=="
syn match SymbolOperator "<>"
syn match SymbolOperator ":="
syn match SymbolOperator "[()\[\]]"
syn match SymbolOperator "\.\."

" Numbers
syn match sebolNumber '-\=\<\d\+\>'

"Floats
syn match sebolFloat '-\=\<\d\+\.\d\+\>'
syn match sebolFloat '-\=\<\d\+\.\d\+[eE]-\=\d\+\>'

"HexNum
syn match sebolHexNumber '\(\(B\|W\|DW\)\+#\)\?$[0-9a-fA-F]\+'

"Comment
syn region sebolComment start="/" end="$" contains=sebolTodo,sebolSpaceError

"functions
syn keyword sebolFunction Abs Arctan Cos Exp Ln Sin Sqr Sqrt
syn keyword sebolFunction cat getname history assign to
syn keyword sebolFunction ccmreadbid cmwritebid format

"Types
syn keyword sebolType char integer long float double

"Constant
syn keyword sebolConstant TITLE NAME AUTHOR FAMILY VERSION % %%

syn keyword sebolStatement fail otherwise operator

" control flow functions
syn keyword sebolFunction quit

if version >= 508 || !exists("did_sebol_syn_inits")
  if version < 508
    let did_sebol_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink sebolAcces sebolStatement
  HiLink sebolBoolean Boolean
  HiLink sebolComment Comment
  HiLink sebolComment1 Comment
  HiLink sebolComment2 Comment
  HiLink sebolComment3 Comment
  HiLink sebolConditional Conditional
  HiLink sebolConstant Constant
  HiLink sebolDelimiter Identifier
  HiLink sebolDirective sebolStatement
  HiLink sebolException Exception
  HiLink sebolFloat float
  HiLink sebolFunction Function
  HiLink sebolLabel Label
  HiLink sebolMatrixDelimiter Identifier
  HiLink sebolModifier Type
  HiLink sebolNumber Number
  HiLink sebolHexNumber Number
  HiLink sebolOperator Operator
  HiLink sebolPredefined sebolStatement
  HiLink sebolPreProc PreProc
  HiLink sebolRepeat Repeat
  HiLink sebolSpaceError Error
  HiLink sebolStatement Statement
  HiLink sebolString String
  HiLink sebolStringError Error
  HiLink sebolStruct sebolStatement
  HiLink SymbolOperator Operator
  HiLink sebolTodo Todo
  HiLink sebolType Type
  HiLink sebolUnclassified sebolStatement
  HiLink sebolError Error
  HiLink sebolAsmKey sebolStatement
  HiLink sebolShowTab Error
  HiLink sebolKeyword Keyword
  delcommand HiLink
endif

let b:current_syntax = "sebol"
