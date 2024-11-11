**Git 学习总结**
#一、概述
Git 是一个强大的分布式版本控制系统,通过学习 Git，能够更好地管理项目的版本、协同工作以及追踪代码的变化。

#二、基本配置
1.设置用户信息
git config --global user.name "uesr name" 
git config --global user.email "email name"
2.查看配置信息
git config --global user.name
git config --global user.email

---

#三、Git 基础概念学习
工作区（Working Directory）：对项目的修改。
暂存区（Staging Area）：用于准备下一次提交的变更。
仓库（Repository）：保存项目历史的地方。
分支（Branch）:是开发线上独立的工作路径。
远程仓库（Remote Repository）：是存储在远程服务器上的 Git 仓库

---

#四、Git的基础操作指令
1.添加工作区到暂存区(add)
命令形式：git add 单个文件名|通配符
2.提交暂存区到本地仓库(commit)
命令形式：git commit -m '注释内容'
3.查看提交日志(log)
命令形式：git log 
4.版本回退
命令形式：git reset --hard commitID
5.查看已经删除的记录
命令形式:git reflog

---

#五、分支
1.查看本地分支：git branch
2.创建本地分支：git branch 分支名
3.切换分支：git checkout [-b] 分支名
4.合并分支：git merge 分支名称
5.删除分支:
git branch -d b1 删除分支时，需要做各种检查
git branch -D b1 不做任何检查，强制删除

---

#六、解决冲突
1. 处理文件中冲突的地方
2. 将解决完冲突的文件加入暂存区(add)
3. 提交到仓库(commit)

---

#七、操作远程仓库
1.添加远程仓库：git remote add <远端名称> <仓库路径>
2.查看远程仓库：git remote
3.推送到远程仓库：git push [-f] [--set-upstream] [远端名称 [本地分支名][:远端分支名]]
4.本地分支与远程分支的关联关系：git branch -vv
5.从远程仓库克隆：git clone <仓库路径> [本地目录]
6.从远程仓库中抓取和拉取
抓取命令：git fetch [remote name][branch name]
拉取命令：git pull [remote name][branch name]
