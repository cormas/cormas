# Cormas Installation Guide

Cormas is an agent-based modelling and simulation platform running on top of the Pharo programming environment :partying_face:. To install Cormas, you must first install Pharo, create a new image, and then run the installation script to load Cormas. This chapter will guide you through this process.

## Installing Pharo

### Step 1: Install Pharo Launcher

The easiest way to install and run Pharo is with **Pharo Launcher** - an application that can be used for creating and managing Pharo images. It can be downloaded from [https://pharo.org/download](https://pharo.org/download). Follow the instructions on the website to install Pharo Launcher on your computer. Once the installation is complete, open Pharo Launcher. You should see the window similar to this:

![]()

## Installing Cormas

> **Note:** To get most up-to-date instructions on how to install Cormas, please refer to its GitHub repository [https://github.com/cormas/cormas](https://github.com/cormas/cormas).

```smalltalk
Metacello new
    repository: 'github://cormas/cormas';
    baseline: 'Cormas';
    load.
```