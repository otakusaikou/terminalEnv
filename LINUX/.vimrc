" プラグイン管理ツールNeoBundleの設定
" viとの互換性をとらない
if has('vim_starting')
    if &compatible
        set nocompatible
    endif

    " NeoBundleの位置
    set runtimepath+=$HOME/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('$HOME/.vim/bundle'))

" NeoBundleの自身をプラグイン管理対象にする
NeoBundleFetch 'Shougo/neobundle.vim'

" かっこいいステータスライン
NeoBundle 'vim-airline/vim-airline'
NeoBundle 'vim-airline/vim-airline-themes'

" python PEP8コーディングスタイルチェックプラグイン
NeoBundle 'nvie/vim-flake8'

" 構文エラーをチェックするプラグイン
NeoBundle 'kevinw/pyflakes-vim'

" ディレクトリツリーを表示するプラグイン
NeoBundle 'scrooloose/nerdtree'

" 入力自動補完プラグイン
NeoBundle 'Valloric/YouCompleteMe'
NeoBundle 'honza/vim-snippets'
NeoBundle 'SirVer/ultisnips'
NeoBundle 'vim-scripts/javacomplete'
NeoBundle 'davidhalter/jedi-vim'

" 括弧自動補完プラグイン
NeoBundle 'jiangmiao/auto-pairs'

" アンドゥツリープラグイン
NeoBundle 'sjl/gundo.vim'

" コマンドを連続で入力するプラグイン
NeoBundle 'kana/vim-submode'

" カラーテーマ
NeoBundle 'altercation/vim-colors-solarized'

call neobundle#end()

" ファイルタイプの対応のプラグイン、インデント設定を自動で検出し、読み込むようにする
filetype plugin indent on

"====================基本的な設定====================
"----------履歴保存関係
" 情報保存の行数を50に限定
set viminfo='20,\"50

" コマンド,検索履歴の上限値を50に限定
set history=50

" ファイルを保存するときにアンドゥファイル情報を保存
set undofile

" アンドゥ情報の保存先
if !isdirectory(expand('$HOME/.vim/tmp/undo'))
    call mkdir(expand('$HOME/.vim/tmp/undo'), 'p')
endif
set undodir=$HOME/.vim/tmp/undo

" バックアップファイルを作らない
set nobackup

"----------検索関係
" 一文字入力するたびに一致する候補を絞りこんでいく
set incsearch

" 検索の時に大文字小文字を区別しない
set ignorecase

" 検索の結果をハイライト表示
set hlsearch

"----------インデント
" タブ入力を複数の空白に置き換える
set expandtab

" タブ文字が占める空白の幅
set tabstop=4

" タブキーやバックスペースキーでカーソルが動く幅
set softtabstop=4

" 自動インデントを有効化
set autoindent

" 自動インデントの際にずれる空白の幅
set shiftwidth=4

" 行頭でタブを入力するとshiftwidthで定義した数の空白を入力
set smarttab

"----------その他
" コマンドラインのファイル名補完
set wildmenu

" コマンドラインでの補完を開始するキーをタブキーにする
set wildchar=<tab>

" エラーメッセージの表示時にビープを鳴らさない
set visualbell t_vb=
set noerrorbells

" ヤンクしたテキストをクリップボードにコピー
set clipboard=unnamedplus,autoselect

" 保存されていないファイルがあるときは終了前に保存確認
" set confirm

" 保存されていないファイルがあるときでも別のファイルを開くことが出来る
set hidden

"================================================

"====================画面表示関係====================
" 行番号を表示
set number

" 画面最下行にカーソルの位置を表示
set ruler

" カーソル位置の行を常にハイライト表示
set cursorline

" カーソル位置の列を常にハイライト表示
set cursorcolumn

" ステータスラインを常に表示
set laststatus=2

" バックスペースキーでインデントを削除可能にする
" indent : 行頭の空白
" eol : 改行
" start : 挿入モード開始位置より手前の文字
set backspace=indent,eol,start

" ファイルタイプに応じて構文の色を適用
syntax enable

" カラーテーマを適用
let g:solarized_termcolors=256
set t_Co=256
set term=screen-256color
set background=dark
colorscheme solarized

