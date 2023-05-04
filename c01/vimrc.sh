autocmd BufNewFile *.py,*.cc,*.sh,*.java exec ":call SetTitle()"
func SetTitle()
if expand("%:e") == 'sh'
call setline(1,"#!/bin/bash")
call setline(2,"#################################")
call setline(3,"# File Name:".expand("%"))
call setline(4,"# Version: v1.0")
call setline(5,"# Author: wyz")
call setline(6,"# Email: wyz@gmail.com")
call setline(7,"# Created Time:" .strftime("%F %T"))
call setline(8,"# Description:")
call setline(9,"#################################")
call setline(10,"")
endif
endfunc

# 自动注释脚本的模板
