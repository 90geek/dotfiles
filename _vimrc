"C:\Users\Chris\_vimrc
"gvim����for win7

set go= " ���ع�����
set guioptions-=m " ���ز˵��� 
set guioptions-=T " ���ع����� 
"set guioptions-=L " ������������ 
set guioptions-=r " �����Ҳ������ 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocp "nocompatible

source $VIMRUNTIME/mswin.vim
behave mswin   " ����windows�µĿ�ݼ�

set nu "line number
set ai  "auto indent
set history=1000
set ruler	"always show cursor
set novisualbell
set showcmd	"always display command
set backspace=indent,eol,start	"make <BS>(backspace> available
""set relativenumber  ����кţ����������Ǻ������


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"my own configuration
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nu
set guifont=consolas\ 16
syntax on
set novisualbell
set helplang=cn
""set encoding=utf-8
""set fileencoding=utf-8
""set cursorline
"set cursorcolumn
set cursorline
""set cursorcolumn
"hi CursorLine gui=underline

set smartindent
set tabstop=4
set shiftwidth=4
set showmode

"""""""""""""""""""""""""""""""""""""""""""""
"my ctags-setting:auto"
"""""""""""""""""""""""""""""""""""""""""""""
set tags=tags;
set autochdir


"�½�.c,.h,.sh,.java�ļ����Զ������ļ�ͷ 
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.java exec ":call SetTitle()"
""���庯��SetTitle���Զ������ļ�ͷ 
func SetTitle() 
	"����ļ�����Ϊ.sh�ļ� 
	if &filetype == 'sh'
		call setline(1,"\##################################################")
		call append(line("."), "\# Filename: ".expand("%")) 
		call append(line(".")+1, "\# Author: ChrisZZ") 
		call append(line(".")+2, "\# E-mail: zchrissirhcz@163.com") 
		call append(line(".")+3, "\# Created Time: ".strftime("%c")) 
		call append(line(".")+4, "\##################################################") 
		call append(line(".")+5, "\#!/bin/bash") 
		call append(line(".")+6, "") 
	endif

	if &filetype == 'c'
		call setline(1, "/*") 
		call append(line("."), " * ==================================================")
		call append(line(".")+1, " *")
		call append(line(".")+2, " *       Filename:  ".expand("%")) 
		call append(line(".")+3, " *")
		call append(line(".")+4, " *    Description:  ")
		call append(line(".")+5, " *")
		call append(line(".")+6, " *        Version:  0.01")
		call append(line(".")+7, " *        Created:  ".strftime("%c")) 
		call append(line(".")+8, " *         Author:  ChrisZZ, zchrissirhcz@163.com")
		call append(line(".")+9," *        Company:  ZJUT")
		call append(line(".")+10, " *")
		call append(line(".")+11, " * ==================================================")
		call append(line(".")+12, " */")
		call append(line(".")+13, "#include <stdio.h>")
		call append(line(".")+14, "")
		call append(line(".")+15, "int main(){")
		call append(line(".")+16, "")
		call append(line(".")+17, "	return 0;")
		call append(line(".")+18, "}")
	endif
	if &filetype == 'cpp'
		call setline(1, "/*") 
		call append(line("."), " * ==================================================")
		call append(line(".")+1, " *")
		call append(line(".")+2, " *       Filename:  ".expand("%")) 
		call append(line(".")+3, " *")
		call append(line(".")+4, " *    Description:  ")
		call append(line(".")+5, " *")
		call append(line(".")+6, " *        Version:  0.01")
		call append(line(".")+7, " *        Created:  ".strftime("%c")) 
		call append(line(".")+8, " *         Author:  ChrisZZ, zchrissirhcz@163.com")
		call append(line(".")+9," *        Company:  ZJUT")
		call append(line(".")+10, " *")
		call append(line(".")+11, " * ==================================================")
		call append(line(".")+12, " */")
		call append(line(".")+13, "#include <iostream>")
		call append(line(".")+14, "using namespace std;")
		call append(line(".")+15, "int main(){")
		call append(line(".")+16, "")
		call append(line(".")+17, "    return 0;")
		call append(line(".")+18, "}")
	endif
	"�½��ļ����Զ���λ���ļ�ĩβ
	autocmd BufNewFile * normal G

endfunc
"����
"set incsearch
"set hlsearch
set showmatch  "�������
set hlsearch
set incsearch


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""��ɫ����  color config
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""colo elflord

