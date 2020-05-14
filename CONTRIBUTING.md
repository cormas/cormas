# Contribution Guide for CORMAS

*This file is currently not complete but will be improve step by step.*

You need to download Pharo 8.0 first.

## Setup Iceberg
You need an ssh key in order to commit on github. Open Iceberg tool, and then click on the settings. Check the box : "Use custom SSH keys".

## Fork the CORMAS repository

All changes you'll do will be versionned in your own fork of the [CORMAS repository](https://github.com/cormas/cormas). Then, from your fork you'll be able to issue pull requests to CORMAS, where they will be reviewed, and luckily, integrated.

Go to Cormas github's repository and click on the fork button on the top right. Yes, this means that you'll need a github account to contribute to CORMAS.

## Add main CORMAS repository as remote

Open Iceberg, open CORMAS repository, click on repositories, then + button (add remote).

Remote name: cormas-upstream

Remote URL: https://github.com/cormas/cormas.git

## Load your fork version of CORMAS in your image
In your Pharo 8.0 image, load now the last development version of CORMAS :

```Smalltalk
Metacello new
        onWarningLog;
        githubUser: 'XXX' project: 'cormas' commitish: 'master' path: 'repository';
        baseline: 'Cormas';
        load
```
where you replace XXX with your github user name.

## Send some changes to the original CORMAS repository

#### From Pharo Iceberg
After doing modifications in your image, open Iceberg tool, commit the changes in your CORMAS repository. Cherry-pick the modifications that you want to include in your commit. Then push your commit to your fork. It's more convenient to divide your changes in meaninfull and simple commits, which makes it easier to check for those who need to proofread it.

![iceberge](img/iceberg_pharo.png)

#### From Github UI
In the GitHub interface, create a Pull Request from your commit.
You have to give some information about what is the purpose of you pull request. Then submit it to CORMAS main repository. 
This will notify CORMAS core developers team that an improvement or bug fix is pending.

![iceberge](img/github_pr.png)

### Sync your fork ull change from cormas/cormas in your own fork
After a while, changes from other developers are integrated in the main CORMAS repository and your fork became out of sync.
In order to do that, you need the fetch the last modifications from the main CORMAS repository, merge them in your image and then push them in your fork repository.



You have also the possibility to delete your fork and fork again the main CORMAS repository.

## Cleanups
Ounce your pull request is integrated, some cleanups are maybe required:
- remove your branch from your fork
- close the issue (tips: you can automatically close the issue n, by inserting the sentence: **close #n** when you merge your pull request).

# Release management (not used at the moment)

This project use semantic versionning to define the releases, meaning that each stable release of the project will be assigned a version number of the form `vX.Y.Z`.

- **X** define the major version number
- **Y** define the minor version number
- **Z** define the patch version number

- When a release contains only bug fixes, the patch number is incremented;
- When the release contains new backward compatible features, the minor version is incremented;
- When the release contains breaking changes, the major version is incremented.

Thus, it should be safe to depend on a fixed major version and moving minor version of this project.

# Branch management (to be defined)
