# Git Application Answers

## Question 1: Reverting Modifications

### Method 1: Using git restore
Discard changes in working directory for specific file
git restore <filename>
Discard all changes in working directory
git restore .
![Method 1: git restore step 1](images/method1-restore-1.png)
![Method 1: git restore step 2](images/method1-restore-2.png)
![Method 1: git restore step 3](images/method1-restore-3.png)

### Method 2: Using git reset and git checkout
Unstage files but keep changes in working directory
git reset
Discard all changes in working directory
git checkout -- .
![Method 2: git reset and checkout](images/method2-reset-checkout.png)

### Method 3: Using git reset --hard
Completely reset to last commit (loses all changes)
git reset --hard HEAD
![Method 3: git reset --hard](images/method3-reset-hard.png)

## Question 2: Reverting Commits

### Without Modifying History:

#### Method 1: Using git revert
Create a new commit that undoes the changes
git revert <commit-hash>
#### Method 2: Using git restore with specific commit
Restore files to previous commit state
git restore --source=HEAD~1 <filename>

![Revert without modifying history 1](images/question2-method1-1.png)
![Revert without modifying history 2](images/question2-method1-2.png)

### Modifying History:

#### Method 1: Using git reset –soft
Move HEAD back but keep changes staged
git reset --soft HEAD~1

#### Method 2: Using git reset –hard
Completely remove the last commit and all changes
git reset --hard HEAD~1

![Revert modifying history 1](images/question2-method2-1.png)
![Revert modifying history 2](images/question2-method2-2.png)

## Question 3: Branch Merging Methods

### Method 1: Merge Commit
Standard merge creating a merge commit
git checkout main
git merge feature-branch

![Standard merge](images/question3-merge-1.png)

### Method 2: Rebase and Fast-forward
Rebase feature branch onto main
git checkout feature-branch
git rebase main
Fast-forward merge
git checkout main
git merge feature-branch

![Rebase and fast-forward](images/question3-merge-2.png)

### Method 3: Squash Merge
Squash all commits from feature branch into one
git checkout main
git merge --squash feature-branch
git commit -m "Squashed feature branch"

![Squash merge](images/question3-merge-3.png)
