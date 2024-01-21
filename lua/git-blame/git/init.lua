local Git = {}

--- @class blame
--- @param line_number number
--- @return string
function Git:blame()
    local blame_line = vim.fn.systemlist("git blame -L " .. vim.fn.line(".") .. ",+1 " .. vim.fn.expand("%:p"))
    return blame_line[1]
end
