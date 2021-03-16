" Include the ~/.vim directory tree in our path.
exec "set path+=".substitute(getcwd(), ' ', '\\\ ', 'g')."/**"
