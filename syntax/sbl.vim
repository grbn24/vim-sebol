" Vim syntax file
" Language: SEBOL
" Version: 0.1

if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

syn case ignore

syn keyword sblBoolean true false
syn keyword sblConditional if else then case elsif compare
syn keyword sblConditional end 
syn keyword sblConstant %% % OPEN CLOSE ON OFF OK NG TMSTOP TMSTAT TMCONT TMPAUS
syn keyword sblLabel goto errorsub
syn keyword sblOperator and div mod not or shl shr xor
syn keyword sblRepeat do for repeat while to until by of
syn keyword sblRepeat next@
syn keyword sblStatement wait
syn keyword sblStruct struct
syn keyword sblStruct end_struct
syn keyword sblType array char
syn keyword sblType string

" Todos
syn keyword sblTodo contained TODO FIXME XXX DEBUG NOTE

" String
syn region  sblString matchgroup=sblString start=+'+ end=+'+ contains=sblStringEscape
syn region  sblString matchgroup=sblString start=+"+ end=+"+ contains=sblStringEscape

" Operator
syn match SymbolOperator "[+\-/*]"
syn match SymbolOperator "[<>]=\="
syn match SymbolOperator "=="
syn match SymbolOperator "<>"
syn match SymbolOperator ":="
syn match SymbolOperator "[()\[\]]"
syn match SymbolOperator "\.\."

" Numbers
syn match sblNumber '-\=\<\d\+\>'

"Floats
syn match sblFloat '-\=\<\d\+\.\d\+\>'
syn match sblFloat '-\=\<\d\+\.\d\+[eE]-\=\d\+\>'

"HexNum
syn match sblHexNumber '\(\(B\|W\|DW\)\+#\)\?$[0-9a-fA-F]\+'

"Comment
syn region sblComment start="/" end="$" contains=sblTodo,sblSpaceError

"functions
syn keyword sblFunction Abs Arctan Cos Exp Ln Sin Sqr Sqrt
syn keyword sblFunction cat getname history assign to
syn keyword sblFunction ccmreadbid cmwritebid format

"Types
syn keyword sblType char integer long float double

"Constant
syn keyword sblConstant TITLE NAME AUTHOR FAMILY VERSION % %%

syn keyword sblStatement fail otherwise operator

" control flow functions
syn keyword sblFunction quit

if version >= 508 || !exists("did_sbl_syn_inits")
  if version < 508
    let did_sbl_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink sblAcces sblStatement
  HiLink sblBoolean Boolean
  HiLink sblComment Comment
  HiLink sblComment1 Comment
  HiLink sblComment2 Comment
  HiLink sblComment3 Comment
  HiLink sblConditional Conditional
  HiLink sblConstant Constant
  HiLink sblDelimiter Identifier
  HiLink sblDirective sblStatement
  HiLink sblException Exception
  HiLink sblFloat float
  HiLink sblFunction Function
  HiLink sblLabel Label
  HiLink sblMatrixDelimiter Identifier
  HiLink sblModifier Type
  HiLink sblNumber Number
  HiLink sblHexNumber Number
  HiLink sblOperator Operator
  HiLink sblPredefined sblStatement
  HiLink sblPreProc PreProc
  HiLink sblRepeat Repeat
  HiLink sblSpaceError Error
  HiLink sblStatement Statement
  HiLink sblString String
  HiLink sblStringError Error
  HiLink sblStruct sblStatement
  HiLink SymbolOperator Operator
  HiLink sblTodo Todo
  HiLink sblType Type
  HiLink sblUnclassified sblStatement
  HiLink sblError Error
  HiLink sblAsmKey sblStatement
  HiLink sblShowTab Error
  HiLink sblKeyword Keyword
  delcommand HiLink
endif

let b:current_syntax = "sbl"
