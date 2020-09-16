call plug#begin('~/.config/nvim/plugged')

"多种语言高亮缩进"
Plug 'sheerun/vim-polyglot'
"更多配色"
Plug 'rafi/awesome-vim-colorschemes'
"vim中文用户文档"
Plug 'yianwillis/vimcdoc'
"Coc补全框架"
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
"支持js、ts缩进
Plug 'jason0x43/vim-js-indent'
"更好的js高亮"
Plug 'othree/yajs.vim'
"配合yajs支持next es语法高亮"
Plug 'othree/es.next.syntax.vim'
"更好的ts高亮"
Plug 'HerringtonDarkholme/yats.vim'
"支持 tsx jsx 高亮
Plug 'maxmellon/vim-jsx-pretty'
"更好的成对符号编辑"
Plug 'tpope/vim-surround'
"缩进线显示"
Plug 'Yggdroot/indentLine'
"自动补成对符号"
Plug 'jiangmiao/auto-pairs'
"更多的文本对象
Plug 'wellle/targets.vim'
"markdown用自动排版表格
Plug 'dhruvasagar/vim-table-mode'
"jsdoc文档生成
Plug 'heavenshell/vim-jsdoc'
"vim-git 相关工具
Plug 'tpope/vim-fugitive'

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
"filetype indent on
filetype plugin indent on
set autoindent
set smartindent
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
"let g:polyglot_disabled = ['javascript', 'markdown']

"系统插件解决输入法问题
"可以用vim-fcitx解决
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
""autocmd InsertEnter * call Fcitx2zh() ""---------------------------------------------------------

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

"空格za折叠
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
"防止webpack监听失败
set backupcopy=yes
"python支持
let g:python3_host_prog = '/usr/bin/python3.8'
let g:python_host_prog = '/usr/bin/python'

"翻译插件按键映射
"nnoremap <silent> <leader>tr :Trans<CR>
"vnoremap <silent> <leader>tr :Trans<CR>
nmap <Leader>tr <Plug>(coc-translator-p)
vmap <Leader>tr <Plug>(coc-translator-pv)

"目录浏览器(netrw)设置
"目录查看映射
command E Explore
"关闭目录头
let g:netrw_banner = 0

"bc 关闭当前buffer
command BC :b # | bd #
"允许不保存切换buffer
set hidden
"vb 垂直打开buffer
command -nargs=* -complete=buffer Vb :vertical sb <args>
command -nargs=* -complete=buffer Sb :sb <args>
"diff 强制垂直分割
set diffopt+=vertical
