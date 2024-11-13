## 学习心得
**不禁感慨上dx培训课期间的每一天都过得很充实，尽管生活有时候会像ubuntu终端一样各种报错，但作为合格的开发者，我们总是应该有勇气和智慧去找出并解决的**

刚开始我通过师兄网课和作业试图快速掌握，到头来发现各种报错让人已老实求放过，都是不看文档的错。
下面是看runoob.com和翻阅CSDN的收获：
1. 创建仓库的流程:
   1. git init
   2. vim filename
   3. git add filename
    (此时会自动创建一个master分支)
   4. git commit -m"提示信息"
2. 创建分支的流程
   1. git branch 列出
   2. git branch +文件名 创建分支
3. git连接GitHub
   1. 方式是直接克隆(配置ssh，先在文件目录git init再clone)
   2. 然后直接add 和commit -m
   3. 然后再git push就可以上传到远程仓库
4. 关于pr
   1. 先fork到自己仓库
   2. 然后是非常重要的要回到自己仓库再pr(折腾一天的教训)
