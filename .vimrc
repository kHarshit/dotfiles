set softtabstop=2
set shiftwidth=2
set tabstop=8
set expandtab


set ignorecase
set number
set ruler
set laststatus=2
set mouse=a
set showmatch
set showmode
set autoindent
syn on
colorscheme desert
set showcmd             " Show (partial) command in status line.
set history=100         " Number of lines of command line history.
set undolevels=200      " Number of undo levels.
set textwidth=0         " Don't wrap words by default.
set ttyscroll=0         " Turn off scrolling (this is faster).
set hlsearch            " Highlight search matches.
set backspace=indent,eol,start " Allow backspacing over everything in insert mode.
" Enable this if you mistype :w as :W or :q as :Q.
"    nmap :W :w 
"       nmap :Q :q
"          " Quit with 'q' instead of ':q'. VERY useful!
"             map q :q<CR>

func! STL()
  let stl = '%f [%{(&fenc==""?&enc:&fenc).((exists("+bomb") && &bomb)?",B":"")}%M%R%H%W] %y [%l/%L,%v] [%p%%]'
  let barWidth = &columns - 65 " <-- wild guess
  let barWidth = barWidth < 3 ? 3 : barWidth

  if line('$') > 1
    let progress = (line('.')-1) * (barWidth-1) / (line('$')-1)
  else
    let progress = barWidth/2
  endif

  " line + vcol + %
  let pad = strlen(line('$'))-strlen(line('.')) + 3 - strlen(virtcol('.')) + 3 - strlen(line('.')*100/line('$'))
  let bar = repeat(' ',pad).' [%1*%'.barWidth.'.'.barWidth.'('
        \.repeat('-',progress )
        \.'%2*0%1*'
        \.repeat('-',barWidth - progress - 1).'%0*%)%<]'

  return stl.bar
endfun

hi def link User1 DiffAdd
hi def link User2 DiffDelete
set stl=%!STL()



