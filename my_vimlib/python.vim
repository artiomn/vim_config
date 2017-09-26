" Python.

fun! Filetype_Python()
endf
"---------------------------------------------------------------------------------
fun! Python_template()
endf
"---------------------------------------------------------------------------------
" from tips 556
fun! Py_ShowDoc(name)
   vnew
   execute "read !pydoc " . a:name
   setlocal nomodifiable
   setlocal nomodified
   set filetype=man
   normal 1G
endf
"---------------------------------------------------------------------------------
" New Class in Python.
fun! Py_NC(name, ...)
python << EOF
import vim

append = vim.current.range.append
args = []
for i in range(1, int(vim.eval("a:0")) + 1):
    args.append(vim.eval("a:{%d}" % i))

append("class %s:" % vim.eval("a:name"))
init = "    def __init__(self"
for arg in args:
    init += ", %s" % arg
append(init + "):")
for arg in args:
    append("        self.%s = %s" % (arg, arg))

EOF
endf
"---------------------------------------------------------------------------------
" New Python interface function.
fun! Py_Int(name)
python << EOF
import vim

template = '''static PyObject *
%s(PyObject *self, PyObject *args)
{
   if (!PyArg_ParseTuple(args, "")) {
       return NULL;
   }

   return Py_BuildValue("");
}
'''

vim.current.range.append((template % vim.eval("a:name")).split("\n"))
EOF
endf
"---------------------------------------------------------------------------------
" Python new test function.
fun! Py_NewTest(name)
python << EOF
import vim

template = """def test_%s(self):
    assert 1 == 0, "wrong universe"
"""
vim.current.range.append((template % ((vim.eval("a:name"), )* 2)).split("\n"))
EOF
endf
"---------------------------------------------------------------------------------
fun! Py_template_main()
python << EOF
import vim
template = """
def main(argv=None):
   if argv is None:
       import sys
       argv = sys.argv

   from optparse import OptionParser

   parser = OptionParser("usage: %prog ")

   opts, args = parser.parse_args(argv[1:])
   if len(args) != 1:
       parser.error("wrong number of arguments") # Will exit

if __name__ == "__main__":
    main()
"""
for line in reversed(template.splitlines()):
    vim.current.range.append(line.rstrip())
EOF
endf
"---------------------------------------------------------------------------------


