" avoid loading twice
if exists("current_compiler")
	finish
endif
let current_compiler = "shell"

setlocal makeprg=%
setlocal errorformat=%f:\ %l:\ %m

