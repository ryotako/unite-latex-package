scriptencoding utf-8
let s:save_cpo = &cpo
set cpo&vim

function! unite#sources#latex_package#define()
  return s:source
endfunction

let s:source = {
      \ 'name': 'latex_packages',
      \ 'description': 'LaTeX packages',
      \}
" function! s:unite_source.gather_candidates(targs, context)
" depends on kpsewhich command in texlive 

function! s:source.gather_candidates(args, context)
  " g:unite_latex_packages_cache_file
  let cache = s:cache()
  let packages = filereadable(cache) ? readfile(cache)
        \ : unite#sources#latex_package#cache_update()
  let source = map(packages,'{
        \ "word": fnamemodify(v:val,":t:r"),
        \ "source": "latex_packages",
        \ "kind": "word",
        \}')
  return sort(source)
endfunction

function! s:cache()
  return expand(get(g:,'unite_latex_packages_cache_file',
        \ '~/.cache/latex_packages'))
endfunction

function! unite#sources#latex_package#cache_update()
  let packages = []
  let paths = substitute(
        \ system("kpsewhich --expand-path='$TEXMF'"),"\n","","")
  for path in split(paths,':')
    let packages += split(globpath(path,'**/*.sty'))
  endfor
  let cache=s:cache()
  if !isdirectory(fnamemodify(cache, ':h'))
    call mkdir(fnamemodify(cache, ':h'), 'p')
  endif
  call writefile(packages,expand(cache))
  return packages
endfunction

"}}}

let &cpo = s:save_cpo
unlet s:save_cpo
