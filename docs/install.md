# Cormas Installation Guide

Cormas is an agent-based modelling and simulation platform running on top of the Pharo programming environment. To install Cormas, you must first install Pharo, create a new image, and then run the installation script to load Cormas. This chapter will guide you through this process.

> **TL;DR** If you are not new to Pharo, just run this script in the Playground and you're done :smile:
> 
> ```smalltalk
> Metacello new
    repository: 'github://cormas/cormas';
    baseline: 'Cormas';
    load.
> ```

## Installing Pharo

### Step 1: Install Pharo Launcher

The easiest way to install and run Pharo is with **Pharo Launcher** - an application that can be used for creating and managing Pharo images. It can be downloaded from [https://pharo.org/download](https://pharo.org/download). Follow the instructions on the website to install Pharo Launcher on your computer. Once the installation is complete, open Pharo Launcher. You should see the window similar to this:

![Pharo Launcher](_media/install-cormas/1-empty-pharo-launcher.png)

![Create new image in Pharo Launcher](_media/install-cormas/2-pharo-launcher-new-image.png)

![Launch the image](_media/install-cormas/3-pharo-launcher-launch-image.png)

![Pharo image](_media/install-cormas/4-empty-pharo.png)

## Installing Cormas

![Open Playground](_media/install-cormas/5-open-playground.png)

![Empty Playgrond](_media/install-cormas/6-empty-playground.png)

```smalltalk
Metacello new
    repository: 'github://cormas/cormas';
    baseline: 'Cormas';
    load.
```

![Run Metacello Script](_media/install-cormas/7-run-metacello-script.png)

![Cormas is installed](_media/install-cormas/8-cormas-installed.png)