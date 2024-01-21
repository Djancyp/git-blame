--- @class  error
--- @field  message string

local Utils = require("git-blame.utils")
local Git = {}

--- This function is used to get the blame line.
--- @class blame
--- @param line_number number
--- @param path string
--- @param file string
--- @return string[] | nil,error
function Git:blame(line_number, path, file)
    local code = "cd " ..
        path .. " && " .. "git blame -L " .. line_number .. "," .. line_number .. " -p " .. file
    local blame_line = vim.fn.systemlist(code)
    -- check if blame_line is table
    if type(blame_line) ~= "table" then
        return nil, { message = "Not Committed Yet" }
    end
    --- @type string[]
    local result = blame_line

    return result, nil
end

--- This function get the log with branch name.
---
--- Example:git log -L 1,1:file
--- @param commit_number string
--- @param path string
function Git:log(commit_number, path)
    local code = "cd " ..
    path .. " && " .. "git for-each-ref --format='%(refname:short) %(objectname)' | grep " .. commit_number

    local log = vim.fn.systemlist(code)
    -- check if log is table
    if type(log) ~= "table" then
        return nil, { message = "Not Committed Yet" }
    end
    --- @type string[]
    local result = log

    return result, nil
end

--- @class FormatBlame
--- @field commit_hash string
--- @field author string
--- @field author_mail string
--- @field author_time string


--- This function format blame lines.
--- git blame -L 1,1 -p file
---
--- @param blame_lines string[]
--- @return table<FormatBlame> | nil,error
function Git:FormatBlame(blame_lines)
    -- check if blame_lines is table
    if type(blame_lines) ~= "table" then
        return nil, { message = "Format Blame didnt get table" }
    end
    if blame_lines[2] == nil then
        return nil, { message = "No git" }
    end
    blame_lines[1] = Utils:strip_ansi_escape_codes(blame_lines[1]):match("(%S+)")
    blame_lines[2] = Utils:strip_ansi_escape_codes(blame_lines[2]):match("%S+%s+(%S+)")
    blame_lines[3] = Utils:strip_ansi_escape_codes(blame_lines[3]):match("%S+%s+(%S+)")
    blame_lines[4] = Utils:strip_ansi_escape_codes(blame_lines[4]):match("%S+%s+(%S+)")
    
    -- summary get all after summary
    -- Ex: summary test test test
    blame_lines[10] = Utils:strip_ansi_escape_codes(blame_lines[10]):match("summary%s*(.+)")

    -- get commit hash
    local result = {
        commit_hash = blame_lines[1],
        author = blame_lines[2],
        author_mail = blame_lines[3],
        author_time = os.date("%Y-%m-%d %H:%M:%S", blame_lines[4]),
        summary = blame_lines[10],
    }
    return result, nil
end

return Git
