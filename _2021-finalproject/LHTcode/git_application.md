# Git 应用

1. 若你已经修改了部分文件、并且将其中的一部分加入了暂存区，应该如何回退这些修改，恢复到修改前最后一次提交的状态？给出至少两种不同的方式？

	**答案**：
	1. `git reset HEAD file_name`

	2. `git rm --cache`

2. 若你已经提交了一个新版本，需要回退该版本，应该如何操作？分别给出不修改历史或修改历史的至少两种不同的方式

	**答案**：
	
	1. 不修改文件的方法：`git reset --hard commitID`
	2. 修改文件方法：
	- `cd ./git `
	- `cd tree object`
	- 这时看到若干个Hash值:
<img src="https://typoranote-lht.oss-cn-guangzhou.aliyuncs.com/image/image-20211109175107132.png" alt="image-20211109175107132" style="zoom: 37%;" />
	- 对其中每一个目录+文件都使用命令`git cat-file -p path_name+_file_name`
	- 找到刚刚的`commit`目录和文件，用`rm -rf`命令把它删除
	- 接着用同样的命令检查下面几个目录和文件，直至找到上一个`commit`的ID为止
	- `git reset --hard original_commit_path_name+_file_name`
	- `git log` 检查发现最新的commit消失

3. 我们已经知道了合并分支可以使用 merge，但这不是唯一的方法，给出至少两种不同的合并分支的方式
	**答案**：
	1. `git rebase [branch name]`
	![image-20211109201934806](https://typoranote-lht.oss-cn-guangzhou.aliyuncs.com/image/image-20211109201934806.png)
	2. `git cherry-pick [branch name]`
	![image-20211109202139296](https://typoranote-lht.oss-cn-guangzhou.aliyuncs.com/image/image-20211109202139296.png)

