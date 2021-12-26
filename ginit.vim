" Enable Mouse
set mouse=a

" Set Editor Font
if exists(':GuiFont')
    " Use GuiFont! to ignore font errors
    GuiFont JetBrainsMono\ Nerd\ Font\ Mono:h14
endif

" Enable GUI ScrollBar
if exists(':GuiScrollBar')
    GuiScrollBar 1
endif

" Right Click Context Menu (Copy-Cut-Paste)
nnoremap <silent><RightMouse> :call GuiShowContextMenu()<CR>
inoremap <silent><RightMouse> <Esc>:call GuiShowContextMenu()<CR>
xnoremap <silent><RightMouse> :call GuiShowContextMenu()<CR>gv
snoremap <silent><RightMouse> <C-G>:call GuiShowContextMenu()<CR>gv

call GuiClipboard()

" Enable GUI Tabline
if exists(':GuiTabline')
    GuiTabline 1
endif

" Enable GUI Popupmenu
if exists(':GuiPopupmenu')
    GuiPopupmenu ``
endif
