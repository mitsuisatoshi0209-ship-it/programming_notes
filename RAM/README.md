# RAM / Memory Memo

このフォルダでは、Linux でメモリ使用量を確認するためのコマンドをまとめています。

## まず確認したいコマンド

- `free -h`: 総メモリ、使用量、空き、スワップの概要を確認
- `vmstat 1 5`: 1秒ごとにメモリ・CPU・スワップの状態を確認
- `ps aux --sort=-%mem | head`: メモリ使用率の高いプロセスを確認
- `ps -eo pid,comm,%mem,rss --sort=-rss | head`: RSS の大きい順にプロセスを確認
- `top`: リアルタイムでメモリと CPU を確認
- `htop`: より見やすくメモリを確認する場合に便利

## 単一プロセスの詳細確認

- `pmap -x <PID>`: 特定プロセスのメモリ使用量を詳細に確認
- `cat /proc/<PID>/status`: プロセスのメモリ関連情報を確認

## OOM やスワップの確認

- `dmesg | grep -i -E 'oom|out of memory'`: OOM のログを確認
- `journalctl -k -b | grep -i -E 'oom|out of memory'`: ブート後の OOM ログを確認
- `swapon --show`: スワップの状態を確認

## 使い方の例

1. `free -h`
2. `ps aux --sort=-%mem | head -10`
3. `vmstat 1 5`
4. 必要なら `pmap -x <PID>`
