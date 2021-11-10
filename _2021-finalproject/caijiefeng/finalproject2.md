#**Git 应用**
##如何回退存入暂存区的修改
1、使用git rm -r --cached删除存入暂存区的文件
       git add添加需要新加的文件
       git commit -m提交一个新的文件
       git push推送到远端
2、使用git reset命令
[回退存入暂存区的修改]（/home/caijiefeng/图片）

##回退新版本
1、使用git revert -n +版本号
       git commit -m xxx
       git push
   *使用revert命令直接更新版本*
2、先找到要恢复的版本号（gitlab）
   使用git reset --hard +版本号
       git push到远端分支
   *使用reset命令重新push新版本*
[回退新版本]（/home/caijiefeng/图片）

##合并分支的方法
1、git checkout master
   git pull orgin master
   git merge +分支名
2、git remote update orgin --prune
   git branch -a
   git push orgin --delete +分支名
   git branch -d +分支名
[合并分支的方法]（/home/caijiefeng/图片）
