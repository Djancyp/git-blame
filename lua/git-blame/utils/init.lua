local Utils = {}

---
--- This function is used to merge two tables.
--- Note: t2 will overwrite t1.
---
--- @return table<string, any>
--- @param t1 table<string, any>
--- @param t2 table<string, any>
function Utils:merge2Tables(t1, t2)
    local t3 = vim.tbl_extend("force", t1, t2)
    return t3
end

---
--- This function is used to print a table.
--- Note: This function is used for debugging.
---
--- @param t table<string, any>
function Utils:printTable(t)
    print(vim.inspect(t))
end

---
--- This function is used to remove ANSI escape codes from a string.
--- This is useful when you want to get the length of a string that contains ANSI escape codes.
--- @param s string
--- @return string
function Utils:strip_ansi_escape_codes(s)
    s = s:gsub("\27%[[%d;]+m", "")
    return s
end

--- This function return file path of current buffer.
---
--- @return any
function Utils:get_current_file()
    return vim.fn.shellescape(vim.fn.expand("%:p"))
end

--- This function return file path of current buffer.
---
--- @return integer
function Utils:get_pointer_line()
    local line = vim.fn.line(".")
    if not line then
        return 0
    end
    return line
end

--- This function return current file folder path.
---
--- @return string
function Utils:get_current_file_folder()
    return vim.fn.shellescape(vim.fn.expand("%:p:h"))
end

--- This function runs commands in the shell and returns the output.
--- function get table of cmd and run them asnyc
--- @param cmd string[]
--- @return string
function Utils:run_shell_command(cmd)
end

return Utils
