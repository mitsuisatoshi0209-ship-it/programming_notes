---
marp: true
theme: default
paginate: true
style: |
  th { background-color: #003366; color: white; }
  td { text-align: center; }
  h1 { font-size: 1.8em; }
  h2 { font-size: 1.4em; border-bottom: 2px solid #003366; }
---

# 科学技術計算のための実践環境構築
## Linux / macOS を前提にした入門

講義ノート
2026年度

---

## 目次

1. まず前提として知っておくこと
2. 基本ツールの導入
3. Fortran, Python, Julia の導入
4. VS Code の導入と設定
5. Continue と OpenAI API を使う
6. どんな場面でエージェント支援を使うべきか

---

## 1. まず前提として知っておくこと

このノートでは、主に Linux と macOS を前提に説明します。

- Windows から作業する場合は、WSL2 を使う方法が現実的です
- できるだけコマンドラインで操作できる環境を整える
- そのうえで、VS Code などのエディタを使う

---

## 2. 基本ツールの導入

### Git

Ubuntu / Debian:

```bash
sudo apt update
sudo apt install git
```

macOS:

```bash
brew install git
```

### gfortran

Ubuntu / Debian:

```bash
sudo apt update
sudo apt install gfortran
```

macOS:

```bash
brew install gcc
```

確認コマンド:

```bash
gfortran --version
```

---

## 3. Fortran, Python, Julia の導入

### Python

Ubuntu / Debian:

```bash
sudo apt update
sudo apt install python3 python3-pip python3-venv
```

macOS:

```bash
brew install python
```

科学計算でよく使うパッケージ:

```bash
python3 -m pip install --user numpy scipy matplotlib
```

### Julia

公式インストーラを使う方法が簡単です。

```bash
curl -fsSL https://install.julialang.org | sh
```

インストール後、ターミナルで `julia` が使えるか確認します。

```bash
julia --version
```

もし `julia: command not found` と表示された場合は、次を試します。

```bash
export PATH="$HOME/.juliaup/bin:$PATH"
```

その後、再度確認します。

```bash
julia --version
```

---

## 4. VS Code の導入と設定

### インストール

Ubuntu / Debian:

```bash
sudo apt update
sudo apt install wget gpg
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
echo "deb [arch=amd64 signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" | sudo tee /etc/apt/sources.list.d/vscode.list > /dev/null
sudo apt update
sudo apt install code
```

macOS:

```bash
brew install --cask visual-studio-code
```

### おすすめ拡張機能

- Python
- Julia
- Git
- Remote - SSH
- Continue

---

## 5. Continue と OpenAI API を使う

VS Code では、Continue などの拡張機能を使うことで、エージェント的な支援を受けやすくなります。

### 基本的な流れ

1. OpenAI の API キーを取得する
2. VS Code に Continue を入れる
3. API キーとモデルを設定する
4. エディタ上でチャットや補完を使う

### 使うとよい場面

- 既存コードの意味をざっと理解したい
- 反復的なボイラープレートコードを生成したい
- 例外エラーの原因を絞り込む
- 似た機能の実装例を比較したい

### 使いすぎない方がよい場面

- 重要なアルゴリズムの正しさを一括で委ねる
- 機密情報を含むコードを外部サービスに渡す
- 最終的なレビューを省略する

---

## 6. どんな場面でエージェント支援を使うべきか

エージェント支援は、次のような場面で特に役立ちます。

- 学習中で、書き方の例が欲しい
- 手順が多い作業を素早く進めたい
- 何を実装すべきか迷っている
- 既存コードを別言語に置き換えたい

一方で、最終判断は人間が行うのが望ましいです。

---

## まとめ

このノートでは、Linux / macOS を前提に、科学技術計算に必要な基本ツールの導入と、VS Code でのエージェント支援の使い方を整理しました。

- コマンドで入れられるものは、まずコマンドで導入する
- 使う言語は目的に応じて選ぶ
- AI支援は便利だが、最終判断は人間が行う

学習の過程では、実際に手を動かしながら理解を深めることが大切です。
