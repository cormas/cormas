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

In this tutorial, you will learn how to create a **repository** (project) on GitHub, add your Pharo packages to this repository, commit your changes and push them to the remote reposiitory, pull changes that are made by others.

## Should You Publish Your Models on GitHub?

## GitHub with Cormas Tutorial

### Step 1. Create a GitHub account

If you don't have one already, you should create your GitHub account.
To do that, go to <https://github.com/signup> and follow the instructions.
It is simple and straightforward and the entire process will take you less than 5 minutes.

### Step 2. Generate SSH keys

### Step 3. Open Iceberg and Add Your SSH Keys

Working with Git in Pharo is very easy thanks to the Git Repositories Browser tool called Iceberg, which is included in any modern Pharo image.

### Step 4. Load Your Repository With Iceberg

### Step 5. Set Up a Pharo Project in Your Repository

### Step 6. Create Packages and Write Some Code

### Step 7. Write Tests

### Step 8. Add Your Packages to Iceberg

### Step 9. Commit and Push

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