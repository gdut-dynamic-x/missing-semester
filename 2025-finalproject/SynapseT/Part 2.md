# 二：

1. ：
   
   ```
   git reset HEA后git checkout -- .
   ```
   
   ***或者***
   
   ```
   git reset --hard HEAD
   ```

![eg](./images/Screenshot%20from%202025-11-11%2013-19-01.png)
![eg](./images/Screenshot from 2025-11-11 13-22-47.png)

---

2. ：

```
不修改历史的方式：git reset HEAD
  git reset <commit-hash>
修改历史的方式：git rebase -i HEAD~1
  git reset --hard HEAD
```

![eg](./images/Screenshot from 2025-11-11 13-14-52.png)
![eg](./images/Screenshot from 2025-11-11 00-42-33.png)
![eg](./images/Screenshot from 2025-11-11 13-07-39.png)

---

3. ：
   
   ```
   git checkout main
   git cherry-pick <commit-hash>
   ```
   
   ***或者***
   
   ```
   git checkout feature-branch
   git checkout main
   git rebase feature-branch
   ```
   
   ![eg](./images/Screenshot from 2025-11-11 13-01-51.png)
   ![eg](./images/Screenshot from 2025-11-11 00-32-15.png)
