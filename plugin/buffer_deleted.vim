"�폜�����o�b�t�@���L�^����unite�C���^�[�t�F�C�X�ŕ\������
"�o�b�t�@�폜���Ƀ��X�g����
au BufDelete * call <SID>buffer_deleted()

let g:unite_source_buffer_deleted_stack =get(g:,'g:unite_source_buffer_deleted_stack',[])
let g:unite_source_buffer_deleted_ignore_patterns=get(g:,'g:unite_source_buffer_deleted_ignore_patterns',['\[unite]','lingr-rooms','lingr-say','\[vimshell]'])

function! s:buffer_deleted()
  let nowbuffer =expand('%:p')
  if nowbuffer !=''
    "ignore���X�g�ɂ����ɐ��K�\���}�b�`������o�^���Ȃ�
    for item in g:unite_source_buffer_deleted_ignore_patterns
      if nowbuffer =~# item
        return
      endif
    endfor

    "�ȑO�̂�����΍폜����
    if get(g:unite_source_buffer_deleted_stack,nowbuffer,'') !=''
      call filter(g:unite_source_buffer_deleted_stack,'v:val !~# nowbuffer')
    endif
    "�L�^����F�o�b�t�@�̃p�X
    let g:unite_source_buffer_deleted_stack=insert(g:unite_source_buffer_deleted_stack,nowbuffer)[0:29]
  endif
endfunction
