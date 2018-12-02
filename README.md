PHP Manual
==========
This plugin enables PHP.net docs within Vim.

Keybindings
-----------

The following keybindings are default:
* <kbd>SHIFT-k</kbd> open manual page within Vim. (default keybinding for !man)
* <kbd>CTRL-h</kbd> open the manual page in PHP.net (in your fav. browser)
* <kbd>CTRL-l</kbd> echoes the PHP.net URL to you (useful for working over SSH)

You can overwrite the <kbd>CTRL-h</kbd> and <kbd>CTRL-l</kbd> keybindings with
the following setting:

```vim
" Setting these to empty strings disables the mapping altogether
let g:php_manual_online_search_shortcut = ''
let g:php_manual_online_get_url = ''
```

Install options
---------------

* Copy these files to runtimepath. (~/.vim)
* Add the following to your favorite plugin manager (Vundle):

`Plugin 'alvan/vim-php-manual'`

Screenshots
-----------
![doc.png](screenshots/20140829/doc.png)
