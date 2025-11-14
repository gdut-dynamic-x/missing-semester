## Git 应用

**要求：** 编写一个文档，回答下列问题，这些问题的答案都应当使用 git 命令实现。  
**提交：** 一个 MarkDown 文件和若干个图片文件，在 MarkDown 中使用有效的相对路径引用你的图片。

---

### 1. 若你已经修改了部分文件，并且将其中的一部分加入了暂存区，应该如何退还这些修改，恢复到修改前最后一次提交的状态？给出至少两种不同的方式。

#### 方法一：使用 `git restore` 分别撤销暂存区和工作区的修改

思路：

1. 先用 `git status` 查看当前哪些文件已暂存、哪些只在工作区修改；
2. 用 `git restore --staged <file>` 把已经加入暂存区的文件“退回”到工作区；
3. 再用 `git restore <file>` 或 `git restore .` 丢弃工作区里的修改；
4. 再次 `git status`，确认工作区已经回到最后一次提交时的状态。

关键命令示例（终端内容见截图）：

```bash
git status
git restore --staged src/app.c
git restore .
git status
```

方法一：  
![method1](./image/T1.1.png)

---

#### 方法二：使用 `git reset --hard` 直接回到 `HEAD`

思路：

1. 当你确定**所有当前修改都不要了**（包括暂存区和工作区），可以使用 `git reset --hard HEAD`；
2. 这个命令会同时重置 **HEAD、索引（暂存区）和工作区**，把整个仓库恢复到当前分支最后一次提交的状态；
3. 再次 `git status`，确认干净。

关键命令示例：

```bash
git status
git reset --hard HEAD
git status
```

方法二：  
![method2](./image/T1.2.png)

---

### 2. 若你已经提交了一个新版本，需要回退该版本，应该如何操作？分别给出不修改历史或修改历史的至少两种不同的方式。

> 这里我给出的是**不修改历史的两种方式**：通过新增提交的方式回退版本，而不是直接改写历史记录。

#### 方法一：使用 `git revert` 生成“反向提交”

思路：

1. 使用 `git log --oneline` 找到需要回退的那个提交的哈希值（例如 `8a1c9ac`）；
2. 运行 `git revert <commit>`，Git 会自动生成一个新的提交，这个提交的内容刚好与目标提交相反，从而达到“撤销”的效果；
3. 这样不会删除原来的提交，只是在后面多了一个“撤销”提交，属于**不修改历史**。

关键命令示例：

```bash
git log --oneline -3
git revert 8a1c9ac
git log --oneline -4
```

方法一：  
![method1](./image/T2.1.png)

---

#### 方法二：使用旧版本内容覆盖当前工作区，然后重新提交

思路：

1. 通过 `git log --oneline` 找到想要回到的旧版本（比如 `3b8f5d1`）；
2. 使用 `git restore --source=<旧版本> .` 把整个工作区文件内容恢复成旧版本；
3. 检查无误后，重新提交一次，这个新的提交就相当于“回滚到了旧版本”，但是中间的历史仍然保留；
4. 同样属于**不修改历史**，只是通过“再提交一次”的方式回到旧状态。

关键命令示例：

```bash
git log --oneline -3
git restore --source=3b8f5d1 .
git status
git commit -am "rollback to version 3b8f5d1 without history rewrite"
git log --oneline -4
```

方法二：  
![method2](./image/T2.2.png)

---

### 3. 我们已经知道了合并分支可以使用 `merge`，但这不是唯一的方法，给出至少两种不同的合并分支的方法。

#### 方法一：使用 `git rebase` + fast-forward 合并

思路：

1. 假设有 `main` 和 `feature/login` 两个分支；
2. 先切到功能分支 `feature/login`，用 `git rebase main`，把功能分支的提交“移动”到 `main` 分支的后面；
3. 然后切换回 `main`，直接 `git merge feature/login`，此时会是一个 fast-forward 合并（实际上只是移动指针），看起来像是线性历史；
4. 这种方式也是一种合并分支的方法，但不是传统的 `merge` 生成 merge commit 的形式。

关键命令示例：

```bash
git branch
git log --oneline --graph --all
git checkout feature/login
git rebase main
git checkout main
git merge feature/login
git log --oneline --graph
```

方法一：  
![method1](./image/T3.1.png)

---

#### 方法二：使用 `git cherry-pick` 挑选提交进行合并

思路：

1. 当你只想从某个分支中挑选**部分提交**合并到当前分支时，可以使用 `git cherry-pick`；
2. 先查看功能分支的提交记录，找到需要的提交哈希（例如 `9f0c4d1`）；
3. 在目标分支（比如 `main`）上执行 `git cherry-pick <commit>`，Git 会把该提交“复制”到当前分支，形成一个新的提交；
4. 这也是一种“合并分支工作成果”的方式，但不是直接对整个分支做 merge。

关键命令示例：

```bash
git branch
git log --oneline feature/login
git checkout main
git cherry-pick 9f0c4d1
git log --oneline --graph
```

方法二：  
![method2](./image/T3.2.png)
