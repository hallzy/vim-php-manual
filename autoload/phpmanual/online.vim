" == "acomment" == {{{
"
"          File:  online.vim
"        Author:  Alvan
"      Modifier:  Alvan
"      Modified:  2014-08-20
"   Description:  PHP online manual for Vim
"
" --}}}

function! phpmanual#online#getURL(...)
    let l:key = ''

    if a:0 < 1
        let l:mcs = '[a-zA-Z0-9_]'
        let l:str = getline('.')
        let l:col = col('.')
        let l:end = col('$')

        let l:num = l:col - 1
        while l:num >= 0
            if strpart(l:str, l:num, 1) !~ l:mcs
                break
            endif
            let l:l = l:num
            let l:num -= 1
        endwhile

        if !exists('l')
            echo 'manual.ERR: The current content under the cursor is not a keyword.'
            return -1
        endif

        let l:num = l:col - 1
        while l:num <= l:end
            if strpart(l:str, l:num, 1) !~ l:mcs
                break
            endif
            let l:r = l:num
            let l:num += 1
        endwhile

        let l:key = strpart(l:str, l:l, l:r-l:l+1)
    else
        let l:key = a:1
    endif

    if l:key ==# ''
        echo 'manual.ERR: no online manual URL.'
        return -1
    endif

    return printf(g:php_manual_online_search_url_format, substitute(l:key, '[\r\n]', '', 'g'))
endfunction

function! phpmanual#online#open(...)
    " If no args passed, then pass no args to getURL
    if a:0 < 1
        let l:url = phpmanual#online#getURL()
    else
        let l:url = phpmanual#online#getURL(a:1)
    endif

    " If getting the URL failed, return.
    if l:url == -1
        return
    endif

    if has('win32') || has('win95') || has('win64') || has('win16')
        call system('explorer ' . shellescape(l:url))
    elseif has('mac')
        call system('open ' . shellescape(l:url))
    else
        call system('xdg-open ' . shellescape(l:url))
    endif
endfunction

" vim:ft=vim:ff=unix:tabstop=4:shiftwidth=4:softtabstop=4:expandtab
" End of file : online.vim
