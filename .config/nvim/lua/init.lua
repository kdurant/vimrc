local global = require 'global'
local options = require 'options'
local autocmd = require 'event'

local vim, api = vim, vim.api

local M = {}
-- 
function M.createdir()
  local data_dir = {global.cache_dir..'backup',global.cache_dir..'session',global.cache_dir..'swap',global.cache_dir..'tags',global.cache_dir..'undo'}
  if not global.isdir(global.cache_dir) then
    os.execute("mkdir -p " .. global.cache_dir)
  end
  for _,v in pairs(data_dir) do
    if not global.isdir(v) then
      os.execute("mkdir -p " .. v)
    end
  end
end

--foo = function(x) return 2*x end
function M.load_core()
    M.createdir()

    local ops = options:new()
    ops:load_options()

    autocmd.load_autocmds()
end
 
M.load_core()
