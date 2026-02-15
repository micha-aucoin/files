" avoid loading twice
if exists("current_compiler")
        finish
endif
let current_compiler = "shell"

setlocal makeprg=go\ build\ .
setlocal errorformat=%f:%l:%c:\ %m

