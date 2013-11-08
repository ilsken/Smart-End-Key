" Name:			SmartEndKey 
" Author:		Andrew Lyon <orthecreedence@gmail.com>
" Version:		0.1
" Description:	Used to make the <Home> key a bit more intelligent. If not at ^
" 				and <Home> is pressed, the cursor is moved to ^. If the cursor 
"				is already at ^ it will be moved to 0, and if at 0 and <Home>
"				is pressed, it will go back to ^. This makes it easy to jump
"				between different beginning of line positions.
"
" Usage:		In your .vimrc, you can set it up like this:
"				map <Home> :SmartHomeKey<CR>
"				imap <Home> <C-O>:SmartHomeKey<CR>


if !exists(':SmartEndKey')
	command! SmartEndKey call SmartEndKey()
endif

function! SmartEndKey()
	let l:lnum	=	line('.')+1
	let l:ccol	=	col('.')+1
	execute 'normal! g_'
	let l:fcol	=	col('.')+1
	execute 'normal! $'
	let l:hcol	=	col('.')+1

	if l:ccol != l:fcol
		call cursor(l:lnum, l:fcol)
	else
		call cursor(l:lnum, l:hcol)
	endif
endfun


