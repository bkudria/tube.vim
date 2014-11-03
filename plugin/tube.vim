" ============================================================================
" File: plugin/tube.vim
" Description: MacVim and terminal interaction made easy
" Mantainer: Giacomo Comitti - https://github.com/gcmt
" Url: https://github.com/gcmt/tube.vim
" License: MIT
" ============================================================================

" Init
" ============================================================================

if exists("g:tube_loaded") || !has('python') || !has('gui_macvim')
    finish
endif
let g:tube_loaded = 1

let s:save_cpo = &cpo
set cpo&vim

" Options
" ============================================================================

let g:tube_terminal =
    \ get(g:, "tube_terminal", 'terminal')

let g:tube_always_clear_screen =
    \ get(g:, "tube_always_clear_screen", 0)

let g:tube_aliases =
    \ get(g:, "tube_aliases",  {})

" Commands
" ============================================================================

com! -nargs=* -range Tube cal tube#ExecuteCommand(<line1>, <line2>, <q-args>)
com! -nargs=1 -range TubeAlias cal tube#ExecuteAlias(<line1>, <line2>, <q-args>)
com! -nargs=* -range TubeClr cal tube#ExecuteCommandClear(<line1>, <line2>, <q-args>)
com! -nargs=1 -range TubeAliasClr cal tube#ExecuteAliasClear(<line1>, <line2>, <q-args>)
com! -range TubeLastCmd cal tube#ExecuteLastCommand(<line1>, <line2>)
com! TubeInterrupt cal tube#InterruptRunningCommand()
com! TubeCd cal tube#CdIntoCurrentDirectory()
com! TubeFocus cal tube#FocusTerminal()
com! TubeClose cal tube#CloseTerminal()
com! TubeAliases cal tube#ShowAliases()

" ============================================================================

let &cpo = s:save_cpo
unlet s:save_cpo
