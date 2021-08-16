local actions = require('telescope.actions')
local sorters = require('telescope.sorters')
local themes = require('telescope.themes')
local previewers = require('telescope.previewers')

require('telescope').setup {
  defaults = {
    prompt_prefix = '> ',
    selection_caret = '> ',

    winblend = 0,

    layout_strategy = 'horizontal',
    layout_config = {
      prompt_position = "top",
      preview_cutoff = 120,
      horizontal = {
        width_padding = 0.1,
        height_padding = 0.1,
        preview_width = 0.6
      },
      vertical = {
        width_padding = 0.05,
        height_padding = 1,
        preview_width = 0.5
      }
    },

    selection_strategy = "reset",
    sorting_strategy = "ascending",
    scroll_strategy = "cycle",
    color_devicons = true,

    mappings = {
      i = {
        ["<C-x>"] = false,
        ["<C-v>"] = actions.select_vertical,
        ["<C-s"] = actions.select_horizontal,
        ["<esc>"] = actions.close
      }
    },

    border = {},
    borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },

    file_sorter = sorters.get_fzy_sorter,

    file_previewer = previewers.vim_buffer_cat.new,
    grep_previewer = previewers.vim_buffer_vimgrep.new
  }
}

-------------------------------------------------------------------------------
------------------------------ FUNCTIONS --------------------------------------
-------------------------------------------------------------------------------

local M = {};

function M.edit_neovim()
  require('telescope.builtin').find_files {
    prompt_title = '~ dotfiles ~',
    shorten_path = false,
    cwd = '~/_repos/config/nvim',

    layout_strategy = 'horizontal'
  }
end

function M.git_files()
  require('telescope.builtin').git_files()
end

function M.lsp_code_actions()
  local opts = themes.get_dropdown {
    winblend = 10,
    border = true,
    previewer = false,
    shorten_path = false
  }

  require('telescope.builtin').lsp_code_actions(opts)
end

function M.find_in_files()
  require('telescope.builtin').live_grep()
end

return setmetatable({}, {
  __index = function(_, k)
    if M[k] then
      return M[k]
    else
      return require('telescope.builtin')[k]
    end
  end
})
