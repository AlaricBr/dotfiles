-- Automatically close Neovim if NvimTree is the last open window
vim.api.nvim_create_autocmd("BufEnter", {
  nested = true,
  callback = function()
    local bufname = vim.api.nvim_buf_get_name(0)
    local is_tree = vim.bo.filetype == "NvimTree"

    if is_tree then
      local wins = vim.api.nvim_list_wins()
      if #wins == 1 then
        vim.cmd("quit")
      end
    end
  end,
})