""set t_Co=256
""colo molokai
""colo desert
if $TERM =~ "^xterm"	"ͼ�λ�terminal��ʹ��molokai
	set background=dark
	colo molokai 
else					"tty�£�ʹ��desert
	colo desert
endif

set showmatch
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ���Եı��������           
" ֧�ֵ����ԣ�java	     F5����(����+����)  F6����
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
func! CompileCode()
	exec "w"
	if &filetype == "java"
		exec "!javac -encoding utf-8 %"
	endif
	if &filetype == "ruby"
		exec "!ruby -Ku %"
	endif
	if &filetype == "python"
		exec "!python %"
	end
endfunc
func! RunCode()
	if &filetype == "java"
		exec "!java -classpath %:h; %:t:r"
	endif
endfunc

" F7 ����+����
map <F7> :call CompileCode()<CR>

" F6 ����
map <F6> :call RunCode()<CR>

" F3 �л�NERDTreeToggleģʽ
map <F3> :NERDTreeToggle<CR>
map <F3> :NERDTreeToggle<CR>

" F4 CommandT���ߣ�for ��������ļ�
map <F4> :CommandT<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""ruby
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"map <F7> :!ruby % <CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""latex����
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:tex_flavor='latex'

let g:pydiction_menu_height=20

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ʵ�ù���
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"--------���� && �����Զ�ƥ��
:inoremap ( ()<ESC>i
:inoremap ) <c-r>=ClosePair(')')<CR>
""inoremap { {}<ESC>i
""inoremap } <c-r>=ClosePair('}')<CR>
"����{��Ϊ���е���Է�ʽ������}Ϊ���е����
""imap { {}<ESC>i<CR><ESC>O
"":inoremap } {}<ESC>i  
"��������� ����¼��һ����
:inoremap [ []<ESC>i
:inoremap ] <c-r>=ClosePair(']')<CR>
":inoremap < <><ESC>i
":inoremap > <c-r>=ClosePair('>')<CR>
:inoremap " ""<ESC>i
:inoremap ' ''<ESC>i
:inoremap ` ``<ESC>i
function ClosePair(char)
	if getline('.')[col('.') - 1] == a:char
		return "\<Right>"
	else
		return a:char
	endif
endf
"--------���ô����۵����ÿո���������۵� 
set foldenable		     " �򿪴����۵�
set foldmethod=syntax        " ѡ������۵�����
set foldlevel=100            " ��ֹ�Զ��۵�
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc':'zo')<CR> 

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
" �ı���ʽ���Ű� 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
set list                        " ��ʾTab����->
set listchars=tab:\|\ ,         " ʹ��һ�������ߴ���
set tabstop=4			" �Ʊ��Ϊ4
set autoindent			" �Զ����루�̳�ǰһ�е�������ʽ��
set smartindent			" �����Զ���������c����ķ�ʽ��
set softtabstop=4 
set shiftwidth=4		" ����ʱ�м佻��ʹ��4���ո�
set noexpandtab			" ��Ҫ�ÿո�����Ʊ��
""set expandtab
set cindent			" ʹ��C��ʽ������
set smarttab			" ���кͶο�ʼ��ʹ���Ʊ��
set nowrap			" ��Ҫ������ʾһ�� 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ״̬��(������)����ʾ
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set cmdheight=2		     " �����У���״̬���£��ĸ߶ȣ�Ĭ��Ϊ1��������2
set ruler				 " ���½���ʾ���λ�õ�״̬��
set laststatus=2		 " ����״̬����Ϣ 
set wildmenu		     " ��ǿģʽ�е��������Զ���ɲ��� 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" �ļ����
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set fenc=utf-8
""set encoding=utf-8		" ����vim�Ĺ�������Ϊutf-8�����Դ�ļ����Ǵ˱��룬vim�����ת������ʾ
set fileencoding=utf-8		" ��vim�½��ļ��ͱ����ļ�ʹ��utf-8����
set fileencodings=utf-8,gbk,cp936,latin-1
filetype on				     " ����ļ�����
filetype indent on			     " ��Բ�ͬ���ļ����Ͳ��ò�ͬ��������ʽ
filetype plugin on			     " ��Բ�ͬ���ļ����ͼ��ض�Ӧ�Ĳ��
syntax on				     " �﷨����
filetype plugin indent on    " �����Զ���ȫ

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ����
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set hlsearch                 " ����������ʾ���
set nowrapscan               " �������ļ�����ʱ����������
set incsearch                " ����ʵʱ��������
