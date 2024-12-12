# open-official-doc.nvim

Yet another plugin to open the official doc from help in Neovim.

## What's this?

With this plugin, you can open pages in [Documentation - Neovim](https://neovim.io/doc/) when you are reading helps in Neovim.

I've borrowed this idea from an article: [NeovimのヘルプからNeovim docsを参照する](https://zenn.dev/kyoh86/articles/693909b1798383). I found some cases not to work with this script, so fixed them and made up to this plugin.

## How to use

Launch the command: `:OpenOfficialDoc` in reading help. Or, you can supply name (and tag) to open pages directly.

```vim
" search the helptag around your cursor and open it.
:OpenOfficialDoc
" open the page
:OpenOfficialDoc change
" open the helptag on the page
:OpenOfficialDoc change <<
```

The last example opens [https://neovim.io/doc/user/change.html#%3C%3C](https://neovim.io/doc/user/change.html#%3C%3C), that means the `<<` mapping in `change.txt`.

### For vimdoc-ja

In addition to [the original script](https://zenn.dev/kyoh86/articles/693909b1798383), you can open the official doc from help pages translated to Japanese: [vim-jp/vimdoc-ja](https://github.com/vim-jp/vimdoc-ja).

The current build only supports vimdoc-ja installed by [lazy.nvim](https://lazy.folke.io/).

## TODO

- [x] Support Neovim HEAD installed by Homebrew
* [x] Open tags including special characters
* [x] Open tags in `index.txt`
* [x] Open `*` (star)
* [ ] Specify the directory containing vimdoc-ja
* [ ] Add additional directories containing help
