1. 若你已经修改了部分文件、并且将其中的一部分加入了暂存区，应该如何回退这些修改，恢复到修改前最后一次提交的状态？给出至少两种不同的方式



第一种方案：使用git reset --hard

![1](/home/lovod/lovod-git/2024-finalproject/lovodllt/lovodllt/1.jpg)

第二种方案：使用git reset HEAD xxx.txt和git cheackout -- xxx.txt



![2](/home/lovod/lovod-git/2024-finalproject/lovodllt/lovodllt/2.jpg)

2. 若你已经提交了一个新版本，需要回退该版本，应该如何操作？分别给出不修改历史或修改历史的至少两种不同的方式

   

1.修改历史：使用reset

![3](/home/lovod/lovod-git/2024-finalproject/lovodllt/lovodllt/3.jpg)

2. 不修改历史：使用revert（书接上回）

   ![4](/home/lovod/lovod-git/2024-finalproject/lovodllt/lovodllt/4.jpg)



3. 我们已经知道了合并分支可以使用 merge，但这不是唯一的方法，给出至少两种不同的合并分支的方式

(为了展现的直观点，这里用了gitkraken)

先建好基础

![5](/home/lovod/lovod-git/2024-finalproject/lovodllt/lovodllt/5.jpg)

第一种：merge

![6](/home/lovod/lovod-git/2024-finalproject/lovodllt/lovodllt/6.jpg)

第二种：rebase

![7](/home/lovod/lovod-git/2024-finalproject/lovodllt/lovodllt/7.jpg)