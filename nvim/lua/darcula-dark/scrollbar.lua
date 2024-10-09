local hi = vim.api.nvim_set_hl
local palette = require("darcula-dark.palette")

hi(0, "ScrollbarHandle", { bg = palette.interface.scroll_bar, fg = palette.interface.scroll_bar })
hi(0, "ScrollbarError", { fg = palette.editor.diagnostic.error })
hi(0, "ScrollbarErrorHandle", { bg = palette.interface.scroll_bar, fg = palette.editor.diagnostic.error })
hi(0, "ScrollbarWarn", { fg = palette.editor.diagnostic.weak_warn })
hi(0, "ScrollbarWarnHandle", { bg = palette.interface.scroll_bar, fg = palette.editor.diagnostic.weak_warn })
hi(0, "ScrollbarInfo", { fg = palette.editor.diagnostic.error })
hi(0, "ScrollbarInfoHandle", { bg = palette.interface.scroll_bar, fg = palette.editor.diagnostic.error })
hi(0, "ScrollbarHint", { fg = palette.editor.diagnostic.warn })
hi(0, "ScrollbarHintHandle", { bg = palette.interface.scroll_bar, fg = palette.editor.diagnostic.warn })
hi(0, "ScrollbarGitAdd", { fg = palette.editor.vcs.added_line })
hi(0, "ScrollbarGitAddHandle", { bg = palette.interface.scroll_bar, fg = palette.editor.vcs.added_line })
hi(0, "ScrollbarGitChange", { fg = palette.editor.vcs.changed_line })
hi(0, "ScrollbarGitChangeHandle", { bg = palette.interface.scroll_bar, fg = palette.editor.vcs.changed_line })
hi(0, "ScrollbarGitDelete", { fg = palette.editor.vcs.deleted_line })
hi(0, "ScrollbarGitDeleteHandle", { bg = palette.interface.scroll_bar, fg = palette.editor.vcs.deleted_line })
