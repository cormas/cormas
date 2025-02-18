# Robot-Forager Tutorial

In this tutorial, you will learn how to build a very simple model in Cormas.
This model is composed of three elements:

1. A square grid of cells
2. Minerals that can be located in those cells
3. Robots that move across the cells and collect minerals

![](_media/robot-forager/0-example-space.png)

To make the model description more precise:

- Multiple robots should never appear on the same cell
- Multiple minerals should never appear on the same cell
- When model is initialized, first we generate robots and then minerals. A mineral cannot be generated on a cell where robot is located.

At each simulation step, all robots perform two actions:

- **Move.** Look around at 8 neighbor cells, if any one of them contains a mineral, move to that cell. If no neighbor has minerals, then move randomly to any of the 8 neighbors.
- **Collect minerals.** Look at the cell on which robot is located (after moving). If this cell has a mineral, then collect it (add it to robot’s inventory and remove it from the cell)
Otherwise do nothing.

Robots perform their actions asyncronously, meaning that as soon as the robot sees a mineral, it moves to the nighbour cell and collects the mineral, without waiting for other robots to make their decision. If this was not the case, we could arrive at a situation when two robots move to the same cell to collect the same mineral.

We will implement two environments: 

- **Small environment:** 5x5 cells, 2 robots, 20 minerals
- **Large environment:** 27x27 cells, 10 robots, 200 minerals.

## Step 1. Create a new model 

If you haven't donne so already, you can [Install Cormas](install) then open a Cormas image. Click on _"Cormas"_ menu in the top left corner and select _"New Model"_.

![](_media/robot-forager/1-new-model-menu.png)

Type the name of your model. In our case, we will call it _"Robot Forager"_. All classes in Pharo exist in the same namespace, which means that every class must have a unique name. To ensure this, we follow a good practice of adding a project-specific prefix to every class name. Cormas will automatically suggest a prefix for your model classes, in our case, it suggests _"RF"_. Feel free to edit this prefix. In the bottom part of the window, you will see the packages and classes that will be generated for you. By default, Cormas will also generate test classes, but we will not use them in this tutorial, which is why we uncheck the _"Create a test package"_ checkbox. We also add a simple description for our model using [Microdown](https://github.com/pillar-markup/Microdown) (you can also write it in Markdown or in plain text).

![](_media/robot-forager/2-new-model.png)

Once you click on _"Create"_ button, Cormas will generate a package _"RobotForager-Model"_ and a class _"RFModel"_. If everything goes well, a System Browser will open on this new class. Now we can start coding!

![](_media/robot-forager/3-new-model-browser.png)

## Step 2. Create a Cell class

We will start by creating a class for a cell of our spatial grid. Cell will define a location where robots and minerals can be located. To create a new class, you can right-click on any of the existing classes and select _"New class"_ from the menu. You will see a window with a template class definition.

![](_media/robot-forager/4-new-class.png)

Alsternatively, you can edit the definition of any existing class in the bottom part of the System Browser. As soon as you change the name and hit _"Save"_ (_Ctrl+S_ on Windows and Linux or _Cmd+S_ on Mac), the new class will be created.

![](_media/robot-forager/5-new-cell-class.png)

In our case, the cell class will be called _"RFCell"_ (remember to use the prefix!) and it will be the subclass of _"CMSpatialEntityElement"_ - a default superclass for spatial cells in Cormas.

```smalltalk
CMSpatialEntityElement << #RFCell	slots: {};	package: 'RobotForager-Model'
```