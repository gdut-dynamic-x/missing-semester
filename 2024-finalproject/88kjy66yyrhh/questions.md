# **图片**

- 第一张
![第一张](./image1.jpg)



- 第二张
![第二张](./image2.png)



- 第三张
![第三张](./image3.png)



# **第一题**


1. git reset --hard HEAD
2. git reset HEAD 
   git checkout -- .

# **第二题**


## *不修改历史*
1. git revert HEAD
2. git checkout -b new-branch <last-version>
## *修改历史*
1. git reset --soft HEAD~1
2. git reset --hard HEAD~1

# **第三题**


1. git checkout <other-branch>
   git rebase main
   git checkout main
   git merge <other-branch>	 
2. git checkout main
   git cherry-pick <want-version>

