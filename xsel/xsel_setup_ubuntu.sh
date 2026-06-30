# 1. パッケージのインストール
sudo apt update && sudo apt install -y xsel

# 2. エイリアス関数と設定を .bashrc に追記
cat << 'EOF' >> ~/.bashrc

# --- xsel Clipboard Settings ---
_ccc_copy() {
    # 引数があればそのファイル、なければ標準入力を受け取ってクリップボードへ
    if [ $# -eq 0 ]; then
        xsel -bi
    else
        cat "$@" | xsel -bi
    fi
}
alias ccc='_ccc_copy'
alias vvv='xsel -bo'
EOF

# 3. 設定の反映
source ~/.bashrc
