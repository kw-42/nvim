# Neovim Configuration

Configuração modular de Neovim otimizada para desenvolvimento multi-linguagem com **LSP completo**, **tree-sitter** e **git integration**.

## 📋 Requisitos

- **Neovim**: 0.12.0+
- **Compilador C**: Para tree-sitter e plugins nativos
- **Node.js**: Para TypeScript/JavaScript support
- **Git**: Obrigatório

**Ferramentas Recomendadas** (instale para melhor experiência):

#### Nerd Font (para renderizar ícones corretamente)

**Windows - Instalação Manual**:

1. Acesse: https://www.nerdfonts.com/font-downloads
2. Escolha uma font:
   - **FiraCode Nerd Font** (recomendada - ligaduras)
   - **JetBrains Mono Nerd Font** (profissional)
3. Baixe o arquivo `.zip`
4. Extraia os arquivos `.ttf`
5. Selecione todos os arquivos → Clique direito → "Instalar"
6. Configure no Neovim:
   - ✅ Já configurado em `lua/config/options.lua`: `guifont = "FiraCode Nerd Font:h12"`
   - Pode mudar de font/tamanho modificando essa linha
7. Reinicie Neovim

**Verificar instalação**:
- Abra Neovim: `nvim`
- Ícones em Neo-tree, Oil, e Lualine devem aparecer corretamente (sem ◇ ou ?)

#### Tree-sitter CLI (necessário para compilar parsers)

Instale via npm (requer Node.js):
```bash
npm install -g tree-sitter-cli
```

Ou via Scoop (Windows):
```bash
scoop install tree-sitter
```

Verificar instalação:
```bash
tree-sitter --version
```

#### Ripgrep (necessário para live_grep rápido no Telescope)

**Windows (Scoop)**:
```bash
scoop install ripgrep
```

**Windows (Chocolatey)**:
```bash
choco install ripgrep
```

**Windows (via Rust)**:
```bash
cargo install ripgrep
```

**macOS**:
```bash
brew install ripgrep
```

**Linux**:
```bash
# Ubuntu/Debian
sudo apt install ripgrep
```

Verificar instalação:
```bash
rg --version
```

## 🚀 Instalação

### 1. Atualize Neovim para 0.12.0+

**Windows (Scoop)**:
```bash
scoop install neovim
# ou atualizar versão existente:
scoop update neovim
```

**Windows (Chocolatey)**:
```bash
choco install neovim
# ou atualizar:
choco upgrade neovim
```

**Windows (Manual via GitHub)**:
1. Acesse https://github.com/neovim/neovim/releases
2. Baixe `nvim.exe` (ou `nvim-win64.zip`) da versão 0.12.0+
3. Coloque em `C:\Program Files\Neovim\bin\` ou adicione ao `%PATH%`
4. Verifique: `nvim --version`

**macOS**:
```bash
brew install neovim
```

**Linux**:
```bash
# Ubuntu/Debian
sudo apt install neovim
```

### 2. Configure a Configuração

```bash
# Clone a configuração
git clone https://github.com/seu-usuario/seu-repo ~/.config/nvim

# Inicie Neovim
nvim
```

Na primeira execução:
- Lazy.nvim será instalado automaticamente
- Plugins serão fetched
- LSP servers serão instalados via Mason

## 📁 Estrutura

```
nvim/
├── init.lua              # Entry point
├── lua/config/           # Opções e keymaps globais
└── lua/plugins/          # Especificações de plugins
    ├── editor.lua        # Oil.nvim, Neo-tree, UI
    ├── treesitter.lua    # Syntax highlighting
    ├── lsp.lua           # LSP + Completion
    ├── git.lua           # Git integration
    └── telescope.lua     # Fuzzy finder
