local Ui = {}

function Ui:Show(table, current_line)
    if table == nil then
        return
    end
    local buffer_number = vim.api.nvim_create_buf(false, true)

    -- convert the string:string to string
    local t3 = {
        table.author,
        table.commit_hash,
        table.author_mail,
        table.author_time,
    }
    -- print(vim.inspect(table.))
    vim.api.nvim_buf_set_lines(buffer_number, 0, -1, false, t3)

    -- Open a new window with the new buffer
    local win_id = vim.api.nvim_open_win(buffer_number, true, {
        relative = "cursor",
        row = -1,
        col = vim.fn.col("."),
        width = table.commit_hash:len() + 1,
        height = #t3,
        style = 'minimal',
        border = 'single',
    })

    -- Set the new window as the current window
    vim.api.nvim_set_current_win(win_id)
end

return Ui
