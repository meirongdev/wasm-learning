# Rust WASM 入门指南

欢迎来到 Rust 世界！通过这个简单的 `add` 函数示例，你可以快速了解 Rust 开发 WASM（WebAssembly）的基础流程。

## 1. 项目结构

- `src/lib.rs`: 你的 Rust 源代码。
- `Cargo.toml`: Rust 的项目配置文件（类似 npm 的 `package.json`）。
- `build_wasm.sh`: 自动化构建脚本，负责安装依赖、配置环境并编译代码。
- `pkg/`: 编译后生成的 JavaScript 和 WebAssembly 产物（构建后生成）。

## 2. 核心代码解析 (`src/lib.rs`)

```rust
use wasm_bindgen::prelude::*; // 导入 WASM 绑定库，用于 Rust 和 JS 通信

// #[wasm_bindgen] 是一个属性宏，告诉编译器这个函数需要暴露给 JS
#[wasm_bindgen]
pub fn add(a: i32, b: i32) -> i32 {
    a + b // Rust 中，函数最后一行不加分号表示返回值
}
```

- `pub`: 表示该函数是公开的。
- `i32`: 32 位整数类型。
- `wasm_bindgen`: 是 Rust WASM 生态的核心，它自动生成 JS 胶水代码，让你能直接在 JS 中调用 Rust 函数。

## 3. 如何运行

在终端中，您现在可以使用 `Makefile` 来简化开发流程：

```bash
# 1. 确保安装了 WASM 编译目标 (通过 rustup)
rustup target add wasm32-unknown-unknown

# 2. 运行构建
make build

# 3. 运行测试
make test
```

`make build` 会自动：
1. 使用 `wasm-pack` 编译代码。
2. 生成 `pkg/` 目录，其中包含 JS 胶水代码。

## 4. 学习建议

1. **修改代码**: 尝试在 `src/lib.rs` 中添加一个 `subtract` 函数。
2. **重新构建**: 再次运行 `make build`。
3. **查看产物**: 观察 `pkg/wasm_learning.js`，你会发现 Rust 函数已经被包装成了普通的 JavaScript 函数。

