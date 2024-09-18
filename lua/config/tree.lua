vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local function my_on_attach(bufnr)
    local api = require "nvim-tree.api"
  
    local function opts(desc)
      return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end
  
    api.config.mappings.default_on_attach(bufnr)
  
    vim.keymap.set('n', 'e', api.node.open.edit, opts('Open'))
  end

require("nvim-tree").setup {
    on_attach = my_on_attach,
    view = {
        adaptive_size = true,
    },
    sync_root_with_cwd = true,
}

local function toggle_or_focus_nvimtree()
    local buf_name = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ":t")
    if vim.bo.filetype:match("alpha") then
        vim.cmd("bdelete")
    end
    if buf_name:match("NvimTree") then
        vim.cmd("NvimTreeToggle")
    else
        vim.cmd("NvimTreeFindFile")
        vim.cmd("NvimTreeFocus")
    end
end

vim.keymap.set({'n', 'v', 's', 't'}, '<leader><leader>', toggle_or_focus_nvimtree, { desc = 'Toggle or Focus Tree' })
