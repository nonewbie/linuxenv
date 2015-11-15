
"去掉讨厌的有关vi一致性模式，避免以前版本的一些bug和局限
set nocompatible
"显示行号
set number
"检测文件的类型
filetype on
"记录历史的行数
set history=1000
"背景使用黑色
""set background=dark 
"语法高亮度显示
syntax on  
"下面两行在进行编写代码时，在格式对齐上很有用；
"vim使用自动对起，也就是把当前行的对起格式应用到下一行；
set autoindent
"依据上面的对起格式，智能的选择对起方式，对于类似C语言编写上很有用
set smartindent
"第一行设置tab键为4个空格，第二行设置当行之间交错时使用4个空格
set tabstop=4
set shiftwidth=4
"设置匹配模式，类似当输入一个左括号时会匹配相应的那个右括号
set showmatch
"去除vim的GUI版本中的toolbar
set guioptions-=T
"当vim进行编辑时，如果命令错误，会发出一个响声，该设置去掉响声
"set vb t_vb=
"在编辑过程中，在右下角显示光标位置的状态行
set ruler
"默认情况下，寻找匹配是高亮度显示的，该设置关闭高亮显示
set nohls
set incsearch
"设置状态栏显示
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
set laststatus=2
set fdm=marker " 命令来设置成marker折叠方式（fdm是foldmethod的缩写
"  设置编码，解决字符显示乱码问题:
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936
set fileencoding=gb2312
set termencoding=utf-8

"Vundle是基于Git仓库的插件管理软件。Vundle将插件的安装简化为类似yum软件安装的过程，只要:BundleInstall插件就安装完了，:BundleClean之后插件就卸载了。
"Vundle的安装
"    $ git clone http://github.com/gmarik/vundle.git ~/.vim/bundle/vundle  
"支持插件管理
filetype plugin indent on    " required!
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

"非github的插件，使用其git地址，例如：  
"Bundle 'git://git.wincent.com/command-t.git'
":BundleList - list configured bundles  
":BundleInstall(!) - install(update) bundles  
":BundleSearch(!) foo - search(or refresh cache first) for foo  
":BundleClean(!) - 删除插件首先要在.vimrc中注释掉插件相应的行，再运行该命令 
" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'
" vim-scripts repos
"Bundle 'vim-plugin-foo'
"Bundle 'vim-plugin-bar'
Bundle 'echofunc.vim'
Bundle 'The-NERD-tree'
Bundle 'a.vim'
Bundle 'OmniCppComplete'
"markdown 
"Bundle 'Markdown-syntax'
"设置nerdtree 
map <F2> :NERDTreeToggle<CR>
"当前没有文件打开时，自动关闭目录树
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") &&b:NERDTreeType == "primary") | q | endif
"设置打开文件时，自动打开目录树
"autocmd vimenter * NERDTree

"C/C++ 函数补全  需要结合tags　使用
"Bundle 'OmniCppComplete'
" configure tags - add additional tags here or comment out not-used ones
"将tags列表重置为当前vim目录下的tags,这样修改工程代码后重新生成tags，就可以实现正常跳转了
"set tags+=~/framework/tags
set tags+=tags
set tags+=~/.vim/tags/clib " C库函数的tags
set tags+=~/.vim/tags/cpp
"set tags+=~/.vim/tags/gl
" set tags+=~/.vim/tags/sdl
" set tags+=~/.vim/tags/qt4
" " build tags of your own project with Ctrl-F12 C++
"map <C-F12> :!ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
"build tags of your own project with Ctrl-F12 C
map <C-F12> :!ctags -R --fields=il .<CR>
" OmniCppComplete
"let OmniCpp_NamespaceSearch = 1
"let OmniCpp_GlobalScopeSearch = 1
"let OmniCpp_ShowAccess = 1
"let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
"let OmniCpp_MayCompleteDot = 1 " autocomplete after .
"let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
"let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
"let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
"automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest,preview

"调用gcc 
map <C-F5> :call CompileRun()<CR>
func! CompileRun()
		exec "w"
		exec "! gcc -Werror -o %< %"
		exec "! ./%<"
endfunc
"调用g++
map <C-F6> :call CompileRun()<CR>
func! CompileRun()
		exec "w"
		exec "! g++ -o %< %"
		exec "! ./%<"
endfunc
"调用gdb
map <C-F8> :call RunGdb()<CR>
func! RunGdb()
	exec "w"
	exec "!gcc -g -o %< %"
	exec "!gdb ./%<"
endfunc
"
" 创建tags 
" 支持C＋＋的函数补全: 
" sudo ctags -R --c++-kinds=+p --fields=+ialS --extra=+q /usr/include/*  ft2build.h  jconfig.h  jerror.h  jmorecfg.h  jpeglib.h  libpng12   pngconf.h png.h  zconf.h  zlib.h


"vim plug-in list here:
	"1.Doxygen :Dox DoxLic DoxAuthor
