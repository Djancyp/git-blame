local Ui = {}

function Ui:Show(table, current_line)
    if table == nil then
        return
    end
    local buffer_number = vim.api.nvim_create_buf(false, true)

    -- convert the string:string to string
    local t3 = {
        " Commit : " .. table.commit_hash,
        " Author : " .. table.author .. " " .. table.author_mail,
        " Summary : " .. table.summary,
        " Commit Time : " .. table.author_time,
    }
    if table.commit_hash == "0000000000000000000000000000000000000000" then
        t3 = {
            " No Committed Yet "
        }
    end
    -- print(vim.inspect(table.))
    vim.api.nvim_buf_set_lines(buffer_number, 0, -1, false, t3)

    -- Open a new window with the new buffer
    local current_line_text = vim.fn.getline(current_line)
    local win_id = vim.api.nvim_open_win(buffer_number, true, {
        relative = "cursor",
        row = 0,
        col = current_line_text:len() + 5,
        width = t3[1]:len() + 2,
        height = #t3,
        style = 'minimal',
        border = 'double',
    })

    -- Set the new window as the current window
    vim.api.nvim_set_current_win(win_id)
end

return Ui
