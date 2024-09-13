require("config.lazy")
require("settings")
require("keymaps")
require('ibl').setup({
    indent = { char = "│" },
})
require('gitsigns').setup()

local lualine_theme = require("lualine_theme")
require("lualine").setup({
    options = {
        theme = lualine_theme
    },
    sections = { 
        lualine_b = {
            { 'branch', icon = ' ' },
        },
        lualine_c = {
            {
                'diff',
                symbols = {added = ' ', modified = ' ', removed = ' '},
            },
            { 
                'diagnostics',
                symbols = {error = ' ', warn = ' ', info = ' ', hint = ' '},
            }
        },
        lualine_x = {
            {
                'filename',
                symbols = {modified = '●', readonly = ''},
            }, 
            'encoding', 'fileformat', 'filetype'
        },
    }
})
require("scrollbar").setup({
    handle = {
        color = "#808080"
    },
    handlers = {
        gitsigns = true
    }
})
require('nvim-treesitter.configs').setup({
    ensure_installed = { 
        "c", 
        "lua", 
        "vim",
        "vimdoc",
        "query",
        "markdown",
        "markdown_inline",
        "rust",
        "kotlin", 
        "java", 
        "json",
--        "toml",
        "yaml",
        "xml",
        "bash",
        "go",
        "proto",
    },
    highlight = {
        enable = true,
    }
})
require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = {
        "lua_ls", 
        "rust_analyzer", 
    },
})

local ELLIPSIS_CHAR = '…'
local MAX_LABEL_WIDTH = 40
local MIN_LABEL_WIDTH = 40
local lspkind = require('lspkind')
local cmp = require("cmp")
require("cmp").setup({
    performance = {
		max_view_entries = 10,
	},
    formatting = {
        fields = { cmp.ItemField.Kind, cmp.ItemField.Abbr  },
        format = lspkind.cmp_format({
            mode = 'symbol',
            preset = 'default',
            maxwidth = 50,
            ellipsis_char = '...',
            show_labelDetails = true, -- show labelDetails in menu. Disabled by default
            before = function (entry, vim_item)
                -- https://github.com/hrsh7th/nvim-cmp/issues/980#issuecomment-1121773499
                local label = vim_item.abbr
                local truncated_label = vim.fn.strcharpart(label, 0, MAX_LABEL_WIDTH)
                if truncated_label ~= label then
                    vim_item.abbr = truncated_label .. ELLIPSIS_CHAR
                elseif string.len(label) < MIN_LABEL_WIDTH then
                    local padding = string.rep(' ', MIN_LABEL_WIDTH - string.len(label))
                    vim_item.abbr = label .. padding
                end
                -- https://github.com/hrsh7th/nvim-cmp/issues/980#issuecomment-1882213992
                vim_item.menu = ""
                return vim_item
            end
        })
    },
    window = {
        completion = {
            border = "rounded",
        },
        documentation = {
            border = "rounded",
        }
    },
    mapping = {
      ["<C-k>"] = cmp.mapping.select_prev_item(),
      ["<C-j>"] = cmp.mapping.select_next_item(),
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    },
    sources = {
        { name = 'nvim_lsp' },
    }
})