```

## ⌨️ Keybinds Principais

### Navegação
```vim
<C-h/j/k/l>      # Navegar entre janelas
<C-w>s / <C-w>v  # Split horizontal/vertical
```

### File Explorers
```vim
-                # Oil: abrir diretório pai
<leader>-        # Oil: abrir float
\                # Neo-tree: reveal file
<leader>e        # Neo-tree: toggle sidebar
```

### Search
```vim
<leader>sf   # Find files
<leader>sg   # Live grep
<leader>/    # Fuzzy search buffer
<leader>s.   # Old files
```

### Git
```vim
]h / [h          # Próximo/anterior hunk (gitsigns)
<leader>gp       # Preview hunk
<leader>ga       # Stage hunk
<leader>gb       # Blame line
<leader>gs       # Git status (fugitive)
```

### Terminal
```vim
tt               # Toggle terminal horizontal abaixo
<Esc>            # Voltar ao normal (no terminal) - conteúdo preservado
<C-h/j/k/l>      # Navegar entre janelas (no terminal)
```

## 🔧 Configuração Rápida

### LSP Servers
Auto-instalados via Mason:
- `lua-language-server` (Lua)
- `typescript-language-server` (JS/TS)
- `pyright` (Python)
- `rust-analyzer` (Rust)
- `clangd` (C/C++)
- `kotlin-language-server` (Kotlin)
- `jdtls` (Java)

### Treesitter Parsers
16 parsers: Lua, Python, JS/TS, Rust, C, C++, Java, Kotlin, HTML, CSS, JSON, YAML, Bash, Markdown, Toml, e mais.

Atualizar: `:TSUpdate`

## 🐛 Troubleshooting

### Verificar Status Geral

```vim
:checkhealth     # Diagnóstico completo (mostra warnings/errors)
:checkhealth treesitter  # Status específico do Treesitter
```

### LSP não funciona

```vim
:LspInfo         # Status do LSP
:Mason           # Status dos LSP servers
```

**Solução**: Verifique se o compilador C está instalado (gcc, clang, ou MSVC).

### Parser não encontrado

Treesitter instalará parsers automaticamente na primeira execução. Se falhar:

```vim
:TSInstall <language>   # Instalar parser específico
:TSUpdate               # Atualizar todos
:TSUpdateSync           # Instalar todos de forma síncrona
```

**Requer**: `tree-sitter-cli` instalado (veja "Ferramentas Recomendadas").

Se receber erro `tree-sitter not found`:
1. Confirme Node.js está instalado: `node --version`
2. Instale tree-sitter-cli: `npm install -g tree-sitter-cli`
3. Reinicie Neovim: `:e` ou `:checkhealth treesitter`

**Erro típico no checkhealth treesitter**:
```
ERROR treesitter: tree-sitter executable not found
ERROR treesitter: C compiler not found
```

**Solução**:
- Instale Node.js + npm (para tree-sitter-cli)
- Instale compilador C (MSVC para Windows, gcc/clang para Linux/Mac)
- Após instalar, rode `:TSInstall` para compilar parsers

### Plugins não carregam

```vim
:Lazy            # Abrir gerenciador de plugins
:Lazy sync       # Sincronizar todos
:Lazy clean      # Remover antigos
:Lazy restore    # Restaurar para snapshot anterior
```

### Live grep lento no Telescope

**Solução**: Instale ripgrep (veja "Ferramentas Recomendadas").

Verificar: `rg --version`

Se instalado e ainda lento, verifique `.gitignore` no projeto (arquivos muito grandes podem ser ignorados).

### Warnings sobre luarocks

Treesitter pode gerar warnings sobre luarocks (opcional). Para desabilitar:

Edit `lua/config/lazy.lua` e adicione:
```lua
defaults = {
  cond = function(plugin)
    return plugin.name ~= "telescope-fzf-native.nvim" or vim.fn.executable("clang") == 1
  end,
},
build = {
  -- Desabilitar rock downloading
  rebuild = false,
}
```

Ou simplesmente ignore os warnings - não afetam funcionalidade.

## ✅ Verificação Pós-Instalação

Após instalar/atualizar, verifique tudo com:

```bash
# 1. Verificar Neovim
nvim --version      # Deve mostrar 0.12.0+

# 2. Verificar ferramentas
node --version      # Node.js (para tree-sitter-cli)
npm --version       # NPM
rg --version        # Ripgrep (opcional, mas recomendado)
tree-sitter --version  # Tree-sitter CLI

# 3. Abrir Neovim e verificar
nvim
```

Dentro de Neovim:

```vim
# 1. Diagnóstico geral
:checkhealth

# 2. Status do Treesitter (deve mostrar 16 parsers instalados)
:checkhealth treesitter
:TSStatus

# 3. Status do LSP
:LspInfo    # Deve mostrar 7 servidores

# 4. Sincronizar plugins
:Lazy sync

# 5. Se algum parser falhar, instale manualmente
:TSInstall python javascript typescript  # exemplo

# 6. Reload config
:e
```

**Sucesso**: Quando `:checkhealth` não mostrar erros críticos (warnings sobre luarocks são OK).

## 📚 Links Importantes

- [Lazy.nvim](https://github.com/folke/lazy.nvim)
- [Neovim LSP](https://neovim.io/doc/user/lsp.html)
- [Tree-sitter](https://tree-sitter.github.io/)
- [Telescope](https://github.com/nvim-telescope/telescope.nvim)

## 🎨 Tema

**Rose Pine (moon)** - Dark theme com paleta rosa suave

---

**Atualizado**: 2026-04-08  
**Versão Neovim**: 0.12.0+
