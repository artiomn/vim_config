" HTML.

fun! Filetype_HTML()
   call MapHTMLKeys()
endf
"---------------------------------------------------------------------------------
fun! HTML_template()
   append
<!DOCTYPE html>
<html>
<!-- Creation date: @DATE@ -->
<head>
<meta http-equiv="Content-Type"     content="text/html; charset=UTF-8">
<meta http-equiv="Content-Language" content="ru">

<meta name="description"            content="@DESC@">
<meta name="author"                 content="@AUTHOR@">
<meta name="copyright"              content="(c)@AUTHOR@">
<title>@FILE@</title>
</head>
<body>



</body>
<!-- vim:set @MODELINE@ -->
.

   call Template_Apply("html")

   call cursor(15, 1)
endf
"---------------------------------------------------------------------------------
fun! MapHTMLKeys(...)
" Sets up various insert mode key mappings suitable for typing HTML, and
" automatically removes them when switching to a non-HTML buffer.

   " if no parameter, or a non-zero parameter, set up the mappings:
   if a:0 == 0 || a:1 != 0
      " require two backslashes to get one:
      inoremap \\ \

      " then use backslash followed by various symbols insert HTML characters:
      inoremap \& &amp;
      inoremap \< &lt;
      inoremap \> &gt;
      inoremap \. &middot;

      " em dash -- have \- always insert an em dash, and also have _ do it if
      " ever typed as a word on its own, but not in the middle of other words:
      inoremap \- &#8212;
      iabbrev _ &#8212;

      " hard space with <Ctrl>+Space, and \<Space> for when that doesn't work:
      "inoremap \<Space> &nbsp;
      "imap <C-Space> \<Space>

      " have the normal open and close single quote keys producing the character
      " codes that will produce nice curved quotes (and apostophes) on both Unix
      " and Windows:
      inoremap ` &#8216;
      inoremap ' &#8217;
      " then provide the original functionality with preceding backslashes:
      inoremap \` `
      inoremap \' '

      " curved double open and closed quotes (2 and " are the same key for me):
      inoremap \2 &#8220;
      inoremap \" &#8221;

      " when switching to a non-HTML buffer, automatically undo these mappings:
      au! BufLeave * call MapHTMLKeys(0)

      " parameter of zero, so want to unmap everything:
   else
      iunmap \\
      iunmap \&
      iunmap \<
      iunmap \>
      iunmap \-
      iunabbrev _
      "iunmap \<Space>
      "iunmap <C-Space>
      iunmap `
      iunmap '
      iunmap \`
      iunmap \'
      iunmap \2
      iunmap \"

      " once done, get rid of the autocmd that called this:
      au! BufLeave *
   endif " test for mapping/unmapping

endf
"---------------------------------------------------------------------------------
