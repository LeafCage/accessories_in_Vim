"�o�^
  function! unite#sources#buffer_deleted#define()
    return s:source
  endfunction

"s:source
  let s:source = {'name' : 'buffer_deleted',
                \ }


"s:source.gather_candidates() ���̍쐬
  function! s:source.gather_candidates(args, context)
    let extention =!empty(a:args)

    let completedSource = s:add_completedSource(extention) "main����
    return completedSource
  endfunction


"completedSource������������
  function! s:add_completedSource(extention)
    let completedSource = []
    let innerdict = { 'kind' : 'file'}

    for item in g:unite_source_buffer_deleted_stack
      let innerdict['word'] = item
      let innerdict['action__path'] = item
      call add(completedSource , copy(innerdict) )
    endfor

    return completedSource
  endfunction


