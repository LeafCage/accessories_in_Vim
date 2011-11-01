"登録
  function! unite#sources#indexindent#define()
    return s:source
  endfunction

"s:source
  let s:source = {'name' : 'indexindent',
                \ }


"s:source.gather_candidates() 候補の作成
  function! s:source.gather_candidates(args, context)
    let extention =!empty(a:args)

    let completedSource = s:add_completedSource(extention) "main部分
    return completedSource
  endfunction


"completedSourceを完成させる
  function! s:add_completedSource(extention)
    "incantation
      let completedSource = []
      let targetFilePath = expand('%:p')
      let innerdict = { 'kind' : 'jump_list', 'action__path' : targetFilePath}

    "let sw_setnumber =&sw "タブ幅の設定値
    let present=1
    while present <= line('$')
      let nextline=nextnonblank(present+1)?nextnonblank(present+1):line('$')+1
      let nowline_indent =strlen(matchstr(getline(present),'^\s\+')) "現在地のインデントの深さを収める
      let nextline_indent =strlen(matchstr(getline(nextline),'^\s\+')) "次の非空白行のインデントの深さを収める
      if a:extention
        if nowline_indent != nextline_indent
          let innerdict['word'] = printf('%4d: %s',present ,getline(present))
          let innerdict['action__line'] = present
          call add(completedSource , copy(innerdict) )
        endif
      else
        if nowline_indent < nextline_indent
          let innerdict['word'] = printf('%4d: %s',present ,getline(present))
          let innerdict['action__line'] = present
          call add(completedSource , copy(innerdict) )
        endif
      endif
      let present= nextline
    endwhile
    return completedSource
  endfunction


