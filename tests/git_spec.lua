local Git = require("git-blame.git")
local Utils = require("git-blame.utils")

describe("Git", function()
    it("should return blame line", function()
        local result = false
        local expected = true
        local file = Utils:get_current_file()
        local path = Utils:get_current_file_folder()
        local line_number = Utils:get_pointer_line()

        local blame, err = Git:blame(line_number, path, file)
        if err ~= nil then
            print(err.message)
        end
        if blame then
            result = true
        end
        assert.are.same(result, expected)
    end)
end)
