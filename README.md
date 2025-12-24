# CV

## Prerequisites

### Install Typst

**macOS:**
```bash
brew install typst
```

**Linux:**
```bash
curl -fsSL https://typst.community/typst-install/install.sh | sh
```

**Windows:**
```bash
winget install --id Typst.Typst
```

Or download from [typst.app](https://github.com/typst/typst/releases)

### Install Bun (for web server)

```bash
curl -fsSL https://bun.sh/install | bash
```

## Usage

### Build PDF

```bash
typst compile main.typ
```

### Build with different CV data (for role-specific versions)

```bash
# Create role-specific YAML
cp cv.yaml cv-ml-engineer.yaml

# Build with specific YAML
typst compile main.typ --input cv=cv-ml-engineer.yaml main-ml-engineer.pdf
```

### Watch mode (auto-rebuild on changes)

```bash
typst watch main.typ

# With specific YAML
typst watch main.typ --input cv=cv-fintech.yaml
```

### Serve PDF locally (with hot reload)

```bash
bun serve.ts
```

This starts a web server on port 41592 and runs `typst watch` automatically.

Access at: `http://localhost:41592`

## Files

- `main.typ` - Typst template
- `cv.yaml` - CV data
- `serve.ts` - Bun web server
- `main.pdf` - Generated PDF
