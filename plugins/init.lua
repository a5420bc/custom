local overrides = require "custom.plugins.overrides"

return {

  ["goolord/alpha-nvim"] = { disable = false }, -- enables dashboard

  -- Override plugin definition options
  ["neovim/nvim-lspconfig"] = {
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.plugins.lspconfig"
    end,
  },

  -- overrde plugin configs
  ["nvim-treesitter/nvim-treesitter"] = {
    override_options = overrides.treesitter,
  },

  ["williamboman/mason.nvim"] = {
    override_options = overrides.mason,
  },

  ["kyazdani42/nvim-tree.lua"] = {
    override_options = overrides.nvimtree,
  },

  ["nvim-telescope/telescope.nvim"] = {
    override_options = overrides.telescope,
  },

  -- Install a plugin
  ["max397574/better-escape.nvim"] = {
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  -- code formatting, linting etc
  ["jose-elias-alvarez/null-ls.nvim"] = {
    after = "nvim-lspconfig",
    config = function()
      require "custom.plugins.null-ls"
    end,
  },
  -- remove plugin
  -- ["hrsh7th/cmp-path"] = false,
  -- ["ahmedkhalf/project.nvim"] = {
  --   config = function()
  --     require("project_nvim").setup {
  --       -- your configuration comes here
  --       -- or leave it empty to use the default settings
  --       -- refer to the configuration section below
  --     }
  --   end
  -- },
  ["rmagatti/auto-session"] = {
    config = function ()
      require("auto-session").setup {
        log_level = "error",
        -- auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/"},
        auto_session_enable_last_session=true,
        auto_save_enabled = true,
        auto_restore_enabled = true,
      }
    end
  },
  ['rmagatti/session-lens'] = {
    cmd = "SearchSession",
    config = function()
      require('session-lens').setup({
        --[[your custom config--]]--
        -- path_display = {'shorten'},
        -- theme_conf = { border = false },
        path_display={'shorten'},
      })
    end
  },
  ["nvim-pack/nvim-spectre"] = {},
  ["ojroques/nvim-osc52"] = {},
  ["tpope/vim-fugitive"] = {},
  ["rcarriga/nvim-dap-ui"] = {},
  ["mfussenegger/nvim-dap"] = {
    config = function()
      require("custom.plugins.dap")
    end
  },
  ["folke/trouble.nvim"] = {},
  ["voldikss/vim-floaterm"] = {},
  ["nvim-lualine/lualine.nvim"] = {
    after = "ui",
    config = function()
      require('lualine').setup {
        sections = {
          lualine_c = {{'filename', path=1}},
        },
      }
    end
  },
}
