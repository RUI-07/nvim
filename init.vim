call plug#begin('~/.config/nvim/plugged')

"多种语言高亮缩进"
Plug 'sheerun/vim-polyglot'
"更多配色"
Plug 'rafi/awesome-vim-colorschemes'
"vim中文用户文档"
Plug 'yianwillis/vimcdoc'
"Coc补全框架"
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}
"更好的js高亮"
Plug 'othree/yajs.vim'
"配合yajs实现js第三方库的高亮"
Plug 'othree/javascript-libraries-syntax.vim'
"配合yajs支持es6语法高亮"
Plug 'othree/es.next.syntax.vim'
"在底部显示函数参数"
Plug 'Shougo/echodoc.vim'
"更好的成对符号编辑"
Plug 'tpope/vim-surround'
"缩进线显示"
Plug 'Yggdroot/indentLine'
"自动补成对符号"
Plug 'jiangmiao/auto-pairs'
"更多的文本对象
Plug 'wellle/targets.vim'
"markdown 预览 支持数学公式"
Plug 'iamcco/mathjax-support-for-mkdp'
Plug 'iamcco/markdown-preview.vim'
"markdown用自动排版表格
Plug 'dhruvasagar/vim-table-mode'
"jsdoc文档生成
Plug 'heavenshell/vim-jsdoc'
"翻译插件
Plug 'echuraev/translate-shell.vim'
"快速移动
Plug 'easymotion/vim-easymotion'

call plug#end()

"配色设置"
set termguicolors
colorscheme molokai
let g:molokai_original = 1
set background=dark
set noshowmode
"开启相对行号"
set number
set relativenumber
"改变un文件位置"
set undodir=~/.undodir
"coc按键映射"
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

nmap <leader>di <Plug>(coc-diagnostic-info)
nmap <leader>nd <Plug>(coc-diagnostic-next)
nmap <leader>pd <Plug>(coc-diagnostic-prev)
nmap <leader>df <Plug>(coc-definition)
nmap <leader>dl <Plug>(coc-declaration)
nmap <leader>ip <Plug>(coc-implementation)
nmap <leader>td <Plug>(coc-type-definition)
nmap <leader>rf <Plug>(coc-references)
nmap <leader>fm <Plug>(coc-format)
vmap <leader>fm <Plug>(coc-format-selected)
nmap <leader>rn <Plug>(coc-rename)
nmap <leader>fc <Plug>(coc-fix-curren)
"关闭左侧报错提示"
set signcolumn=no
"缩进相关设置"
filetype indent on
"filetype plugin indent on
set smartindent
set autoindent
autocmd filetype c,cpp set cindent
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"
set tabstop=2
set shiftwidth=2
set expandtab
set softtabstop=2
set shiftround
set smarttab
"vim文件类型识别"
syntax on
filetype on
"coc开启同一变量高亮"
set updatetime=100
au CursorHold * sil call CocActionAsync('highlight')
au CursorHoldI * sil call CocActionAsync('showSignatureHelp')
"错误提示样式设置"
hi CocErrorHighlight ctermfg=White ctermbg=Red guifg=#000000 guibg=#ff0000 
"关闭polyglot js高亮换用更好的插件"
let g:polyglot_disabled = ['javascript', 'markdown']

"系统插件解决输入法问题
""--------------退出插入模式自动关闭输入法-----------------
"let g:input_toggle = 1
"function! Fcitx2en()
"   let s:input_status = system("fcitx-remote")
"   if s:input_status == 2
"      let g:input_toggle = 1
"      let l:a = system("fcitx-remote -c")
"   endif
"endfunction
"
"function! Fcitx2zh()
"   let s:input_status = system("fcitx-remote")
"   if s:input_status != 2 && g:input_toggle == 1
"      let l:a = system("fcitx-remote -o")
"      let g:input_toggle = 0
"   endif
"endfunction
"
"set timeoutlen=300
"autocmd InsertLeave * call Fcitx2en()
""去掉下行注释进入插入模式自动打开输入法
""autocmd InsertEnter * call Fcitx2zh()
""---------------------------------------------------------

"开启函数参数显示"
let g:echodoc#enable_at_startup = 1
"缩进显示符的颜色设定"
let g:indentLine_color_term = 237
"开启首行缩进符显示"
""let g:indentLine_showFirstIndentLevel = 1

"markdown 更好的表格输入"
"let g:table_mode_auto_align = 0
autocmd FileType markdown :TableModeEnable
autocmd FileType markdown
            \ let g:table_mode_corner = "|" |
            \ let g:table_mode_corner_corner = "|" |
            \ let g:table_mode_header_fillchar = "-" |
            \ let g:table_mode_align_char = ":"

"za折叠
nnoremap <space> za
set foldmethod=indent
set foldmethod=indent
set foldlevel=99
"H L 行首 行尾
noremap H ^
noremap L $
"缓冲区移动
nnoremap <C-h> :bprevious<CR>
nnoremap <C-l> :bnext<CR>
"无限撤销
set undofile
set undodir=~/.vim/undodir
"python支持
let g:python3_host_prog = '/usr/bin/python3'
let g:python_host_prog = '/usr/bin/python'
"翻译插件按键映射
nnoremap <silent> <leader>tr :Trans<CR>
vnoremap <silent> <leader>tr :Trans<CR>
"目录查看映射
cnoremap E Explore
"关闭目录头
let g:netrw_banner = 0
"bc 关闭当前buffer
command Bc :b # | bd #
cnoremap bc Bc
"快速移动映射
map f <Plug>(easymotion-fl)
map F <Plug>(easymotion-Fl)
map s <Plug>(easymotion-prefix)
map ss <Plug>(easymotion-overwin-f2)
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
