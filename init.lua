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

vim.lsp.config['rust_analyzer'] = {
	cmd = { 'rust-analyzer' },
	filetypes = { 'rust' },
	settings = {
		rust_analyzer = {
			imports = {
				granularity = {
					group = "module",
				},
				prefix = "self",
			},
			cargo = {
				buildScripts = {
					enable = true,
				},
			},
			procMacro = {
				enable = true
			},
		},
	},
}

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
	pattern = "*.rs",
	callback = function()
		vim.lsp.buf.format({ async = false })
	end
})

vim.lsp.enable('rust_analyzer')

vim.lsp.config['lua_ls'] = {
	-- Command and arguments to start the server.
	cmd = { 'lua-language-server' },
	-- Filetypes to automatically attach to.
	filetypes = { 'lua' },
	-- Sets the "workspace" to the directory where any of these files is found.
	-- Files that share a root directory will reuse the LSP server connection.
	-- Nested lists indicate equal priority, see |vim.lsp.Config|.
	root_markers = { { '.luarc.json', '.luarc.jsonc' }, '.git' },
	-- Specific settings to send to the server. The schema is server-defined.
	-- Example: https://raw.githubusercontent.com/LuaLS/vscode-lua/master/setting/schema.json
	settings = {
		Lua = {
			runtime = {
				version = 'Lua 5.4',
			}
		}
	}
}

vim.lsp.enable('lua_ls')

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
	pattern = "*.lua",
	callback = function()
		vim.lsp.buf.format({ async = false })
	end
})


vim.api.nvim_create_autocmd({ "BufWritePre" }, {
	pattern = "*.go",
	callback = function()
		local params = vim.lsp.util.make_range_params()
		params.context = { only = { "source.organizeImports" } }
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
		vim.lsp.buf.format({ async = false })
	end
})

vim.diagnostic.enable = true
vim.diagnostic.config({
	virtual_lines = true,
})
