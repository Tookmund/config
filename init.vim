vim.cmd([[
set background=dark

" Show trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" Tabs are 4 spaces
set ts=4
set sw=4

set colorcolumn=80

set nohlsearch

set spelllang=en_us

set clipboard=unnamedplus

set nomodeline

set sm
]])

vim.lsp.config['gopls'] = {
	cmd = { 'gopls' },
	filetypes = { 'go' },
	  settings = {
	    gopls = {
	      analyses = {
		unusedparams = true,
	      },
	      staticcheck = true,
	      gofumpt = true,
	    },
	  },
}

vim.lsp.enable('gopls')

vim.api.nvim_create_autocmd({"BufWritePre"}, {
  pattern = "*.go",
  callback = function()
    local params = vim.lsp.util.make_range_params()
    params.context = {only = {"source.organizeImports"}}
    -- buf_request_sync defaults to a 1000ms timeout. Depending on your
    -- machine and codebase, you may want longer. Add an additional
    -- argument after params if you find that you have to write the file
    -- twice for changes to be saved.
    -- E.g., vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 3000)
    local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params)
    for cid, res in pairs(result or {}) do
      for _, r in pairs(res.result or {}) do
        if r.edit then
          local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or "utf-16"
          vim.lsp.util.apply_workspace_edit(r.edit, enc)
        end
      end
    end
    vim.lsp.buf.format({async = false})
  end
})

vim.diagnostic.enable = true
vim.diagnostic.config({
	virtual_lines = true,
})
