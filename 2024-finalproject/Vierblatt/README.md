用ssh时没通过防火墙一直无法clone折腾了一天因为改了太多config中途还重装了一次
最终在csdn找到解决方案并新建了ssh config解决问题
在这门课获得了一定看git报错的能力
以及git的部分常用操作和md文件的常见命令
1、克隆仓库

如果你要参与一个已有的项目，首先需要将远程仓库克隆到本地：

git clone https://github.com/username/repo.git
cd repo

2、创建新分支

为了避免直接在 main 或 master 分支上进行开发，通常会创建一个新的分支：

git checkout -b new-feature

3、工作目录

在工作目录中进行代码编辑、添加新文件或删除不需要的文件。
4、暂存文件

将修改过的文件添加到暂存区，以便进行下一步的提交操作：

git add filename
# 或者添加所有修改的文件
git add .

5、提交更改

将暂存区的更改提交到本地仓库，并添加提交信息：

git commit -m "Add new feature"

6、拉取最新更改

在推送本地更改之前，最好从远程仓库拉取最新的更改，以避免冲突：

git pull origin main
# 或者如果在新的分支上工作
git pull origin new-feature

7、推送更改

将本地的提交推送到远程仓库：

git push origin new-feature

8、创建 Pull Request（PR）

在 GitHub 或其他托管平台上创建 Pull Request，邀请团队成员进行代码审查。PR 合并后，你的更改就会合并到主分支。
9、合并更改

在 PR 审核通过并合并后，可以将远程仓库的主分支合并到本地分支：

git checkout main
git pull origin main
git merge new-feature

10、删除分支

如果不再需要新功能分支，可以将其删除：

git branch -d new-feature

或者从远程仓库删除分支：

git push origin --delete new-feature
