# 在本门课程中我学习了git版本控制系统的基本用法，学习如何使用个git来管理工作空间代码
# git简介
- Git 是一个开源的分布式版本控制系统，用于敏捷高效地处理任何或小或大的项目。
- Git 是 Linus Torvalds 为了帮助管理 Linux 内核开发而开发的一个开放源码的版本控制软件。
- Git 与常用的版本控制工具 CVS, Subversion 等不同，它采用了分布式版本库的方式，不必服务器端软件支持
# 在ubuntu系统中安装git的命令
```shell
apt-get install git
```
# git配置
```shell
 git config --global user.name "runoob"
 #初始化用户名
 git config --global user.email test@runoob.com
 #初始化邮箱
 #--global对所有仓库有效
```
# git的工作区、暂存区、版本库
1. 工作区是repo里除了.git文件之外的位置，是平时修改代码的位置
2. 暂存区是工作区和版本库之间的过渡阶段
3. 版本库是git存放版本信息的位置，提交到版本库的代码才真正被git管理
# 如何创建一个仓库
## git init
本地初始化仓库
```shell
mkdir my-project
cd my-project
git init
```
## git clone
远程克隆仓库到指定目录
```shell
git clone <repo> <directory>
```
# 文件的状态
- 未跟踪（Untracked）： 新创建的文件最初是未跟踪的。它们存在于工作目录中，但没有被 Git 跟踪
- 已跟踪（Tracked）： 通过 git add 命令将未跟踪的文件添加到暂存区后，文件变为已跟踪状态。
- 已修改（Modified）： 对已跟踪的文件进行更改后，这些更改会显示为已修改状态，但这些更改还未添加到暂存区。
- 已暂存（Staged）： 使用 git add 命令将修改过的文件添加到暂存区后，文件进入已暂存状态，等待提交。
- 已提交（Committed）： 使用 git commit 命令将暂存区的更改提交到本地仓库后，这些更改被记录下来，文件状态返回为已跟踪状态。

# git 的常用命令
```shell
git add filename       # 将单个文件添加到暂存区
git add .              # 将工作区中的所有修改添加到暂存区
git status             # 查看哪些文件在暂存区中
git commit -m "Commit message"   # 将暂存区的更改提交到本地版本库
git log                          # 查看提交历史
git diff                         # 查看工作区和暂存区之间的差异
git diff --cached                # 查看暂存区和最后一次提交之间的差异
git pull origin branch-name      #使用 git pull命令从远程仓库获取更新。
git push origin branch-name      #使用 git push 命令将本地版本库的提交推送到远程仓库。
```
# git的基本操作
## 创建仓库命令
```shell
git init	#初始化仓库
git clone	#拷贝一份远程仓库，也就是下载一个项目。
```
## 提交与修改
```shell
git add	#添加文件到暂存区
git status	#查看仓库当前的状态，显示有变更的文件。
git diff	#比较文件的不同，即暂存区和工作区的差异。
git difftool	#使用外部差异工具查看和比较文件的更改。
git range-diff	#比较两个提交范围之间的差异。
git commit	#提交暂存区到本地仓库。
git reset	#回退版本。
git rm	#将文件从暂存区和工作区中删除。
git mv	#移动或重命名工作区文件。
git notes	#添加注释。
git checkout	#分支切换。
git switch #（Git 2.23 版本引入）	更清晰地切换分支。
git restore #（Git 2.23 版本引入）	恢复或撤销文件的更改。
git show	#显示 Git 对象的详细信息。
```
## 提交日志
```shell
git log	#查看历史提交记录
git blame <file>	#以列表形式查看指定文件的历史修改记录
git shortlog	#生成简洁的提交日志摘要
git describe	#生成一个可读的字符串，该字符串基于 Git 的标签系统来描述当前的提交
```
## 远程操作
```shell
git remote	#远程仓库操作
git fetch	#从远程获取代码库
git pull	#下载远程代码并合并
git push	#上传远程代码并合并
git submodule	#管理包含其他 Git 仓库的项目
```
# 分支管理
```shell
git checkout -b <branchname> #创建新分支并切换到该分支
git checkout (branchname) #切换分支命令
git branch #查看所有分支
git branch -r #查看远程分支
git branch -a #查看所有本地和远程分支
git merge <branchname> #将其他分支合并到当前分支
git add <conflict-file> #标记冲突文件解决
git commit #提交冲突文件
git branch -d <branchname> #删除本地分支
git branch -D <branchname> #强制删除未合并分支
git push origin --delete <branchname> #删除远程分支
 ```

