"�폜�����o�b�t�@���L�^����unite�C���^�[�t�F�C�X�ŕ\������
"�o�b�t�@�폜���Ƀ��X�g����
au BufDelete * call <SID>registerDeletedBuffer()

let g:registerDeletedBuffer =get(g:,'g:registerDeletedBuffer',[])
let g:registerDeletedBufferIgnore =get(g:,'g:registerDeletedBufferIgnore',['\[unite]',])

function! s:registerDeletedBuffer()
  let nowbuffer =expand('%:p')
  if nowbuffer !=''
    "ignore���X�g�ɂ����ɐ��K�\���}�b�`������o�^���Ȃ�
    for item in g:registerDeletedBufferIgnore
      if nowbuffer =~# item
        return
      endif
    endfor

    "TODO:�ȑO�̂�����΍폜����
"    if get(g:registerDeletedBuffer,nowbuffer,'') !=''
"      call remove(g:registerDeletedBuffer,nowbuffer)
"    endif
    "�L�^����F�o�b�t�@�̃p�X
    call insert(g:registerDeletedBuffer,nowbuffer)
  endif
endfunction
