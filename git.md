## Create branch dev

```
git checkout -b dev
```

## List branch

```
git branch
```

## Merge dev to master

```
git checkout master 
git merge dev
git push -u origin master
```

## Repository

```
git remote -v
```

## Revert file

> error: Your local changes to the following files would be overwritten by merge:

```
git checkout HEAD^ file/to/overwrite
git pull
```
