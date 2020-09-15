local global = require 'global'
local vim = vim

local options = {}

function options:new()
    local instance = {}
    setmetatable(instance, self)
    self.__index = self
    return instance
end

--1. 选项有内容
--2. 选项无内容
--
--
function options:load_options()
    self.mouse         = "a"
    self.number        = true
    self.clipboard     = "unnamed"
    self.scrolloff     = 3
    self.linebreak     = true
    self.swapfile      = false
    self.writebackup = false
    self.wrap        = false
    self.splitbelow    = true
    self.fileformats   = "dos,unix,mac"
    self.confirm       = true
    self.splitright    = true
    self.cursorline    = true

    self.cindent       = true
    self.shiftwidth    = 4
    self.softtabstop   = 4
    self.expandtab     = true
    self.autochdir     = true
    self.virtualedit   = "block"
    self.ignorecase    = true
    self.smartcase     = true
    --self.completeopt   = "menu, noinsert"

    for name, value in pairs(self) do
        vim.o[name] = value
    end
end

return options
