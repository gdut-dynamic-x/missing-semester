# Git学习笔记

## 1. Git的工作流程

![](photos/git-process.png)

## 2. Git的工作区与版本库及其常见命令

![](photos/wks.jpg)

工作区的文件`add`到index（暂存区）后需要`commit`到master分支



当对工作区修改（或新增）的文件执行`git add`命令时，暂存区的目录树被更新，同时工作区修改（或新增）的文件内容被写入到对象库中的一个新的对象中，而该对象的ID被记录在暂存区的文件索引中。(用`git add filename`对指定文件提交到暂存区，用`git add .`对当前目录下所有文件提交到暂存区)

当对暂存区执行`commit`命令后，暂存区的所有文件将会被提交到当前的分支（图中为master）

