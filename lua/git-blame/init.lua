local options = require("git-blame.otps")
local Utils = require("git-blame.utils")
local Git = require("git-blame.git")
local Ui = require("git-blame.ui")
local M = {}

--- This function is setup function.
---
--- @param opts options
function M.setup(opts)
    opts = opts or {}
    opts = Utils:merge2Tables(options, opts)
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
        -- TODO: handle error
        print(err.message)
        return
    end
    if not blame then
        return
    end
    local result, formatErr = Git:FormatBlame(blame)
    if formatErr ~= nil then
        -- TODO: handle error
        print(vim.inspect(err))
        return
    end

    Ui:Show(result, line_number)
end

return M
