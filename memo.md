---
marp: true
theme: default
paginate: true
style: |
  th { background-color: #003366; color: white; }
  td { text-align: center; }
---

# Coding Reference Memo
## Useful tools, commands, and workflows for daily coding

このメモは、プログラミング学習のノートではなく、実際のコーディング作業を便利に進めるための備忘録です。

---

## Purpose

- 日常的に使う開発ツールのインストール方法や設定を記録する
- 慣れない環境で迷わないように、手順を短くまとめる
- プロジェクト作成やGitHub公開の流れを再確認する
- xsel のようなターミナルで便利なツールをメモする

---

## Useful tools

### xsel

Linux でクリップボードを扱うときに便利なコマンドです。

```bash
# クリップボードにコピー
echo "hello" | xsel --clipboard

# クリップボードからペースト
xsel --clipboard --output
```

### VS Code

- `code` コマンドでファイルやフォルダをすばやく開ける
- 拡張機能で機能を追加できる
- プロジェクト設定と連携させると便利

### Git

- 変更履歴を管理する
- GitHub に公開する
- 新しい PC では最初に `git config --global` でユーザー情報を設定する

---

## Quick setup notes

### Git 初期設定

```bash
git config --global user.name "YOUR_NAME"
git config --global user.email "your_email@example.com"
```

### SSH 鍵登録

```bash
ssh-keygen -t ed25519 -C "your_email@example.com"
cat ~/.ssh/id_ed25519.pub
```

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

### Julia

```bash
curl -fsSL https://install.julialang.org | sh
```

必要ならパスを追加:

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

---

## GitHub / project workflow

### 新しいプロジェクトの立ち上げ

```bash
mkdir ~/works/new_project
cd ~/works/new_project
git init
git add .
git commit -m "first commit"
git branch -M main
```

GitHub にリポジトリを作成したあと:

```bash
git remote add origin git@github.com:YOUR_USER/YOUR_REPO.git
git push -u origin main
```

### 日常の更新

```bash
git add .
git commit -m "update"
git push
```

---

## Notes

- このメモは、自分用の備忘録として見る
- 誰かに説明するためではなく、自分が迷ったときの救いになるように書く
- 重要なのは「後で見返したときにすぐ分かること」

---

## Links

- Git 学習に良い資料: https://github.com/kaityo256/github/tree/main
- VS Code Continue 拡張の使い方は、実際に触りながら覚える
