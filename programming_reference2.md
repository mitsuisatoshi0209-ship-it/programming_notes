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

# プログラミング環境を整える
## VS Code と実行環境の入れ方

講義ノート
2026年度

---

## 目次

1. まずは何を準備するか
2. VS Code の導入
3. Python / Julia / Fortran の入れ方
4. 最初のプログラムを動かす
5. まとめ

---

## 1. まずは何を準備するか

プログラミングを始めるときは、まず「コードを書く場所」と「コードを実行する場所」を用意します。

- エディタ: VS Code
- 実行環境: Python, Julia, Fortran など
- 参考情報の保存場所: GitHub

この順番で整えると、作業がかなり楽になります。

---

## 2. VS Code の導入

VS Code は、軽くて拡張機能が豊富なため、プログラミングの作業環境として非常に使いやすいです。

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

## 3. Python / Julia / Fortran の入れ方

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

確認:

```bash
python3 --version
```

### Julia

公式インストーラを使う方法が簡単です。

```bash
curl -fsSL https://install.julialang.org | sh
```

インストール後、確認します。

```bash
julia --version
```

もし `julia: command not found` と表示された場合は、次を試します。

```bash
export PATH="$HOME/.juliaup/bin:$PATH"
```

### Fortran

Ubuntu / Debian:

```bash
sudo apt update
sudo apt install gfortran
```

macOS:

```bash
brew install gcc
```

確認:

```bash
gfortran --version
```

---

## 4. 最初のプログラムを動かす

### Python の Hello World

```python
print("Hello, world!")
```

実行:

```bash
python3 hello.py
```

### Julia の Hello World

```julia
println("Hello, world!")
```

実行:

```bash
julia hello.jl
```

### Fortran の Hello World

```fortran
program main
  print *, 'Hello, world!'
end program main
```

保存して、以下のように実行します。

```bash
gfortran hello.f90 -o hello
./hello
```

---

## 5. まとめ

VS Code は、コードを書くための快適な作業環境です。

- まずは VS Code を入れる
- そのあと Python / Julia / Fortran を入れる
- それぞれの Hello World を動かして確認する

コマンドラインで入れられるものはコマンドで入れるのが基本ですが、VS Code の拡張機能を使うと、作業のしやすさがかなり上がります。
