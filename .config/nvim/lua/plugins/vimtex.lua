return {
  "lervag/vimtex",
  lazy = false, -- VimTeX lädt am besten direkt beim Start
  init = function()
    -- Sagt VimTeX, dass Zathura unser PDF-Viewer ist
    vim.g.vimtex_view_method = "zathura"
    -- Optional: Versteckt Warnungen über fehlende Dependencies
    vim.g.vimtex_quickfix_mode = 0
  end,
}
