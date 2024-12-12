local Help = require "open-official-doc/help"

return {
  setup = function()
    vim.api.nvim_create_user_command("OpenOfficialDoc", function(args)
      local help = Help.new()
      local url = help:generate_url(args.fargs[1], args.fargs[2])
      if not url then
        vim.notify("Cannot find URL for official doc here", vim.log.levels.WARN)
        return
      end
      vim.ui.open(url)
    end, { nargs = "*", desc = "Open Neovim official doc" })
  end,
}
