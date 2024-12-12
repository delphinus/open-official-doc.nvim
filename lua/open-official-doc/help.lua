local runtimes = require "open-official-doc.runtimes"

---@class OpenOfficialDocHelp
local Help = {}

---@return OpenOfficialDocHelp
Help.new = function()
  return setmetatable({}, { __index = Help })
end

---@param name? string
---@param tag? string
---@return string?
function Help:generate_url(name, tag)
  if not name then
    name = self:name_from_buf()
    if not name then
      return
    end
  end
  if not tag then
    local win = vim.api.nvim_get_current_win()
    local pos = vim.api.nvim_win_get_cursor(win)
    tag = self:find_tag(pos[1] - 1, pos[2])
  end
  local hash = tag
      and "#" .. vim.uri_encode(tag == "*" and "star" or tag, "rfc2396"):gsub("%%[%da-f][%da-f]", function(s)
        return s:upper()
      end)
    or ""
  return ("https://neovim.io/doc/user/%s.html%s"):format(name, hash)
end

---@param bufnr? integer
---@return string?
function Help:name_from_buf(bufnr)
  if vim.bo.buftype ~= "help" then
    return
  end
  local bufname = vim.api.nvim_buf_get_name(bufnr or 0)
  for _, path in ipairs(runtimes()) do
    local _, finish = bufname:find(path .. "/doc/", 1, true)
    if finish then
      local found = bufname:match("(.*)%.[^.]+$", finish + 1)
      if found then
        return found == "index" and "vimindex" or found
      end
    end
  end
end

---@param row integer
---@param col? integer
---@return string?
function Help:find_tag(row, col)
  if row < 0 then
    return
  end
  local line = vim.api.nvim_buf_get_lines(0, row, row + 1, true)[1]
  return line and (line:match("%*([^%*]+)%*", col)) or self:find_tag(row - 1)
end

return Help
