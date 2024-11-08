# Learning Git

## Git 简介

git是一个版本控制的工具，可以很方便地对项目进行管理。

比如要对原项目增加新功能时，只需要新建一个分支，在分支的基础进行修改并提交即可。即使提交的有问题，也能随时回溯到之前的版本。分支的性质也极大的方便了多人同时对代码进行修改，每个人负责不同的部分，最后只需将每个人的分支合并，即可得到最后的所有修改。

## Git基本结构

### 分区

git主要分为三个区：工作区、暂存区、版本库

- 工作区：修改代码的地方
- 暂存区：工作区与提交的过渡，用于暂存工作区修改的代码，可随时提交
- 版本库：储存着当前版本和过去所有提交的记录，可随时回溯到之前的某一次提交

### 三者关系

1. **工作区 -> 暂存区**

   ```
   git add 文件名
   ```

   或者一次性提交所有文件：

   ```
   git add .
   ```

2. **暂存区 -> 版本库**

   ```
   git commit -m "本次提交的修改内容，要用纯英文！！！"
   ```

3. **版本库 -> 远程仓库（如github）**

   ```
   git push 远程仓库名 分支名
   ```

   

## 常用命令

（）内为可不加

| 作用                     | 命令                  |
| ------------------------ | --------------------- |
| 初始化仓库               | git init              |
| 查看当前仓库状态         | git status            |
| 查看历史提交日志及版本号 | git log               |
| 查看所有分支（切换分支)  | git checkout (分支名) |
| 将文件加入暂存区         | git add 文件名        |
| 将暂存区文件提交到版本库 | git commit            |
| 克隆其他仓库             | git clone             |
| 回退到某一版本           | git reset             |
| 撤销某一版本提交         | git revert            |



## Git与Github

github为远程仓库，可以储存项目的代码

### 连接远程仓库github

- 添加远程仓库

  ```
  git remote add 自己指定的仓库名 ssh密匙
  ```

- 在github上添加本地git仓库的ssh密匙：

  1. 生成密匙

     ```
     ssh-keygen -t rsa -C "github注册的邮箱"
     ```

  2. 在 **.ssh/** 下找到 **id_rsa.pub** ，复制密匙，粘贴到 **github->setting->New SSH Key** 里面

### 将本地内容推到github

- 推送你的新分支与数据到某个远端仓库命令:

  ```
  git push [alias] [branch]
  ```

- 以上命令将你的 [branch] 分支推送成为 [alias] 远程仓库上的 [branch] 分支，实例如下。

  ```
  $ touch runoob-test.txt      # 添加文件
  $ git add runoob-test.txt 
  $ git commit -m "添加到远程"
  master 69e702d] 添加到远程
   1 file changed, 0 insertions(+), 0 deletions(-)
   create mode 100644 runoob-test.txt
  
  $ git push origin master    # 推送到 Github
  ```

### 将github更新拉到仓库

1、从远程仓库下载新分支与数据：

```
git fetch 远程仓库名（自己之前取的）
```

该命令执行完后需要执行 git merge 远程分支到你所在的分支。

2、从远端仓库提取数据并尝试合并到当前分支：

```
git merge 当前分支名
```

该命令就是在执行 **git fetch** 之后紧接着执行 **git merge** 远程分支到你所在的任意分支。





