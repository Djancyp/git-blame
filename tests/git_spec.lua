local Git = require("git-blame.git")
local Utils = require("git-blame.utils")



describe("Git", function()
    it("should return blame line", function()
        local file = Utils:get_current_file()
        local path = Utils:get_current_file_folder()
        local line_number = Utils:get_pointer_line()

        local blame, err = Git:blame(line_number, path, file)
        if err then
            vim.print(err.message)
        end
        -- assert.is_not_nil(blame)
        assert.are.same(blame, "d0f7d0f1 (Rishabh) 2021-07-04 21:04:00 +0530 1) -- Path: lua/git-blame/utils/init.lua")
    end)
end)
