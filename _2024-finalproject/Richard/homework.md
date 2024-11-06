## 1. 如果已经修改了部分文件，并且将其中的一部分加入了暂存区，应该如何回退这些修改，恢复到修改前最后一次提交的状态？给出至少两种不同的方式

- **方法 1：使用 `git reset`**
  ```bash
  git reset <文件名>
  ```
  此命令会将文件从暂存区移除，但保留工作区的修改内容，方便继续编辑或重新添加。
![Git reset](git%20reset.jpeg)

- **方法 2：使用 `git checkout`**
  ```bash
  git checkout -- <文件名>
  ```
  此命令会将文件恢复到上一次提交的状态，放弃工作区的所有更改。
![Git checkout](git%20checkout.jpeg)

## 2. 如果已经提交了一个新版本，需要回退该版本，应该如何操作？分别给出不修改历史或修改历史的至少两种不同的方式

- **不修改历史的方式 ：**
  - **方法 1：使用 `git revert`**
    ```bash
    git revert <提交哈希值>
    ```
    ![Git revert](git%20revert.jpeg)
    ![Git revert 2](git%20revert%202.jpeg)
  该命令会生成一个新的提交，用来撤销指定提交的更改，同时保留提交历史记录。
  - **方法 2：使用 `git restore`**
    ```bash
    git restore --source=<提交哈希值> <文件路径>
    ```
    ![Git restore](git%20restore.jpeg)
  该命令会恢复指定文件到特定提交的状态，但不会修改提交历史记录。适用于想要恢复文件内容而不回退整个提交的情况。
- **修改历史的方式：**
  - **方法 1：软重置**（保留工作区和暂存区的内容）：
    ```bash
    git reset --soft <提交哈希值>
    ```
    ![Git reset --soft](git%20reset%20--soft.jpeg)
  - **方法 2：硬重置**（删除暂存区和工作区的更改）：
    ```bash
    git reset --hard <提交哈希值>
    ```
    ![Git reset --hard](git%20reset%20--hard.jpeg)
  该命令会将当前分支回退到指定提交，并删除之后的所有提交记录。

## 3. 合并分支可以使用 `merge`，但这不是唯一的方法，给出至少两种不同的合并分支的方式
- **方法 1：使用 `git rebase`**
  ```bash
  git rebase <分支名>
  ```
  ![Git rebase 1](git%20rebase%201.jpeg)
  ![Git rebase 2](git%20rebase%202.jpeg)
  `rebase` 会将当前分支的更改移动到指定分支的后面，生成更简洁的提交历史，但会重写历史记录。

- **方法 2：使用 `cherry-pick`**
  ```bash
  git cherry-pick <提交哈希值>
  ```
  ![Git cherry-pick 1](git%20cherry-pick%201.jpeg)
  ![Git cherry-pick 2](git%20cherry-pick%202.jpeg)
  `cherry-pick` 可以将另一个分支上的特定提交应用到当前分支上。适合需要选择性地合并某些提交的情况，而不需要合并整个分支。
