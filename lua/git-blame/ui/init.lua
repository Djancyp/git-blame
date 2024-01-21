local Ui = {}

function Ui:Show(table, current_line)
    if table == nil then
        return
    end
    local buffer_number = vim.api.nvim_create_buf(false, true)
    vim.api.nvim_buf_set_lines(buffer_number, 0, -1, false, table[1])

    -- Open a new window with the new buffer
    local win_id = vim.api.nvim_open_win(buffer_number, true, {
        relative = "cursor",
        row = current_line + 1,
        col = 0,
        width = vim.fn.winwidth(0),
        height = 20,
        style = 'minimal',
        border = 'single',
    })

    -- Set the new window as the current window
    vim.api.nvim_set_current_win(win_id)
end

return Ui
