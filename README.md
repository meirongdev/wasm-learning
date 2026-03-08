# WASM Learning (Rust)

这是一个基于 Rust 的 WebAssembly (WASM) 入门项目。项目展示了如何编写 Rust 函数并通过 `wasm-pack` 将其编译为可在浏览器中使用的 WebAssembly 模块。

## 📋 项目内容

- **Rust 源代码**: 在 `src/lib.rs` 中定义了一个简单的 `add` 函数及单元测试。
- **自动构建**: 使用 `wasm-pack` 生成 JavaScript 胶水代码和 `.wasm` 二进制文件。
- **本地开发**: 提供了 `Makefile` 简化常用命令。
- **持续集成**: 配置了 GitHub Actions (`.github/workflows/ci.yml`) 自动运行构建和测试。

## 🚀 快速开始

### 1. 前置条件

确保您的开发环境已安装以下工具：

- [rustup](https://rustup.rs/) (用于管理 Rust 工具链)
- [wasm-pack](https://rustwasm.github.io/wasm-pack/installer/) (用于编译和打包 WASM)

安装 Rust 后，请确保已添加 WASM 编译目标：

```bash
rustup target add wasm32-unknown-unknown
```

### 2. 本地构建

使用项目自带的 `Makefile` 进行构建：

```bash
make build
```

构建完成后，编译产物将存放在 `pkg/` 目录下。

### 3. 运行测试

```bash
make test
```

## 🛠️ 常用开发命令

| 命令 | 说明 |
| :--- | :--- |
| `make build` | 编译 WASM 模块 (`--target web`) |
| `make test` | 运行 Rust 单元测试 |
| `make fmt` | 自动格式化代码 |
| `make lint` | 运行 Clippy 进行代码检查 |
| `make clean` | 清理 `target/` 和 `pkg/` 目录 |
| `make help` | 查看所有支持的命令 |

## 📂 项目结构

```text
.
├── src/
│   └── lib.rs          # Rust 源代码及测试
├── .github/
│   └── workflows/      # CI/CD 配置
├── Makefile            # 本地开发辅助脚本
├── Cargo.toml          # Rust 项目配置
└── pkg/                # 编译产物目录 (构建后生成)
```

## 💡 使用示例 (JavaScript)

构建完成后，你可以按如下方式在网页中使用：

```html
<script type="module">
  import init, { add } from './pkg/wasm_learning.js';

  async function run() {
    await init();
    console.log("2 + 3 =", add(2, 3));
  }

  run();
</script>
```

## 📚 学习资源

[Ultimate WebAssembly for High-Performance Apps](https://amzn.eu/d/0beETq4o)
