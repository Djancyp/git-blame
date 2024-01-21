local options = require("git-blame.otps")
local Utils = require("git-blame.utils")
local Git = require("git-blame.git")
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

    local blame, err = Git:blame(line_number, path, file)
    if err then
        vim.print(err.message)
    end
end

return M
