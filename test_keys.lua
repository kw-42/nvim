-- Debug: Log what keys are pressed
vim.keymap.set('i', '<C-BS>', function()
    print("INSERT: C-BS pressed")
end)

vim.keymap.set('t', '<C-BS>', function()
    print("TERMINAL: C-BS pressed")
end)

-- Also test if C-BS is being received as something else
vim.on_key(function(key)
    if key:find("") then  -- Check for special chars
        print("Special key received: " .. vim.fn.strtrans(key))
    end
end)
