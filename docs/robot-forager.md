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

Once you click on _"Create"_ button, Cormas will generate a package `RobotForager-Model` and a class `RFModel`. If everything goes well, a System Browser will open on this new class. Now we can start coding!

![](_media/robot-forager/3-new-model-browser.png)

## Step 2. Create a Cell class

We will start by creating a class for a cell of our spatial grid. Cell will define a location where robots and minerals can be located. To create a new class, you can right-click on any of the existing classes and select _"New class"_ from the menu. You will see a window with a template class definition.

![](_media/robot-forager/4-new-class.png)

Alsternatively, you can edit the definition of any existing class in the bottom part of the System Browser. As soon as you change the name and hit _"Save"_ (`Ctrl+S` on Windows and Linux or `Cmd+S` on Mac), the new class will be created.

![](_media/robot-forager/5-new-cell-class.png)

In our case, the cell class will be called `RFCell` (remember to use the prefix!) and it will be the subclass of `CMSpatialEntityElement` - a default superclass for spatial cells in Cormas.

```smalltalk
CMSpatialEntityElement << #RFCell	slots: {};	package: 'RobotForager-Model'
```

In our model, cells will do nothing, which is why we do not need to implement any methods for this class. By default, cells will be represented as gray squares.

We must now create a collection of cells in our model. To do that, we must edit a class definition of `RFModel` and add a new slot (instance variable). We will call it `cells` but you can choose any name you like.

```smalltalk
CMAbstractModel << #RFModel
    slots: { #cells };
    package: 'RobotForager-Model'
```

Now we will create some methods in `RFModel` class. To add a new method, click on _"instance side"_ in the third pane of the System Browser and then edit the method template in the bottom part. You can also create a new mthod by editing the code of any existing method. As soon as you change the name, the new method will be created.

![](_media/robot-forager/6-new-method.png)

First, we create an `initialize` method and initialize the `cells` variable with an empty collection. Cormas will populate this collection with actual cells once we define a spatial grid in the next section. Remember that the `RFModel >>` part is just an indication for you that this method should belond to the `RFModel` class. You must not type this part in the System Browser.

```smalltalk
RFModel >> initialize
	super initialize.
	cells := OrderedCollection new.
```

Now we must create a getter accessor for the `cells` collection. We add a pragma `<getterFor: #ClassName>` to tell Cormas that this getter is linked to the `RFCell` class.

```smalltalk
RFModel >> cells
	<getterFor: #RFCell>
	^ cells
```

## Step 3. Create a grid

Now we are ready to create a spatial grid and have a first look at our simulation. To do that, we must add two methods to our model class: at least one _"init"_ method which defines the initial scenario for our simulation and at least one _"control"_ method which defines what happens at each step of the simulation.

As we discussed at the beginning of this tutorial, we want to implement two environments: a big one with 27x27 grid and a small one with 5x5 grid. We will start with the small environment. Create a new method in the `RFModel` class and call it `initSmall`. We must add a pragma `<init>` to tell Cormas that this is one of the _"init"_ methods. Then we use a method provided by the superclass to define the spatial grid. We specify the number of rows and columns, the size of the neighbourhool (in this case, there are two options: 4 or 8; neighbourhood of size 4 means that only north, south, east, and west cells are considered as neighbours; neighbourhood of size 8 includes diagonal cells such as north-east, north-west, etc.). Finally, we pass `true` as a last parameter telling Cormas that the environment should be closed - the agents won't be able to walk over the edge of the grid (if the environment is _"open"_, the agents can cross the left edge and appear on the right or cross the top edge and appear in the bottom. 

```smalltalk
RFModel >> initSmall
	<init>
	self
		createGridNumberOfRows: 5
		numberOfColumns: 5
		neighbourhood: 8
		closed: true.
```

We must create at least one _"control"_ method. We will call it `step` and leave it empty for now. We add a pragma `<control>` to tell Cormas that this is one of the control methods.

```smalltalk
RFModel >> step
	<control>
	"do nothing"
```

## Step 4. First look at a simulation

Now we can open the simulation view and take a first look at our model. Select _"Models in this image"_ from the _"Cormas"_ menu in the top left corner.

