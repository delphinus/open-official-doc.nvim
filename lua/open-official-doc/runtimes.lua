local config = require "open-official-doc.config"

---@type boolean?
local has_lazy

return function()
  if has_lazy == nil then
    has_lazy = pcall(require, "lazy.core.config")
  end
  ---@type string[]
  local result = { vim.env.VIMRUNTIME }
  if has_lazy then
    local vimdoc_ja = require("lazy.core.config").plugins[config.vimdoc_ja_name]
    if vimdoc_ja then
      table.insert(result, vimdoc_ja.dir --[[@as string]])
    end
  end
  return result
end
