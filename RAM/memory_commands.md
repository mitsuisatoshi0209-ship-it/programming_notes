# Memory Commands

## 基本的なメモリ確認

### 1. メモリ全体の概要
```bash
free -h
```

### 2. リアルタイムで確認
```bash
watch -n 1 free -h
```

### 3. CPU とメモリの変化を確認
```bash
vmstat 1 5
```

## プロセスごとのメモリ使用量

### 4. メモリ使用率の高い順
```bash
ps aux --sort=-%mem | head -15
```

### 5. RSS の大きい順
```bash
ps -eo pid,comm,%mem,rss --sort=-rss | head -15
```

### 6. 特定プロセスのメモリ使用量
```bash
pmap -x <PID>
```

## さらに見やすく確認する方法

### 7. top
```bash
top
```

### 8. htop
```bash
htop
```

## スワップと OOM

### 9. スワップの状態
```bash
swapon --show
```

### 10. OOM のログを確認
```bash
dmesg | grep -i -E 'oom|out of memory'
```

### 11. システムログから確認
```bash
journalctl -k -b | grep -i -E 'oom|out of memory'
```

## 補足

- `RSS` は実際にプロセスが占有しているメモリ量に近い値です。
- `free -h` の `available` は、実際に新しいアプリが使える目安になります。
- スワップが増えている場合、メモリ不足の可能性があります。
