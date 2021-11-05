# 一

```1.先 git reset HEAD  <file> 再 git checkout --file```
![avatar](stage back1.png)

```2. 先 git reset HEAD  <file> 再 git restore <file>```
 ![avatar](stage back2.png)

# 二
``` 1. git reset --hard HEAD^ / git reset --hard commit_id```
![avatar](version back1.png)

``` 2.先 git revert -n commit_id 再 git commit -m " "```
![avatar](version back2.png)

# 三
``` 1. FastForward 删除分支后，会丢掉分支信息: git merge <branch> ``` 
![avatar](merge1.png)

``` 2. --no-ff强制禁用Fast forward :git merge --no-ff -m "merge with no-ff" dev -->会产生分支信息 ```
![avatar](merge2.png)

