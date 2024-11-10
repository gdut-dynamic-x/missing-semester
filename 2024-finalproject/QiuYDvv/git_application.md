# 若你已经修改了部分文件、并且将其中的一部分加入了暂存区，应该如何回退这些修改，恢复到修改前最后一次提交的状态？给出至少两种不同的方式
```shell
git reset HEAD <文件名> 
```
![reset照片](https://github.com/QiuYDvv/picture/blob/3864c78c69d7a80484eb54d29c7848a61ba7e5c1/reset%E5%8F%96%E6%B6%88%E6%9A%82%E5%AD%98.jpeg)
```shell
git checkout -- <文件名>
```
![checkout照片](https://github.com/QiuYDvv/picture/blob/3864c78c69d7a80484eb54d29c7848a61ba7e5c1/checkout%E5%8F%96%E6%B6%88%E6%9A%82%E5%AD%98.jpeg)
# 若你已经提交了一个新版本，需要回退该版本，应该如何操作？分别给出不修改历史或修改历史的至少两种不同的方式
```shell
git revert <commit> #不修改历史
```
![revert照片](https://github.com/QiuYDvv/picture/blob/3864c78c69d7a80484eb54d29c7848a61ba7e5c1/revert%E5%9B%9E%E9%80%80%E7%89%88%E6%9C%AC.jpeg)
```shell
git reset --hard <commit> #修改历史
```
![reset照片](https://github.com/QiuYDvv/picture/blob/3864c78c69d7a80484eb54d29c7848a61ba7e5c1/reset%E5%9B%9E%E9%80%80%E7%89%88%E6%9C%AC.jpeg)
# 我们已经知道了合并分支可以使用 merge，但这不是唯一的方法，给出至少两种不同的合并分支的方式
```shell
git rebase <branch> #合并到当前分支
```
![rebase照片](https://github.com/QiuYDvv/picture/blob/3864c78c69d7a80484eb54d29c7848a61ba7e5c1/rebase%E5%90%88%E5%B9%B6%E5%88%86%E6%94%AF.jpeg)
```shell
git cherry-pick <commit> #合并特定提交
```
![cherry-pick照片](https://github.com/QiuYDvv/picture/blob/3864c78c69d7a80484eb54d29c7848a61ba7e5c1/cherry-pick%E5%90%88%E5%B9%B6%E5%88%86%E6%94%AF.jpeg)
