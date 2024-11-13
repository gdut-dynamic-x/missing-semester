1. (1)`git reset` `git checkout --`

   ![wechat_2024-11-11_232215_570](/home/lty/图片/wechat_2024-11-11_232215_570.png)

   (2)`git restore --stage <file>` `git restore <file>`

   ![wechat_2024-11-11_232336_954](/home/lty/图片/wechat_2024-11-11_232336_954.png)

2. `git revert` `git reset --soft` `git reset --hard`

   ![wechat_2024-11-11_232505_450](/home/lty/图片/wechat_2024-11-11_232505_450.png)

3. 先`git checkout`，后`git rebase`，出现冲突时解决后再`git rebase`；或者，先`git log` ，然后  `git checkout` ，最后`git cherry-pick`

![wechat_2024-11-11_232612_071](/home/lty/图片/wechat_2024-11-11_232612_071.png)
