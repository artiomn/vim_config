" Vimball Archiver by Charles E. Campbell, Jr., Ph.D.
UseVimball
finish
doc/checksyntax.txt	[[[1
577
*checksyntax.txt*   checksyntax -- Check syntax when saving a file (php, ruby, tex ...)
                    Author: Tom Link, micathom at gmail com

The checksyntax plugin runs an external syntax checker for the current buffer 
whenever the buffer is saved (by calling the |:CheckSyntax| command). Syntax 
errors are managed as location or quickfix lists. If any syntax error occurs, 
the |location-list| is opened (users can redefine |CheckSyntaxFail()| to change 
this behaviour). You can use any |location-list| related command to navigate 
the list of syntax errors.

By default, |:CheckSyntax| is mapped to <F5> (if not mapped already), and 
automatically executed when saving the buffer. If multiple syntax checkers are 
defined for the given filetype, this will by default invoke the preferred (see 
|g:checksyntax#preferred|) or first good (i.e. installed) syntax checker for a 
given filetype.

:CheckSyntax! (with the optional <bang>) or <C-F5> will run all supported 
syntax checkers for a given filetype if multiple syntax checkers are defined 
for a given filetype and if the software is installed on your computer.

In order to automatically run a syntax check when saving a file, please set 
|g:checksyntax#auto_enable_rx| to an appropriate value. If the variable is set 
to '.', which matches all filetypes, automatic syntax checks are enabled for 
all supported filetypes. Automatic checks are equivalent to running 
|:CheckSyntax| with no <bang>.

The syntax checks are performed by external syntax checker. This software has 
to be installed on your computer. Pre-defined syntax checkers are:

  c, cpp       ... Use splint
  html         ... Use tidy
  java         ... Use
                    jlint (http://jlint.sourceforge.net),
                    checkstyle (http://checkstyle.sourceforge.net),
                    pmd (http://pmd.sourceforge.net)
  javascript   ... Use jshint, esprima, gjslint, jslint, jsl, pmd
  lua          ... Use luac (run luac -p)
  php          ... Use php (run php -l)
  python       ... Use pyflakes or pylint
  r            ... Use codetools::checkUsage, lint::lint, or 
                   svTools::lint
  ruby         ... Use ruby (run ruby -c)
  tex, latex   ... Use chktex (run chktex -q -v0)
  typescript   ... Use tsc
  viki         ... Use deplate
  xhtml        ... Use tidy
  xml, docbk   ... Use xmllint, pmd

Syntax checker definitions are kept in:
autoload/checksyntax/defs/{&filetype}.vim

Run this command to find out, which filetypes are supported: >

  :echo globpath(&rtp, 'autoload/checksyntax/defs/*.vim')


Credits:

This plugin was originally based on Klaus Horsten's php_console 
(vimscript #779) and it is the successor of php_check_syntax.vim 
(vimscript #1272).


-----------------------------------------------------------------------
Install~

Edit the vba file and type: >

    :so %

See :help vimball for details. If you have difficulties or use vim 7.0, 
please make sure, you have the current version of vimball (vimscript 
#1502) installed or update your runtime.

Optional enhancements:

If quickfixsigns (vimscript #2584) is installed, lines containing syntax errors 
will be marked with signs.

Experimental: If AsyncCommand (vimscript #3431) is installed, syntax checks can 
be peformed asynchronously -- see also |g:checksyntax#run_alternatives|, 
|g:checksyntax#run_all_alternatives| and |g:checksyntax#async_runner|. This 
requires a version of vim with |clientserver| support and |v:servername| to be 
set (for vim see also |--servername|).


========================================================================
Contents~

        :CheckSyntax ........................................... |:CheckSyntax|
        g:checksyntax_key_single ............................... |g:checksyntax_key_single|
        g:checksyntax_key_all .................................. |g:checksyntax_key_all|
        g:checksyntax_auto ..................................... |g:checksyntax_auto|
        g:checksyntax_enable_syntax ............................ |g:checksyntax_enable_syntax|
        g:checksyntax#auto_enable_rx ........................... |g:checksyntax#auto_enable_rx|
        g:checksyntax#auto_disable_rx .......................... |g:checksyntax#auto_disable_rx|
        g:checksyntax#show_cmd ................................. |g:checksyntax#show_cmd|
        g:checksyntax#lines_expr ............................... |g:checksyntax#lines_expr|
        g:checksyntax#preferred ................................ |g:checksyntax#preferred|
        g:checksyntax#async_runner ............................. |g:checksyntax#async_runner|
        :CheckSyntaxStatus ..................................... |:CheckSyntaxStatus|
        g:checksyntax#run_alternatives ......................... |g:checksyntax#run_alternatives|
        g:checksyntax#run_all_alternatives ..................... |g:checksyntax#run_all_alternatives|
        g:checksyntax#windows .................................. |g:checksyntax#windows|
        g:checksyntax#null ..................................... |g:checksyntax#null|
        g:checksyntax#cygwin_path_rx ........................... |g:checksyntax#cygwin_path_rx|
        g:checksyntax#cygwin_expr .............................. |g:checksyntax#cygwin_expr|
        g:checksyntax#check_cygpath ............................ |g:checksyntax#check_cygpath|
        CheckSyntaxSucceed ..................................... |CheckSyntaxSucceed()|
        CheckSyntaxFail ........................................ |CheckSyntaxFail()|
        g:checksyntax#prototypes ............................... |g:checksyntax#prototypes|
        checksyntax#AddChecker ................................. |checksyntax#AddChecker()|
        checksyntax#GetChecker ................................. |checksyntax#GetChecker()|
        checksyntax#Check ...................................... |checksyntax#Check()|
        checksyntax#AddJob ..................................... |checksyntax#AddJob()|
        checksyntax#RemoveJob .................................. |checksyntax#RemoveJob()|
        checksyntax#Status ..................................... |checksyntax#Status()|
        checksyntax#GetList .................................... |checksyntax#GetList()|
        checksyntax#NullOutput ................................. |checksyntax#NullOutput()|
        checksyntax#MaybeUseCygpath ............................ |checksyntax#MaybeUseCygpath()|
        checksyntax#SetupSyntax ................................ |checksyntax#SetupSyntax()|
        checksyntax#defs#xml#pmd_args .......................... |checksyntax#defs#xml#pmd_args|
        g:checksyntax#defs#r#progname .......................... |g:checksyntax#defs#r#progname|
        g:checksyntax#defs#r#options ........................... |g:checksyntax#defs#r#options|
        g:checksyntax#defs#r#checkUsage_options ................ |g:checksyntax#defs#r#checkUsage_options|
        g:checksyntax#defs#r#checkUsage_ignore_undefined_rx .... |g:checksyntax#defs#r#checkUsage_ignore_undefined_rx|
        g:checksyntax#defs#r#checkUsage_ignore_functions ....... |g:checksyntax#defs#r#checkUsage_ignore_functions|
        g:checksyntax#defs#r#checkUsage_search_other_buffers ... |g:checksyntax#defs#r#checkUsage_search_other_buffers|
        g:checksyntax#defs#php#cmd ............................. |g:checksyntax#defs#php#cmd|
        g:checksyntax#defs#php#args ............................ |g:checksyntax#defs#php#args|
        g:checksyntax#defs#haxe#haxe ........................... |g:checksyntax#defs#haxe#haxe|
        g:checksyntax#defs#haxe#hxml_files ..................... |g:checksyntax#defs#haxe#hxml_files|
        checksyntax#defs#haxe#Cmd .............................. |checksyntax#defs#haxe#Cmd()|
        g:checksyntax#defs#javascript#closure .................. |g:checksyntax#defs#javascript#closure|
        g:checksyntax#defs#javascript#closure_warnings ......... |g:checksyntax#defs#javascript#closure_warnings|
        g:checksyntax#defs#javascript#pmd_args ................. |g:checksyntax#defs#javascript#pmd_args|
        g:checksyntax#defs#ruby#interpreter .................... |g:checksyntax#defs#ruby#interpreter|
        g:checksyntax#defs#scala#scalastyle .................... |g:checksyntax#defs#scala#scalastyle|
        checksyntax#defs#scala#Cmd ............................. |checksyntax#defs#scala#Cmd()|
        checksyntax#defs#java#pmd_rulesets ..................... |checksyntax#defs#java#pmd_rulesets|
        checksyntax#defs#java#pmd_args ......................... |checksyntax#defs#java#pmd_args|
        checksyntax#defs#java#Jlint ............................ |checksyntax#defs#java#Jlint()|
        g:checksyntax#pmd#cmd .................................. |g:checksyntax#pmd#cmd|
        g:checksyntax#pmd#args ................................. |g:checksyntax#pmd#args|
        checksyntax#pmd#Cmd .................................... |checksyntax#pmd#Cmd()|
        checksyntax#async#asyncaddon#Run ....................... |checksyntax#async#asyncaddon#Run()|
        checksyntax#async#asynccommand#Run ..................... |checksyntax#async#asynccommand#Run()|


========================================================================
plugin/checksyntax.vim~

                                                    *:CheckSyntax*
CheckSyntax[!] [NAME]
    Check the current buffer's syntax (type defaults to &filetype).
    Or use NAME instead of &filetype.

    With the bang !, run all alternatives (see 
    |g:checksyntax#run_alternatives|).

                                                    *g:checksyntax_key_single*
g:checksyntax_key_single       (default: '<F5>')
    Map for running the preferred syntax checkers on the current 
    buffer.

                                                    *g:checksyntax_key_all*
g:checksyntax_key_all          (default: '<C-F5>')
    Map for running all suitable syntax checkers on the current 
    buffer.

                                                    *g:checksyntax_auto*
g:checksyntax_auto             (default: 1)
    If 1, enable automatic syntax checks after saving a file.
    If 2, enable automatic syntax checks when saving and loading a 
    file.
    NOTE: This variable must be customized in vimrc before loading 
    this plugin.

    See also |g:checksyntax|, |g:checksyntax#auto_enable_rx| and 
    |g:checksyntax#auto_disable_rx|.

                                                    *g:checksyntax_enable_syntax*
g:checksyntax_enable_syntax    (default: [])
    A list of filetypes for which frequent beginner errors will be 
    highlighted by matching lines against |regexp|s defined in the 
    file `autoload/checksyntax/syntax/{FILETYPE}.vim`.

    See :echo globpath(&rtp, 'autoload/checksyntax/syntax/*.vim') for 
    supported filetypes/checks.

    The variable can also be buffer-local. In this case all named 
    types will be loaded.

    E.g. in order to enable highlighting trailing whitespace, use: >

      let b:checksyntax_enable_syntax = ['trailing_whitespace']

<   If you want to enable this for all file of filetype X, add this 
    line to in `after/syntax/X.vim`.


========================================================================
autoload/checksyntax.vim~

                                                    *g:checksyntax#auto_enable_rx*
g:checksyntax#auto_enable_rx   (default: '')
    Enable automatic checking for filetypes matching this rx.
    Set to "." to enable for all filetypes.
    This requires |g:checksyntax_auto| to be > 0.
    This variable overrules any filetype-specific settings in 
    |g:checksyntax|.

                                                    *g:checksyntax#auto_disable_rx*
g:checksyntax#auto_disable_rx  (default: '')
    Disable automatic checking for filetypes matching this rx.
    Set to "." to disable for all filetypes.
    This requires |g:checksyntax_auto| to be > 0.
    This variable overrules any filetype-specific settings in 
    |g:checksyntax|.

                                                    *g:checksyntax#show_cmd*
g:checksyntax#show_cmd         (default: {'qfl': 'copen', 'loc': 'lopen'})
    A dictionary of VIM commands that are used to display the qf/loc 
    lists.
    If empty, do nothing.

                                                    *g:checksyntax#lines_expr*
g:checksyntax#lines_expr       (default: '')
    A vim expression that determines the number of lines of the 
    qfl/loc window. If empty, don't set the size.
    A useful value is: >
      let g:checksyntax#lines_expr = 'min([&previewheight, &lines / 2, len(getloclist(0))])'
<

                                                    *g:checksyntax#preferred*
g:checksyntax#preferred        (default: {'xml': '.'})
    A dictionary of 'filetype' => |regexp|.
    If only one alternative should be run (see 
    |g:checksyntax#run_alternatives|), check only those syntax 
    checkers whose names matches |regexp|.

                                                    *g:checksyntax#async_runner*
g:checksyntax#async_runner     (default: has('clientserver') && !empty(v:servername) && exists(':AsyncMake') ? 'asynccommand' : '')
    Supported values:
      asynccommand ... Use the AsyncCommand plugin

                                                    *:CheckSyntaxStatus*
:CheckSyntaxStatus
    Show status information (pending async tasks).

                                                    *g:checksyntax#run_alternatives*
g:checksyntax#run_alternatives (default: 'first' . (!empty(g:checksyntax#async_runner) ? ' async' : ''))
    How to handle alternatives. Possible values:

        first ... Use the first valid entry
        all   ... Run all valid alternatives one after another

    Alternatively, the following flag can be added in order to change 
    how the alternatives are run:

        async ... Run alternatives asynchronously (see also 
                  |g:checksyntax#async_runner|)

                                                    *g:checksyntax#run_all_alternatives*
g:checksyntax#run_all_alternatives (default: 'all' . (!empty(g:checksyntax#async_runner) ? ' async' : ''))
    How to run "all" alternatives -- e.g., when calling the 
    |:CheckSyntax| command with a bang.

                                                    *g:checksyntax#windows*
g:checksyntax#windows          (default: &shell !~ 'sh' && (has('win16') || has('win32') || has('win64')))

                                                    *g:checksyntax#null*
g:checksyntax#null             (default: g:checksyntax#windows ? 'NUL' : (filereadable('/dev/null') ? '/dev/null' : ''))

                                                    *g:checksyntax#cygwin_path_rx*
g:checksyntax#cygwin_path_rx   (default: '/cygwin/')
    If a full windows filename (with slashes instead of backslashes) 
    matches this |regexp|, it is assumed to be a cygwin executable.

                                                    *g:checksyntax#cygwin_expr*
g:checksyntax#cygwin_expr      (default: '"bash -c ''". escape(%s, "''\\") ."''"')
    For cygwin binaries, convert command calls using this vim 
    expression.

                                                    *g:checksyntax#check_cygpath*
g:checksyntax#check_cygpath    (default: g:checksyntax#windows && s:Executable('cygpath'))
    If true, check whether we have to convert a path via cyppath -- 
    see |checksyntax#MaybeUseCygpath|

                                                    *CheckSyntaxSucceed()*
CheckSyntaxSucceed(type, manually)
    This function is called when no syntax errors were found.

                                                    *CheckSyntaxFail()*
CheckSyntaxFail(type, manually, bg)
    This function is called when a syntax error was found.

                                                    *g:checksyntax#prototypes*
g:checksyntax#prototypes       (default: {'loc': {}, 'qfl': {}})
    Contains prototype definitions for syntax checkers that use the 
    |location-list| ("loc") or the |quixfix|-list.

                                                    *checksyntax#AddChecker()*
checksyntax#AddChecker(filetype, ...)
    Define a syntax checker definition for a given filetype.
    If filetype ends with "?", add only if no checker with the given name 
    is defined.

    A checker definition is a dictionary with the following fields:

    Mandatory (either one of the following):

      cmd ........ A shell command used as 'makeprg' to check the file.
      cmdexpr .... A vim expression that returns the cmd
      compiler ... A vim compiler that is used to check the file.
      exec ....... A vim command used to check the file (deprecated; use 
                   cmdexpr & process_list instead)

    Optional:

      efm  ....... An 'errorformat' string.
      prepare .... An ex command that is run before doing anything.
      ignore_nr .. A list of error numbers that should be ignored.
      listtype ... Either loc (default) or qfl
      include .... Include another definition
      process_list .. Process a list of issues
      if ......... An expression to test *once* whether a syntax checker 
                   should be used.
      if_executable .. Test whether an application is executable.
      buffers .... Keep results only for either "current", "listed", or 
                   "all" buffers
      compiler_args .. Internal use
      cmd_args ... Internal use

    Optional top-level fields:

      auto ....... Run automatically when saving a file (see also 
                   |g:checksyntax#auto_enable_rx| and 
                   |g:checksyntax#auto_disable_rx|)
      modified ... The name of a pseudo-filetype that should be used if 
                   the buffer was modified
      run_alternatives ... A string that defines how to run 
                   alternatives (overrides 
                   |g:checksyntax#run_alternatives|).

    Top-level fields affect how syntax checkers for a filetype are run.

                                                    *checksyntax#GetChecker()*
checksyntax#GetChecker(filetype, ...)

                                                    *checksyntax#Check()*
checksyntax#Check(manually, ?bang='', ?filetype=&ft, ?background=1)
    Perform a syntax check.
    If bang is not empty, run all alternatives (see 
    |g:checksyntax#run_alternatives|).
    If filetype is empty, the current buffer's 'filetype' will be used.
    If background is true, display the list of issues in the background, 
    i.e. the active window will keep the focus.

                                                    *checksyntax#AddJob()*
checksyntax#AddJob(make_def)

                                                    *checksyntax#RemoveJob()*
checksyntax#RemoveJob(job_id)

                                                    *checksyntax#Status()*
checksyntax#Status()

                                                    *checksyntax#GetList()*
checksyntax#GetList(name, make_def, type)

                                                    *checksyntax#NullOutput()*
checksyntax#NullOutput(flag)

                                                    *checksyntax#MaybeUseCygpath()*
checksyntax#MaybeUseCygpath(cmd)
    If cmd seems to be a cygwin executable, use cygpath to convert 
    filenames. This assumes that cygwin's which command returns full 
    filenames for non-cygwin executables.

                                                    *checksyntax#SetupSyntax()*
checksyntax#SetupSyntax(syntax)


========================================================================
autoload/checksyntax/defs/xml.vim~

                                                    *checksyntax#defs#xml#pmd_args*
checksyntax#defs#xml#pmd_args  (default: '')


========================================================================
autoload/checksyntax/defs/r.vim~


Syntax checkers for R:

  codetools::checkUsageEnv ... Requires http://cran.r-project.org/web/packages/codetools/
  lint::lint ... Requires http://cran.r-project.org/web/packages/lint/
  svTools::lint ... Requires http://cran.r-project.org/web/packages/svTools/

                                                    *g:checksyntax#defs#r#progname*
g:checksyntax#defs#r#progname  (default: executable('Rterm') ? 'Rterm' : 'R')

                                                    *g:checksyntax#defs#r#options*
g:checksyntax#defs#r#options   (default: '--slave --ess --restore --no-save -e "%s" --args')

                                                    *g:checksyntax#defs#r#checkUsage_options*
g:checksyntax#defs#r#checkUsage_options (default: 'all = TRUE')
    Optons passed to codetools::checkUsageEnv.
    Must not be empty.

                                                    *g:checksyntax#defs#r#checkUsage_ignore_undefined_rx*
g:checksyntax#defs#r#checkUsage_ignore_undefined_rx (default: '')
    A |/\V| regexp pattern of names that should be ignored, when 
    codetools::checkUsageEnv reports "no visible global function 
    definition".

                                                    *g:checksyntax#defs#r#checkUsage_ignore_functions*
g:checksyntax#defs#r#checkUsage_ignore_functions (default: [])
    A list of function names that will be ignored when parsing the 
    result list from codetools::checkUsageEnv.

                                                    *g:checksyntax#defs#r#checkUsage_search_other_buffers*
g:checksyntax#defs#r#checkUsage_search_other_buffers (default: 0)
    If 2, also search other buffers for patterns returned by 
    codetools::checkUsageEnv. This may cause unreponsive behaviour.

    If 1, show unidentifiable patterns as is.

    If 0, remove unidentifiable patterns.


========================================================================
autoload/checksyntax/defs/php.vim~

                                                    *g:checksyntax#defs#php#cmd*
g:checksyntax#defs#php#cmd     (default: 'php')

                                                    *g:checksyntax#defs#php#args*
g:checksyntax#defs#php#args    (default: '-l -n -d display_errors=1 -d error_log= -d error_reporting=E_ALL')
    Displaying errors for php files is surprisingly fragile since it 
    depends on the php version and the php.ini file. If you get 
    duplicate errors or no errors at all, change the command-line 
    arguments defined with this variable. Please consider the 
    information kindly collected by Björn Oelke:

      Somehow the values in the php.ini and those passed via '--define' 
      seem to be independent, so either value in checksyntax' def file 
      seems to be a problem with one of the possible values in the 
      php.ini:

      | cmd | php.ini | Errors |
      +-----+---------+--------+
      | 1   | On      | 2      |
      | 0   | On      | 1      |
      | 1   | Off     | 1      |
      | 0   | Off     | 0      |

      There's an additional flag in the manpage called '--no-php-ini', 
      that could solve the problem.

    You can run `php -i | grep display_errors` to find out if 
    display_errors is On because of the php.ini. By default, the 
    setting in php.ini is ignored ("-n" command-line flag).


========================================================================
autoload/checksyntax/defs/haxe.vim~

                                                    *g:checksyntax#defs#haxe#haxe*
g:checksyntax#defs#haxe#haxe   (default: executable('haxe') ? 'haxe' : '')
    Filename of the haxe executable.

                                                    *g:checksyntax#defs#haxe#hxml_files*
g:checksyntax#defs#haxe#hxml_files (default: ['compile.hxml'])

                                                    *checksyntax#defs#haxe#Cmd()*
checksyntax#defs#haxe#Cmd()


========================================================================
autoload/checksyntax/defs/javascript.vim~

                                                    *g:checksyntax#defs#javascript#closure*
g:checksyntax#defs#javascript#closure (default: '')
    If non-empty, enable some checks via closure compiler.

                                                    *g:checksyntax#defs#javascript#closure_warnings*
g:checksyntax#defs#javascript#closure_warnings (default: ['const', 'constantProperty', 'checkRegExp', 'strictModuleDepCheck', 'visibility'])

                                                    *g:checksyntax#defs#javascript#pmd_args*
g:checksyntax#defs#javascript#pmd_args (default: '')


========================================================================
autoload/checksyntax/defs/ruby.vim~

                                                    *g:checksyntax#defs#ruby#interpreter*
g:checksyntax#defs#ruby#interpreter (default: system('ruby --version'))


========================================================================
autoload/checksyntax/defs/scala.vim~

                                                    *g:checksyntax#defs#scala#scalastyle*
g:checksyntax#defs#scala#scalastyle (default: '')
    The command to invoke scalastyle -- see http://www.scalastyle.org 
    and especially http://www.scalastyle.org/command-line.html

                                                    *checksyntax#defs#scala#Cmd()*
checksyntax#defs#scala#Cmd()


========================================================================
autoload/checksyntax/defs/java.vim~

                                                    *checksyntax#defs#java#pmd_rulesets*
checksyntax#defs#java#pmd_rulesets (default: [...])

                                                    *checksyntax#defs#java#pmd_args*
checksyntax#defs#java#pmd_args (default: '')

                                                    *checksyntax#defs#java#Jlint()*
checksyntax#defs#java#Jlint()


========================================================================
autoload/checksyntax/pmd.vim~

                                                    *g:checksyntax#pmd#cmd*
g:checksyntax#pmd#cmd          (default: '')
    The command to run pmd.

                                                    *g:checksyntax#pmd#args*
g:checksyntax#pmd#args         (default: '-f text')

                                                    *checksyntax#pmd#Cmd()*
checksyntax#pmd#Cmd(language, args, rulesets)


========================================================================
autoload/checksyntax/syntax/vim.vim~


                                                    *checksyntax_enable_syntax-vim*
Simple syntax checks for the vim 'filetype'~

Setting |g:checksyntax_enable_syntax| enables the following checks:

- Assignment in |:if| expression
- `else if` instead of |:elseif|
- Propably wrong arguments for |bufnr()| or |winnr()|
- Don't ignore/simplify the return value of |exists()| for cmdnames
- Calls like exists('fnname()')
- Don't write exists('foo'). If it's a variable, make the scope explicit 
  (like `g:foo`). Otherwise it was an error anyway.
- Variables with scope (|g:|, |l:|, |a:var| etc.) in function 
  argument position


========================================================================
autoload/checksyntax/async/asyncaddon.vim~

                                                    *checksyntax#async#asyncaddon#Run()*
checksyntax#async#asyncaddon#Run(cmd, make_def)


========================================================================
autoload/checksyntax/async/asynccommand.vim~

                                                    *checksyntax#async#asynccommand#Run()*
checksyntax#async#asynccommand#Run(cmd, make_def)



vim:tw=78:fo=tcq2:isk=!-~,^*,^|,^":ts=8:ft=help:norl:
plugin/checksyntax.vim	[[[1
110
" checksyntax.vim -- Check syntax when saving a file (php, ruby, tex ...)
" @Author:      Tom Link (micathom AT gmail com)
" @License:     GPL (see http://www.gnu.org/licenses/gpl.txt)
" @Created:     04-Mai-2005.
" @Last Change: 2012-08-28.
" GetLatestVimScripts: 1431 0 :AutoInstall: checksyntax.vim
" @Revision:    462

if exists('g:loaded_checksyntax')
    finish
endif
let g:loaded_checksyntax = 403


if !exists('g:checksyntax')
    let g:checksyntax = {}
endif


" :display: CheckSyntax[!] [NAME]
" Check the current buffer's syntax (type defaults to &filetype).
" Or use NAME instead of &filetype.
"
" With the bang !, run all alternatives (see 
" |g:checksyntax#run_alternatives|).
command! -bang -nargs=? CheckSyntax call checksyntax#Check(1, "<bang>", <f-args>)


" @TPluginInclude
if !exists('g:checksyntax_key_single')
    " Map for running the preferred syntax checkers on the current 
    " buffer.
    let g:checksyntax_key_single = '<F5>'   "{{{2
endif


" @TPluginInclude
if !exists('g:checksyntax_key_all')
    " Map for running all suitable syntax checkers on the current 
    " buffer.
    let g:checksyntax_key_all = '<C-F5>'   "{{{2
endif


if !exists('g:checksyntax_auto')
    " If 1, enable automatic syntax checks after saving a file.
    " If 2, enable automatic syntax checks when saving and loading a 
    " file.
    " NOTE: This variable must be customized in vimrc before loading 
    " this plugin.
    "
    " See also |g:checksyntax|, |g:checksyntax#auto_enable_rx| and 
    " |g:checksyntax#auto_disable_rx|.
    let g:checksyntax_auto = 1   "{{{2
endif


if !exists('g:checksyntax_enable_syntax')
    " A list of filetypes for which frequent beginner errors will be 
    " highlighted by matching lines against |regexp|s defined in the 
    " file `autoload/checksyntax/syntax/{FILETYPE}.vim`.
    "
    " See :echo globpath(&rtp, 'autoload/checksyntax/syntax/*.vim') for 
    " supported filetypes/checks.
    "
    " The variable can also be buffer-local. In this case all named 
    " types will be loaded.
    "
    " E.g. in order to enable highlighting trailing whitespace, use: >
    "
    "   let b:checksyntax_enable_syntax = ['trailing_whitespace']
    "
    " If you want to enable this for all file of filetype X, add this 
    " line to in `after/syntax/X.vim`.
    let g:checksyntax_enable_syntax = []   "{{{2
endif


" @TPluginInclude
augroup CheckSyntax
    autocmd!
    autocmd VimLeave * let s:vimleave = 1
    if !exists('g:checksyntax_auto') || g:checksyntax_auto >= 1
        autocmd BufWritePost * if !exists('s:vimleave') | call checksyntax#Check(0) | endif
    endif
    if exists('g:checksyntax_auto') && g:checksyntax_auto >= 2
        autocmd BufEnter * if !exists('b:checksyntax_runs') && !exists('s:vimleave')
                    \ | call checksyntax#Check(0, 0, &ft, 1)
                    \ | endif
    endif
    autocmd Syntax * call checksyntax#SetupSyntax(expand('<amatch>'))
augroup END


" @TPluginInclude
if !hasmapto(':CheckSyntax')
    if empty(maparg(g:checksyntax_key_single, 'n'))
        exec 'noremap' g:checksyntax_key_single ':CheckSyntax<cr>'
    endif
    if empty(maparg(g:checksyntax_key_single, 'i'))
        exec 'inoremap' g:checksyntax_key_single '<c-o>:CheckSyntax<cr>'
    endif
    if empty(maparg(g:checksyntax_key_all, 'n'))
        exec 'noremap' g:checksyntax_key_all ':CheckSyntax!<cr>'
    endif
    if empty(maparg(g:checksyntax_key_all, 'i'))
        exec 'inoremap' g:checksyntax_key_all '<c-o>:CheckSyntax!<cr>'
    endif
endif

autoload/checksyntax.vim	[[[1
1118
" @Author:      Tom Link (mailto:micathom AT gmail com?subject=[vim])
" @Website:     http://www.vim.org/account/profile.php?user_id=4037
" @License:     GPL (see http://www.gnu.org/licenses/gpl.txt)
" @Revision:    1438


if !exists('g:checksyntax#auto_enable_rx')
    " Enable automatic checking for filetypes matching this rx.
    " Set to "." to enable for all filetypes.
    " This requires |g:checksyntax_auto| to be > 0.
    " This variable overrules any filetype-specific settings in 
    " |g:checksyntax|.
    let g:checksyntax#auto_enable_rx = ''   "{{{2
endif


if !exists('g:checksyntax#auto_disable_rx')
    " Disable automatic checking for filetypes matching this rx.
    " Set to "." to disable for all filetypes.
    " This requires |g:checksyntax_auto| to be > 0.
    " This variable overrules any filetype-specific settings in 
    " |g:checksyntax|.
    let g:checksyntax#auto_disable_rx = ''   "{{{2
endif


if !exists('g:checksyntax#show_cmd')
    " A dictionary of VIM commands that are used to display the qf/loc 
    " lists.
    " If empty, do nothing.
    let g:checksyntax#show_cmd = {'qfl': 'copen', 'loc': 'lopen'}   "{{{2
endif


if !exists('g:checksyntax#lines_expr')
    " A vim expression that determines the number of lines of the 
    " qfl/loc window. If empty, don't set the size.
    " A useful value is: >
    "   let g:checksyntax#lines_expr = 'min([&previewheight, &lines / 2, len(getloclist(0))])'
    let g:checksyntax#lines_expr = ''   "{{{2
endif


if !exists('g:checksyntax#debug')
    let g:checksyntax#debug = 0
endif


if !exists('g:checksyntax#preferred')
    " A dictionary of 'filetype' => |regexp|.
    " If only one alternative should be run (see 
    " |g:checksyntax#run_alternatives|), check only those syntax 
    " checkers whose names matches |regexp|.
    let g:checksyntax#preferred = {'xml': '.'}   "{{{2
endif


if !exists('g:checksyntax#async_runner')
    " Supported values:
    "   asynccommand ... Use the AsyncCommand plugin
    let g:checksyntax#async_runner = has('clientserver') && !empty(v:servername) && exists(':AsyncMake') ? 'asynccommand' : ''  "{{{2
    if has('clientserver') && empty(v:servername)
        echohl WarningMsg
        echom "CheckSyntax: Run vim with the --servername NAME command line option to enable use of AsyncCommand"
        echohl NONE
    endif
endif


if !empty(g:checksyntax#async_runner)
    " Show status information (pending async tasks).
    command! CheckSyntaxStatus call s:Status()
endif


if !exists('g:checksyntax#run_alternatives')
    " How to handle alternatives. Possible values:
    "
    "     first ... Use the first valid entry
    "     all   ... Run all valid alternatives one after another
    "
    " Alternatively, the following flag can be added in order to change 
    " how the alternatives are run:
    "
    "     async ... Run alternatives asynchronously (see also 
    "               |g:checksyntax#async_runner|)
    let g:checksyntax#run_alternatives = 'first' . (!empty(g:checksyntax#async_runner) ? ' async' : '')   "{{{2
endif


if !exists('g:checksyntax#run_all_alternatives')
    " How to run "all" alternatives -- e.g., when calling the 
    " |:CheckSyntax| command with a bang.
    let g:checksyntax#run_all_alternatives = 'all' . (!empty(g:checksyntax#async_runner) ? ' async' : '')   "{{{2
endif


if !exists('g:checksyntax#windows')
    let g:checksyntax#windows = &shell !~ 'sh' && (has('win16') || has('win32') || has('win64'))   "{{{2
endif


if !exists('g:checksyntax#null')
    let g:checksyntax#null = g:checksyntax#windows ? 'NUL' : (filereadable('/dev/null') ? '/dev/null' : '')    "{{{2
endif


if !exists('g:checksyntax#cygwin_path_rx')
    " If a full windows filename (with slashes instead of backslashes) 
    " matches this |regexp|, it is assumed to be a cygwin executable.
    let g:checksyntax#cygwin_path_rx = '/cygwin/'   "{{{2
endif


if !exists('g:checksyntax#cygwin_expr')
    " For cygwin binaries, convert command calls using this vim 
    " expression.
    let g:checksyntax#cygwin_expr = '"bash -c ''". escape(%s, "''\\") ."''"'   "{{{2
endif


let s:cygwin = {}

function! s:CygwinBin(cmd) "{{{3
    " TLogVAR a:cmd
    if !g:checksyntax#windows
        return 0
    elseif has_key(s:cygwin, a:cmd)
        let rv = s:cygwin[a:cmd]
    else
        if !s:Executable('cygpath', 1) || !s:Executable('which', 1)
            let rv = 0
        else
            let which = substitute(system('which '. shellescape(a:cmd)), '\n$', '', '')
            " echom "DBG which:" which
            if which =~ '^/'
                let filename = system('cygpath -ma '. shellescape(which))
                " echom "DBG filename:" filename
                let rv = filename =~ g:checksyntax#cygwin_path_rx
            else
                let rv = 0
            endif
        endif
        let s:cygwin[a:cmd] = rv
    endif
    " TLogVAR rv
    return rv
endf


let s:executables = {}

function! s:Executable(cmd, ...) "{{{3
    " TLogVAR a:cmd
    " echom "DBG has_key(s:executables, a:cmd)" has_key(s:executables, a:cmd)
    if !has_key(s:executables, a:cmd)
        let executable = executable(a:cmd)
        " TLogVAR 1, executable
        let ignore_cyg = a:0 >= 1 ? a:1 : !g:checksyntax#windows
        if !executable && !ignore_cyg
            let executable = s:CygwinBin(a:cmd)
            " TLogVAR 2, executable
        endif
        let s:executables[a:cmd] = executable
    endif
    " echom "DBG s:executables[a:cmd]" s:executables[a:cmd]
    return s:executables[a:cmd]
endf


if !exists('g:checksyntax#check_cygpath')
    " If true, check whether we have to convert a path via cyppath -- 
    " see |checksyntax#MaybeUseCygpath|
    let g:checksyntax#check_cygpath = g:checksyntax#windows && s:Executable('cygpath')   "{{{2
endif


if !exists('*CheckSyntaxSucceed')
    " This function is called when no syntax errors were found.
    function! CheckSyntaxSucceed(type, manually)
        call g:checksyntax#prototypes[a:type].Close()
        if a:manually
            echo
            echo 'Syntax ok.'
        endif
    endf
endif


if !exists('*CheckSyntaxFail')
    " This function is called when a syntax error was found.
    function! CheckSyntaxFail(type, manually, bg)
        " TLogVAR a:type, a:manually, a:bg
        call g:checksyntax#prototypes[a:type].Open(a:bg)
    endf
endif


if !exists('g:checksyntax#prototypes')
    " Contains prototype definitions for syntax checkers that use the 
    " |location-list| ("loc") or the |quixfix|-list.
    let g:checksyntax#prototypes = {'loc': {}, 'qfl': {}} "{{{2
endif

    
function! s:Open(bg, type) "{{{3
    " TLogVAR a:bg
    let cmd = get(g:checksyntax#show_cmd, a:type, '')
    if !empty(cmd)
        if empty(g:checksyntax#lines_expr) || !empty(lines)
            let bufnr = bufnr('%')
            let winnr = winnr()
            exec cmd
            if a:bg && bufnr != bufnr('%')
                if !empty(g:checksyntax#lines_expr)
                    let lines = eval(g:checksyntax#lines_expr)
                    " TLogVAR lines
                    exec 'resize' lines
                endif
                wincmd p
            endif
        endif
    endif
endf


if empty(g:checksyntax#prototypes.loc)
    function! g:checksyntax#prototypes.loc.Close() dict "{{{3
        lclose
    endf

    function! g:checksyntax#prototypes.loc.Open(bg) dict "{{{3
        call s:Open(a:bg, 'loc')
    endf

    function! g:checksyntax#prototypes.loc.GetExpr(args) dict "{{{3
        " TLogDBG system(a:args)
        return s:RunCmd('lgetexpr', 'system('. string(a:args). ')')
    endf

    function! g:checksyntax#prototypes.loc.Make(args) dict "{{{3
        return s:RunCmd('lmake!', a:args)
    endf

    function! g:checksyntax#prototypes.loc.Get() dict "{{{3
        return copy(getloclist(0))
    endf

    function! g:checksyntax#prototypes.loc.Set(list) dict "{{{3
        call setloclist(0, a:list)
    endf
endif


if empty(g:checksyntax#prototypes.qfl)
    function! g:checksyntax#prototypes.qfl.Close() dict "{{{3
        cclose
    endf

    function! g:checksyntax#prototypes.qfl.Open(bg) dict "{{{3
        call s:Open(a:bg, 'qfl')
    endf

    function! g:checksyntax#prototypes.qfl.GetExpr(args) dict "{{{3
        " TLogDBG system(a:args)
        return s:RunCmd('cgetexpr', 'system('. string(a:args). ')')
    endf

    function! g:checksyntax#prototypes.qfl.Make(args) dict "{{{3
        return s:RunCmd('make!', a:args)
    endf

    function! g:checksyntax#prototypes.qfl.Get() dict "{{{3
        return copy(getqflist())
    endf

    function! g:checksyntax#prototypes.qfl.Set(list) dict "{{{3
        call setqflist(a:list)
    endf
endif


function! s:RunCmd(cmd, args) "{{{3
    try
        " TLogVAR a:cmd, a:args, &efm
        exec 'silent' a:cmd a:args
        return 1
    catch
        echohl Error
        echom v:exception
        echohl NONE
        return 0
    endtry
endf


let s:checkers = {}
let s:top_level_fields = ['modified', 'auto', 'run_alternatives', 'alternatives']
let s:mandatory = ['cmd', 'cmdexpr', 'compiler', 'exec']


" Define a syntax checker definition for a given filetype.
" If filetype ends with "?", add only if no checker with the given name 
" is defined.
"
" A checker definition is a dictionary with the following fields:
" 
" Mandatory (either one of the following):
"
"   cmd ........ A shell command used as 'makeprg' to check the file.
"   cmdexpr .... A vim expression that returns the cmd
"   compiler ... A vim compiler that is used to check the file.
"   exec ....... A vim command used to check the file (deprecated; use 
"                cmdexpr & process_list instead)
" 
" Optional:
"
"   efm  ....... An 'errorformat' string.
"   prepare .... An ex command that is run before doing anything.
"   ignore_nr .. A list of error numbers that should be ignored.
"   listtype ... Either loc (default) or qfl
"   include .... Include another definition
"   process_list .. Process a list of issues
"   if ......... An expression to test *once* whether a syntax checker 
"                should be used.
"   if_executable .. Test whether an application is executable.
"   buffers .... Keep results only for either "current", "listed", or 
"                "all" buffers
"   compiler_args .. Internal use
"   cmd_args ... Internal use
"
" Optional top-level fields:
"
"   auto ....... Run automatically when saving a file (see also 
"                |g:checksyntax#auto_enable_rx| and 
"                |g:checksyntax#auto_disable_rx|)
"   modified ... The name of a pseudo-filetype that should be used if 
"                the buffer was modified
"   run_alternatives ... A string that defines how to run 
"                alternatives (overrides 
"                |g:checksyntax#run_alternatives|).
"
" Top-level fields affect how syntax checkers for a filetype are run.
function! checksyntax#AddChecker(filetype, ...) "{{{3
    if a:0 == 1 && type(a:1) == 3
        let alternatives = a:1
    else
        let alternatives = a:000
    endif
    " TLogVAR alternatives
    if !empty(alternatives)
        let [update, filetype] = s:UpName(a:filetype)
        " TLogVAR filetype, update, a:000, a:0, type(a:1)
        if !has_key(s:checkers, filetype)
            let s:checkers[filetype] = {'alternatives': {}, 'order': []}
        endif
        for make_def in alternatives
            " Copy top_level_fields
            for upkey in s:top_level_fields
                let [kupdate, key] = s:UpName(upkey)
                if has_key(make_def, key) && (kupdate || !has_key(s:checkers[filetype], key))
                    let s:checkers[filetype][key] = remove(make_def, key)
                endif
            endfor
            " If there are other fields, add make_def
            if !empty(make_def)
                if has_key(make_def, 'cmdexpr')
                    let make_def.cmd = eval(make_def.cmdexpr)
                endif
                " TLogVAR make_def
                if !has_key(make_def, 'cmd') || !empty(make_def.cmd)
                    let [update_name, name] = s:UpNameFromDef(make_def)
                    if empty(name)
                        throw "CheckSyntax: Name must not be empty: ". filetype .': '. string(make_def)
                    elseif empty(filter(copy(s:mandatory), 'has_key(make_def, v:val)'))
                        throw "CheckSyntax: One of ". join(s:mandatory, ', ') ." must be defined: ". filetype .': '. string(make_def)
                    else
                        let new_item = !has_key(s:checkers[filetype].alternatives, name)
                        if update || update_name || new_item
                            let s:checkers[filetype].alternatives[name] = make_def
                            if new_item
                                call add(s:checkers[filetype].order, name)
                            endif
                        endif
                    endif
                endif
            endif
        endfor
    endif
endf


function! checksyntax#GetChecker(filetype, ...) "{{{3
    call checksyntax#Require(a:filetype)
    let alts = get(get(s:checkers, a:filetype, {}), 'alternatives', {})
    if a:0 == 0
        return values(alts)
    else
        return values(filter(copy(alts), 'index(a:000, v:key) != -1'))
    endif
endf


" :nodoc:
" Run |:make| based on a syntax checker definition.
function! s:RunSyncWithEFM(make_def) "{{{3
    " TLogVAR a:make_def
    let type = get(a:make_def, 'listtype', 'loc')
    let shellpipe = &shellpipe
    let errorformat = &errorformat
    if has_key(a:make_def, 'shellpipe')
        let &shellpipe = get(a:make_def, 'shellpipe')
        " TLogVAR &shellpipe
    endif
    if has_key(a:make_def, 'efm')
        let &errorformat = get(a:make_def, 'efm')
        " TLogVAR &errorformat
    endif
    try
        if has_key(a:make_def, 'cmd')
            let cmddef = s:ExtractCompilerParams(a:make_def, '%', a:make_def.cmd)
            let cmd = s:NativeCmd(cmddef.cmd)
            " TLogVAR cmd
            let rv = g:checksyntax#prototypes[type].GetExpr(cmd)
            " TLogVAR rv, getqflist()
            return rv
        elseif has_key(a:make_def, 'exec')
            exec a:make_def.exec
            return 1
        endif
    finally
        if &shellpipe != shellpipe
            let &shellpipe = shellpipe
        endif
        if &errorformat != errorformat
            let &errorformat = errorformat
        endif
    endtry
endf


let s:convert_filenames = {}

function! s:ConvertFilenames(make_def, props) "{{{3
    for key in ['filename', 'altname']
        let filename = a:props[key]
        let convert_filename = get(a:make_def, 'convert_filename', '')
        if !empty(convert_filename)
            if !has_key(s:convert_filenames, convert_filename)
                let s:convert_filenames[convert_filename] = {}
            endif
            if has_key(s:convert_filenames[convert_filename], filename)
                let filename = s:convert_filenames[convert_filename][filename]
            else
                " TLogVAR filename, convert_filename
                let cmd = printf(convert_filename, shellescape(filename))
                " TLogVAR cmd
                let filename = system(cmd)
                let filename = substitute(filename, '\n$', '', '')
                let s:convert_filenames[convert_filename][filename] = filename
            endif
            " TLogVAR filename
        endif
        let a:make_def[key] = filename
    endfor
    return a:make_def
endf


let s:loaded_checkers = {}

" :nodoc:
function! checksyntax#Require(filetype) "{{{3
    if empty(a:filetype)
        return 0
    else
        if !has_key(s:loaded_checkers, a:filetype)
            exec 'runtime! autoload/checksyntax/defs/'. a:filetype .'.vim'
            let s:loaded_checkers[a:filetype] = 1
        endif
        return has_key(s:checkers, a:filetype)
    endif
endf


function! s:NativeCmd(cmd) "{{{3
    if !empty(g:checksyntax#cygwin_expr) && s:CygwinBin(matchstr(a:cmd, '^\S\+'))
        let cmd = eval(printf(g:checksyntax#cygwin_expr, string(a:cmd)))
        " TLogVAR cmd
        return cmd
    else
        return a:cmd
    endif
endf


" :nodoc:
function! s:Cmd(make_def) "{{{3
    if has_key(a:make_def, 'cmd')
        let cmd = matchstr(a:make_def.cmd, '^\(\\\s\|\S\+\|"\([^"]\|\\"\)\+"\)\+')
    else
        let cmd = ''
    endif
    return cmd
endf


" :nodoc:
function! s:UpName(upname) "{{{3
    if a:upname =~ '?$'
        let update = 0
        let name = substitute(a:upname, '?$', '', '')
    else
        let update = 1
        let name = a:upname
    endif
    return [update, name]
endf


" :nodoc:
function! s:UpNameFromDef(make_def) "{{{3
    let name = get(a:make_def, 'name', '')
    if empty(name)
        let name = get(a:make_def, 'compiler', '')
    endif
    if empty(name)
        let name = s:Cmd(a:make_def)
    endif
    return s:UpName(name)
endf


function! s:ValidAlternative(make_def) "{{{3
    " TLogVAR a:make_def
    if has_key(a:make_def, 'if')
        return eval(a:make_def.if)
    elseif has_key(a:make_def, 'if_executable')
        return s:Executable(a:make_def.if_executable)
    else
        return 1
    endif
endf


function! s:GetValidAlternatives(filetype, run_alternatives, alternatives) "{{{3
    " TLogVAR a:filetype, a:run_alternatives, a:alternatives
    let valid = {}
    for name in get(get(s:checkers, a:filetype, {}), 'order', [])
        let alternative = a:alternatives[name]
        " TLogVAR alternative
        if s:ValidAlternative(alternative)
            if has_key(alternative, 'cmd')
                let cmd = s:Cmd(alternative)
                " TLogVAR cmd
                if !empty(cmd) && !s:Executable(cmd)
                    continue
                endif
            endif
            let valid[name] = alternative
            if a:run_alternatives =~? '\<first\>'
                break
            endif
        endif
    endfor
    return valid
endf


let s:run_alternatives_all = 0

" :nodoc:
function! checksyntax#RunAlternativesMode(make_def) "{{{3
    let rv = s:run_alternatives_all ? g:checksyntax#run_all_alternatives : get(a:make_def, 'run_alternatives', g:checksyntax#run_alternatives)
    " TLogVAR a:make_def, rv
    return rv
endf


function! s:GetDef(filetype) "{{{3
    " TLogVAR a:filetype
    if has_key(s:checkers, a:filetype)
        let dict = s:checkers
        let rv = s:checkers[a:filetype]
    else
        let dict = {}
        let rv = {}
    endif
    if !empty(dict)
        let alternatives = get(rv, 'alternatives', {})
        " TLogVAR alternatives
        if !empty(alternatives)
            let alternatives = s:GetValidAlternatives(a:filetype, checksyntax#RunAlternativesMode(rv), alternatives)
            " TLogVAR alternatives
            if len(alternatives) == 0
                let rv = {}
            else
                let rv = copy(rv)
                let rv.alternatives = alternatives
            endif
        endif
    endif
    return rv
endf


let s:async_pending = {}


let g:checksyntax#issues = {}


function! g:checksyntax#issues.Reset() dict "{{{3
    let self.issues = []
    let self.type = 'loc'
endf

call g:checksyntax#issues.Reset()


function! g:checksyntax#issues.AddList(name, make_def, type) dict "{{{3
    if a:type == 'qfl'
        let self.type = a:type
    endif
    let issues = checksyntax#GetList(a:name, a:make_def, a:type)
    if !empty(issues)
        let self.issues += issues
    endif
    return issues
endf


function! g:checksyntax#issues.Display(manually, bg) dict "{{{3
    if empty(self.issues)
        call g:checksyntax#prototypes[self.type].Set(self.issues)
        call CheckSyntaxSucceed(self.type, a:manually)
    else
        " TLogVAR self.issues
        call sort(self.issues, 's:CompareIssues')
        " TLogVAR self.issues
        " TLogVAR self.type
        call g:checksyntax#prototypes[self.type].Set(self.issues)
        " TLogVAR self.type, a:manually, a:bg
        call CheckSyntaxFail(self.type, a:manually, a:bg)
    endif
endf


" :def: function! checksyntax#Check(manually, ?bang='', ?filetype=&ft, ?background=1)
" Perform a syntax check.
" If bang is not empty, run all alternatives (see 
" |g:checksyntax#run_alternatives|).
" If filetype is empty, the current buffer's 'filetype' will be used.
" If background is true, display the list of issues in the background, 
" i.e. the active window will keep the focus.
function! checksyntax#Check(manually, ...)
    let bang = a:0 >= 1 ? !empty(a:1) : 0
    let filetype   = a:0 >= 2 && a:2 != '' ? a:2 : &filetype
    let bg   = a:0 >= 3 && a:3 != '' ? a:3 : 0
    " TLogVAR a:manually, bang, filetype, bg
    let s:run_alternatives_all = bang
    let wd = getcwd()
    let bd = expand('%:p:h')
    let will_display = 0
    try
        let defs = s:GetDefsByFiletype(a:manually, filetype)
        " TLogVAR defs
        if !empty(defs.make_defs)
            if !exists('b:checksyntax_runs')
                let b:checksyntax_runs = 1
            else
                let b:checksyntax_runs += 1
            endif
            " TLogVAR &makeprg, &l:makeprg, &g:makeprg, &errorformat
            if defs.run_alternatives =~? '\<first\>' && has_key(g:checksyntax#preferred, filetype)
                let preferred_rx = g:checksyntax#preferred[filetype]
                let defs.make_defs = filter(defs.make_defs, 's:UpNameFromDef(v:val)[1] =~ preferred_rx')
            endif
            let async = !empty(g:checksyntax#async_runner) && defs.run_alternatives =~? '\<async\>'
            " TLogVAR async
            if !empty(s:async_pending)
                if !a:manually && async
                    echohl WarningMsg
                    echo "CheckSyntax: Still waiting for async results ..."
                    echohl NONE
                    return
                else
                    let s:async_pending = {}
                endif
            endif
            let props = {
                        \ 'bg': bg,
                        \ 'bufnr': bufnr('%'),
                        \ 'filename': expand('%'),
                        \ 'altname': expand('#'),
                        \ 'manually': a:manually,
                        \ }
            call g:checksyntax#issues.Reset()
            for [name, make_def] in items(defs.make_defs)
                " TLogVAR make_def
                let make_def1 = copy(make_def)
                let done = 0
                if async
                    call extend(make_def1, props)
                    let make_def1 = s:ConvertFilenames(make_def1, make_def1)
                    let make_def1.name = name
                    let make_def1.job_id = name .'_'. make_def1.bufnr
                    let done = s:Run_async(make_def1)
                endif
                if !done
                    let make_def1 = s:ConvertFilenames(make_def1, props)
                    let done = s:Run_sync(name, filetype, make_def1)
                endif
            endfor
            " echom "DBG 1" string(list)
            if empty(s:async_pending)
                let will_display = 1
            endif
        endif
    finally
        let s:run_alternatives_all = 0
        if will_display
            call g:checksyntax#issues.Display(a:manually, bg)
        endif
    endtry
    redraw!
endf


function! s:Status() "{{{3
    if empty(s:async_pending)
        echo "CheckSyntax: No pending jobs"
    else
        echo "CheckSyntax: Pending jobs:"
        for [job_id, make_def] in items(s:async_pending)
            echo printf("  %s: bufnr=%s, cmd=%s",
                        \ job_id,
                        \ make_def.bufnr, 
                        \ make_def.name
                        \ )
        endfor
    endif
endf


function! s:GetDefsByFiletype(manually, filetype) "{{{3
    " TLogVAR a:manually, a:filetype
    let defs = {'mode': '', 'make_defs': {}}
    call checksyntax#Require(a:filetype)
    " let defs.mode = 'auto'
    let make_def = a:manually ? {} : s:GetDef(a:filetype .',auto')
    " TLogVAR 1, make_def
    if empty(make_def)
        let make_def = s:GetDef(a:filetype)
        " TLogVAR 2, make_def
    endif
    if &modified
        if has_key(make_def, 'modified')
            let make_def = s:GetDef(make_def.modified)
            " TLogVAR 3, make_def
        else
            echohl WarningMsg
            echom "Buffer was modified. Please save it before calling :CheckSyntax."
            echohl NONE
            return
        endif
    endif
    " TLogVAR make_def
    if empty(make_def)
        return defs
    endif
    if v:dying
        let auto = 0
    elseif !empty(g:checksyntax#auto_enable_rx) && a:filetype =~ g:checksyntax#auto_enable_rx
        let auto = 1
    elseif !empty(g:checksyntax#auto_disable_rx) && a:filetype =~ g:checksyntax#auto_disable_rx
        let auto = 0
    else
        let auto = get(make_def, 'auto', 0)
    endif
    " TLogVAR auto
    if !(a:manually || auto)
        return defs
    endif
    let defs.run_alternatives = checksyntax#RunAlternativesMode(make_def)
    " TLogVAR &makeprg, &l:makeprg, &g:makeprg, &errorformat
    " TLogVAR make_def
    let defs.make_defs = get(make_def, 'alternatives', {'*': make_def})
    " TLogVAR defs
    return defs
endf


function! s:CompareIssues(i1, i2) "{{{3
    let l1 = get(a:i1, 'lnum', 0)
    let l2 = get(a:i2, 'lnum', 0)
    " TLogVAR l1, l2, type(l1), type(l2)
    return l1 == l2 ? 0 : l1 > l2 ? 1 : -1
endf


function! s:WithCompiler(compiler, exec, default) "{{{3
    if exists('g:current_compiler')
        let cc = g:current_compiler
    else
        let cc = ''
    endif
    try
        exec 'compiler '. a:compiler
        exec a:exec
    finally
        if cc != ''
            let g:current_compiler = cc
            exec 'compiler '. cc
        endif
    endtry
    return a:default
endf


function! s:RunSyncChecker(filetype, make_def)
    let bufnr = bufnr('%')
    let pos = getpos('.')
    let type = get(a:make_def, 'listtype', 'loc')
    try
        if has_key(a:make_def, 'compiler')
            " <+TODO+> Use s:ExtractCompilerParams and run s:RunSyncWithEFM
            let args = get(a:make_def, 'compiler_args', '%')
            let rv = s:WithCompiler(a:make_def.compiler,
                        \ 'call g:checksyntax#prototypes[type].Make('. string(args) .')',
                        \ 1)
        else
            let rv = s:RunSyncWithEFM(a:make_def)
        endif
        " TLogVAR rv
        return rv
    catch
        echohl Error
        echom "Exception" v:exception "from" v:throwpoint
        echom v:errmsg
        echohl NONE
    finally
        " TLogVAR pos, bufnr
        if bufnr != bufnr('%')
            exec bufnr 'buffer'
        endif
        call setpos('.', pos)
    endtry
    return 0
endf


function! s:Run_async(make_def) "{{{3
    " TLogVAR a:make_def
    let make_def = a:make_def
    let cmd = ''
    if has_key(make_def, 'cmd')
        let cmd = get(make_def, 'cmd', '')
        " let cmd .= ' '. shellescape(make_def.filename)
        if has_key(a:make_def, 'cmd_args')
            let cmddef = s:ExtractCompilerParams(a:make_def, '', a:make_def.cmd)
            let cmd = cmddef.cmd
        else
            let cmd .= ' '. escape(make_def.filename, '"''\ ')
        endif
    elseif has_key(make_def, 'compiler')
        let compiler_def = s:WithCompiler(make_def.compiler,
                    \ 'return s:ExtractCompilerParams('. string(a:make_def) .', "")',
                    \ {})
        " TLogVAR compiler_def
        if !empty(compiler_def)
            let cmd = compiler_def.cmd
            let make_def.efm = compiler_def.efm
        endif
    endif
    " TLogVAR cmd
    if !empty(cmd)
        try
            let cmd = s:NativeCmd(cmd)
            " TLogVAR cmd
            let rv = checksyntax#async#{g:checksyntax#async_runner}#Run(cmd, make_def)
            call checksyntax#AddJob(make_def)
            return rv
        catch /^Vim\%((\a\+)\)\=:E117/
            echohl Error
            echom 'Checksyntax: Unsupported value for g:checksyntax#async_runner: '. string(g:checksyntax#async_runner)
            echohl NONE
            let g:checksyntax#async_runner = ''
            return 0
        endtry
    else
        echohl WarningMsg
        echom "CheckSyntax: Cannot run asynchronously: ". make_def.name
        echohl NONE
        return 0
    endif
endf


function! s:ReplaceMakeArgs(make_def, cmd, args) "{{{3
    let cmd = a:cmd
    if !empty(a:args) && stridx(cmd, '$*') == -1
        let cmd .= ' '. a:args
    endif
    let replaced = []
    if stridx(cmd, '%') != -1
        let cmd = substitute(cmd, '%\(\%(:[phtre]\)\+\)\?', '\=s:Filename(a:make_def, "%", submatch(1))', 'g')
        call add(replaced, '%')
    endif
    if stridx(cmd, '$*') != -1
        if index(replaced, '%') == -1
            let cmd = substitute(cmd, '\V$*', a:args .' '. escape(a:make_def['filename'], '\'), 'g')
            call add(replaced, '%')
        else
            let cmd = substitute(cmd, '\V$*', a:args, 'g')
        endif
        call add(replaced, '$*')
    endif
    if stridx(cmd, '#') != -1
        let cmd = substitute(cmd, '#\(\%(:[phtre]\)\+\)\?', '\=s:Filename(a:make_def, "#", submatch(1))', 'g')
        call add(replaced, '#')
    endif
    return cmd
endf


function! s:Filename(make_def, type, mod) "{{{3
    if a:type == '%'
        let filename = a:make_def.filename
    elseif a:type == '#'
        let filename = a:make_def.altname
    else
        throw "CheckSyntax/s:Filename: Internal error: type = ". a:type
    endif
    if !empty(a:mod)
        let filename = fnamemodify(filename, a:mod)
    endif
    return escape(filename, '\')
endf


function! s:ExtractCompilerParams(make_def, args, ...) "{{{3
    let cmd = a:0 >= 1 ? a:1 : &makeprg
    let args = get(a:make_def, 'compiler_args', a:args)
    let cmd = s:ReplaceMakeArgs(a:make_def, cmd, args)
    let compiler_def = {
                \ 'cmd': cmd,
                \ 'efm': &errorformat
                \ }
    " TLogVAR compiler_def
    return compiler_def
endf


let s:status_expr = 'checksyntax#Status()'

function! checksyntax#AddJob(make_def) "{{{3
    let s:async_pending[a:make_def.job_id] = a:make_def
    if exists('g:tstatus_exprs')
        if index(g:tstatus_exprs, s:status_expr) == -1
            call add(g:tstatus_exprs, s:status_expr)
        endif
    endif
endf


function! checksyntax#RemoveJob(job_id) "{{{3
    let rv = has_key(s:async_pending, a:job_id)
    if rv
        call remove(s:async_pending, a:job_id)
        if empty(s:async_pending) && exists('g:tstatus_exprs')
            let idx = index(g:tstatus_exprs, s:status_expr)
            if idx != -1
                call remove(g:tstatus_exprs, idx)
            endif
        endif
    endif
    return rv ? len(s:async_pending) : -1
endf


function! checksyntax#Status() "{{{3
    let n = len(s:async_pending)
    if n == 0
        return ''
    else
        return 'PendingChecks='. n
    endif
endf


function! s:Run_sync(name, filetype, make_def) "{{{3
    " TLogVAR a:name, a:filetype, a:make_def
    let make_def = a:make_def
    if has_key(make_def, 'include')
        let include = s:GetDef(make_def.include)
        if !empty(include)
            let make_def = extend(copy(make_def), include, 'keep')
        endif
    endif
    exec get(make_def, 'prepare', '')
    if s:RunSyncChecker(a:filetype, make_def)
        let type = get(make_def, 'listtype', 'loc')
        call g:checksyntax#issues.AddList(a:name, make_def, type)
        return 1
    else
        return 0
    endif
endf


function! checksyntax#GetList(name, make_def, type) "{{{3
    " TLogVAR a:type
    let list = g:checksyntax#prototypes[a:type].Get()
    " TLogVAR list
    " TLogVAR 1, len(list), has_key(a:make_def, 'process_list')
    if !empty(list) && has_key(a:make_def, 'process_list')
        " TLogVAR a:make_def.process_list
        let list = call(a:make_def.process_list, [list])
        " TLogVAR 2, len(list)
    endif
    if !empty(list)
        let list = filter(list, 's:FilterItem(a:make_def, v:val)')
        " TLogVAR 3, len(list)
        " TLogVAR a:type, list
        if !empty(list)
            let list = map(list, 's:CompleteItem(a:name, a:make_def, v:val)')
            " TLogVAR 4, len(list)
            " TLogVAR a:type, list
        endif
    endif
    " TLogVAR "return", list
    return list
endf


function! s:CompleteItem(name, make_def, val) "{{{3
    " TLogVAR a:name, a:make_def, a:val
    if get(a:val, 'bufnr', 0) == 0
        let a:val.bufnr = bufnr('%')
    endif
    let text = get(a:val, 'text', '')
    let a:val.text = substitute(text, '^\s\+\|\s\+$', '', 'g')
    let type = get(a:val, 'type', '')
    if !empty(type)
        let a:val.text = printf('[%s] %s', type, a:val.text)
    endif
    if !empty(a:name)
        let text = get(a:val, 'text', '')
        if !empty(text)
            let a:val.text = a:name .': '. text
        endif
    endif
    " TLogVAR a:val
    return a:val
endf


function! s:FilterItem(make_def, val) "{{{3
    if a:val.lnum == 0 && a:val.pattern == ''
        return 0
    elseif has_key(a:val, 'nr') && has_key(a:make_def, 'ignore_nr') && index(a:make_def.ignore_nr, a:val.nr) != -1
        return 0
    elseif has_key(a:make_def, 'buffers')
        let buffers = a:make_def.buffers
        if buffers == 'listed' && !buflisted(a:val.bufnr)
            return 0
        elseif buffers == 'current' && a:val.bufnr != a:make_def.bufnr
            return 0
        endif
    endif
    return 1
endf


function! checksyntax#NullOutput(flag) "{{{3
    if empty(g:checksyntax#null)
        return ''
    else
        return a:flag .' '. g:checksyntax#null
    endif
endf


" If cmd seems to be a cygwin executable, use cygpath to convert 
" filenames. This assumes that cygwin's which command returns full 
" filenames for non-cygwin executables.
function! checksyntax#MaybeUseCygpath(cmd) "{{{3
    " echom "DBG" a:cmd
    if g:checksyntax#check_cygpath && s:CygwinBin(a:cmd)
        return 'cygpath -u %s'
    endif
    return ''
endf


function! checksyntax#SetupSyntax(syntax) "{{{3
    let after_syntax = []
    if index(g:checksyntax_enable_syntax, a:syntax) != -1
        call add(after_syntax, a:syntax)
    endif
    if exists('b:checksyntax_enable_syntax')
        let after_syntax += b:checksyntax_enable_syntax
    endif
    " TLogVAR after_syntax
    redir => hidef
    silent! hi CheckSyntaxError
    redir END
    if hidef !~ '\<guisp\>'
        let fg = &bg == 'dark' ? 'yellow' : 'brown'
        exec 'hi CheckSyntaxError term=standout cterm=underline ctermfg=red gui=undercurl guisp=red guifg='. fg
        exec 'hi CheckSyntaxWarning term=standout cterm=underline ctermfg=cyan gui=undercurl guisp=cyan guifg='. fg
    endif
    for asyn in after_syntax
        exec 'runtime! autoload/checksyntax/syntax/'. asyn .'.vim'
    endfor
endf

autoload/checksyntax/defs/viki.vim	[[[1
13
" @Author:      Tom Link (mailto:micathom AT gmail com?subject=[vim])
" @License:     GPL (see http://www.gnu.org/licenses/gpl.txt)
" @Revision:    4


call checksyntax#AddChecker('viki?',
            \ {
            \     'cmd': 'deplate -f null',
            \     'convert_filename': checksyntax#MaybeUseCygpath('deplate'),
            \ }
            \ )


autoload/checksyntax/defs/lua.vim	[[[1
14
" @Author:      Tom Link (mailto:micathom AT gmail com?subject=[vim])
" @License:     GPL (see http://www.gnu.org/licenses/gpl.txt)
" @Revision:    5


call checksyntax#AddChecker('lua?',
            \ {
            \ 'if_executable': 'luac',
            \ 'cmd': 'luac -p',
            \ 'efm': 'luac\:\ %f:%l:\ %m'
            \ 'convert_filename': checksyntax#MaybeUseCygpath('luac'),
            \ }
            \ )

autoload/checksyntax/defs/xml.vim	[[[1
36
" @Author:      Tom Link (mailto:micathom AT gmail com?subject=[vim])
" @License:     GPL (see http://www.gnu.org/licenses/gpl.txt)
" @Revision:    27


if !exists('checksyntax#defs#xml#pmd_rulesets')
    let checksyntax#defs#xml#pmd_rulesets = ["basic"]
endif


if !exists('checksyntax#defs#xml#pmd_args')
    let checksyntax#defs#xml#pmd_args = ''   "{{{2
endif


call checksyntax#AddChecker('xml?',
            \   {
            \     'compiler': 'xmllint',
            \     'compiler_args': '%',
            \     'convert_filename': checksyntax#MaybeUseCygpath('xmllint'),
            \   }
            \ )


if !empty(g:checksyntax#pmd#cmd)
    call checksyntax#AddChecker('xml?',
                \ {
                \ 'name': 'pmd',
                \ 'type': 'qfl',
                \ 'cmdexpr': "checksyntax#pmd#Cmd('xml', g:checksyntax#defs#xml#pmd_args, g:checksyntax#defs#xml#pmd_rulesets)",
                \ 'cmd_args': '',
                \ 'buffers': 'listed',
                \ 'efm': '%f:%l:%m',
                \ })
endif

autoload/checksyntax/defs/r.vim	[[[1
176
" @Author:      Tom Link (mailto:micathom AT gmail com?subject=[vim])
" @License:     GPL (see http://www.gnu.org/licenses/gpl.txt)
" @Revision:    146

" :doc:
" Syntax checkers for R:
"
"   codetools::checkUsageEnv ... Requires http://cran.r-project.org/web/packages/codetools/
"   lint::lint ... Requires http://cran.r-project.org/web/packages/lint/
"   svTools::lint ... Requires http://cran.r-project.org/web/packages/svTools/


if !exists('g:checksyntax#defs#r#progname')
    let g:checksyntax#defs#r#progname = executable('Rterm') ? 'Rterm' : 'R'   "{{{2
endif

if !executable(g:checksyntax#defs#r#progname)
    throw "Please set g:checksyntax#defs#r#progname to the full filename of Rterm/R first!"
endif


if !exists('g:checksyntax#defs#r#options')
    let g:checksyntax#defs#r#options = '--slave --ess --restore --no-save -e "%s" --args'   "{{{2
endif


if !exists('g:checksyntax#defs#r#checkUsage_options')
    " Optons passed to codetools::checkUsageEnv.
    " Must not be empty.
    let g:checksyntax#defs#r#checkUsage_options = 'all = TRUE'   "{{{2
endif


if !exists('g:checksyntax#defs#r#checkUsage_ignore_undefined_rx')
    " A |/\V| regexp pattern of names that should be ignored, when 
    " codetools::checkUsageEnv reports "no visible global function 
    " definition".
    let g:checksyntax#defs#r#checkUsage_ignore_undefined_rx = ''   "{{{2
endif


if !exists('g:checksyntax#defs#r#checkUsage_ignore_functions')
    " A list of function names that will be ignored when parsing the 
    " result list from codetools::checkUsageEnv.
    let g:checksyntax#defs#r#checkUsage_ignore_functions = []   "{{{2
endif


if !exists('g:checksyntax#defs#r#checkUsage_search_other_buffers')
    " If 2, also search other buffers for patterns returned by 
    " codetools::checkUsageEnv. This may cause unreponsive behaviour.
    "
    " If 1, show unidentifiable patterns as is.
    "
    " If 0, remove unidentifiable patterns.
    let g:checksyntax#defs#r#checkUsage_search_other_buffers = 0   "{{{2
endif


call checksyntax#AddChecker('r?',
            \   {
            \     'listtype': 'qfl',
            \     'name': 'codetools',
            \     'cmd': g:checksyntax#defs#r#progname .' '.
            \         printf(g:checksyntax#defs#r#options, 'try({library(codetools); source(commandArgs(TRUE)); checkUsageEnv(globalenv(),'. g:checksyntax#defs#r#checkUsage_options .')})'),
            \     'efm': '%m (%f:%l), %s : <anonymous>: %m, %s : %m, %s: %m',
            \     'process_list': 'checksyntax#defs#r#CheckUsageEnv'
            \   },
            \   {
            \     'name': 'lint',
            \     'cmd': g:checksyntax#defs#r#progname .' '.
            \         printf(g:checksyntax#defs#r#options, 'try(lint::lint(commandArgs(TRUE)))'),
            \     'efm': 'Lint: %m,%E%f:%l:%c,%Z%\\s\\+%m',
            \     'process_list': 'checksyntax#defs#r#LintLint'
            \   },
            \ )
            " \   {
            " \     'name': 'svTools::lint',
            " \     'cmd': g:checksyntax#defs#r#progname .' '.
            " \         printf(g:checksyntax#defs#r#options, 'try(svTools::lint(commandArgs(TRUE),type=''flat''))'),
            " \     'efm': '%t%\\w%\\++++%l+++%c+++%m',
            " \   }


" :nodoc:
function! checksyntax#defs#r#LintLint(list) "{{{3
    " TLogVAR a:list
    let list = []
    for issue in a:list
        let text = get(issue, 'text', '')
        if text =~ ': found on lines \d\+'
            let message = matchstr(text, '^.\{-}\ze: found on lines \d\+')
            let lines = split(matchstr(text, 'found on lines \zs\d\+.*$'), ', ')
            " TLogVAR message, lines
            for line in lines
                if line[0] =~ '^\d\+'
                    let issue1 = copy(issue)
                    let issue1.text = message
                    let issue1.lnum = str2nr(line)
                    call add(list, issue1)
                endif
            endfor
        else
            call add(list, issue)
        endif
    endfor
    " TLogVAR list
    return list
endf


" :nodoc:
function! checksyntax#defs#r#CheckUsageEnv(list) "{{{3
    " TLogVAR a:list
    let view = winsaveview()
    try
        let list = map(a:list, 's:CompleteCheckUsageEnvItem(v:val)')
        unlet! s:lnum s:bufnr
        let list = filter(list, '!empty(v:val)')
    finally
        call winrestview(view)
    endtry
    return list
endf


function! s:CompleteCheckUsageEnvItem(item) "{{{3
    " TLogVAR a:item
    let item = a:item
    let pattern = get(item, 'pattern', '')
    if !empty(g:checksyntax#defs#r#checkUsage_ignore_functions) && !empty(pattern)
        let ignored = filter(copy(g:checksyntax#defs#r#checkUsage_ignore_functions),
                    \ 'v:val =~ pattern')
        if len(ignored) > 0
            return {}
        endif
    endif
    if !empty(g:checksyntax#defs#r#checkUsage_ignore_undefined_rx) &&
                \ item.text =~ '\C\V\<no visible global function definition for '''. g:checksyntax#defs#r#checkUsage_ignore_undefined_rx .''''
        return {}
    endif
    " TLogVAR bufname(item.bufnr)
    if get(item, 'bufnr', 0) == 0 && !empty(pattern)
        let pattern = substitute(pattern, '\\\$', '\\>', '')
        let s:bufnr = bufnr('%')
        " let fn_rx = pattern .'\_s\*<-\_s\*function\_s\*('
        let fn_rx = pattern .'\_s\*<-\_s\*'
        let s:lnum = search(fn_rx, 'cwn')
        if s:lnum == 0 && g:checksyntax#defs#r#checkUsage_search_other_buffers == 2
            let bufnr0 = s:bufnr
            let view = winsaveview()
            try
                bufdo! if &ft == 'r' | let s:lnum = search(fn_rx, 'cwn') | if s:lnum > 0 | let s:bufnr = bufnr('%') | throw "ok" | endif | endif
            catch /ok/
            finally
                exec 'buffer' bufnr0
                call winrestview(view)
            endtry
        endif
        " TLogVAR pattern, s:lnum
        if s:lnum > 0
            let item.bufnr = s:bufnr
            let item.lnum = s:lnum
            let item.pattern = ''
            " TLogVAR item
        elseif g:checksyntax#defs#r#checkUsage_search_other_buffers == 1
            let item.pattern = pattern
        else
            return {}
        endif
    elseif bufname(item.bufnr) == '<Text>'
        return {}
    endif
    return item
endf

autoload/checksyntax/defs/typescript.vim	[[[1
15
" @Author:      Tom Link (mailto:micathom AT gmail com?subject=[vim])
" @License:     GPL (see http://www.gnu.org/licenses/gpl.txt)
" @Revision:    4


call checksyntax#AddChecker('typescript?',
            \     {
            \         'name': 'tsc',
            \         'args': checksyntax#NullOutput('--out'),
            \         'if_executable': 'tsc',
            \         'compiler': 'typescript',
            \     }
            \ )


autoload/checksyntax/defs/php.vim	[[[1
49
" @Author:      Tom Link (mailto:micathom AT gmail com?subject=[vim])
" @License:     GPL (see http://www.gnu.org/licenses/gpl.txt)
" @Revision:    25


if !exists('g:checksyntax#defs#php#cmd')
    let g:checksyntax#defs#php#cmd = 'php'   "{{{2
endif


if !exists('g:checksyntax#defs#php#args')
    " Displaying errors for php files is surprisingly fragile since it 
    " depends on the php version and the php.ini file. If you get 
    " duplicate errors or no errors at all, change the command-line 
    " arguments defined with this variable. Please consider the 
    " information kindly collected by Björn Oelke:
    "
    "   Somehow the values in the php.ini and those passed via '--define' 
    "   seem to be independent, so either value in checksyntax' def file 
    "   seems to be a problem with one of the possible values in the 
    "   php.ini:
    "
    "   | cmd | php.ini | Errors |
    "   +-----+---------+--------+
    "   | 1   | On      | 2      |
    "   | 0   | On      | 1      |
    "   | 1   | Off     | 1      |
    "   | 0   | Off     | 0      |
    "
    "   There's an additional flag in the manpage called '--no-php-ini', 
    "   that could solve the problem.
    "
    " You can run `php -i | grep display_errors` to find out if 
    " display_errors is On because of the php.ini. By default, the 
    " setting in php.ini is ignored ("-n" command-line flag).
    let g:checksyntax#defs#php#args = '-l -n -d display_errors=1 -d error_log= -d error_reporting=E_ALL'   "{{{2
endif


call checksyntax#AddChecker('php?',
            \   {
            \     'name': 'php',
            \     'cmd': g:checksyntax#defs#php#cmd .' '. g:checksyntax#defs#php#args,
            \     'if_executable': g:checksyntax#defs#php#cmd,
            \     'convert_filename': checksyntax#MaybeUseCygpath(g:checksyntax#defs#php#cmd),
            \     'efm': '%*[^:]: %m in %f on line %l',
            \   }
            \ )

autoload/checksyntax/defs/cpp.vim	[[[1
8
" @Author:      Tom Link (mailto:micathom AT gmail com?subject=[vim])
" @License:     GPL (see http://www.gnu.org/licenses/gpl.txt)
" @Revision:    4


call checksyntax#Require('c')
call checksyntax#AddChecker('cpp?', checksyntax#GetChecker('c'))

autoload/checksyntax/defs/haxe.vim	[[[1
52
" @Author:      Tom Link (mailto:micathom AT gmail com?subject=[vim])
" @License:     GPL (see http://www.gnu.org/licenses/gpl.txt)
" @Revision:    18


if !exists('g:checksyntax#defs#haxe#haxe')
    " Filename of the haxe executable.
    let g:checksyntax#defs#haxe#haxe = executable('haxe') ? 'haxe' : ''   "{{{2
endif


if !exists('g:checksyntax#defs#haxe#hxml_files')
    let g:checksyntax#defs#haxe#hxml_files = ['compile.hxml']   "{{{2
endif


function! checksyntax#defs#haxe#Cmd() "{{{3
    if empty(g:checksyntax#defs#haxe#haxe)
        echohl Error
        echom 'CheckSyntax: Please set g:checksyntax#defs#haxe#haxe!'
        echohl NONE
        return ''
    endif
    if exists(":HaxeCtags") == 2
        let hxml = vaxe#CurrentBuild()
    else
        let hxml = findfile('compile.hxml', '.;')
    endif
    if empty(hxml)
        echohl WarningMsg
        echom 'CheckSyntax: compile.hxml not found!'
        echohl NONE
        let cmd = ''
    else
        let cmd = printf('%s -D no-compilation %s',
                    \ g:checksyntax#defs#haxe#haxe,
                    \ shellescape(hxml, 1))
    endif
    return cmd
endf


call checksyntax#AddChecker('haxe?',
            \ {
            \   'name': 'haxe',
            \   'listtype': 'qfl',
            \   'cmdexpr': 'checksyntax#defs#haxe#Cmd()',
            \   'cmd_args': '',
            \   'efm': '%f:%l: characters %c-%n : %m',
            \ },
            \ )

autoload/checksyntax/defs/html.vim	[[[1
14
" @Author:      Tom Link (mailto:micathom AT gmail com?subject=[vim])
" @License:     GPL (see http://www.gnu.org/licenses/gpl.txt)
" @Revision:    4


call checksyntax#AddChecker('html?',
            \ {
            \ 'cmd': 'tidy -eq',
            \ 'efm': 'line %l column %c - %m',
            \ 'convert_filename': checksyntax#MaybeUseCygpath('tidy'),
            \ }
            \ )


autoload/checksyntax/defs/xhtml.vim	[[[1
10
" @Author:      Tom Link (mailto:micathom AT gmail com?subject=[vim])
" @License:     GPL (see http://www.gnu.org/licenses/gpl.txt)
" @Revision:    2

call checksyntax#Require('html')

call checksyntax#AddChecker('xhtml?',
            \ checksyntax#GetChecker('html'))


autoload/checksyntax/defs/javascript.vim	[[[1
84
" @Author:      Tom Link (mailto:micathom AT gmail com?subject=[vim])
" @License:     GPL (see http://www.gnu.org/licenses/gpl.txt)
" @Revision:    70


if !exists('g:checksyntax#defs#javascript#closure')
    " If non-empty, enable some checks via closure compiler.
    let g:checksyntax#defs#javascript#closure = ''   "{{{2
endif


if !exists('g:checksyntax#defs#javascript#closure_warnings')
    let g:checksyntax#defs#javascript#closure_warnings = ['const', 'constantProperty', 'checkRegExp', 'strictModuleDepCheck', 'visibility']   "{{{2
endif


if !exists('g:checksyntax#defs#javascript#pmd_rulesets')
    let g:checksyntax#defs#javascript#pmd_rulesets = ["basic", "braces", "unnecessary"]
endif


if !exists('g:checksyntax#defs#javascript#pmd_args')
    let g:checksyntax#defs#javascript#pmd_args = ''   "{{{2
endif


call checksyntax#AddChecker('javascript?',
            \     {
            \         'name': 'jshint',
            \         'cmd': 'jshint --verbose',
            \         'efm': '%f: line %l\, col %c\, %m (%t%n)',
            \     },
            \     {
            \         'name': 'esprima',
            \         'cmd': 'esvalidate',
            \         'efm': '%f:%l: %m',
            \     },
            \     {
            \         'name': 'gjslint',
            \         'cmd': 'gjslint',
            \         'ignore_nr': [1, 110],
            \         'efm': '%P%*[^F]FILE%*[^:]: %f %*[-],Line %l%\, %t:%n: %m,%Q',
            \     },
            \     {
            \         'name': 'jslint',
            \         'cmd': 'jslint --terse',
            \         'efm': '%f:%l:%c: %m',
            \     },
            \     {
            \         'name': 'jsl',
            \         'cmd': 'jsl -nofilelisting -nocontext -nosummary -nologo -process',
            \     },
            \ )

if !empty(g:checksyntax#defs#javascript#closure)
    if !empty(g:checksyntax#defs#javascript#closure_warnings)
        let s:closure_warnings = ' --jscomp_warning '. join(g:checksyntax#defs#javascript#closure_warnings, ' --jscomp_warning ')
    else
        let s:closure_warnings = ''
    endif
    call checksyntax#AddChecker('javascript?',
                \     {
                \         'name': 'closure',
                \         'cmd': g:checksyntax#defs#javascript#closure .' --warning_level VERBOSE '. checksyntax#NullOutput('--js_output_file') . s:closure_warnings,
                \         'efm': '%A%f:%l: %m,%-Cfound %#: %.%#,%+Crequired %#: %.%#,%-C%.%#,%-Z%p^',
                \     },
                \ )
    unlet s:closure_warnings
    " ,%-C%.%#,%+Z%p^
endif


if !empty(g:checksyntax#pmd#cmd)
    call checksyntax#AddChecker('javascript?',
                \ {
                \ 'name': 'pmd',
                \ 'type': 'qfl',
                \ 'cmdexpr': "checksyntax#pmd#Cmd('ecmascript', g:checksyntax#defs#javascript#pmd_args, g:checksyntax#defs#javascript#pmd_rulesets)",
                \ 'cmd_args': '',
                \ 'buffers': 'listed',
                \ 'efm': '%f:%l:%m',
                \ })
endif

autoload/checksyntax/defs/ruby.vim	[[[1
25
" @Author:      Tom Link (mailto:micathom AT gmail com?subject=[vim])
" @License:     GPL (see http://www.gnu.org/licenses/gpl.txt)
" @Revision:    10


if !exists('g:checksyntax#defs#ruby#interpreter')
    let g:checksyntax#defs#ruby#interpreter = system('ruby --version')   "{{{2
endif


let s:def = {
            \     'prepare': 'compiler ruby',
            \     'cmd': 'ruby -c',
            \ }

if g:checksyntax#defs#ruby#interpreter =~ '\<jruby'
    let s:def.efm = 'SyntaxError in %f:%l:%m'
else
    let s:def.convert_filename = checksyntax#MaybeUseCygpath('xmllint')
endif

call checksyntax#AddChecker('ruby?', s:def)

unlet s:def

autoload/checksyntax/defs/tex.vim	[[[1
15
" @Author:      Tom Link (mailto:micathom AT gmail com?subject=[vim])
" @License:     GPL (see http://www.gnu.org/licenses/gpl.txt)
" @Revision:    3


call checksyntax#AddChecker('tex?',
            \ {
            \ 'cmd': 'chktex -q -v0',
            \ 'if_executable': 'chktex',
            \ 'convert_filename': checksyntax#MaybeUseCygpath('chktex'),
            \ 'efm': '%f:%l:%m',
            \ }
            \ )


autoload/checksyntax/defs/scala.vim	[[[1
40
" @Author:      Tom Link (mailto:micathom AT gmail com?subject=[vim])
" @License:     GPL (see http://www.gnu.org/licenses/gpl.txt)
" @Revision:    18
"
" Other candidates:
" - wartremover https://github.com/typelevel/wartremover

if !exists('g:checksyntax#defs#scala#scalastyle')
    " The command to invoke scalastyle -- see http://www.scalastyle.org 
    " and especially http://www.scalastyle.org/command-line.html
    let g:checksyntax#defs#scala#scalastyle = ''   "{{{2
endif


function! checksyntax#defs#scala#Cmd() "{{{3
    let build = findfile('build.sbt', '.;')
    if !empty(build)
        let config = fnamemodify(build, ':h') .'/scalastyle-config.xml'
        if filereadable(config)
            return 'sbt scalastyle'
        endif
    endif
    if !empty(g:checksyntax#defs#scala#scalastyle)
        return g:checksyntax#defs#scala#scalastyle .' %'
    endif
    return ''
endf


" if !empty(g:checksyntax#defs#scala#scalastyle)
    call checksyntax#AddChecker('scala?',
                \     {
                \         'name': 'scalastyle',
                \         'cmdexpr': 'checksyntax#defs#scala#Cmd()',
                \         'cmd_args': '',
                \         'efm': '%t%\\S%\\+ file=%f message=%m line=%l column=%c',
                \     },
                \ )
" endif

autoload/checksyntax/defs/docbk.vim	[[[1
7
" @Author:      Tom Link (mailto:micathom AT gmail com?subject=[vim])
" @License:     GPL (see http://www.gnu.org/licenses/gpl.txt)
" @Revision:    3

call checksyntax#Require('xml')
call checksyntax#AddChecker('docbk?', checksyntax#GetChecker('xml'))

autoload/checksyntax/defs/python.vim	[[[1
20
" @Author:      Tom Link (mailto:micathom AT gmail com?subject=[vim])
" @License:     GPL (see http://www.gnu.org/licenses/gpl.txt)
" @Revision:    16


call checksyntax#AddChecker('python?',
            \   {
            \     'cmd': 'pyflakes',
            \     'if_executable': 'pyflakes',
            \     'efm': '%f:%l: %m',
            \     'convert_filename': checksyntax#MaybeUseCygpath('pyflakes'),
            \   },
            \   {
            \     'cmd': 'pylint -r n -f parseable',
            \     'if_executable': 'pylint',
            \     'efm': '%f:%l: [%t] %m',
            \     'convert_filename': checksyntax#MaybeUseCygpath('pylint'),
            \   }
            \ )

autoload/checksyntax/defs/sh.vim	[[[1
14
" @Author:      Tom Link (mailto:micathom AT gmail com?subject=[vim])
" @License:     GPL (see http://www.gnu.org/licenses/gpl.txt)
" @Revision:    7

if &shell =~ '\<bash\>'
    call checksyntax#AddChecker('sh?',
                \ {
                \ 'cmd': 'bash -n',
                \ 'efm': '%f: %\\w%\\+ %l: %m',
                \ 'convert_filename': checksyntax#MaybeUseCygpath('bash'),
                \ }
                \ )
endif

autoload/checksyntax/defs/java.vim	[[[1
55
" @Author:      Tom Link (mailto:micathom AT gmail com?subject=[vim])
" @License:     GPL (see http://www.gnu.org/licenses/gpl.txt)
" @Revision:    46


if !exists('checksyntax#defs#java#pmd_rulesets')
    " :read: let checksyntax#defs#java#pmd_rulesets = [...]   "{{{2
    let checksyntax#defs#java#pmd_rulesets = [
                \ "basic", "braces", "clone", "codesize", "comments", 
                \ "design", "empty", "finalizers", "imports", "javabeans", 
                \ "logging-jakarta-commons", "logging-java", "migrating", 
                \ "optimizations", "strictexception", "strings", 
                \ "sunsecure", "typeresolution", "unnecessary", 
                \ "unusedcode"]
    "android", "controversial", "coupling", "j2ee", "junit", "naming", 
endif


if !exists('checksyntax#defs#java#pmd_args')
    let checksyntax#defs#java#pmd_args = ''   "{{{2
endif


function! checksyntax#defs#java#Jlint() "{{{3
    let filename = expand('%:r') .'.class'
    let dirname = expand('%:h')
    return 'jlint +all -done -source '. shellescape(dirname) .' '. shellescape(filename)
endf


call checksyntax#AddChecker('java?',
            \ {
            \ 'if_executable': 'checkstyle',
            \ 'compiler': 'checkstyle',
            \ 'compiler_args': '%'
            \ })
            " \ {
            " \ 'name': 'jlint',
            " \ 'if_executable': 'jlint',
            " \ 'efm': '%m',
            " \ 'cmdexpr': 'checksyntax#defs#java#Jlint()'
            " \ },

if !empty(g:checksyntax#pmd#cmd)
    call checksyntax#AddChecker('java?',
                \ {
                \ 'name': 'pmd',
                \ 'type': 'qfl',
                \ 'cmdexpr': 'checksyntax#pmd#Cmd("java", g:checksyntax#defs#java#pmd_args, g:checksyntax#defs#java#pmd_rulesets)',
                \ 'cmd_args': '',
                \ 'buffers': 'listed',
                \ 'efm': '%f:%l:%m',
                \ })
endif

autoload/checksyntax/defs/perl.vim	[[[1
13
" @Author:      Tom Link (mailto:micathom AT gmail com?subject=[vim])
" @License:     GPL (see http://www.gnu.org/licenses/gpl.txt)
" @Revision:    14


call checksyntax#AddChecker('perl?',
            \   {
            \     'cmd': 'perl -Wc %',
            \     'efm': '%-G%.%#had compilation errors.,%-G%.%#syntax OK,%m at %f line %l.,%+A%.%# at %f line %l\,%.%#,%+C%.%#',
            \     'convert_filename': checksyntax#MaybeUseCygpath('perl'),
            \   },
            \ )

autoload/checksyntax/defs/c.vim	[[[1
13
" @Author:      Tom Link (mailto:micathom AT gmail com?subject=[vim])
" @License:     GPL (see http://www.gnu.org/licenses/gpl.txt)
" @Revision:    5


call checksyntax#AddChecker('c?',
            \ {
            \ 'compiler': 'splint',
            \ 'if_executable': 'splint',
            \ 'convert_filename': checksyntax#MaybeUseCygpath('splint'),
            \ }
            \ )

autoload/checksyntax/pmd.vim	[[[1
37
" @Author:      Tom Link (mailto:micathom AT gmail com?subject=[vim])
" @License:     GPL (see http://www.gnu.org/licenses/gpl.txt)
" @Revision:    13


if !exists('g:checksyntax#pmd#cmd')
    " The command to run pmd.
    let g:checksyntax#pmd#cmd = ''   "{{{2
endif


if !exists('g:checksyntax#pmd#args')
    let g:checksyntax#pmd#args = '-f text'   "{{{2
endif


function! checksyntax#pmd#Cmd(language, args, rulesets) "{{{3
    if empty(g:checksyntax#pmd#cmd)
        return ''
    else
        let args = [g:checksyntax#pmd#args, a:args, '-l', a:language]
        if !exists('b:checksyntax_project_dir')
            if exists('b:project_dir')
                let b:checksyntax_project_dir = b:project_dir
            else
                let b:checksyntax_project_dir = expand('%:h')
            endif
        endif
        call add(args, '-d '. shellescape(b:checksyntax_project_dir))
        let rulesets = join(map(copy(a:rulesets), 'a:language ."-". v:val'), ',')
        let args += ['-R', rulesets]
        return printf("%s %s",
                    \ g:checksyntax#pmd#cmd,
                    \ join(args))
    endif
endf

autoload/checksyntax/syntax/trailing_whitespace.vim	[[[1
10
" @Author:      Tom Link (mailto:micathom AT gmail com?subject=[vim])
" @License:     GPL (see http://www.gnu.org/licenses/gpl.txt)
" @Revision:    2


" Trailing space
syn match VimCheckSyntaxTrailingWhitespace /\s\+$/ containedin=ALL

hi def link VimCheckSyntaxTrailingWhitespace CheckSyntaxWarning

autoload/checksyntax/syntax/vim.vim	[[[1
39
" @Author:      Tom Link (mailto:micathom AT gmail com?subject=[vim])
" @License:     GPL (see http://www.gnu.org/licenses/gpl.txt)
" @Revision:    77

" :doc:
"                                                     *checksyntax_enable_syntax-vim*
" Simple syntax checks for the vim 'filetype'~
"
" Setting |g:checksyntax_enable_syntax| enables the following checks:
"
" - Assignment in |:if| expression
" - `else if` instead of |:elseif|
" - Propably wrong arguments for |bufnr()| or |winnr()|
" - Don't ignore/simplify the return value of |exists()| for cmdnames
" - Calls like exists('fnname()')
" - Don't write exists('foo'). If it's a variable, make the scope explicit 
"   (like `g:foo`). Otherwise it was an error anyway.
" - Variables with scope (|g:|, |l:|, |a:var| etc.) in function 
"   argument position


syn match VimCheckSyntaxError /\%(^\||\)\s*\zs\<if\>\%('[^']*'\|"[^"]*"\|.\)\{-}[^=!<>]=[^=~<>#?]/ containedin=ALLBUT,vimLineComment,vimString

syn match VimCheckSyntaxError /\<\(bufnr('\.')\|bufnr()\|winnr('[.%]')\)/ containedin=ALLBUT,vimLineComment,vimString

syn match VimCheckSyntaxError /\<exists(\zs\(["']\)[^'"]*()\1\ze)/ containedin=ALLBUT,vimLineComment,vimString

syn match VimCheckSyntaxWarning /\<exists(\zs\(["']\):.\{-}\1\ze)\s*$/ containedin=ALLBUT,vimLineComment,vimString

syn match VimCheckSyntaxWarning /\<exists(\zs\(["']\)\%(\w:\)\@![^*&#+$:].\{-}\1\ze)/ containedin=ALLBUT,vimLineComment,vimString

syn match VimCheckSyntaxError /\%(^\||\)\s*fu\%[nction]!\?\s[^(]\+([^)]\{-}\<\w:/ containedin=ALLBUT,vimLineComment,vimString

syn match VimCheckSyntaxError /\<else\>\s\+\<if\?\>/ containedin=ALLBUT,vimLineComment,vimString


hi def link VimCheckSyntaxError CheckSyntaxError
hi def link VimCheckSyntaxWarning CheckSyntaxWarning

autoload/checksyntax/async/asynccommand.vim	[[[1
67
" @Author:      Tom Link (mailto:micathom AT gmail com?subject=[vim])
" @License:     GPL (see http://www.gnu.org/licenses/gpl.txt)
" @Revision:    43


let s:async_handler = {}


function s:async_handler.get(temp_file_name) dict
    " echom "DBG async_handler.get" self.name self.job_id
    let jobs = checksyntax#RemoveJob(self.job_id)
    if jobs != -1
        let errorformat = &errorformat
        try
            " TLogVAR self.async_type, self.bufnr, bufnr('%')
            if self.async_type != 'loc' || self.bufnr == bufnr('%')
                let &errorformat = self.async_efm
                " TLogVAR self.async_efm
                " TLogVAR self.async_cmd, a:temp_file_name
                " let lines = readfile(a:temp_file_name) " DBG
                " TLogVAR lines
                exec self.async_cmd a:temp_file_name
                let list = g:checksyntax#issues.AddList(self.name, self, self.async_type)
                " TLogVAR list
                " TLogVAR self.name, len(list)
                if g:checksyntax#debug
                    echo
                    echom printf('CheckSyntax: Processing %s (%s items)', self.name, len(list))
                endif
                if jobs == 0
                    " let bg = self.bg
                    let bg = 1
                    " let manually = self.manually
                    let manually = g:checksyntax#debug
                    call g:checksyntax#issues.Display(manually, bg)
                endif
            endif
        finally
            let &errorformat = errorformat
        endtry
    endif
endf


function! s:AsyncCommandHandler(make_def)
    " TLogVAR a:make_def
    let type = get(a:make_def, 'listtype', 'loc')
    let async_handler = {
                \ 'async_cmd': type == 'loc' ? 'lgetfile' : 'cgetfile',
                \ 'async_type': type,
                \ 'async_efm': get(a:make_def, 'efm', &errorformat),
                \ }
    call extend(async_handler, a:make_def)
    call extend(async_handler, s:async_handler, 'keep')
    " TLogVAR async_handler
    return asynccommand#tab_restore(async_handler)
endf


function! checksyntax#async#asynccommand#Run(cmd, make_def) "{{{3
    " TLogVAR a:cmd, a:make_def
    let async_handler = s:AsyncCommandHandler(a:make_def)
    " TLogVAR async_handler
    call asynccommand#run(a:cmd, async_handler)
    return 1
endf

autoload/airline/extensions/checksyntax.vim	[[[1
31
if !exists(':CheckSyntax')
    finish
endif


function! airline#extensions#checksyntax#get_msg()
    let errors = checksyntax#Status()
    if !empty(errors)
        return errors.(g:airline_symbols.space)
    endif
    return ''
endf


let s:spc = g:airline_symbols.space


function! airline#extensions#checksyntax#apply(...)
    let w:airline_section_c = get(w:, 'airline_section_c', g:airline_section_c)
    let w:airline_section_c .= s:spc . g:airline_left_alt_sep . s:spc . '%{airline#extensions#checksyntax#get_msg()}'
endf


function! airline#extensions#checksyntax#init(ext)
    call airline#parts#define_function('checksyntax', 'airline#extensions#checksyntax#get_msg')
  "  call airline#parts#define_raw('checksyntax', '%{airline#extensions#checksyntax#get_msg()}')
   call a:ext.add_statusline_func('airline#extensions#checksyntax#apply')
endf


" vi: ft=vim:tw=72:ts=4
