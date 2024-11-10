## 问题 1：

### 方法一：

1. **命令**：
   ```bash
   git reset --hard HEAD
   ```
   
2. **截图**：
   - ![使用 git reset 回退所有修改](./截图-2024-10-26-16-28-18.png)

### 方法二：

1. **取消暂存区的更改**：
   ```bash
   git restore --staged <file>
   ```

2. **回退工作区的更改**：
   ```bash
   git restore <file>
   ```

3. **截图**：
   - ![取消暂存的更改和回退工作区的更改](./截图-2024-10-26-16-34-07.png)

## 问题 2：回退已提交的版本


### 方法一：

1. **命令**：
   ```bash
   git revert <commit_hash>
   ```

2. **截图**：
   - ![使用 git revert 创建新的提交](./截图-2024-10-26-16-41-53.png)

### 方法二：

1. **命令**：
   ```bash
   git reset --hard <commit_hash>
   ```

2. **截图**：
   - ![硬回退](./截图-2024-10-26-16-42-49.png)

## 问题 3：

### 方法一：

1. **命令**：
   ```bash
   git checkout feature-branch
   git rebase main
   ```

2. **截图**：
   - ![使用 git rebase 合并分支](./截图-2024-10-26-16-45-07.png)

### 方法二：

1. **命令**：
   ```bash
   git checkout main
   git cherry-pick <commit_hash>
   ```
   
2. **截图**：
   - ![使用 git cherry-pick 选择性合并提交](./截图-2024-10-26-16-47-32.png)
