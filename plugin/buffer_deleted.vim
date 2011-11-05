"削除したバッファを記録してuniteインターフェイスで表示する
"バッファ削除時にリストする
au BufDelete * call <SID>buffer_deleted()

let g:unite_source_buffer_deleted_stack =get(g:,'g:unite_source_buffer_deleted_stack',[])
let g:unite_source_buffer_deleted_ignore_patterns=get(g:,'g:unite_source_buffer_deleted_ignore_patterns',['\[unite]','lingr-rooms','lingr-say','\[vimshell]'])

function! s:buffer_deleted()
  let nowbuffer =expand('%:p')
  if nowbuffer !=''
    "ignoreリストにあるやつに正規表現マッチしたら登録しない
    for item in g:unite_source_buffer_deleted_ignore_patterns
      if nowbuffer =~# item
        return
      endif
    endfor

    "以前のがあれば削除する
    if get(g:unite_source_buffer_deleted_stack,nowbuffer,'') !=''
      call filter(g:unite_source_buffer_deleted_stack,'v:val !~# nowbuffer')
    endif
    "記録する：バッファのパス
    let g:unite_source_buffer_deleted_stack=insert(g:unite_source_buffer_deleted_stack,nowbuffer)[0:29]
  endif
endfunction
