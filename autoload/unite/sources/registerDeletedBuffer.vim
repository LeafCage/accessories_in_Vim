"“o˜^
  function! unite#sources#registerDeletedBuffer#define()
    return s:source
  endfunction

"s:source
  let s:source = {'name' : 'registerDeletedBuffer',
                \ }


"s:source.gather_candidates() Œó•â‚Ìì¬
  function! s:source.gather_candidates(args, context)
    let extention =!empty(a:args)

    let completedSource = s:add_completedSource(extention) "main•”•ª
    return completedSource
  endfunction


"completedSource‚ğŠ®¬‚³‚¹‚é
  function! s:add_completedSource(extention)
    let completedSource = []
    let innerdict = { 'kind' : 'file'}

    for item in g:registerDeletedBuffer
      let innerdict['word'] = item
      let innerdict['action__path'] = item
      call add(completedSource , copy(innerdict) )
    endfor

    return completedSource
  endfunction


