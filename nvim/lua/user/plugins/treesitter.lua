local C = require "default_theme.colors"

return {
  ensure_installed = {},
  sync_install = false,
  ignore_install = {},
  highlight = {enable = true, additional_vim_regex_highlighting = false},
  context_commentstring = {enable = true, enable_autocmd = false},
  autopairs = {enable = true},
  incremental_selection = {enable = true},
  indent = {enable = true},
  autotag = {enable = true},
  auto_install = true,
  matchup = {enable = true},
  rainbow = {
    enable = true,
    disable = {"html"},
    extended_mode = true,
    max_file_lines = nil,
    colors = {C.purple_2, C.red_4, C.cyan, C.grey, C.blue, C.yellow_1, C.red_4}
    -- colors = {
    --   "#a89984", "#cc241d", "#b16286", "#d79921", "#689d6a", "#d65d0e",
    --   "#458588"
    -- },
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ["aF"] = "@custom-function_definition",
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@custom-class_definition",
        ["aC"] = "@custom-class_definition",
        ["ic"] = "@class.inner"
      },
      selection_modes = {
        ["@parameter.outer"] = "v",
        ["@function.definition"] = "v",
        ["@function.outer"] = "v",
        ["@function.inner"] = "V",
        ["@class.definition"] = "v",
        ["@class.outer"] = "v",
        ["@class.inner"] = "V"
      },
      include_surrounding_whitespace = {
        ["@function.inner"] = false,
        ["@function.outer"] = true,
        ["@custom-function_definition"] = true,
        ["@class.outer"] = true
      }
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        ["]m"] = "@function.outer",
        ["]]"] = {query = "@class.outer", desc = "Next class start"}
      },
      goto_next_end = {["]M"] = "@function.outer", ["]["] = "@class.outer"},
      goto_previous_start = {
        ["[m"] = "@function.outer",
        ["[["] = "@class.outer"
      },
      goto_previous_end = {["[M"] = "@function.outer", ["[]"] = "@class.outer"}
    }
  }

}
