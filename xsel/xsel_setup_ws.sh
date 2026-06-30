# 1. 一時ディレクトリで作業
cd /tmp

# 2. RPMファイルのダウンロード（dnf/yumどちらか動く方で）
dnf download xsel || yumdownloader xsel

# 3. RPMを解凍して展開
rpm2cpio xsel-*.rpm | cpio -idmv

# 4. 自分の個人バイナリ用フォルダ（~/bin）を作成して移動
mkdir -p ~/bin
cp usr/bin/xsel ~/bin/

# 5. 後片付けをしてホームに戻る
cd ~

# 6. エイリアス関数と設定を .bashrc に追記
cat << 'EOF' >> ~/.bashrc

# --- xsel Clipboard Settings (Local) ---
_ccc_copy() {
    if [ $# -eq 0 ]; then
        ~/bin/xsel -bi
    else
        cat "$@" | ~/bin/xsel -bi
    fi
}
alias ccc='_ccc_copy'
alias vvv='~/bin/xsel -bo'
EOF

# 7. 設定の反映
source ~/.bashrc
