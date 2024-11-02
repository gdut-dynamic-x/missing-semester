# Git的学习过程

## Git的工作流程

![](screenshot/GitLogo.png)

![](screenshot/git-workflow.png)

上面这张图，很形象地介绍了Git的工作流程，掌握上面几条命令，基本可以~~熟练Git的使用~~。

## 1.开启PR

首先在Github上将目标仓库fork到自己的仓库下，之后在自己的仓库界面点击pull request按钮，填写好概要之后开启PR。值得注意的是，fork过来的仓库要有过commit才能开启PR。

![](screenshot/PR-01.png)

上图为Github上PR面板的介绍，同时可以发现若没有对fork过来的仓库进行commit。Github检查发现两个仓库内容一致，不会允许开启PR。

因此，得先对fork过来的仓库进行修改并commit后才能开启PR。

## 2.Git的常用命令（用于本地）

### git init

使得指定目录初始化为仓库

### git add

通过

```
git add filename
```

可以将工作区的文件推送到暂存区

### git commit

这条命令是将暂存区的文件推送到本地版本库

加上-m参数，可以附带上本次提交(commit)的概要

```
git commit -m "Commit message"   # 将暂存区的更改提交到本地版本库
```

### git log

通过这条命令，我们可以查看提交历史，每次提交的**版本号**

### git reset

通过这条命令可以实现版本回退

```
git reset --hard 目标版本号
```

关于版本回退更详细的资料可以参考[Git的历史版本查看与版本回退](https://blog.csdn.net/qq_39505245/article/details/119788832)

### 小结

通过上面几条命令，便可以简单入门上手git的使用，可以实现本地多版本开发。

## 3.Git的常用命令（用于远程）

### git remote 

git remote add \<name\> \<URL\>

```
git remote add origin <你的远程仓库链接>
```

通过上面的命令可以添加远程仓库，即将本地仓库和指定远程仓库绑定在一起。

### git push

通过push命令，可以将本地仓库推送到远程仓库

### git pull

通过pull命令，可以将最新远程仓库拉到本地仓库来。

### git clone

用于在本地没有仓库下,克隆一个远程仓库到本地。



### 更多教程

[Git教程-菜鸟教程](https://www.runoob.com/git/git-tutorial.html)
