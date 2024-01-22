local Git = require("git-blame.git")
local Ui = require("git-blame.ui")
local Utils = require("git-blame.utils")
local options = require("git-blame.otps")
local M = {}

--- This function is setup function.
---
--- @param opts options
function M.setup(opts)
    opts = opts or {}
    opts = Utils:merge2Tables(options, opts)
    M.set_autocmd()
end

function M.set_autocmd()
    vim.api.nvim_create_user_command(
        "GitBlame",
        "lua require('git-blame').blame()",
        {}
    )
end

function M.blame()
    local file = Utils:get_current_file()
    local path = Utils:get_current_file_folder()
    local line_number = Utils:get_pointer_line()
    if not path then
        return
    end
    if not file then
        return
    end

    local blame, err = Git:blame(line_number, path, file)
    if err ~= nil then
        return
    end
    if not blame then
        return
    end

    local result, formatErr = Git:FormatBlame(blame)
    if formatErr ~= nil then
        return
    end

    -- local log, logErr = Git:log(result.commit_hash, path)
    -- print(vim.inspect(log))
    Ui:Show(result, line_number)
end

return M
