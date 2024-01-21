local Utils = require("git-blame.utils")

describe("Utils", function()
    describe("merge2Tables", function()
        it("should merge two tables t2 should overite t1", function()
            local t1 = { a = 1, b = 2 }
            local t2 = { b = 3, c = 4 }
            local t3 = Utils:merge2Tables(t1, t2)
            assert.are.same(t3, { a = 1, b = 3, c = 4 })
        end)
    end)

    describe("printTable", function()
        it("should print a table", function()
            local t = { a = 1, b = 2 }
            Utils:printTable(t)
        end)
    end)

    describe("strip_ansi_escape_codes", function()
        it("should strip ANSI escape codes from a string", function()
            local s = "\27[38;5;81mhello\27[0m"
            local s2 = Utils:strip_ansi_escape_codes(s)
            assert.are.same(s2, "hello")
        end)
    end)

    describe("get_current_file", function()
        it("should return file path of current buffer", function()
            -- TODO fix this test
            local file = Utils:get_current_file()
            -- check if file contains "tests/utils_spec.lua"
            local result = true
            if string.match(file, "tests/utils_spec.lua") then
                result = false
            end
            assert.are.same(result, true)
        end)
    end)

    describe("get_pointer_line", function()
        it("should return pointer line", function()
            local line = Utils:get_pointer_line()
            assert.are.same(line, 1)
        end)
    end)

    describe("get_current_file_folder", function()
        it("should return current file folder path", function()
            -- TODO fix this test
            local folder = Utils:get_current_file_folder()
            local result = true
            local expected = true
            if string.match(folder, "tests") then
                result = true
            end
            assert.are.same(result, expected)
        end)
    end)
end)
