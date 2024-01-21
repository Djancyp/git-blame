local options = require("git-blame.otps")
local Utils = require("git-blame.utils")
local M = {}

-- @class setup
-- @field opts options
function M.setup(opts)
    opts = opts or {}
    opts = Utils:merge2Tables(options, opts)

    -- Utils:printTable(opts)
end

return M
