-- :highlight - see all
local hi = vim.api.nvim_set_hl
local palette = require("darcula-dark.palette")
--vim.cmd.colorscheme("darcula-dark")

hi(0, "StaticFunction", { fg = palette.lang.default.function_decaration, italic = true })
hi(0, "WinSeparator", { fg = palette.interface.background })
hi(0, "Pmenu", { bg = palette.interface.background })
hi(0, "FloatBorder", { bg = palette.interface.background, fg = palette.interface.hint_text })
hi(0, "Normal", { bg = palette.editor.background, ctermbg = 1 })
hi(0, "LineNr", { fg = "#4b5059" })
hi(0, "CursorLine", { bg = palette.editor.cursor_line })
hi(0, "CursorLineNr", { fg = "#a1a3ab" })
hi(0, "ColorColumn", { bg = "#393B40", ctermbg = 1 })
hi(0, "Visual", { bg = palette.editor.select })
hi(0, "Search", { bg = palette.editor.search_select })
hi(0, "CurSearch", { bg = "#214283" })

-- diagnostics
hi(0, "DiagnosticError", { fg = palette.editor.diagnostic.error })
hi(0, "DiagnosticHint", { fg = palette.editor.diagnostic.warn })
hi(0, "DiagnosticWarn", { fg = palette.editor.diagnostic.weak_warn })
hi(0, "DiagnosticInfo", { fg = palette.editor.diagnostic.error })
hi(0, "DiagnosticUnnecessary", { fg = palette.editor.diagnostic.unnecessary})
