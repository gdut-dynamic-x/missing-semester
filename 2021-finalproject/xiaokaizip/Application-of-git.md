# Application of git 

1. 若你已经修改了部分文件、并且将其中的一部分加入了暂存区，应该如何回退这些修改，恢复到修改前最后一次提交的状态？给出至少两种不同的方式

   首先取消暂存的文件

   ```shel
   git reset HEAD <file>
   ```

     然后撤销对文件的修改

   ```shell
   git checkout -- <file>
   ```
   
   