![](_media/robot-forager/7-models-in-image-menu.png)

Then select your model from the list (in our case, it's `RFModel`) and click on _"Open Simulation"_ button.

![](_media/robot-forager/8-models-in-image.png)

You will see the Cormas Simulation browser. The left side allows you to initialize the simulation. Here you can select the _"init"_ and _"control"_ methods that will be executed, fix the random seed, modify parameters of the model (we don't have any parameters at this point). The right side of the window is currently empty because the simulation was not initialized yet.

![](_media/robot-forager/9-simulation.png)

In our case, we have only one _"init"_ method: `initSmall` anb only one _"control"_ method: `step`. They are selected by default, so you can simply click the _"Initialize simulation"_ button. You will see a 5x5 grid with instances of `RFCell` class that were created in the `initSmall` method. Every cell is gray because this is the default color in Cormas. If you click on _"Step"_ button in the top part of the Simulation window, the _"control"_ method (in this case, `step`) will be executed. Our `step` method is empty, so nothing will happen.

![](_media/robot-forager/10-simulation-initialized.png)

Every cell is a live object, you can right-click on it and select _"Inspect"_ from the menu. This will open an interactive inspector for the selected cell.

![](_media/robot-forager/11-inspect-cell.png)

You can also select the _"Inspector"_ tab of the Simulation window. This will open the inspector of the simulation object. This object has an instance variable called `cormasModel`. If you click on it, you will open an inspector of your `RFModel` instance in a separate pane. If you click on the `cells` variable, you will inspect the collection of cells.

![](_media/robot-forager/12-simulation-inspector.png)

## Step 5. Add robots

Open SystemBrowser again and create a new class called `RFRobot`. It should be a subclass of `CMAgent` - a common superclass for all Cormas agents. Since we want our agent to be located on the grid, we will use the trait `TCMLocated` which will insert all the methods for spatial interaction into our class. [Traits](https://github.com/pharo-open-documentation/pharo-wiki/blob/master/General/Traits.md) are composable units of behavior that are used in Pharo as an alternative to multiple inheritance. They allow us to group methods related to certain functionalities and reuse them in classes that belong to different inheritance hierarchies.

```smalltalk
CMAgent << #RFRobot	traits: {TCMLocated};	slots: {};	package: 'RobotForager-Model'
```

We add a _"pov"_ (point of view) method to describe how the agent should be visualized on the grid. Cormas allows you to define many different points of view methods and change them while the simulation is running. We will call this method `pov` but you can choose any name you like. The only requirement is to include a `<pov>` pragma. Our method will return an instance of a `CMPointOfView` class specifying that the color of our agents should be blue and the shape should be a _"star"_. We will use the colors defined in `CMColor` class instead of the standard Pharo `Color` because they are more aesthetic.

```smalltalk
RFRobot >> pov
	<pov>
	^ CMPointOfView
		color: CMColor blue
		shape: #star.
```

Now we must add robots to our model and tell Cormas how to instantiate them. First, we add an instance variable `robots` to our `RFModel` class.

```smalltalk
CMAbstractModel << #RFModel	slots: { #cells . #robots };	package: 'RobotForager-Model'
```

We update the `initialize` method to assign an empty `OrderedCollection` to this variable.

```smalltalk
RFModel >> initialize	super initialize.	cells := OrderedCollection new.	robots := OrderedCollection new
```

Then we define a getter accessor for this collection. Remember to include the `<getterFor:>` pragma.

```smalltalk
RFModel >> robots	<getterFor: #RFRobot>	^ robots
```

Now we add one line to the end of our `initSmall` method telling Cormas to create two robots located randomly on the grid but only in those cells that are not occupied by other agents (the cells where robots would be _"alone"_.

```smalltalk
RFModel >> initSmall    <init>    self        createGridNumberOfRows: 5        numberOfColumns: 5        neighbourhood: 8        closed: true.	self createN: 2 randomlyLocatedAloneEntities: RFRobot.
```

Now, when you open (or simply re-initialize) your simulation, you should see two robots located somewhere on the grid.

![](_media/robot-forager/13-adding-robots.png)