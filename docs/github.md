# Saving and Sharing Your Cormas Models on GitHub

**Version control systems** (VCS) are certainly among the most important instruments in any modern programmer's toolkit.
They help us keep track of all the changes that we make to our code in the form of **commits**, saving them on a **remote** server, and thus making sure that nothing is ever lost and any bad change can always be reverted.
They also let us share our code with others, making it easy for multiple programmers to collaborate on the same piece of source code and managing any potential **conflicts** (for example, when two people try to modify the same lines of code simultaneously).

**Git** is by far the most popular version control system today.
It was originally created by Linus Torvalds to support the development of the first Linux kernel.
Git is free and open-source, anyone can install it on their computer and use it in their projects.
If you want to learn more about Git, I highly recommend you to read the first chapters of the official [Git Book](https://git-scm.com/book/).
It is free and available in different formats (online, PDF, EPUB) and many different languages.

Although you can use Git locally on your computer or host it on your own server, most people use free online platforms such as [GitHub](https://github.com/) or [Gitlab](https://gitlab.com/).

![Intuition behing GitHub](_media/github/0-intuition.png)

In this tutorial, you will learn how to create a **repository** (project) on GitHub, add your Pharo packages to this repository, commit your changes and push them to the remote reposiitory, pull changes that are made by others.

> **Fun fact:** The creature on the image above is called an _Octocat_. It is the official mascot of GitHub - a cat with eight tentacles.

## Should You Publish Your Models on GitHub?

## GitHub with Cormas Tutorial

### Step 1. Create a GitHub account

If you don't have one already, you should create your GitHub account.
To do that, go to <https://github.com/signup> and follow the instructions.
It is simple and straightforward and the entire process will take you less than 5 minutes.

![GitHub Sign Up](_media/github/1-github-signup.png)

### Step 2. Generate SSH keys

When you use GitHub in your project, you will need to authenticate to your account (prove that it is actually you and not someone else).
In the past, you could enter your login and password, but now GitHub requires something called a _"personal access token"_ instead of password because it is more secure (more information: [About authentication to GitHub](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/about-authentication-to-github)).

An alternative way of authentication is by using SSH keys. We recommend this aproach because, even though it may take a couple minutes to set up, it will save you time in the long run.

You will start by generating a pair of secure keys on your computer: _a public key_ and _a private key_. Then you will add the public key to your GitHub account. Every time you will use GitHub on your computer, it will compare the public and private keys and as long as they align, authentication will happen automatically.

> In other words, SSH keys are a very secure way to make GitHub remember your computer and not have to ask you for passwords or personal tokens.

On GitHub Docs there is a very detailed guide on [Connecting to GitHub with SSH](https://docs.github.com/en/authentication/connecting-to-github-with-ssh). It is adapted to each operating system: Windows, Linux, or Mac. Specifically, you need to follow those three steps:

1. [Checking for existing SSH keys](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/checking-for-existing-ssh-keys)
2. [Generating a new SSH key and adding it to the ssh-agent](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)
3. [Adding a new SSH key to your GitHub account](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account)

After completing those steps, you should have two files on your computer: one with public and one with private ssh key. Remember their location because you will need to specify it in the next step. For example, for me those are:

- `/Users/zaitsev/.ssh/id_ed25519` _(private key)_
- `/Users/zaitsev/.ssh/id_ed25519.pub` _(public key)_ 

?> If you have trouble following those steps, do not hesitate to ask a question on [our Discord server](contact).

### Step 3. Open Iceberg and Add Your SSH Keys

To work with GitHub from within Cormas, we use a tool called Iceberg (Git Repositories Browser) which is included in any modern Pharo image.
Iceberg allows you to load different git repositories, keep track of all your changes, prepare commits, push those commits to a remote server, and pull commits that were made by others.
Let us start by opening Iceberg.
To do that, in your Cormas image, you should select _"Browse"_ in the top menu and then click on _"Git Repositories Browser"_.
Alternatively, you can use a shortcut: _Ctrl+OI_ on Windows and Linux or _Cmd+OI_ on Mac.

![Open Iceberg](_media/github/2-open-iceberg.png)

Before using Iceberg, you must first specify the location of your SSH keys.
This way, Iceberg will be able to perform authentication when you push changes to your repositories.

![Iceberg](_media/github/3-iceberg.png)

![Iceberg Settings](_media/github/4-iceberg-settings.png)

### Step 4. Create a GitHub Repository

![GitHub new repository button](_media/github/5-github-new-repository-button.png)

![Create new repository on GitHub](_media/github/6-github-create-new-repository.png)

![Github repository](_media/github/7-github-repository.png)

### Step 5. Load Your Repository With Iceberg

![Add Repository to Iceberg](_media/github/8-iceberg-add.png)

![Clone repository](_media/github/9-iceberg-clone-repository.png)

### Step 6. Set Up a Pharo Project in Your Repository

![Repair repository](_media/github/10-iceberg-repair-repository.png)

![Create project metadata](_media/github/11-iceberg-create-project-metadata.png)

Now you must select the directory in which the source code of your project will be stored.
You are free to choose the root directory (`robot-forager-model`) but it is a good practice to keep code separate from documentation and other files in your repository.
We recommend you to create a new directory called `src` and save your code there.
To add a new directory, click on the _"Add"_ button. 

![Add src directory](_media/github/12-iceberg-add-directory.png)

![Select src directory](_media/github/13-iceberg-src-directory.png)

> **Deeper understanding** _(optional)_ : To see what happened, open the directory on your computer where Cormas image is located. You can find its path by executing `FileSystem workingDirectory` in the Playground and printing the result. Then navigate to `pharo-local/iceberg/<your github user name>/robot-forager-model`. Here you will find the contents of your repository (we call it the _local copy_). You will notice that the `src` directory was created, along with a file called `.project`. This file contains one entry, specifying that the code of your project will be located in the `src` directory.
> 
> ```
> {
>   'srcDirectory' : 'src'
> }
> ```
> Inside the `src` directory, you will also find the `.properties` file specifying that the source code of your project should be stored in [Tonel format](https://github.com/pharo-vcs/tonel).
>
> ```
> {
>   #format : #tonel
> }
> ```
> Those two files are called _"project metadata"_. They help Iceberg understand how to extract packages, classes, and methods from your repository.

### Step 7. Create Packages and Write Some Code

```smalltalk
CMSpatialEntityElement << #RFCell	slots: {};	package: 'RobotForager-Model'
```

```smalltalk
pov	<pov>	^ CMPointOfView color: Color lightGray
```

![Create a package and write code](_media/github/14-write-code.png)

### Step 8. Add Your Packages to Iceberg

![Add package to repository](_media/github/15-iceberg-add-package-button.png)

![Select package](_media/github/16-iceberg-select-package.png)

### Step 9. Commit and Push

![Commit](_media/github/17-iceberg-commit.png)

![Enter commit message and push](_media/github/18-iceberg-commit-message.png)

![Code critics](_media/github/19-iceberg-critiques.png)

### Step 10. Add a Baseline

### Step 11. Load Your Project in a New Pharo Image

### Step 12. Make Changes in a New Image

### Step 13. Pull Your Changes Into the Old Image

## Related Materials

Source code and documentation of Iceberg on GitHub: https://github.com/pharo-vcs/iceberg

### Videos from Pharo MOOC

_(complete Pharo MOOC: [Live Object Programming in Pharo](https://www.fun-mooc.fr/en/courses/live-object-programming-pharo/) - available in English and French)_

- [Git: New project creation](https://youtu.be/k5KlIzAeqfA)
- [Git: Creating a remote repository to an existing project](https://youtu.be/GzwmGyW6a54)
- [Git: Loading a project with Metacello](https://youtu.be/Q7CiFN3Q12A)

### Pharo Wiki

- [A detailed guide on Baselines](https://github.com/pharo-open-documentation/pharo-wiki/blob/master/General/Baselines.md)
- [Setting up your continuous integration via GitHub Actions](https://github.com/pharo-open-documentation/pharo-wiki/blob/master/General/GithubActions.md)