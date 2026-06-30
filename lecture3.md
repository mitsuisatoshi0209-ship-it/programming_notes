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

# Git と AI を使う
## GitHub, Continue, OpenAI / Gemini API の基礎

講義ノート
2026年度

---

## 目次

1. Git とは何か
2. GitHub にアップロードするまで
3. Git の初期設定
4. 新しいプロジェクトを作ってアップロードする手順
5. Continue とは何か
6. OpenAI / Gemini API とは何か
7. AI と API の違い
8. まとめ

---

## 1. Git とは何か

Git は、ファイルの変更履歴を管理するための仕組みです。

- どんな変更をしたかを記録できる
- 間違えたときに戻せる
- 複数人で作業しやすい
- GitHub と組み合わせると公開・共有しやすい

---

## 2. GitHub にアップロードするまで

GitHub では、ローカルの作業フォルダをリモート上のリポジトリに対応させて保存します。

基本の流れは次の通りです。

1. ローカルでファイルを作る
2. Git で変更を保存する
3. GitHub 上にリポジトリを作る
4. ローカルの内容を GitHub に送る

---

## 3. Git の初期設定

新しいパソコンでは、まず次のような設定を行います。

```bash
git config --global user.email "your_email@example.com"
git config --global user.name "your_name"
```

SSH 鍵を作る場合:

```bash
ssh-keygen -t ed25519 -C "your_email@example.com"
```

公開鍵を表示します。

```bash
cat ~/.ssh/id_ed25519.pub
```

その内容を GitHub の SSH 鍵設定画面に登録します。

---

## 4. 新しいプロジェクトを作ってアップロードする手順

### 1. プロジェクトフォルダを作る

```bash
mkdir ~/works/new_project
cd ~/works/new_project
```

### 2. Git を初期化する

```bash
git init
git add .
git commit -m "first commit"
git branch -M main
```

### 3. GitHub 上にリポジトリを作る

GitHub の画面で New repository を選び、名前を決めます。

### 4. ローカルを GitHub に接続する

```bash
git remote add origin git@github.com:YOUR_USER/YOUR_REPOSITORY.git
git push -u origin main
```

### 5. 以後の更新手順

```bash
git add .
git commit -m "update"
git push
```

---

## 5. Continue とは何か

Continue は、VS Code 上で AI 補助を受けやすくする拡張機能です。

- コードの説明を聞ける
- 既存コードを理解しやすくする
- 反復的なコード生成を支援する
- 文章やメモの生成にも使いやすい

特に、少しだけコードを書き換えたいときや、調査を進めたいときに便利です。

---

## 6. OpenAI / Gemini API とは何か

API とは、ソフトウェア同士が通信するための窓口です。

OpenAI や Gemini の API を使うと、プログラムから AI に問い合わせて、回答を受け取ることができます。

### 例

- 質問応答
- 要約
- 翻訳
- コード生成
- 文章の整形

### 使い方のイメージ

```python
import requests

url = "https://api.openai.com/v1/chat/completions"
headers = {
    "Authorization": "Bearer YOUR_API_KEY"
}
```

これは、プログラムから AI に「こういう内容を返して」と依頼するための基本的な考え方です。

---

## 7. AI と API の違い

よく混同されますが、違いは大きいです。

### 通常の AI 利用

- 画面上でチャットを使う
- ユーザーが直接入力する
- すぐに試しやすい
- 使い方が直感的

### API 利用

- プログラムから自動で呼び出す
- 自動化に向いている
- 他のツールと組み合わせやすい
- 例えば、Webサービス、スクリプト、開発支援ツールに組み込める

つまり、普通の AI は「対話」向き、API は「自動化」向きです。

---

## 8. まとめ

Git, GitHub, Continue, OpenAI / Gemini API を理解しておくと、開発作業はかなり効率的になります。

- Git は変更履歴を管理する仕組み
- GitHub はその内容を共有・公開する場所
- Continue は VS Code 上の AI 支援拡張
- API はプログラムから AI を呼び出す仕組み

学習の初期段階では、まずは Git と VS Code を使えるようにするのが非常に重要です。
