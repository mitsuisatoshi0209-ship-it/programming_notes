# 管理者権限（sudo）なしでkdiff3をホームディレクトリにインストールする手順

Red Hat系Linux（Rocky Linux、AlmaLinux、RHEL、CentOSなど）のワークステーションにおいて、一般ユーザー権限だけで `kdiff3` 本体と、動作に必要なすべての依存ライブラリ（KDE/Qt関連）をローカルに導入し、利用可能にするための手順です。

## 前提条件・環境
- **OS:** Red Hat系 Linux (passerina ワークステーション)
- **インストール先:** - 実行バイナリ: `~/bin`
  - 共有ライブラリ: `~/lib`

---

## インストール・設定コマンド一括

以下のコマンドをすべて選択して、ターミナルにそのまま貼り付けて実行してください。

```bash
# ==========================================
# 1. 実行ファイル（kdiff3）の抽出
# ==========================================
mkdir -p ~/kdiff3_tmp
cd ~/kdiff3_tmp

# リポジトリからパッケージをダウンロードして解凍
dnf download kdiff3 || yum download kdiff3
rpm2cpio kdiff3-*.rpm | cpio -idmv

# 実行ファイルを ~/bin に配置
mkdir -p ~/bin
cp usr/bin/kdiff3 ~/bin/

# 一時フォルダの片付け
cd ~
rm -rf ~/kdiff3_tmp

# ==========================================
# 2. 依存ライブラリの一括抽出と配置
# ==========================================
mkdir -p ~/kdiff3_all_libs
cd ~/kdiff3_all_libs

# 依存関係のあるすべてのRPMをまとめてダウンロードして一括解凍
dnf download --resolve kdiff3 || yum download --resolve kdiff3
for rpm in *.rpm; do rpm2cpio "$rpm" | cpio -idmv; done

# 解凍されたライブラリファイルを ~/lib にコピー
mkdir -p ~/lib
cp -r usr/lib64/* ~/lib/ 2>/dev/null

# 一時フォルダの片付け
cd ~
rm -rf ~/kdiff3_all_libs

# ==========================================
# 3. 環境変数の設定（恒久化）と反映
# ==========================================
# パスを ~/.bashrc の末尾に追記
echo 'export PATH="$HOME/bin:$PATH"' >> ~/.bashrc
echo 'export LD_LIBRARY_PATH="$HOME/lib:$LD_LIBRARY_PATH"' >> ~/.bashrc

# 現在のターミナルセッションに設定を即時反映
source ~/.bashrc
