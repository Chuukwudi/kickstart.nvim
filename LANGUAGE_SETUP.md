# Language Setup for Neovim - Elixir, Python, Rust

## What has been configured

Your Neovim configuration has been updated to support Elixir, Python, and Rust development with:

### Language Servers (LSP)
- **Python**: `pyright` - Type checking and code intelligence
- **Rust**: `rust_analyzer` - Rust language server with clippy integration
- **Elixir**: `elixirls` - Elixir language server

### Formatters (Auto-format on save enabled)
- **Python**: `black` (code formatter) + `isort` (import sorter)
- **Rust**: `rustfmt` (standard Rust formatter)
- **Elixir**: `mix format` (standard Elixir formatter)

### Linters
- **Python**: `ruff` - Fast Python linter
- **Rust**: `clippy` (integrated via rust_analyzer)
- **Elixir**: Credo can be added manually

### Code Style Settings
- **Python**: 4 spaces (PEP 8 compliant)
- **Rust**: 4 spaces
- **Elixir**: 2 spaces

## Installation Steps

### 1. Open Neovim and install LSP servers
```bash
nvim
```

Once in Neovim, Mason will automatically install the configured language servers and tools. You can check the status with:
```
:Mason
```

### 2. Install language toolchains (if not already installed)

#### Python
```bash
# Most systems have Python, but ensure you have pip
python3 --version
pip3 --version
```

#### Rust
```bash
# Install Rust via rustup
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# After installation, ensure cargo is in your PATH
source ~/.cargo/env

# Verify installation
rustc --version
cargo --version
```

#### Elixir
```bash
# On Ubuntu/Debian
sudo apt-get install elixir

# On Fedora/RHEL
sudo dnf install elixir

# On Arch
sudo pacman -S elixir

# On macOS
brew install elixir

# Verify installation
elixir --version
```

### 3. Additional Elixir setup (optional but recommended)

For the Elixir Language Server to work properly:
```bash
# Install hex package manager
mix local.hex --force

# Install the language server (if not auto-installed by Mason)
mix archive.install hex elixir_ls --force
```

For Elixir linting with Credo (optional):
```bash
# In your Elixir projects, add to mix.exs dependencies:
# {:credo, "~> 1.7", only: [:dev, :test], runtime: false}

# Then run:
mix deps.get
```

## Usage

### Opening files
When you open a `.py`, `.rs`, `.ex`, `.exs`, or `.heex` file, the language server will automatically attach and provide:
- Autocompletion
- Go to definition (`gd`)
- Hover documentation (`K`)
- Code actions (`<leader>ca`)
- Rename symbol (`<leader>rn`)
- Find references (`grr` or `<leader>rr`)

### Formatting
- **Manual**: Press `<leader>f` in normal or visual mode
- **Automatic**: Enabled on save for Python, Rust, and Elixir files

### Diagnostics
- Navigate errors: `]d` (next) and `[d` (previous)
- Show diagnostic details: `<leader>e`
- See all diagnostics: `<leader>q`

## Troubleshooting

### Language server not starting
1. Check Mason installation: `:Mason`
2. Check LSP status: `:LspInfo`
3. Check health: `:checkhealth`

### Formatter not working
1. Ensure the formatter is installed: `:Mason`
2. Check conform status: `:ConformInfo`

### Elixir Language Server issues
If elixirls doesn't work:
```bash
# Manually install via Mason
:MasonInstall elixir-ls

# Or set up from source
git clone https://github.com/elixir-lsp/elixir-ls.git
cd elixir-ls
mix deps.get
MIX_ENV=prod mix compile
MIX_ENV=prod mix elixir_ls.release2 -o release
```

## Testing Your Setup

### Python
Create a test file: `test.py`
```python
def hello(name: str) -> str:
    return f"Hello, {name}!"

if __name__ == "__main__":
    print(hello("World"))
```

### Rust
Create a test file: `test.rs`
```rust
fn main() {
    let name = "World";
    println!("Hello, {}!", name);
}
```

### Elixir
Create a test file: `test.ex`
```elixir
defmodule Hello do
  def greet(name) do
    "Hello, #{name}!"
  end
end

IO.puts(Hello.greet("World"))
```

Open each file in Neovim and verify:
- Syntax highlighting works
- LSP attaches (check `:LspInfo`)
- Autocompletion appears when typing
- Formatting works (`<leader>f`)

## Enjoy coding! 🚀
