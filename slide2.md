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

# B4ゼミ 第1回：プログラミング実践
## 環境構築からFortran反復演算の基礎まで

ゼミ用資料
2026年度

---

## 目次

1. 【第1部】環境構築：科学計算の準備
   - Fortran, Python, Juliaの導入
   - エディタの準備
2. 【第2部】Fortranプログラムの基本
   - プログラムの作成からコンパイル・実行まで
3. 【第3部】実践：反復演算編（doループ）
   - コードの構造と変数宣言
   - 繰り返し処理と標準出力
4. 【第4部】演習問題

---

# 【第1部】環境構築：科学計算の準備

---

## Fortran環境の構築

Fortranのソースコードを機械語に変換する「コンパイラ」を導入します。一般的には `gfortran` を使用します。

* **Windows**: WSL2やMSYS2など、Linux系環境を使う方法が一般的です。
* **Mac**: Homebrewで `brew install gcc` を実行する方法があります。
* **Linux (Ubuntu)**: `sudo apt update && sudo apt install gfortran`

---

## Python環境の構築

データ解析やグラフ作成に使用するPython環境を構築します。研究室ではバージョン管理やパッケージ管理が容易な環境を推奨します。

* 一般的には **Anaconda** または軽量な **Miniconda** をインストールし、仮想環境を構築します。
* または、公式のPythonインストーラーから導入し、`venv` モジュールを使用してプロジェクトごとに独立した環境（pip）を作成します。
* 科学計算に必須のパッケージ（`numpy`, `scipy`, `matplotlib`）をインストールしておきましょう。

---

## Julia環境の構築

Juliaの導入方法は環境によって異なりますが、公式のインストーラや `juliaup` のような管理ツールを使う方法が一般的です。

* **Windows**: パッケージ管理ツールや公式インストーラを使う方法があります。
* **Mac / Linux**: 公式のインストール手順に従って導入します。
* バージョン管理を容易にし、必要に応じて安定版や最新版を切り替えられるのが利点です。

---

## エディタの準備

プログラムのコードを書くためのテキストエディタを準備します。

* [cite_start]テキスト文書を作成、編集するアプリケーションを使用して、文法に従うプログラムを書き、テキストファイルとして保存します [cite: 20, 28, 37]。
* [cite_start]**Terminalベース**: Vim, Emacsなど。軽量でサーバー作業に必須です [cite: 20, 28, 37]。
* **GUIベース**: Visual Studio Code (VSCode)。拡張機能が豊富で、現在のコーディングの主流です。

---

# 【第2部】Fortranプログラムの基本

---

## プログラムの作成から実行までの手順

Fortranのプログラムを動かすには、一般的に次の3つのステップが必要です。

1. **プログラムの作成**
   エディタを使って `main.f90` のようなファイルにコードを書き保存します。
2. **コンパイル**
   `gfortran main.f90 -o main` のようにして実行ファイルを作成します。
3. **実行**
   `./main` で生成した実行ファイルを起動します。

---

# 【第3部】実践：反復演算編（doループ）

[cite_start]では、早速作業していきましょう [cite: 42, 44]！

---

## 作業手順（ディレクトリとファイル作成）

[cite_start]Terminalを開いて、以下の指示に従って準備を進めてください [cite: 46, 66]。

1. [cite_start]ホームディレクトリに新しいディレクトリを作成（例: `programming`, `B4_seminar_fortran`） [cite: 47, 48, 49, 50, 67, 68, 69, 70]。
2. [cite_start]作成したディレクトリに移動 [cite: 51, 71]。
3. [cite_start]テキストファイル（例: `main.f90`）をエディタで開く [cite: 52, 72]。

---

## プログラムの入力

[cite_start]以下の合計を計算するプログラム（1から100までの和）を実際に書いてみましょう [cite: 64, 82, 85]。

```fortran
program main
implicit none
integer :: i, wa
wa = 0
do i = 1, 100
    wa = wa + i
end do
write (unit = *, fmt = *) "wa = ", wa
end program main
