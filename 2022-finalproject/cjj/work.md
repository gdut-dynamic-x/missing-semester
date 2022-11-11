## 回答

### 问题一
-  使用 "git restore --staged <文件>..."

-  git reset HEAD --.

-  git rm --cached filename

![2.jpeg](2.jpeg)

### 问题二
-  使用git revert -n +版本号

-  先用git log查看提交的commit id,复制最后一次提交的commit id,使用git reset --hard +commit id恢复

![1.jpeg](1.jpeg)


### 问题三
- git commit --amend

- git rebase -i

![3.jpeg](3.jpeg)