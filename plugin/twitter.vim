"
" Post To Twitter Vim plugin.
"


command! -range Twitter <line1>,<line2>write ++enc=UTF-8
  \ !curl --data-urlencode status@- --netrc --no-remote-name
  \ https://twitter.com/statuses/update.xml


