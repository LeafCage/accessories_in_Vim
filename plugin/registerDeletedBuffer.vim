"削除したバッファを記録してuniteインターフェイスで表示する
"バッファ削除時にリストする
au BufDelete * call <SID>registerDeletedBuffer()

let g:registerDeletedBuffer =get(g:,'g:registerDeletedBuffer',[])
let g:registerDeletedBufferIgnore =get(g:,'g:registerDeletedBufferIgnore',['\[unite]',])
function! s:registerDeletedBuffer()
  let nowbuffer =expand('%:p')
  if nowbuffer !=''
    "ignoreリストにあるやつに正規表現マッチしたら登録しない
    for item in g:registerDeletedBufferIgnore
      if nowbuffer =~# item
        let g:chk=1
        return
      endif
    endfor

    "以前のがあれば削除する
    if get(g:registerDeletedBuffer,nowbuffer,'') !=''
      call remove(g:registerDeletedBuffer,nowbuffer)
    endif
    "記録する：バッファのパス
    call insert(g:registerDeletedBuffer,nowbuffer)
  endif
  let g:chk=get(g:registerDeletedBufferIgnore,nowbuffer,'nohit')
endfunction
