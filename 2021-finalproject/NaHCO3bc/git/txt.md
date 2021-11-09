#git 应用
   ‘苏柏承’

##第一题：回退修改
*1.第一种方法：*
 git reset HEAD <filename> | git checkout -- <filename>

图片示例:
2021-finalproject/NaHCO3bc/githomework1.png

*2.第二种方法：*
git restore --staged <filename> | git checkout -- <filename>

图片示例：
2021-finalproject/NaHCO3bc/githomework2.png

##第二题:版本回退
*不修改历史*
第一种方法：
git reset --soft HEAD^

第二种方法： 
git reset --soft 版本号

图片示例（方法1）：
2021-finalproject/NaHCO3bc/githomework3.png

*修改历史*
第一种方法：
git reset --hard HEAD^

第二种方法：
git reset --hard 版本号

图片示例（方法2）：
2021-finalproject/NaHCO3bc/githomework4.png

##第三题：合并分支
*第一种方法：*
git rebase <branch_name>

图片示例：
2021-finalproject/NaHCO3bc/githomework5.png

*第二种方法：*
git push










