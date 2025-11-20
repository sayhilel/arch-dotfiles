return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    main = "nvim-treesitter.configs",
    opts = {
      auto_install = true,
      ensure_installed = { "cpp", "c", "lua", "python" },
      highlight = {
        enable = true,
      },
      indent = { enable = true, disable = {} },
    },
  },
}
