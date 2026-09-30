return {
  -- 1. Plugin untuk membuat visual Markdown menjadi rapi dan cantik
  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-mini/mini.icons",
    },
    ft = { "markdown", "norg", "rmd", "org" },
    init = function()
      -- Memaksa Neovim mengaktifkan fitur menyembunyikan karakter mentah seperti '#' atau '|'
      vim.opt_local.conceallevel = 2
    end,
    opts = {
      anti_preview = {
        enabled = true, -- Tetap rapi bahkan saat kursor berada di baris tersebut
      },
    },
  },

  -- 2. Mematikan aturan-aturan linter yang mengganggu dokumen teks Anda
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters = {
        markdownlint = {
          -- Menghilangkan aturan panjang baris (MD013) dan jarak baris kosong (MD022, MD032)
          args = { "--disable", "MD013", "MD022", "MD032", "--" },
        },
      },
    },
  },
}