" フォント設定と文字化け対策
set guifont=Consolas:h16":cSHIFTJIS

" カーソルの点滅を止める
set gcr=a:block-blinkon0

" 左右のスクロールバーを非表示
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R

" メニューとツールバーを非表示
set guioptions-=m
set guioptions-=T

"================================================

"=====================エンコード======================
" 改行コードの設定
if has('unix')
    set fileformat=unix

    " 改行コード自動判別の順番
    set fileformats=unix,dos,mac
elseif has('win32')
    set fileformat=dos
    set fileformats=dos,unix,mac
endif

" vim自身の文字コード,グローバルオプション
set encoding=utf-8

" バッファ保存時に用いる文字コード,バッファローカルオプション
set fileencoding=utf-8

" ファイルを開く時に用いる文字コード自動判別の順番,開けなかったらencodingで設定した文字コードでファイルを開く,グローバルオプション
set fileencodings=utf-8,sjis,big5,gbk,ucs-bom,iso-2022-jp-3,iso-2022-jp,eucjp-ms,euc-jisx0213,euc-jp,,cp932,gb2312,euc-kr

" vimのメッセージの言語を英語に変更
" let $LANG='en_US'

" 日本語MSシステムのvimメッセージ文字化け対策
" let $LANG='ja_JP.UTF-8'

" gvimのメニュー言語を英語に変更
" set langmenu=en

" gvimのウィンドウのメニューと右クリックのメニューの文字化けを解決する
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

"================================================

"==================キーボードショートカット==================
" Leaderキー
let mapleader=';'

" jjを押すと挿入モードから抜ける
imap jj <esc>

" オムニ補完を行う
imap <Leader>c <c-x><c-o>

" jjを押すとコマンドラインモードから抜ける
cno jj <c-c>

" 行頭、行末移動
nmap <Leader>b 0
nmap <Leader>e $

" 分割したウィンドウあるいはvimを終了
nmap <Leader>q :q<CR>

" vimを強制終了
nmap <Leader>Q :qa!<CR>

" ファイルを保存
nmap <Leader>w :w<CR>

" すべてのファイルを保存
nmap <Leader>WQ :wa<CR>:q<CR>

" 下のウィンドウに移動
map <c-j> <c-w>j

" 上のウィンドウに移動
map <c-k> <c-w>k

" 右のウィンドウに移動
map <c-l> <c-w>l

" 左のウィンドウに移動
map <c-h> <c-w>h

" 分割したウィンドウの拡大と縮小(プラグインvim-submodeが必要)
" 分割ウィンドウの幅を増やす
call submode#enter_with('winsize', 'n', '', '<C-w>L', '<C-w>>')
call submode#map('winsize', 'n', '', 'L', '<C-w>>')

" 分割ウィンドウの幅を減らす
call submode#enter_with('winsize', 'n', '', '<C-w>H', '<C-w><')
call submode#map('winsize', 'n', '', 'H', '<C-w><')

" 分割ウィンドウの高さを増やす
call submode#enter_with('winsize', 'n', '', '<C-w>K', '<C-w>-')
call submode#map('winsize', 'n', '', 'K', '<C-w>-')

" 分割ウィンドウの高さを減らす
call submode#enter_with('winsize', 'n', '', '<C-w>J', '<C-w>+')
call submode#map('winsize', 'n', '', 'J', '<C-w>+')

" ディレクトリツリーを開く/閉じる
map <Leader>n :NERDTreeToggle<CR>

" アンドゥツリーを開く/閉じる
nnoremap <F5> :GundoToggle<CR>

" 次のバッファに切り替える
map <Leader>a :bn<cr>

" 前のバッファに切り替える
map <Leader>s :bp<cr>

" 今のバッファを削除
map <Leader>d :bw<cr>

" vimrcの再読み込み
map <Leader>r :so $MYVIMRC<CR>

" vimrcを開ける
map <Leader>rc :e $MYVIMRC<CR>

" gvimrcを開ける
map <Leader>rgc :e $MYGVIMRC<CR>

