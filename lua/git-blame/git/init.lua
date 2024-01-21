--- @class  error
--- @field  message string

local Git = {}

--- This function is used to get the blame line.
--- @class blame
--- @param line_number number
--- @param path string
--- @param file string
--- @return string | nil,error
function Git:blame(line_number, path, file)
    local code = "cd " ..
        path .. " && " .. "git blame -L " .. line_number .. "," .. line_number .. " " .. path
    print(code)
    local blame_line = vim.fn.systemlist(code)
    -- check if blame_line is table
    if type(blame_line) ~= "table" then
        return nil, { message = "Not Committed Yet" }
    end
    --- @type string
    local result = blame_line[1]
    return result, {}
end

return Git
