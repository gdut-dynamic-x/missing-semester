# 学习总结

## shell&vim

### 常用命令

#### shell：

1.cd：进入到某个路径（cd .和cd ..可以进入和退回路径）

2.cat：输出文件的内容

3.mkdir+文件名：新建一个文件夹

4.touch+文件名和后缀：创建一个文件

5.rm：删除文件

6.chmod：修改文件的权限

7.ls：列出当前路径下的文件（后面可以加入各种指令例如 -a）

8.ctrl+c：中断当前terminal的进程

9.sudo：给后面的指令赋予最高权限

#### vim：

###### 命令模式（此模式下不能修改内容）：

a/i：进入编辑模式

h/j/k/l：在命令模式里面进行光标的左下上右移动

：（冒号）：进入末行模式

###### 编辑模式：

esc：返回命令模式

其余几乎和普通的编辑器一样

###### 末行模式：

wq：保存并推出vim

q：不保存就退出vim

## git

### 前置

```
git config --global user.name 用户名
git config --global user.email 邮箱
```

这两段代码可以让我们和github账号建立连接

### 常用指令

git init：新建本地电脑的仓库

git status：查看仓库状态

git add <filename>：提交文件到暂存区

git commit：提交文件，可以在后面加-m对本次提交的描述

git pull：下载远程代码并合并

git push：上传远程代码并合并

git remote：远程仓库操作（用add与远程仓库进行连接）

git log：查看历史提交记录

git branch：显示分支

git branch+分支名：创建分支

git checkout <name>：切换到分支

git clone：下载远程仓库到电脑



