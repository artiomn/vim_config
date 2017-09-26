" Lisp & Scheme.

fun! Filetype_Lisp()
   if exists("b:is_mzscheme") || exists("is_mzscheme")
      " improve indenting
      setl iskeyword+=#,%,^
      setl lispwords+=module,parameterize,let-values,let*-values,letrec-values
      setl lispwords+=define-values,opt-lambda,case-lambda,syntax-rules,with-syntax,syntax-case
      setl lispwords+=define-signature,unit,unit/sig,compund-unit/sig,define-values/invoke-unit/sig
   endif
endf
"---------------------------------------------------------------------------------

