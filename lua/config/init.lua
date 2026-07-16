local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

function R(name)
    require("plenary.reload").reload_module(name)
end

local yank_group = augroup("HighlightYank", {})
autocmd("TextYankPost", {
    group = yank_group,
    pattern = "*",
    callback = function()
        vim.highlight.on_yank({ higroup = "IncSearch", timeout = 80 })
    end,
})

local clean_group = augroup("CleanOnSave", {})
autocmd("BufWritePre", {
    group = clean_group,
    pattern = "*",
    command = [[%s/\s\+$//e]],
})

local resize_group = augroup("ResizeSplits", {})
autocmd("VimResized", {
    group = resize_group,
    callback = function()
        vim.cmd("tabdo wincmd =")
    end,
})

local lsp_group = augroup("LspKeymaps", {})
autocmd("LspAttach", {
    group = lsp_group,
    callback = function(event)
        local map = function(keys, func)
            vim.keymap.set("n", keys, func, { buffer = event.buf })
        end

        map("gd", vim.lsp.buf.definition)
        map("gr", vim.lsp.buf.references)
        map("gI", vim.lsp.buf.implementation)
        map("gD", vim.lsp.buf.declaration)
        map("K", vim.lsp.buf.hover)
        map("<leader>D", vim.lsp.buf.type_definition)
        map("<leader>ds", vim.lsp.buf.document_symbol)
        map("<leader>ws", vim.lsp.buf.workspace_symbol)
        map("<leader>rn", vim.lsp.buf.rename)
        map("<leader>ca", vim.lsp.buf.code_action)
        map("]d", vim.diagnostic.goto_next)
        map("[d", vim.diagnostic.goto_prev)

        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if client and client.supports_method("textDocument/inlayHint") then
            map("<leader>th", function()
                vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
            end)
        end
    end,
})
