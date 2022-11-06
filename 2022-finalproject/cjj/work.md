## 回答

### 问题一
* 使用 "git restore --staged <文件>..."
* git reset HEAD +filename


### 问题二
* 使用git checkout HEAD +文件名
* 先用git log查看提交的commit id,复制最后一次提交的commit id,使用git reset --hard +commit id恢复


### 问题三
* git commit --amend
* git rebase -i