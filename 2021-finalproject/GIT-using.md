## A1

情况一: 如果还没     git add file    


使用该指令进行撤销: 

     git checkout -- fileName     


情况二: 已完成    git add file但还没 git commit-m 

    git reset HEAD^
    git  status
    git checkout -- file 

## A2
情况一:不修改历史的回退
通过 

    git log 

或者

    git log --pretty=oneline 

或者

    git reflog

找到对应的commit id进行回退：

    git reset --hard (id)
情况二:若想回退到上一个版本

    git reset --hard HAED^

 ## A3

 ### 方法一: 如果待合并的分支在当前分支的下游，也就是说没有分叉时，会发生快速合并，从test分支切换到master分支，然后合并test分支

     git checkout master
     git merge test
### 方法二: 如果我们不想要快速合并，那么我们可以强制指定为非快速合并，只需加上--no-ff参数

     git checkout master
     git merge –no-ff test

### 方法三: svn的在合并分支时采用的就是这种方式，squash会在当前分支新建一个提交节点 squash和no-ff非常类似，区别只有一点不会保留对合入分支的引用

     git checkout master
     git merge –squash test

### 方法四: 当要合并两个分叉的分支时，merge的方式是将待合入分支和当前分支不同的部分，rebase与merge不同，rebase会将合入分支上超前的节点在待合入分支上重新提交一遍

