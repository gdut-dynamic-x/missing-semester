```bash 

#Learning Courses Record
```markdown
# Shell基础知识部分

## 通配符

## 正则表达式

## 管道符号 |

# Markdown语法手记

- [ ] 和 - [x] 表示动态的选项框
## 表示标题

# Git基础知识部分

## Gitghub托管平台

## 了解集中式和分布式版本控制

## 本地仓库与远程仓库、推送、创建
### 基础仓库（通常是原始仓库）和目标分支（main或者master）

## 协同开发工作流程、remote、push、clone、fetch、pull

## 暂存区的概念

## diff命令

## rm命令和文件删除原理

## mv命令和文件改名原理

## log命令

## 文件忽略

## add命令原理

## commit命令原理

## 分支创建查看删除

## 分支checkout切换switch切换及其影响

## checkout撤销修改和强制切换

## Git分支状态储存、Git储存的使用、与暂存区的关系、原理

## 远程分支跟踪

## 工作树

## 分支合并、快进式与典型式

## 代码冲突、分类、远程协作代码冲突

## Git merge命令

## Git还原restore命令

## 修正提交amend命令

## 数据回退reset命令

## 配置项config命令

# 开发问题部分

## 找到Git目录并记住他的位置
- Ubuntu终端的默认起始目录是家目录，也叫家目录，简写形式是~，完整路径是/home/用户名
- pwd命令可以用来打印当前目录，输出/home/用户名，其中第一个/表示根目录，是所有目录的父目录

## 小技巧
- 自动补全名称 Tab
- 使用之前键入的命令 ⬆ ⬇
```bash
# Git Application Q&A

## 问题1：回退已修改但未提交的更改

### 方式一：使用git checkout
-git checkout -- <file>
#方式二：使用git restore
-git restore <file>
#方式三：使用git reset
-git reset --hard HEAD
#问题2：回退已提交的版本
#不修改历史的方式：
# 方式一：使用git revert
-git revert HEAD

# 方式二：创建反向提交
-git revert <commit-hash>
#修改历史的方式：
# 方式一：使用git reset --hard
-git reset --hard HEAD~1

# 方式二：使用git reset --soft
-git reset --soft HEAD~1
#问题3：合并分支的不同方式
#方式一：使用merge
-git merge <branch-name>
#方式二：使用rebase
-git rebase <branch-name>
#方式三：使用cherry-pick
-git cherry-pick <commit-hash>
