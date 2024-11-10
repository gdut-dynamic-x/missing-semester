若你已经修改了部分文件、并且将其中的一部分加入了暂存区，应该如何回退这些修改，恢复到修改前最后一次提交的状态？
## 使用 git reset --hard 回退到最后一次提交

查看当前状态：

    git status
![Image 1](Images/git1.png) 
回退到最后一次提交：

    git reset --hard HEAD
![Image 3](Images/git3.png) 
## 使用 git checkout -- 实现版本回退
![Image 2](Images/git2.png)     

若你已经提交了一个新版本，需要回退该版本，应该如何操作？分别给出不修改历史或修改历史的至少两种不同的方式
## 不修改历史的方式：使用 git revert
 
## 修改历史的方式：使用 git reset --hard
![Image 4](Images/git4.png)
## 使用 git reset --mixed
![Image 5](Images/git5.png) 


我们已经知道了合并分支可以使用 merge，但这不是唯一的方法，给出至少两种不同的合并分支的方式

### 使用 git rebase

    git rebase
    git checkout <target_branch>
    git rebase <source_branch>
![Image 6](Images/git6.png)  
## Git 应用
# 图片  
