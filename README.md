# NvChad for Termux - Complete Neovim Configuration

![NvChad Logo](assets/nvchad.webp)

**NvChad-Termux** is a fully configured Neovim setup optimized for Termux on Android. It comes with pre-configured language servers, AI assistants, code formatters, and a beautiful UI - ready to use out of the box.

---

## Table of Contents

- [Features](#features)
- [Quick Start](#quick-start)
- [Installation](#installation)
- [Configuration Overview](#configuration-overview)
- [Keybindings](#keybindings)
- [AI Assistants](#ai-assistants)
- [Language Support](#language-support)
- [Code Formatting](#code-formatting)
- [UI Components](#ui-components)
- [Customization](#customization)
- [Troubleshooting](#troubleshooting)

---

## Features

### 🤖 AI Integration
- **GitHub Copilot** - Real-time AI code suggestions with custom keybindings
- **CodeCompanion** - Multi-provider AI chat assistant (OpenAI, Mistral, Anthropic, etc.)

### 📝 Code Completion
- **nvim-cmp** - Intelligent autocompletion engine
- **LuaSnip** - Snippet engine with HTML/JSX/TSX snippets
- **Ghost Text** - Inline suggestion display

### 🎨 Language Support (LSP)
- HTML & CSS Language Servers
- TypeScript/JavaScript (ts_ls)
- TailwindCSS
- ESLint integration
- Auto-closing tags for HTML/JSX/TSX

### 🛠 Code Formatting
- **Prettier** - JavaScript, TypeScript, CSS, HTML, JSON, Markdown, YAML
- **stylua** - Lua formatting
- **shfmt** - Bash/Shell script formatting
- **pg_format** - SQL formatting

### 🌳 Syntax & Navigation
- **Treesitter** - Advanced syntax highlighting and code navigation
- **Incremental Selection** - Expand/shrink code selections with `<C-space>` / `<bs>`
- **Auto-closing Tags** - HTML/JSX tag auto-completion

### 🖥 UI Enhancements
- **Eldritch Theme** - Dark, eye-friendly color scheme
- **bufferline.nvim** - Tab-like buffer management
- **lualine.nvim** - Status bar with diagnostics
- **indent-blankline** - Visual indentation guides
- **nvim-notify** - Beautiful notifications
- **which-key** - Keybinding helper
- **nvim-scrollbar** - Scrollbar with diagnostics
- **nvim-web-devicons** - File type icons

### 🔍 Navigation & Search
- **Telescope** - Fuzzy finder for files, text, buffers
- **Trouble** - Diagnostic list viewer
- **Symbols Outline** - Code structure sidebar

---

## Quick Start

```bash
# Clone and install
git clone https://github.com/DevCoreXOfficial/nvchad-termux.git
cd nvchad-termux
bash nvchad.sh

# Open Neovim
nvim
```

**Leader Key:** `<Space>`

---

## Installation

### Prerequisites

1. **Termux** app installed on Android
2. **Internet connection** for package downloads
3. Updated Termux repositories

### Step-by-Step Installation

1. **Clone the repository:**
   ```bash
   git clone https://github.com/DevCoreXOfficial/nvchad-termux.git
   cd nvchad-termux
   ```

2. **Run the installation script:**
   ```bash
   bash nvchad.sh
   ```

3. **Launch Neovim:**
   ```bash
   nvim
   ```

   > **Note:** First launch will automatically install all plugins via lazy.nvim

### Updating

```bash
bash update.sh
```

---

## Configuration Overview

```
nvim/
├── init.lua           # Main entry point, lazy.nvim bootstrap
├── lua/
│   ├── chadrc.lua     # NvChad theme & base46 settings
│   ├── mappings.lua   # Custom keybindings
│   ├── options.lua    # Neovim options
│   ├── configs/
│   │   ├── cmp.lua          # Autocompletion config
│   │   ├── conform.lua      # Code formatter config
│   │   ├── lspconfig.lua    # Language server config
│   │   ├── snippets.lua     # Custom snippets (HTML/JSX)
│   │   ├── lazy.lua         # lazy.nvim settings
│   │   └── ui.lua           # UI plugin settings
│   └── plugins/
│       ├── ai/              # AI plugins (Copilot, CodeCompanion)
│       ├── completion/      # Completion plugins (nvim-cmp, LuaSnip)
│       ├── formatting/      # Formatting plugins (conform.nvim)
│       ├── lsp/             # LSP plugins (lspconfig, mason, treesitter)
│       └── ui/              # UI plugins (lualine, bufferline, etc.)
```

---

## Keybindings

### General

| Key | Mode | Description |
|-----|------|-------------|
| `;` | Normal | Enter command mode |
| `jk` | Insert | Exit insert mode |
| `<Space>` | Normal | Leader key |

### Window Navigation

| Key | Description |
|-----|-------------|
| `<S-h>` | Go to left split / Previous buffer |
| `<S-l>` | Go to right split / Next buffer |
| `<S-j>` | Go to bottom split |
| `<S-k>` | Go to top split |
| `<leader>sv` | Split vertically |
| `<leader>sh` | Split horizontally |
| `<leader>sq` | Close current split |
| `<leader>so` | Close other splits |

### Line Movement

| Key | Mode | Description |
|-----|------|-------------|
| `<A-j>` | Normal/Insert | Move line down |
| `<A-k>` | Normal/Insert | Move line up |
| `<A-j>` | Visual | Move selection down |
| `<A-k>` | Visual | Move selection up |

### Code Formatting

| Key | Description |
|-----|-------------|
| `<leader>fm` | Format file with Prettier/conform.nvim |
| `<leader>fs` | Format Bash script with shfmt |
| `<leader>fq` | Format SQL with pg_format |

### AI Assistants

| Key | Description |
|-----|-------------|
| `<leader>aa` | CodeCompanion: Open chat |
| `<leader>ai` | CodeCompanion: Transform/create inline code |
| `<leader>at` | CodeCompanion: Toggle chat (show/hide) |
| `<leader>am` | CodeCompanion: Actions menu |
| `<leader>as` | CodeCompanion: Change adapter/provider |

### GitHub Copilot (Insert Mode)

| Key | Description |
|-----|-------------|
| `Ctrl+l` | Accept suggestion |
| `Ctrl+j` | Next suggestion |
| `Ctrl+k` | Previous suggestion |
| `Ctrl+h` | Dismiss suggestion |

### Search & Navigation (Telescope)

| Key | Description |
|-----|-------------|
| `<leader>ff` | Find files |
| `<leader>fg` | Live grep (search text) |
| `<leader>fb` | Search buffers |
| `<leader>fh` | Search help tags |

### Diagnostics (LSP)

| Key | Description |
|-----|-------------|
| `[d` | Go to previous diagnostic |
| `]d` | Go to next diagnostic |
| `<leader>e` | Show diagnostic in floating window |
| `<leader>q` | Open diagnostic location list |

### Utilities

| Key | Description |
|-----|-------------|
| `<leader>y` | Yank entire file to clipboard |
| `<leader>sr` | Reload configuration |
| `<leader>ch` | Clear search highlight |
| `<leader>tw` | Toggle line wrap |
| `<leader>tn` | Toggle relative line numbers |

### Autocompletion (Insert Mode)

| Key | Description |
|-----|-------------|
| `Tab` | Next completion item / Expand snippet |
| `Shift+Tab` | Previous completion item |
| `Ctrl+Space` | Manual trigger completion |
| `Enter` | Confirm selection |
| `Ctrl+d` | Scroll docs up |
| `Ctrl+f` | Scroll docs down |
| `Down` | Next item |
| `Up` | Previous item |

---

## AI Assistants

### GitHub Copilot

Copilot provides real-time code suggestions as you type.

**Setup:**
```bash
# Authenticate with GitHub
copilot setup
```

**Usage:**
- Write code naturally and accept suggestions with `Ctrl+l`
- Cycle through suggestions with `Ctrl+j` / `Ctrl+k`
- Dismiss with `Ctrl+h`

### CodeCompanion

CodeCompanion is a multi-provider AI assistant that supports OpenAI, Mistral, Anthropic, and more.

**Setup:**

1. **Install the plugin** (already included in this configuration)

2. **Configure your API keys** based on the provider you want to use:

   ```bash
   # OpenAI
   export OPENAI_API_KEY="your-key-here"

   # Mistral AI
   export MISTRAL_API_KEY="your-key-here"

   # Anthropic (Claude)
   export ANTHROPIC_API_KEY="your-key-here"
   ```

3. **Default configuration:** The plugin is configured to use Mistral AI as the default adapter (recommended for Termux).

**Main commands:**

| Command | Description |
|---------|-------------|
| `:CodeCompanionChat` | Open AI chat |
| `:CodeCompanion` | Inline mode (transform code) |
| `:CodeCompanionChat -t` | Toggle chat (show/hide) |
| `:CodeCompanionActions` | Open actions menu |
| `:CodeCompanionChat -s` | Change adapter/provider |

**Usage with keybindings:**

- `<leader>aa` - Open chat (in normal mode or with selection in visual mode)
- `<leader>ai` - Transform selected code or create new inline code
- `<leader>at` - Show/hide chat
- `<leader>am` - Open actions menu (slash commands, agents, etc.)
- `<leader>as` - Change AI provider

**Usage examples:**

```vim
" Open chat directly
:CodeCompanionChat

" Transform selected code (visual mode)
" 1. Select code
" 2. Press <leader>ai
" 3. Type your prompt

" Create new inline code
" 1. Position cursor where you want the code
" 2. Press <leader>ai
" 3. Describe what code you need
```

**Supported providers:**

| Provider | Default Model | Environment Variable |
|-----------|-------------------|---------------------|
| Mistral AI | mistral-large-latest | MISTRAL_API_KEY |
| OpenAI | gpt-4o | OPENAI_API_KEY |
| Anthropic | claude-sonnet-4-20250514 | ANTHROPIC_API_KEY |

To change provider, use `<leader>as` or configure the default adapter in `lua/plugins/ai/init.lua`.

---

## Language Support

### Supported Languages

| Language | LSP | Formatter | Features |
|----------|-----|-----------|----------|
| JavaScript | ts_ls | Prettier | Autocompletion, diagnostics, inlay hints |
| TypeScript | ts_ls | Prettier | Autocompletion, diagnostics, inlay hints |
| HTML | html-lsp | Prettier | Auto-tags, completion |
| CSS | cssls | Prettier | Autocompletion, Tailwind support |
| Lua | lua-language-server | stylua | Autocompletion, diagnostics |
| Bash | bashls | shfmt | Shell formatting |
| SQL | - | pg_format | SQL formatting |
| JSON | - | Prettier | Formatting |
| Markdown | - | Prettier | Formatting |
| YAML | - | Prettier | Formatting |

### Treesitter Syntax Support

Treesitter provides enhanced syntax highlighting and code navigation for:

**Web Development:**
- HTML, CSS, SCSS
- JavaScript, TypeScript, TSX, JSX

**Backend & Scripting:**
- Bash, Shell

**Data & Documentation:**
- JSON, YAML, TOML
- Markdown, Markdown Inline

**Development Tools:**
- Lua, Vim, Vimdoc
- SQL, Dockerfile
- Gitignore, Regex, Query

**Keybindings:**

| Key | Description |
|-----|-------------|
| `<C-space>` | Incremental selection (expand) |
| `<bs>` | Decremental selection (shrink) |

### Inlay Hints (TypeScript/JavaScript)

The configuration enables rich inlay hints for better code understanding:

- Parameter name hints
- Variable type hints
- Function return type hints
- Property declaration types
- Enum member values

---

## Code Formatting

### Automatic Formatting

Formatting is triggered manually with `<leader>fm` or can be enabled on save.

**Enable format on save** (edit `lua/configs/conform.lua`):
```lua
format_on_save = {
  timeout_ms = 500,
  lsp_fallback = true,
}
```

### Available Formatters

| Formatter | File Types | Command |
|-----------|------------|---------|
| Prettier | JS, TS, CSS, HTML, JSON, MD, YAML | `<leader>fm` |
| stylua | Lua | Auto (conform.nvim) |
| shfmt | Bash/Shell | `<leader>fs` |
| pg_format | SQL | `<leader>fq` |

### Custom Formatters

Add custom formatters in `lua/configs/formatters/custom.lua`:

```lua
return {
  formatters = {
    my_formatter = {
      command = "my-formatter",
      args = { "--config", "$FILENAME" },
    },
  },
  formatters_by_ft = {
    python = { "black" },
  },
}
```

---

## UI Components

### Theme

**Current Theme:** Eldritch (dark purple/blue tones)

Change theme in `lua/chadrc.lua`:
```lua
M.base46 = {
  theme = "onedark",  -- Available: onedark, dracula, tokyonight, etc.
}
```

### Status Line (lualine)

Displays:
- Current mode
- Git branch & diff
- Diagnostics count
- Filename
- Encoding, format, filetype
- Location (line:column)

### Buffer Line

- Modified indicator: `●`
- Close icon: ``
- Diagnostics from LSP
- Color-coded icons

### Indent Guides

- Character: `│`
- Scope highlighting enabled

### Notifications

- Timeout: 3 seconds
- Position: Bottom-up

---

## Customization

### Add New Plugins

Edit `lua/plugins/` directories:

```lua
-- Example: Add a new plugin in lua/plugins/ui/init.lua
return {
  {
    "author/plugin-name",
    event = "VeryLazy",
    opts = {},
  },
  -- ...existing plugins
}
```

### Modify Keybindings

Edit `lua/mappings.lua`:

```lua
local map = vim.keymap.set

-- Add custom mapping
map("n", "<leader>xx", ":YourCommand<CR>", { desc = "Description" })
```

### Change Options

Edit `lua/options.lua`:

```lua
local o = vim.opt

o.tabstop = 4        -- Change tab width
o.shiftwidth = 4     -- Change indent width
o.wrap = true        -- Enable line wrapping
```

### Add Snippets

Edit `lua/configs/snippets.lua`:

```lua
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.add_snippets("javascript", {
  s("log", { t("console.log("), i(0), t(")") }),
})
```

### Configure LSP Servers

Edit `lua/configs/lspconfig.lua`:

```lua
vim.lsp.config("your_language_server", {
  on_attach = nvlsp.on_attach,
  capabilities = nvlsp.capabilities,
  settings = {
    -- Server-specific settings
  },
})
```

---

## Troubleshooting

### Plugins Not Loading

```bash
# Clear lazy.nvim cache and reinstall
nvim --headless "+Lazy! sync" +qa
```

### LSP Not Working

```vim
" Check LSP status
:LspInfo

" Restart LSP
:LspRestart
```

### Install Missing Language Servers

```vim
:Mason
```

Use `I` to install servers interactively.

### API Key Issues (CodeCompanion)

```bash
# Verify API keys are set
echo $MISTRAL_API_KEY
echo $OPENAI_API_KEY
echo $ANTHROPIC_API_KEY

# Re-export if needed
export MISTRAL_API_KEY="your-key"
```

### Performance Issues

Disable unused plugins in `lua/configs/lazy.lua`:

```lua
performance = {
  rtp = {
    disabled_plugins = {
      -- Add more plugins to disable
    },
  },
}
```

### Reset Configuration

```bash
# Remove nvim data and reinstall
rm -rf ~/.local/share/nvim
rm -rf ~/.local/state/nvim
nvim
```

---

## Plugin List

### Core
- [NvChad](https://github.com/NvChad/NvChad) - Base configuration
- [lazy.nvim](https://github.com/folke/lazy.nvim) - Plugin manager

### AI
- [copilot.vim](https://github.com/github/copilot.vim) - GitHub Copilot
- [codecompanion.nvim](https://github.com/olimorris/codecompanion.nvim) - Multi-provider AI chat assistant
- [plenary.nvim](https://github.com/nvim-lua/plenary.nvim) - Lua utility library (CodeCompanion dependency)

### Completion
- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) - Completion engine
- [LuaSnip](https://github.com/L3MON4D3/LuaSnip) - Snippet engine
- [friendly-snippets](https://github.com/rafamadriz/friendly-snippets) - Pre-made snippets

### LSP & Syntax
- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) - LSP configuration
- [mason.nvim](https://github.com/williamboman/mason.nvim) - LSP installer
- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) - Syntax highlighting, incremental selection, indent
- [nvim-ts-autotag](https://github.com/windwp/nvim-ts-autotag) - Auto-close HTML/JSX tags

### Formatting
- [conform.nvim](https://github.com/stevearc/conform.nvim) - Code formatter

### UI
- [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) - Status line
- [bufferline.nvim](https://github.com/akinsho/bufferline.nvim) - Buffer tabs
- [indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim) - Indent guides
- [nvim-notify](https://github.com/rcarriga/nvim-notify) - Notifications
- [which-key.nvim](https://github.com/folke/which-key.nvim) - Key helper
- [nvim-scrollbar](https://github.com/petertriho/nvim-scrollbar) - Scrollbar
- [nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons) - Icons

### Navigation & Diagnostics
- [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) - Fuzzy finder
- [trouble.nvim](https://github.com/folke/trouble.nvim) - Diagnostic list
- [symbols-outline.nvim](https://github.com/simrat39/symbols-outline.nvim) - Code outline

---

## License

This configuration is provided as-is for Termux users. NvChad is licensed under its own terms.
