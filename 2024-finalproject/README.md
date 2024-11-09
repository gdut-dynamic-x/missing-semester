###  github 总结
#### 方法总结
1. 需要合理的记笔记，选取重要有用的信息。
2. 学会高效的查找资料和筛选信息。
3. 掌握从0到1的一般步骤，更快的上手新软件。

#### github
**功能：** == 能高效的管理代码，有助与团队合作。 ==
**创建仓库：** 要安装好git， 在用*git init*初始化本地仓库。
1. *git add .* ——提交到缓存区。
2. *git commit -m " "* ——提交到master
**提交到远程：**
1. 先用*ssh-keygen*配置密钥。
2. 在将生成的文件粘贴到github上，进行配置。
3. 通过*git remote add test.txt ssh*和*git push test.txt master*上传到远程仓库。
**克隆：**
1. *git clone ssh* ——将远程的仓库克隆到本地。
**pr:**
2. 重要的是解决冲突。

