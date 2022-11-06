# 回退文件的两种方法

![image-20221105163501054](C:\Users\WUYOUJIAN\AppData\Roaming\Typora\typora-user-images\image-20221105163501054.png)

![image-20221105163532606](C:\Users\WUYOUJIAN\AppData\Roaming\Typora\typora-user-images\image-20221105163532606.png)

git reset <commit的编号>

git reset HEAD~或 git reset HEAD^可以回退上一个版本

# 回退版本的方法

![image-20221105163555689](C:\Users\WUYOUJIAN\AppData\Roaming\Typora\typora-user-images\image-20221105163555689.png)

![image-20221105163623248](C:\Users\WUYOUJIAN\AppData\Roaming\Typora\typora-user-images\image-20221105163623248.png)

git revert <commit编号> 可以回到某个版本，并删除某个版本后的变化，并且会保留历史

# 合并分支的方法

git merge

git rebase