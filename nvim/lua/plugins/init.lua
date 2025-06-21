-- Plugin specifications for lazy.nvim
return {
  -- Colorscheme
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    config = function()
      require("gruvbox").setup({
        contrast = "hard",
      })
      vim.cmd("colorscheme gruvbox")
    end,
  },

  -- Buffer line
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
      require("bufferline").setup({
        options = {
          mode = "buffers",
          show_buffer_close_icons = false,
          show_close_icon = false,
          separator_style = "thin",
          always_show_bufferline = true,
          indicator = {
            style = 'icon',
            icon = '▎',
          },
        },
      })
    end,
  },

  -- Essential plugins
  { "tpope/vim-repeat" },
  { "tpope/vim-surround" },
  { "tpope/vim-commentary" },

  -- Enhanced f/t motions
  {
    "ggandor/leap.nvim",
    config = function()
      -- Use leap for s/S (2-character search with labels)
      vim.keymap.set({'n', 'x', 'o'}, 's', '<Plug>(leap-forward-to)')
      vim.keymap.set({'n', 'x', 'o'}, 'S', '<Plug>(leap-backward-to)')
    end,
  },
  
  -- Enhanced f/F/t/T with repeat
  {
    "rhysd/clever-f.vim",
    config = function()
      vim.g.clever_f_smart_case = 1
      vim.g.clever_f_across_no_line = 0
      vim.g.clever_f_fix_key_direction = 1
    end,
  },

  -- Fuzzy finder
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("telescope").setup({
        defaults = {
          mappings = {
            i = {
              ["<esc>"] = require("telescope.actions").close,
            },
          },
        },
      })
      vim.keymap.set('n', '<Space>p', '<Cmd>Telescope find_files<CR>', { desc = "Find files" })
    end,
  },

  -- File explorer
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("nvim-tree").setup({
        view = {
          adaptive_size = true,
        },
        filters = {
          dotfiles = false,
        },
      })
      vim.keymap.set('n', '<M-o>', '<Cmd>NvimTreeToggle<CR>', { desc = "Toggle file tree" })
    end,
  },

  -- Move lines
  {
    "fedepujol/move.nvim",
    config = function()
      local opts = { noremap = true, silent = true }
      -- j/k == n/e on colemak layout
      vim.keymap.set('n', '<M-n>', ':MoveLine(1)<CR>', opts)
      vim.keymap.set('n', '<M-e>', ':MoveLine(-1)<CR>', opts)
      vim.keymap.set('v', '<M-n>', ':MoveBlock(1)<CR>', opts)
      vim.keymap.set('v', '<M-e>', ':MoveBlock(-1)<CR>', opts)
    end,
  },

  -- Auto pairs
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("nvim-autopairs").setup({
        enable_check_bracket_line = false,
        ignored_next_char = "[%w%.]",
      })
    end,
  },

  -- Auto close HTML tags
  {
    "windwp/nvim-ts-autotag",
    event = "InsertEnter",
    dependencies = "nvim-treesitter/nvim-treesitter",
    config = true,
  },

  -- Text objects (user must be loaded first)
  { 
    "kana/vim-textobj-user",
    lazy = false,
    priority = 100,
  },
  { 
    "kana/vim-textobj-entire",
    dependencies = "kana/vim-textobj-user",
  },
  { 
    "kana/vim-textobj-indent",
    dependencies = "kana/vim-textobj-user",
  },
  { "wellle/targets.vim" },

  -- Language support
  { "dart-lang/dart-vim-plugin" },
  { "jvirtanen/vim-hcl" },

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "vim", "lua", "python", "javascript", "typescript", "scala", "dart", "markdown" },
        highlight = { enable = true },
        indent = { enable = true },
      })
    end,
  },

  -- Keep using CoC for now since nvim-lspconfig requires newer Neovim
  {
    "neoclide/coc.nvim",
    branch = "release",
  },

  -- Scala support
  {
    "scalameta/coc-metals",
    build = "yarn install --frozen-lockfile",
  },

  -- Python support
  {
    "fannheyward/coc-pyright",
    build = "yarn install --frozen-lockfile",
  },

  -- Markdown preview
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
  },
}