" pythonスクリプトの実行
autocmd BufNewFile,BufRead *.py map <F9> :w<CR>:!python %<CR>

" Javaプログラムをコンパイル
autocmd FileType java :map <F8> :!javac %<CR>

" コンパイルされたJavaプログラムを実行
autocmd FileType java :map <F9> :!java %<<CR>

" Cプログラムをコンパイル
autocmd FileType c,cpp :map <F8> :!make clean<CR>:!make %<<CR>

" コンパイルされたCプログラムを実行
autocmd FileType c,cpp :map <F9> :!./%<<CR>

" Cプログラムをコンパイル
"autocmd FileType cpp :map <F8> :!make clean<CR>:!make %<<CR>

" コンパイルされたCプログラムを実行
"autocmd FileType cpp :map <F9> :!./%<<CR>

" Altキーをターミナルのメタキーとして使う
let c='a'
while c <= 'z'
  exec "set <A-".c.">=\e".c
  exec "imap \e".c." <A-".c.">"
  let c = nr2char(1+char2nr(c))
endw

" マッピングされたキー列の反応時間を50ミリ秒に短縮
set timeout ttimeoutlen=50

"================================================

"====================プラグィン関係====================
"----------vim-flake8
" コーディングスタイルエラーを行番号にマーク
let g:flake8_show_in_gutter=1

" コーディングスタイルエラーをハイライト表示
let g:flake8_show_in_file=1

" ハイライトグループを指定する
highlight link Flake8_Error      Error
highlight link Flake8_Warning    WarningMsg
highlight link Flake8_Complexity WarningMsg
highlight link Flake8_Naming     WarningMsg
highlight link Flake8_PyFlake    WarningMsg

"----------pyflakes-vim
" pyflakes-vimのquickfix機能を無効化
let g:pyflakes_use_quickfix = 0

"----------vim-airline
let g:airline#extensions#tabline#enabled=1
let g:airline_powerline_fonts=1

" airlineのテーマ
let g:airline_theme='base16'

"----------YouCompleteMe
" YouCompleteMe初期設定スクリプトを読み込む
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'

" 初期設定スクリプト適用前の確認を無効化
let g:ycm_confirm_extra_conf=0

" Ctrl+n or Ctrl+pキーでポップアップメニューを次の候補に進む
let g:ycm_key_list_select_completion = ['<C-n>', '<C-j>']

" Ctrl+p or Ctrl+kキーでポップアップメニューを前の候補に戻る
let g:ycm_key_list_previous_completion = ['<C-p>', '<C-k>']

" シンタックスをキャッシュするときの最小文字数を2にする
let g:ycm_min_num_of_chars_for_completion=2

" オムニ補完のキャッシュ機能を無効化
let g:ycm_cache_omnifunc=0

" 識別子補完機能を有効化
let g:ycm_seed_identifiers_with_syntax=1

" コメント内の自動補完を有効化
let g:ycm_complete_in_comments = 1

" 左側のガーターエリアを隠す
let g:ycm_enable_diagnostic_signs=0

"----------Ultisnips
" タブキーで補完のコンテンツを展開
let g:UltiSnipsExpandTrigger='<tab>'

"----------vim-snippets
" snipMateとの互換性を有効化
"let g:neosnippet#enable_snipmate_compatibility = 1

" snipMate用スニペット集の場所を指定
let g:neosnippet#snippets_directory=expand('$HOME/.vim/bundle/vim-snippets/snippets')

"----------jedi-vim
" Pydocを表示
let g:jedi#documentation_command = 'K'

" 変数の宣言場所へジャンプ
let g:jedi#goto_assignments_command = '<leader>g'

" . で補完が始まるという設定を解除
let g:jedi#popup_on_dot = 0

" 使われてないコマンドを無効化
let g:jedi#goto_definitions_command = ''
let g:jedi#goto_command = ''
let g:jedi#usages_command = ''

" タブキーで次の補完候補に進む(コンフリクトあり、効かない)
let g:jedi#use_tabs_not_buffers = 1

" ポップアップを表示しない
autocmd FileType python,c,cpp setlocal completeopt-=preview

"================================================
