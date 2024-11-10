#魏佳桦3123002619的作业
# git学习过程
## 安装
*Linux安装*
```sudo apt install git```

*配置git环境：*
```git config --global user.name "你的用户名"```
```git config --global user.email "你的邮箱"```

## 基础使用
*1.创建目录*
```mkdir test```
*2.进入目录*
```cd test```
*3.使用git init初始化当前仓库*
```git init```

*使用git add命令将文件添加到本地仓库的提交缓存*
```git add test.c ```

*使用git commit命令为其添加修改的描述信息*
```git commit -m "add new file \"test.c\""```

*改写提交：*
```git commit --amend```

*查看历史提交日志：*
```git log```

*回滚代码仓库：*
```git reset --hard 要回滚id```

*查看提交之后文件是否做了改动：*
```git status```

## 分支的使用
*1.使用git checkout -b参数来创建一个分支，创建完成分支后会自动切换过去*
```git checkout -b 分支名```
*2.查看当前属于哪个分支*
```git branch```
*3.git切换分支*
```git checkout master```
*4.git合并分支：*
```git merge```

## github使用
*1.github将本地仓库关联到远程仓库：*
```git remote add origin git@github.com:beiszhihao/test.git```

*2.然后使用git push推送到远程*
```git push -u origin master```

*3.git将远程仓库关联到本地*
```git clone+网址```


