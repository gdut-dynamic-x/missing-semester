git 学习总结

1.连接github
配置个人的用户名称和电子邮件地址，：
git config --global user.name "用户名"
git config --global user.email 邮箱
生成ssh
ssh-keygen -t rsa -b 4096 -C "github"
将ssh添加到github中
更改配置文件修改端口 port 443
测试ssh连接 
ssh -T -p 443 git@github.com

git操作
git init	初始化仓库
git add	添加文件到暂存区
git commit	将暂存区内容添加到仓库中
git add	添加文件到暂存区
git status	查看仓库当前的状态，显示有变更的文件
git diff	比较文件的不同，即暂存区和工作区的差异
git reset	回退版本
git rm		将文件从暂存区和工作区中删除
git mv		移动或重命名工作区文件
git checkout	分支切换
git log	查看历史提交记录
git push	上传远程代码并合并 文件名《文件描述信息》

具体实现
电脑上的区域为工作目录，在完成代码编译后，添加至暂存区
使用 git add <具体文件名> 命令将文件从工作目录添加到暂存区。
使用 git add . 命令将当前目录下的所有更改添加到暂存区。
再提交至本地仓库
git commit -m "提交的文件名"
再上传至github
git push	上传远程代码并合并

分支概念
创建新分支并切换到该分支：
git checkout -b <分支名>
git branch	查看所有分支
git branch -d <要删除的分支名>	删除分支

提交的撤回
首先需要 git log 获取日志信息
git reset	重置当前分支到指定提交（软重置、混合重置、硬重置）。
git revert	创建一个新的提交以撤销指定提交，不改变提交历史。
恢复工作目录中的文件到某个提交：
git checkout <提交文件> -- <恢复状态>
--soft：只重置 HEAD 到指定的提交，暂存区和工作目录保持不变。
--hard：重置 HEAD 到指定的提交，暂存区和工作目录都重置。
--mixed（默认）：重置 HEAD 到指定的提交，暂存区重置，但工作目录保持不变。
