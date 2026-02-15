" avoid loading twice
if exists("current_compiler")
	finish
endif
let current_compiler = "python"

setlocal makeprg=pyqf-run\ %:p
setlocal errorformat=%E%f:%l:\ %m

