# 收获

从学习这个项目以来，我收获到了
c+＋的基础学习
linux 命令行的基础语法
bash脚本基础
vim编辑器的使用
git入门语法

作为刚入门的一个纯小白，甚至连Windows都弄不明白，就加入到了Ubuntu系统的学习，通过B站相关网课学习对应的内容，以及每学习一个内容，我都会用手机的WPS便签记笔记。

# 感想
我是一名大一的小萌新，从高中开始就对机器人有着极大的热情，也对RM的赛事比较关注，在开学后了解到学校的对应的团队，我便报名加入了DynamicX团队的考核，但我对系统这方面简直是一窍不通，但通过团队这段时间的培训，我对系统的一些专有名词有所了解，并了解了对应的部分发挥怎么样的作用。即使现在的自己对很多东西都是一窍不通，但我相信，通过不断地学习，能够改变自己。但不管怎么说，我渴望拥有自己的一个机器人，渴望拥有一群机器人的伙伴，渴望拥有一支自己热爱的团队，渴望拥有一个为之奋斗的梦想。

###关于文件恢复和版本回退的一些总结（git 任务）
文件恢复
# 第一种方法： git reset
reset的本质是移动HEAD以及它所指向的branch

git reset 后面可以有l两个个参数：

git reset --hard <commit编号> 这个是将暂存区和工作区清空

彻底回退到上一个版本，所有变更都会消失

git reset --soft <commit编号> 这个会保留暂存区和工作区

只是撤销了commit ,上一次的更改还在，什么都没变

在实际操作中，我先创建了自己的测试空间，然后创建了一个test.sh的文档，输入：你好呀，然后add,commit，提交了第一次修改，然后我再修改了test.sh，进行了第二次提交，这时候我用git log 得到对应的commit编号，git reset --hard 编号 就回到了第一次的版本，若使用git reset --soft 文件内容就没有对应改变。
！[](reset)
! [](reset -hard.jpeg)

#第二种方法： git checkout 文件名
这种方法可以直接将commit的文件直接回到未修改前

我将test.sh add,commit后，用git checkout test.sh就直接回到了未修改前

版本回退
#第一种方法: git reset HEAD~
还有一种写法是 git reset HEAD^(个人觉得应该没多大区别)

创建一个新的文档test.txt，进行两次add，commit ,之后git log 查看是否体交了两次版本，再使用git reset HEAD~,·那么最后一次的commit就会在暂存区被删除，但是这个方法会修改git log里的历史
! [](reset -head.jpeg)

#第二种方法: git revert <commit编号>
这是我第一次了解到这种方法，我在csdn上对相关资料进行了搜集，git log 找到对应的编号，当使用这个编号作为参数传入git revert时，本地文件就会回到这个编号之前的版本，然后这个操作也会作为历史记录在git log里。

在本地操作中两个方法都可以，但若是已经将本地仓库push到远程后，最好使用git revert 这个操作
! [](revert .jpeg)
! [](revert.jpeg)

合并分支的两种方法
#第一种方法git merge
git checkout branch_name #用来切换到某个分支(如要合并到master分支，就切换到master分支下)
git pull
git branch -a #查看是否所有分支都pull下来了
git merge branch_name #合并某个分支
git branch -d branch_name #删除某个分支



#第二种方法git rebase
git checkout branch_name_1  #切换到某个分支
git rebase branch_name_2  #但这么操作容易使在git status中造成冲突
# 单机可以使用，多人合作尽量用merge 
