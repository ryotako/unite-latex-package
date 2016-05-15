if exists('g:loaded_unite_latex_package')
  finish
endif
let g:loaded_unite_latex_package = 1

let s:save_cpo = &cpo
set cpo&vim

command! LatexPackageCacheUpdate
      \ call unite#sources#latex_package#cache_update()

let &cpo = s:save_cpo
unlet s:save_cpo
