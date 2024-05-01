-- Define commands for Lua compatible with Neovim
vim.cmd [[
  command! Econf lua require('eluded.utils').edit_config()
  command! Eplug lua require('eluded.utils').edit_plugins()
  command! Ezsh lua require('eluded.utils').edit_zshrc()
  command! Etmux lua require('eluded.utils').edit_tmux()
  command! Essh lua require('eluded.utils').edit_ssh()

  function! GoToNextIndent(inc)
    " Get the cursor current position
    let currentPos = getpos('.')
    let currentLine = currentPos[1]
    let matchIndent = 0

    " Look for a line with the same indent level whithout going out of the buffer
    while !matchIndent && currentLine != line('$') + 1 && currentLine != -1
        let currentLine += a:inc
        let matchIndent = indent(currentLine) == indent('.')
    endwhile

    " If a line is found go to this line
    if (matchIndent)
        let currentPos[1] = currentLine
        call setpos('.', currentPos)
    endif
  endfunction

  nnoremap ]l :call GoToNextIndent(1)<CR>
  nnoremap [l :call GoToNextIndent(-1)<CR>
]]
