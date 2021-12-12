"配置教程https://vimjc.com/vimrc-config.html"

"Define global variables"
let USER='Jack'
let EMAIL="chengjunjie.jack@gmail.com"
let DATE=''.strftime('%Y-%m-%d')

"Set encoding"
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8

set number
"set cursorline

"Enable mouse"
set mouse=a
set selection=exclusive
set selectmode=mouse,key

"显示括号匹配"
set showmatch

"设置Tab长度为4空格"
set tabstop=4
"设置自动缩进长度为4空格"
set shiftwidth=4
"继承前一行的缩进方式，适用于多行注释"
set autoindent

"总是显示状态栏"
set laststatus=2
"显示光标当前位置"
set ruler

"打开文件类型检测"
filetype plugin indent on

"增加配置项colorscheme $YOUR_COLOR_THEAME并保存 (假设下载了一个叫$YOUR_COLOR_THEAME的配色方案文件$YOUR_COLOR_THEAME.vim)"
colorscheme solarized8

"Vim支持多种折叠形式：手动折叠manual、基于缩进行折叠indent、基于语法进行折叠syntax、未更改文本折叠diff等"
"Vim打开文件后，重复使用操作命令 za 可打开或关闭当前折叠；zM 用于关闭所有折叠，zR 则用来打开所有折叠。"
set foldmethod=syntax
"启动 Vim 时关闭折叠"
set nofoldenable

" 打开文件类型检测 "
filetype on
" 打开语法高亮显示 "
syntax on

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""" 自动插入文件头
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd BufNewFile *.cpp,*.[ch],*.sh exec ":call SetTitle()"
"" 定义函数SetTitle，自动插入文件头
func SetTitle()
	" 如果文件类型为.sh文件
	if &filetype == 'sh'
		call setline(1, "##########################################################################")
		call append(line("."), "# @file ".expand("%"))
		call append(line(".")+1, "# @author ".g:USER)
		call append(line(".")+2, "# @mail ".g:EMAIL)
		call append(line(".")+3, "# @date ".g:DATE)
		call append(line(".")+4, "# @version 0.1")
		call append(line(".")+5, "#########################################################################")
		call append(line(".")+6, "")
		call append(line(".")+7, "#!/usr/bin/env bash")
		call append(line(".")+8, "")
	else
		call setline(1, "/**")
		call append(line("."), " * @file ".expand("%"))
		call append(line(".")+1, " * @author ".g:USER)
		call append(line(".")+2, " * @mail ".g:EMAIL)
		call append(line(".")+3, " * @date ".g:DATE)
		call append(line(".")+4, " * @version 0.1")
		call append(line(".")+5, " *")
		call append(line(".")+6, " * @copyright Copyright (c) ".strftime('%Y'))
		call append(line(".")+7, " */")
		call append(line(".")+8, "")
	endif
	" 新建文件后，自动定位到文件末尾
	autocmd BufNewFile * normal G
endfunc
