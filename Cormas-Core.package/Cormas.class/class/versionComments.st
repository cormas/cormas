version
versionComments
	
	^'
 --------------------- 2011/2/13 - 16:22:57 --------------------- 
- CormasModel as subclass of ApplicationModel.
- Entity class : chooseActivityDiagramEditorToReOpen
- Add this new Cormas version utility (with developer name):
Cormas class : 
		update updateVersion method.
		create #updateComments method.
		create #versionComments method.
		add developerNames methods.
		new menu, displayCormasVersion
CommentInterface: add one new interface for this comment.
 *** Developer: Pierre Bommel ***
 --------------------- 2011/2/14 - 3:11:52 --------------------- 
finalize the Comments Version utility
 *** Developer: Pierre Bommel ***
 *** kernel FileName: Kernel-v.2011214 - ooo.st ***
 --------------------- 2011/2/14 - 5:55:48 --------------------- 
Comments utilities + kernel filename

 *** Developer: Pierre Bommel ***
 *** kernel FileName: Kernel-v.2011214 - commentVersion.st ***
 --------------------- 2011/2/14 - 6:14:5 --------------------- 
Display the Cormas contributors into "about Cormas" window
 *** Developer: Pierre Bommel ***
 *** kernel FileName: Kernel-v.2011214 - contributors.st *** 
 --------------------- 2011/2/17 - 15:55:21 --------------------- 
Allows to create and manipulate Arcs on the grid.
New classes :
  - ToolConditionType
  - ConditionTransitionTable
Modifications on classes :
  - Tool : #initializeCreateEntityTool
  - SpaceInterface createStartArcEntityOn
  - CreateInstances : nouvelle var de classe : entityClass pour √™tre facilement accessible depuis le Tool. #createInstancesOnCell:aCell. modif de l"interface

Other small modifications: manipulate locatedObjects when aggregated POV is selected
  - SpaceView #spatialAgregateFigureAt:
  - Figure #isMovedTo:
  - CompositeEntityFigure #celluleFigureAt:
  - SpaceViewZoom #zoomTo: aSetOfPovs
 *** Developer: Pierre Bommel ***
 *** kernel FileName: Kernel-v.2011217 - ArcManipulation.st ***
 --------------------- 2011/2/17 - 17:1:23 --------------------- 
Small corrections:
  - Tool #initializeCreateEntityTool
  - CreateInstances #changeEntity to display the entity figure in the interface
  - ArcEntity #startNodeType & #stopNodeType
 *** Developer: Pierre Bommel ***
 *** kernel FileName: Kernel-v.2011217 - 155521.st ***
 --------------------- 2011/2/18 - 8:53:23 --------------------- 
Improvement of CreateIntances: A Click on [+] button of spaceInterface will open the CreateInstanceInterface.
   By default, the number of instances to create is not limited (number= a character different from number)
	
  - Tool #initializeCreateEntityTool
  - CreateInstances #isNbEntitiesToCreatePositive; #numberEntitiesToCreate ; ...
  - SpaceInterface: organization of tool hotdraw; #createInstancesController:
  - creation of some traduction messages (file all.lbl)
 *** Developer: Pierre Bommel ***
 *** kernel FileName: Kernel-v.2011217 - createInstances.st ***
 --------------------- 2011/2/28 - 3:30:6 --------------------- 
Manipulation interface (***  Nicolas B√©cu ***).
Some very few modifications
 *** Developer: Pierre Bommel ***
 *** kernel FileName: Kernel-v.2011218 - nico.st ***
 --------------------- 2011/3/3 - 20:16:40 --------------------- 
Activity diagrams are saved via compiled methods. A new method (#bidon for ex) is created as instance method of the Agent, and an activity method (#activity_bidon for ex) is created at the class level of the agent.
Main work in ActivityDiagramEditor.

bug correction on #stepSynchronouslyCA:
 *** Developer: Pierre Bommel ***
 *** kernel FileName: Kernel-v.2011228 - activityDiag_OK.st ***
 --------------------- 2011/3/4 - 5:32:54 --------------------- 

 *** Developer: Pierre Bommel ***
 *** kernel FileName: Kernel-v.activityDiag_OK.st ***
 --------------------- 2011/3/4 - 8:13:6 --------------------- 
Integrating Nico"s modifications for the manipulation tool (not finalized).
 *** Developer: Pierre Bommel ***
 *** kernel FileName: Kernel-v.201134 - IntegratingNB.st ***
 --------------------- 2011/3/15 - 21:8:2 --------------------- 
Small changes:
 - initializeInspectTool
 - setText for the figures
 *** Developer: Pierre Bommel ***
 *** kernel FileName: Kernel-v.201134 - 8136.st ***
 --------------------- 2011/3/23 - 15:34:5 --------------------- 
Options on ChartInterface : 
	display markers, auto scale Y axis & display legend.
 *** Developer: Pierre Bommel ***
 *** kernel FileName: Kernel-v.2011315 -chartInterfaceOption.st ***
 --------------------- 2011/3/24 - 4:10:21 --------------------- 
POV are saved as class method into #pov symbol category. Is compatible with .ev files
 *** Developer: Nicolas B√©cu ***
 *** kernel FileName: Kernel-v.2011323 - povSymbol.st ***
 --------------------- 2011/4/1 - 5:37:53 --------------------- 

 *** Developer: Pierre + Nicolas + CLP ***
 *** kernel FileName: Kernel-v.2011324 - collective.st ***
 --------------------- 2011/4/1 - 6:32:16 --------------------- 
 reviseSystemSilently when new classes are created
 *** Developer: Pierre + Nicolas + CLP ***
 *** kernel FileName: Kernel-v.201141-collective.st ***
 --------------------- 2011/4/1 - 8:3:16 --------------------- 
Version without French
 *** Developer: Pierre + Nicolas + CLP ***
 *** kernel FileName: Kernel-v.201141 without French.st ***
 --------------------- 2011/4/2 - 13:36:34 --------------------- 
- First version compatible with VW 7.7.
- Cormas automatically opened at starting (after parcels loading). See Cormas #postLoadActions.
- Only 1 Cormas item in VisualLauncher menu.
 *** Developer: Pierre Bommel ***
 *** kernel FileName: Kernel-v.201141 - vw7.7.st ***
 --------------------- 2011/4/6 - 16:38:46 --------------------- 
 - The "+" tool to add manualy new agents on the grid has been improved : "any kind" works...   Manipulate is more direct now (click and move directly), shift to move several entities.

 - The install procedure ends on Comas interface and proposes to save the image after having clean-up all the install windows.

 - With WV7.7, a new bug: PovSetterNotebook bugs... Into Cormas #openPovSetterGUI, on  PovSetterNotebook new openOn: self currentModel... to be solved...  :(
 *** Developer: Pierre Bommel ***
 *** kernel FileName: Kernel-v.201141 - vw7.7 bis.st ***
 --------------------- 2011/4/7 - 20:26:21 --------------------- 
- Displaying aggregates delimitors do not remove anymore the cell figures.
- Manipulation of entities on the grid: select and move directly
 *** Developer: Pierre Bommel + Nicolas Becu ***
 *** kernel FileName: Kernel-v.201146 - delimitor.st ***
 --------------------- 2011/4/17 - 6:48:40 --------------------- 
- ZoomInterface is more precise.
- SpaceInterface opens respecting the spaceModel dimensions
- Parcel can be saved with overrides !
 *** Developer: Pierre Bommel ***
 *** kernel FileName: Kernel-v.201147 - zoomInterface.st ***
 --------------------- 2011/4/17 - 6:48:40 --------------------- 

 *** Developer: Pierre Bommel ***
 *** kernel FileName: Kernel-v.201147 - zoomInterface.st ***
 *** VW compatibility: 7.6 ***
 --------------------- 2011/4/17 - 16:28:25 --------------------- 
- Debug: #saveImage at the end of installation with the right filename
 *** Developer: Pierre Bommel ***
 *** kernel FileName: Kernel-v.2011417 - saveImage.st ***
 *** VW compatibility: 7.6 ***
 --------------------- 2011/4/18 - 5:53:3 --------------------- 
Key shortcuts for inspect and manipulate spaceInterface tools
Multiple select of entities with manipulate tool

 *** Developer: Pierre Bommel + Nicolas Becu ***
 *** kernel FileName: Kernel-v.2011417 - 162825.st ***
 *** VW compatibility: 7.6 ***
 --------------------- 2011/6/23 - 8:37:47 --------------------- 
mise en commun NB + PB
 *** Developer: Pierre Bommel + Nicolas Becu ***
 *** kernel FileName: Kernel-v.2011-06-23.st ***
 *** VW compatibility: 7.6 ***
 --------------------- 2011/7/11 - 2:24:38 --------------------- 
- New way of setting the attribut accessors
- Analysis table (not finished)
 *** Developer: Pierre Bommel ***
 *** kernel FileName: Kernel-v.2011623 - 83747.st ***
 *** VW compatibility: 7.6 ***
 --------------------- 2011/9/3 - 15:32:16 --------------------- 
New default attribut setter.
 *** Developer: Pierre Bommel ***
 *** kernel FileName: Kernel-v.2011711 - 22438.st ***
 *** VW compatibility: 7.6 ***
 --------------------- 2011/9/4 - 17:55:8 --------------------- 
New grid to add attributes and default values.
 *** Developer: Pierre Bommel ***
 *** kernel FileName: Kernel-v.201193 - 153216.st ***
 *** VW compatibility: 7.6 ***
 --------------------- 2011/9/5 - 16:25:36 --------------------- 
minor corrections
 *** Developer: Pierre Bommel ***
 *** kernel FileName: Kernel-v.201194 - 17558.st ***
 *** VW compatibility: 7.6 ***
 --------------------- 2011/9/14 - 1:57:10 --------------------- 
Add, Remove and Rename attributes (and accessors) from the Edition Attribute Interface.
 *** Developer: Pierre Bommel ***
 *** kernel FileName: Kernel-v.201195 - 162536.st ***
 *** VW compatibility: 7.6 ***
 --------------------- 2011/9/18 - 10:47:32 --------------------- 
- Add menu of Entities: 
	- for changing abstract / concret class
	- for edition of Class Diagram
- remove from the ScenarioBuilderInterface the probes for the abstract classes
 *** Developer: Pierre Bommel ***
 *** kernel FileName: Kernel-v.2011914 - 15710.st ***
 *** VW compatibility: 7.6 ***
 --------------------- 2011/10/26 - 18:26:14 --------------------- 
Some adaptations for Mac
 *** Developer: Pierre Bommel ***
 *** kernel FileName: 18 - 10:47:32.st ***
 *** VW compatibility: 7.6 ***
 --------------------- 2011/10/26 - 18:48:42 --------------------- 
 postLoadActions for Mac
 *** Developer: Pierre Bommel ***
 *** kernel FileName: 26 - 18:26:14.st ***
 *** VW compatibility: 7.6 ***
 --------------------- 2011/11/7 - 16:16:58 --------------------- 
* DefaultAttributesSetter: 2 types of default values of the parameters:
 - the InitialValues that are set at the initialisation of a simulation
 - the DefaultValues that are predefined in the model.
* small fixes: 
 - open RB of CormasModel on firts method of #init or #control.
 - resize the spaceGrid window when proportions (X & Y) have changed
 *** Developer: Pierre Bommel ***
 *** kernel FileName: Kernel-v.20111026 - 184842.st ***
 *** VW compatibility: 7.6 ***
 --------------------- 2011/11/16 - 18:45:9 --------------------- 
Fix a bug for DefaultValue of an attribute in the case of a Dictionary
 *** Developer: Pierre Bommel ***
 *** kernel FileName: Kernel-v.2011117 - 161658.st ***
 *** VW compatibility: 7.6 ***
 --------------------- 2011/11/21 - 4:28:29 --------------------- 
Modifications on DefaultAttributesSetter (and AttributeAdder, ClassAttributeValue) for Symbol and String, but also for Array (because in VW7.6, #(1 2 3) is an immutable Array...).
 *** Developer: Pierre Bommel ***
 *** kernel FileName: Kernel-v.20111116 - 18459.st ***
 *** VW compatibility: 7.6 ***
 --------------------- 2011/11/21 - 12:33:45 --------------------- 
Fix the update Cormas
 *** Developer: Pierre Bommel ***
 *** kernel FileName: Kernel-v.20111121 - 42829.st ***
 *** VW compatibility: 7.6 ***
 --------------------- 2011/12/1 - 6:8:42 --------------------- 
New class: ParameterInterface, that displays the parameters of the model and allows to custome the interface by hidding some of them (menu Settings). These settings can be saved for future interfaces (recompile the #hiddenAttributes into CormasModel)
 *** Developer: Pierre Bommel ***
 *** kernel FileName: Kernel-v.20111201.st ***
 *** VW compatibility: 7.6 ***
 --------------------- 2012/3/20 - 9:14:10 --------------------- 
Small bug fix on Sensitivity Analysis
 *** Developer: Pierre Bommel ***
 *** kernel FileName: Kernel-v.2011121 - 6842.st ***
 *** VW compatibility: 7.6 ***
 --------------------- 2012/4/2 - 10:29:59 --------------------- 
Sensitivity Analysis can be saved using Excel
 *** Developer: Pierre Bommel ***
 *** kernel FileName: Kernel-v.2012320 - 91410.st ***
 *** VW compatibility: 7.6 ***
 --------------------- 2012/4/5 - 5:21:47 --------------------- 
update of protocols name and renaming of methods
 *** Developer: Le Page & Becu ***
 *** kernel FileName: Kernel-v.201242 - 102959.st ***
 *** VW compatibility: 7.6 ***
 --------------------- 2012/4/6 - 3:4:30 --------------------- 

 *** Developer: Le Page & Becu ***
 *** kernel FileName: Kernel-v.201245 - 52147.st ***
 *** VW compatibility: 7.6 ***
 --------------------- 2012/4/6 - 6:55:43 --------------------- 
Sensitivity Analysis is OK: works for CSV and Excel savings, and for OAT and Crossed analysis
 *** Developer: Pierre Bommel ***
 *** kernel FileName: Kernel-v.201246 - 3430.st ***
 *** VW compatibility: 7.6 ***
 --------------------- 2012/4/11 - 5:44:33 --------------------- 

 *** Developer: Pierre Bommel ***
 *** kernel FileName: Kernel-v.2012-04-11.st ***
 *** VW compatibility: 7.6 ***
 --------------------- 2012/4/11 - 10:53:18 --------------------- 
Renaming of protocols and methods in the Cormas and CormasModel classes
New methods for population metrics
 *** Developer: Nicolas Becu ***
 *** kernel FileName: Kernel-v.2012411 - 54433.st ***
 *** VW compatibility: 7.6 ***
 --------------------- 2012/4/11 - 20:21:7 --------------------- 
Debug of VW crash that occured when manipulating big grid of cells.
(SpaceView -> addAllSpatialEntities & changePov:)
 *** Developer: Nicolas Becu ***
 *** kernel FileName: Kernel-v.2012.04.12.st ***
 *** VW compatibility: 7.6 ***
 --------------------- 2012/4/12 - 8:12:49 --------------------- 
Renaming protocols and metods in the Cormas class
new methods in the utilities - string protocol of the Cormas class

 *** Developer: Nicolas Becu ***
 *** kernel FileName: Kernel-v.2012411 - 20217.st ***
 *** VW compatibility: 7.6 ***
 --------------------- 2012/4/13 - 16:2:25 --------------------- 
Renaming protocols and methods in the Cormas class
 *** Developer: Nicolas Becu ***
 *** kernel FileName: Kernel-v.2012412 - 81249.st ***
 *** VW compatibility: 7.6 ***
 --------------------- 2012/4/21 - 19:12:25 --------------------- 
Editor of attributes and of activity diagram for CormasModel.
New icons for Programming menu + edit attributes and activity diagram for CormasModel.
Direct access to PoV setter from class menu (in Entities window).
 *** Developer: Pierre Bommel ***
 *** kernel FileName: Kernel-v.2012413 - 16225.st ***
 *** VW compatibility: 7.6 ***
 --------------------- 2012/4/30 - 8:26:33 --------------------- 

With Clp adds

* Comments on Entity classes
* Glossary in Cormas "?" menu 
 *** Developer: Pierre Bommel ***
 *** kernel FileName: Kernel-v.2012421 - 191225.st ***
 *** VW compatibility: 7.6 ***
 --------------------- 2012.4.30 - 14:24:25 --------------------- 
Activity Diagrams for CormasModel
 *** Developer: Pierre Bommel ***
 *** kernel FileName: Kernel-v.2012.4.30 - 8:26:33 ***
 *** VW compatibility: 7.6 ***
 --------------------- 2012.4.30 - 14:26:56 --------------------- 
Activity Diagrams for CormasModel
 *** Developer: Pierre Bommel ***
 *** kernel FileName: Kernel-v.2012.4.30 - 8:26:33 ***
 *** VW compatibility: 7.6 ***
 --------------------- 2012.4.30 - 21:29:17 --------------------- 
New protocols for Entities: @ (manipulable methods), + (publics) and - (privates).
Minor changes: setSurround of aggregates, entitiesListing, Figure (comments of methods, deletionUpdateFrom)
 *** Developer: Pierre Bommel ***
 *** kernel FileName: Kernel-v.2012.4.30 - 14:36:15 ***
 *** VW compatibility: 7.6 ***
 --------------------- 2012.5.2 - 5:1:11 --------------------- 
* modifs to collect "info" et "pov" methods used in  graphical user interfaces (the corresponding protocols have been renamed "* pov" and "* info"
* minor changes in Cormas glossary
  - arguments in dark pink;
  - redondent Entity subclasses (GroupComm AgentCommLocation GroupCommLocation et GroupLocation ) not considered
 *** Developer: clp ***
 *** kernel FileName: Kernel-v.2012.4.30 - 21:29:17 ***
 *** VW compatibility: 7.6 ***
 --------------------- 2012.5.2 - 8:55:3 --------------------- 
bug fix on notify observers when changed
modification of add on manager help 
 *** Developer: nb ***
 *** kernel FileName: Kernel-v.2012.5.2 - 5:1:11 ***
 *** VW compatibility: 7.6 ***
 --------------------- 2012.5.3 - 8:28:44 --------------------- 
new way to create classes for the entities of the model: 
- use the "+" buttons to add classes inheriting from Cormas generic entities
- use the contextual menu ("specialize") directly on the list of model"s entities to add a class inheriting from an existing model"s class 
 *** Developer: clp ***
 *** kernel FileName: Kernel-v.2012.5.2 - 8:55:3 ***
 *** VW compatibility: 7.6 ***
 --------------------- 2012.5.4 - 19:54:39 --------------------- 
 - New way to create classes (CLP).
 - Bug fix for TrackFigure
 - Bug fix for Activity deletion
 *** Developer: Pierre Bommel ***
 *** kernel FileName: Kernel-v.2012.5.3 - 8:28:44 ***
 *** VW compatibility: 7.6 ***
 --------------------- 2012.5.6 - 12:8:14 --------------------- 
Let the user set some comments on his model"s version.
Automatic glossary for Model.
Some new menus on Cormas interface.
UpdateCormas with choices.
Creation of Entity with remarque for Specialization.
 *** Developer: Pierre Bommel ***
 *** kernel FileName: Kernel-v.2012.5.4 - 19:54:39 ***
 *** VW compatibility: 7.6 *** 
 --------------------- 2012.5.6 - 20:24:36 ---------------------

 --------------------- 2012.5.6 - 20:29:40 --------------------- 
Add Network components to PassiveEntity creation (EntityAdditionInterface)
 *** Developer: Pierre Bommel ***
 *** kernel FileName: Kernel-v.2012.5.6 - 20:24:36 ***
 *** VW compatibility: 7.6 ***
 --------------------- 2012.5.8 - 14:37:23 --------------------- 
Small stuff on AttributeAdder
 *** Developer: Pierre Bommel ***
 *** kernel FileName: Kernel-v.2012.5.6 - 20:29:40 ***
 *** VW compatibility: 7.6 ***
 --------------------- 2012.5.12 - 21:1:2 --------------------- 
- Bug fix for ImageEditor
- Remove POV menu for not situated classes
- defaultCOlor as a fonction of the class name
 *** Developer: Pierre Bommel ***
 *** kernel FileName: Kernel-v.2012.5.8 - 14:37:23 ***
 *** VW compatibility: 7.6 ***
 --------------------- 2012.5.14 - 20:27:35 --------------------- 
PoVSetter: 
   - "palette" now compatible with Mac
   - background color according to entity type
 *** Developer: Pierre Bommel ***
 *** kernel FileName: Kernel-v.2012.5.12 - 21:1:2 ***
 *** VW compatibility: 7.6 ***
 --------------------- 2012.6.5 - 19:54:23 --------------------- 
Bug fix for Aggregate swelling.
 *** Developer: Pierre Bommel ***
 *** kernel FileName: Kernel-v.2012.5.14 - 20:27:35 ***
 *** VW compatibility: 7.6 ***
 --------------------- 2012.6.9 - 7:48:38 --------------------- 

 *** Developer: Pierre Bommel ***
 *** kernel FileName: Kernel-v.2012.6.5 - 19:54:23 ***
 *** VW compatibility: 7.6 ***
 --------------------- 2012.6.11 - 20:39:18 --------------------- 
test new activityEditor
 *** Developer: Pierre Bommel ***
 *** kernel FileName: Kernel-v.2012.6.9 - 7:48:38 ***
 *** VW compatibility: 7.6 ***
 --------------------- 2012.6.12 - 11:38:45 --------------------- 
New Activity Diagram Editor with new ActivityFigure and DiamondFigure, and new way to select the activities.
 *** Developer: Pierre Bommel ***
 *** kernel FileName: Kernel-v.2012.6.11 - 20:39:18 ***
 *** VW compatibility: 7.6 ***
 --------------------- 2012.6.12 - 22:10:16 --------------------- 
Activity diagram compatibility with previous version.
 *** Developer: Pierre Bommel ***
 *** kernel FileName: Kernel-v.2012.6.12 - 11:38:45 ***
 *** VW compatibility: 7.6 ***
 --------------------- 2012.6.13 - 11:2:30 --------------------- 
add Dictionary #elementsEqual from COM into Cormas (for Mac compatibility)
 *** Developer: Pierre Bommel ***
 *** kernel FileName: Kernel-v.2012.6.12 - 22:10:16 ***
 *** VW compatibility: 7.6 ***
 --------------------- 2012.8.13 - 13:41:2 --------------------- 
Activity diagram editor: display control methods without argument
 *** Developer: Pierre Bommel ***
 *** kernel FileName: Kernel-v.2012.6.13 - 11:2:30 ***
 *** VW compatibility: 7.6 ***
 --------------------- 2012.8.13 - 17:58:53 --------------------- 
manipulation: add #allMethodsButProtocols:  #allMethodsBut:  to be compatible with protocols stating with #* ... and #+ ...
 *** Developer: Pierre Bommel ***
 *** kernel FileName: Kernel-v.2012.8.13 - 13:41:2 ***
 *** VW compatibility: 7.6 ***
 --------------------- 2012.8.20 - 11:28:28 --------------------- 
Few corrections of the PoVSetters
 *** Developer: Pierre Bommel ***
 *** kernel FileName: Kernel-v.2012.8.13 - 17:58:53 ***
 *** VW compatibility: 7.6 ***
 --------------------- 2012.8.20 - 13:39:59 --------------------- 
BitMap library compatible with Mac OS.
 *** Developer: Pierre Bommel ***
 *** kernel FileName: Kernel-v.2012.8.20 - 11:28:28 ***
 *** VW compatibility: 7.6 ***
 --------------------- 2012.8.21 - 8:58:18 --------------------- 
updateCormas that reopens the Cormas main window
 *** Developer: Pierre Bommel ***
 *** kernel FileName: Kernel-v.2012.8.20 - 13:39:59 ***
 *** VW compatibility: 7.6 ***
 --------------------- 2012.8.23 - 12:53:54 --------------------- 
Probes with predefined colors, that can be modified (and saved). New class: MultiColorChooser
 *** Developer: Pierre Bommel ***
 *** kernel FileName: Kernel-v.2012.8.21 - 8:58:18 ***
 *** VW compatibility: 7.6 ***
 --------------------- 2012.8.25 - 15:48:11 --------------------- 
 - User can now choose the color of the curves displayed by ChartsInterface. Colors are saved at CormasModel class level.
 - Contextual menu on the grid with PoV and Track (you can change the PoV of one entity, and track only this entity)
 *** Developer: Pierre Bommel ***
 *** kernel FileName: Kernel-v.2012.8.23 - 12:53:54 ***
 *** VW compatibility: 7.6 ***
 --------------------- 2012.8.28 - 10:9:38 --------------------- 
Small stuff on SensitivityAnalysis for Mac interfaces
 *** Developer: Pierre Bommel ***
 *** kernel FileName: Kernel-v.2012.8.25 - 15:48:11 ***
 *** VW compatibility: 7.6 ***
 --------------------- 2012.9.1 - 12:27:59 --------------------- 
 - New Sensitivity analysis to sort the parameters (Global sensitivity). New class: ClassifyParameter.
Analysis is runned in 2 sessions: Standard runs + Modified runs, then calculates sensitivity formula.
 - Removing an activity diagram
 *** Developer: Pierre Bommel ***
 *** kernel FileName: Kernel-v.2012.8.28 - 10:9:38 ***
 *** VW compatibility: 7.6 ***
 --------------------- 2012.9.5 - 13:18:25 --------------------- 
 - ClassifyParameter and ExcelSheet modifications
 *** Developer: Pierre Bommel ***
 *** kernel FileName: Kernel-v.2012.9.1 - 12:27:59 ***
 *** VW compatibility: 7.6 ***
 --------------------- 2012.9.13 - 14:34:43 --------------------- 
Cormas randomFloatFrom:to: & Cormas randomIntegerFrom:to:
 *** Developer: Pierre Bommel ***
 *** kernel FileName: Kernel-v.2012.9.5 - 13:18:25 ***
 *** VW compatibility: 7.6 ***
 --------------------- 2012.9.20 - 9:2:13 --------------------- 
Possibility to create random value as default value of an attribute
 *** Developer: Pierre Bommel ***
 *** kernel FileName: Kernel-v.2012.9.13 - 14:34:43 ***
 *** VW compatibility: 7.6 ***
 --------------------- 2012.9.20 - 13:35:18 --------------------- 
Can choose between SpatialEntityElement or SpatialEntityCell when creating a cell class.
 *** Developer: Pierre Bommel ***
 *** kernel FileName: Kernel-v.2012.9.20 - 9:2:13 ***
 *** VW compatibility: 7.6 ***
 --------------------- 2012.9.21 - 9:33:32 --------------------- 

 *** Developer: Pierre Bommel ***
 *** kernel FileName: Kernel-v.2012.9.20 - 13:35:18 ***
 *** VW compatibility: 7.6 ***
 --------------------- 2012.9.23 - 16:12:48 --------------------- 
Bugs fixes
 *** Developer: Pierre Bommel ***
 *** kernel FileName: Kernel-v.2012.9.21 - 9:33:32 ***
 *** VW compatibility: 7.6 ***
 --------------------- 2012.9.26 - 15:14:3 --------------------- 

 *** Developer: Pierre Bommel ***
 *** kernel FileName: Kernel-v.2012.9.23 - 16:12:48 ***
 *** VW compatibility: 7.6 ***
 --------------------- 2012.9.26 - 15:38:50 --------------------- 
AttributeAdder: Can change a default value (from the setter), just by entering the new value (and save) 
 *** Developer: Pierre Bommel ***
 *** kernel FileName: Kernel-v.2012.9.26 - 15:14:3 ***
 *** VW compatibility: 7.6 ***
 --------------------- 2012.9.27 - 9:47:0 --------------------- 

 *** Developer: Pierre Bommel ***
 *** kernel FileName: Kernel-v.2012.9.26 - 15:38:50 ***
 *** VW compatibility: 7.6 ***
 --------------------- 2012.11.24 - 10:38:16 --------------------- 
DefaultAttributesSetter -> transformAsString ok for Array
 *** Developer: Pierre Bommel ***
 *** kernel FileName: Kernel-v.2012.9.27 - 9:47:0 ***
 *** VW compatibility: 7.6 ***
 --------------------- 2012.12.4 - 3:17:5 --------------------- 
ChartsInterface with possibility to change and save the color of the local probes. (+ Entity class-colorOfVectorialPOV)
 *** Developer: Pierre Bommel ***
 *** kernel FileName: Kernel-v.2012.11.24 - 10:38:16 ***
 *** VW compatibility: 7.6 ***
 --------------------- 2012.12.11 - 4:40:44 --------------------- 
Debug DiagramChooser.
AgentLocation -> #randomWalk: radius and #randomJump
SpatialEntity -> #grid and #connexity (connexity in SpaceModel)
 *** Developer: Pierre Bommel ***
 *** kernel FileName: Kernel-v.2012.12.4 - 3:17:5 ***
 *** VW compatibility: 7.6 ***
 --------------------- 2013.2.16 - 12:38:55 --------------------- 
AgentLocation --> randomJump
Activity diagram opens independently of the running diagram
 *** Developer: Pierre Bommel ***
 *** kernel FileName: Kernel-v.2012.12.11 - 4:40:44 ***
 *** VW compatibility: 7.6 ***
bug correction on adding and removing symbols in the pov setter interface
 --------------------- 2013.2.17 - 10:48:55 --------------------- 

 *** Developer: Nicolas Becu ***
 *** kernel FileName: Kernel-v.2013.2.16 - 12:38:55 ***
 *** VW compatibility: 7.6 ***
 --------------------- 2013.2.19 - 4:38:52 --------------------- 
bug correction
-ne bug plus si on change le notify when changed alors qu"on a pas encore appliqu√© les valeurs par d√©faut (--> accepte directement la valeur par d√©faut au moment o√π l"on ferme la fenetre de cr√©ation d"une valeur par d√©faut)
-erreur dans le wayTo corrig√© 
-syntaxe des exemples dans les createEntities
-v√©rification que la m√©thode existe dans les methodes ask toDo
-n"affiche plus les accesseur dans les m√©thode de manipulation depuis l"interface spatiale

 *** Developer: Nicolas Becu ***
 *** kernel FileName: Kernel-v.2013.2.17 - 10:48:55 ***
 *** VW compatibility: 7.6 ***
 --------------------- 2013.2.20 - 16:14:41 --------------------- 
minor bug fixes
add an option in the pov setter to directly create a povMethod for a specific attribute
 *** Developer: Nicolas Becu ***
 *** kernel FileName: Kernel-v.2013.2.19 - 4:38:52 ***
 *** VW compatibility: 7.6 ***
 --------------------- 2013.2.20 - 16:31:49 --------------------- 

 *** Developer: Nicolas Becu ***
 *** kernel FileName: Kernel-v.2013.2.20 - 16:14:41 ***
 *** VW compatibility: 7.6 ***
 --------------------- 2013.2.25 - 17:23:28 --------------------- 
This version implements the Habitus module for configuring the way a user can view, manipulate and act on entities

The version also includes a new EntityInspector that enables to see all the values of an instances at a glance. The EntityInspector is linked to a Histogram chart interface and enables to view a population distribution for any numeric or symbolic attribute
 *** Developer: Nicolas Becu ***
 *** kernel FileName: Kernel-v.2013.2.20 - 16:31:49 ***
 *** VW compatibility: 7.6 ***
 --------------------- 2013.3.1 - 8:2:56 --------------------- 

 *** Developer: Nicolas Becu ***
 *** kernel FileName: Kernel-v.2013.2.25 - 17:23:28 ***
 *** VW compatibility: 7.6 ***
 --------------------- 2013.3.1 - 8:48:33 --------------------- 
ScenarioBuilder - Select a init and step method automatically if only one choice exists
changePov:ofEntity:   Optimization ->  changed from "values do:[ "  to  "do:["
changePov:ofEntity:   Optimization ->  changed from "values do:[ "  to  "do:["
createSpatialGrid now returns the new spaceInterface created
 *** Developer: Nicolas Becu ***
 *** kernel FileName: Kernel-v.2013.3.1 - 8:2:56 ***
 *** VW compatibility: 7.6 ***
 --------------------- 2013.3.2 - 0:6:3 --------------------- 

 *** Developer: Nicolas Becu ***
 *** kernel FileName: Kernel-v.2013.3.1 - 8:48:33 ***
 *** VW compatibility: 7.6 ***
 --------------------- 2013.3.22 - 10:1:16 --------------------- 
Optimization of memory allocation of VisualWorks VM
- no more growMemory request dynamically in the addAllSpatialEntities when loading a Cormas environment
- setting of the memory allocation of VW settings directly during Cormas parcel installation. objectMemory settings used :
	growthRegime 128 000 000 (instead of 32 000 000 as default)
	ObjectMemory sizesAtStartup:  #(3.0 15.0 1.0 1.0 1.0 20.0 1.0)   instead of  #(1.0 1.0 1.0 1.0 1.0 1.0 1.0)  as default 

Performance of Cormas mixt: method
Gives directly the size of the new OrderedCollection when created so that it doesn"t need to grow several times during the proceess of adding items to it
-> collTemp1 := OrderedCollection new: aCollec size.

Adds an option to have only one Refactroing Browser used to browse entities and cormasModel init and step.
When the user edits another entity, it focuses the already opened Browser on that entity insteald of opening a second one.
the user can change this setting in the Cormas Tools Menu  
 *** Developer: Nicolas Becu and Jean Fran√ßois Lefevre ***
 *** kernel FileName: Kernel-v.2013.3.2 - 0:6:3 ***
 *** VW compatibility: 7.6 ***
 --------------------- 2013.3.22 - 11:24:43 --------------------- 
Updated settings of ObjectMemory found after several tests on opening large envrironments and running simulations. The best option found is 
ObjectMemory sizesAtStartup:  #(10.0 10.0 1.0 1.0 1.0 10.0 1.0).
 *** Developer: Nicolas Becu ***
 *** kernel FileName: Kernel-v.2013.3.22 - 10:1:16 ***
 *** VW compatibility: 7.6 ***
 --------------------- 2013.3.29 - 7:39:34 --------------------- 
correction of a bug appearing in the entity inspector when an atribute"s value is an instance to an object which ios not a cormas entity
correction of a bug appearing when requesting the graph of an attribute which has a nil value or non plotable value
adds by default a control protocol for any new entity created
focus the refactoring browser on the control protocol when it is first open so that the user does"nt see the class definition when editing a class, but instead a method canevas

 *** Developer: Nicolas Becu ***
 *** kernel FileName: Kernel-v.2013.3.22 - 11:24:43 ***
 *** VW compatibility: 7.6 ***
 --------------------- 2013.4.13 - 4:0:28 --------------------- 
bug fix when opening a chart on a specific entity when using the Habitus module
correction of the syntax of examples given the ask:toDo: methods
addition of ask: aClass select: aBlockCondition toDo: aSymbol  methods in the +control protocol
bug fix on the canBeMoved option of an Entity in the Habitus module
adding the method recursiveNeighbourhood: range verifying: aBlock which has disappeared 
 *** Developer: Nicolas Becu ***
 *** kernel FileName: Kernel-v.2013.3.29 - 7:39:34 ***
 *** VW compatibility: 7.6 ***
 --------------------- 2013.4.13 - 4:5:41 --------------------- 
- Removing the use of inheritsFrom: and replacing them by tests on the class (isMoveable isSituated isSituatedClass isSpatialClass)
- Having the CreateInstances window openned and linked properly to a spaceInterface. The spaceInterface now inform of its changes (eg self changed: #windowClosed) and the objects registered to the spaceInterace (such has a createInstances window) receive those notifications
- Adding in the spaceInterface some access methods to the various properties of cormasModel in order to encapsulate the capabilities of the spaceInterface (eg classFromSymbol timeName timeUnitName)
- Adding in the spaceModel some access methods to the various properties of cormasModel in order to encapsulate the capabilities of the spaceModel (eg  timeStep timeUnitName)
- Adding the method envSpecStringFor: in the spaceModel to compute all the title of the window in one method (in ordre to limit the messages between the spaceInterface and the spaceModel)
- changing the way the timeChanged message is propagated to the different objects that needs to update. It now uses -> self changed: #timeChanged (see as well  the initialze method of cormasModel). The spaceModel propages the timeChanged message to its dependents.  -> The cormasModel is some kind of model for the spaceModel (receive notification).
- Change the initialization of a spaceInterface (setSpaceModel: aModel)
-Adding a ClientSpaceModel class which redirect some messages to the remoteSpaceModel (cellClass timeStep absoluteBounds envSpecStringFor: timeUnitName gridCellShape
 *** Developer: Jean Fran√ßois Lefevre ***
 *** kernel FileName: Kernel-v.2013.4.13 - 4:0:28 ***
 *** VW compatibility: 7.6 ***
 --------------------- 2013.4.14 - 14:58:3 --------------------- 
- new functionality to define a local probe that refers to a global probe. To do so, the local probe method has to return a symbol of the name of the global probe it refers to. The global probe has to be activated in order for the local probe to work (otherwise it returns a 0 value)
 *** Developer: Nicolas Becu ***
 *** kernel FileName: Kernel-v.2013.4.13 - 4:5:41 ***
 *** VW compatibility: 7.6 ***
 --------------------- 2013.5.9 - 7:26:51 --------------------- 

 *** Developer: Nicolas Becu ***
 *** kernel FileName: Kernel-v.2013.4.14 - 14:58:3 ***
 *** VW compatibility: 7.6 ***
 --------------------- 2013.5.27 - 16:5:20 --------------------- 

 *** Developer: Nicolas Becu ***
 *** kernel FileName: Kernel-v.2013.5.9 - 7:26:51 ***
 *** VW compatibility: 7.6 ***
 --------------------- 2013.6.17 - 2:54:36 --------------------- 

 *** Developer: Nicolas Becu ***
 *** kernel FileName: Kernel-v.2013.5.27 - 16:5:20 ***
 *** VW compatibility: 7.6 ***
 --------------------- 2013.6.17 - 2:56:17 --------------------- 

 *** Developer: Nicolas Becu ***
 *** kernel FileName: Kernel-v.2013.6.17 - 2:54:36 ***
 *** VW compatibility: 7.6 ***
 --------------------- 2013.6.20 - 12:35:12 --------------------- 
Debug of Opentalk remarshaling for passModel by name
Implentation of a EntityReference transport mode between spaceModel and its remoteSpaceInterfaces to reduce the messages from client to server
Adding a createEntityPovFromSpec: aEntityPOVSpec class method so that entityPovs for clients can be created on the client side using that class method
 *** Developer: Nicolas Becu + Jean-Fran√ßois Lefevre ***
 *** kernel FileName: Kernel-v.2013.6.17 - 2:56:17 ***
 *** VW compatibility: 7.6 ***
 --------------------- 2013.6.25 - 3:11:55 --------------------- 

 *** Developer: Nicolas Becu + Jean-Fran√ßois Lefevre ***
 *** kernel FileName: Kernel-v.2013.6.20 - 12:35:12 ***
 *** VW compatibility: 7.6 ***
 --------------------- 2013.6.25 - 3:31:19 --------------------- 

 *** Developer: Nicolas Becu + Jean-Fran√ßois Lefevre ***
 *** kernel FileName: Kernel-v.2013.6.25 - 3:11:55 ***
 *** VW compatibility: 7.6 ***
 --------------------- 2013.6.25 - 3:43:28 --------------------- 

 *** Developer: Nicolas Becu + Jean-Fran√ßois Lefevre ***
 *** kernel FileName: Kernel-v.2013.6.25 - 3:31:19 ***
 *** VW compatibility: 7.6 ***
 --------------------- 2013.6.26 - 13:52:28 --------------------- 

 *** Developer: Nicolas Becu ***
 *** kernel FileName: Kernel-v.2013.6.25 - 3:43:28 ***
 *** VW compatibility: 7.6 ***
 --------------------- 2013.7.1 - 5:10:40 --------------------- 

 *** Developer: Nicolas Becu ***
 *** kernel FileName: Kernel-v.2013.6.26 - 13:52:28 ***
 *** VW compatibility: 7.6 ***
 --------------------- 2013.7.2 - 5:31:34 --------------------- 

 *** Developer: Nicolas Becu ***
 *** kernel FileName: Kernel-v.2013.7.1 - 5:10:40 ***
 *** VW compatibility: 7.6 ***
 --------------------- 2013.7.2 - 15:34:44 --------------------- 

 *** Developer: Nicolas Becu ***
 *** kernel FileName: Kernel-v.2013.7.2 - 5:31:34 ***
 *** VW compatibility: 7.6 ***
 --------------------- 2013.7.2 - 16:8:6 --------------------- 

 *** Developer: Nicolas Becu ***
 *** kernel FileName: Kernel-v.2013.7.2 - 15:34:44 ***
 *** VW compatibility: 7.6 ***
 --------------------- 2013.7.9 - 2:0:16 --------------------- 

 *** Developer: Nicolas Becu ***
 *** kernel FileName: Kernel-v.2013.7.2 - 16:8:6 ***
 *** VW compatibility: 7.6 ***
 --------------------- 2013.7.25 - 6:11:15 --------------------- 

 *** Developer: Nicolas Becu ***
 *** kernel FileName: Kernel-v.2013.7.9 - 2:0:16 ***
 *** VW compatibility: 7.6 ***
 --------------------- 2013.10.18 - 3:22:7 --------------------- 
Activity Diagram editor debuging after Distribution module integration
Zoom debuging after Distribution module integration
Arc-Node entities debuging after Distribution module integration
 *** Developer: Nicolas Becu ***
 *** kernel FileName: Kernel-v.2013.7.25 - 6:11:15 ***
 *** VW compatibility: 7.6 ***
 --------------------- 2013.11.4 - 11:52:58 --------------------- 

 *** Developer: Nicolas Becu ***
 *** kernel FileName: Kernel-v.2013.10.18 - 3:22:7 ***
 *** VW compatibility: 7.6 ***
 --------------------- 2013.11.6 - 13:55:58 --------------------- 

 *** Developer: Nicolas Becu ***
 *** kernel FileName: Kernel-v.2013.11.4 - 11:52:58 ***
 *** VW compatibility: 7.6 ***
 --------------------- 2013.11.6 - 13:56:17 --------------------- 

 *** Developer: Nicolas Becu ***
 *** kernel FileName: Kernel-v.2013.11.6 - 13:55:58 ***
 *** VW compatibility: 7.6 ***
 --------------------- 2013.11.27 - 23:47:33 --------------------- 
Integration of a Cormas packager module
- File/Package model saves an executable image (exe file) for the current opened model only
- ?/Package Cormas saves  an executable image (exe file) for Cormas
 *** Developer: Nicolas Becu ***
 *** kernel FileName: Kernel-v.2013.11.6 - 13:56:17 ***
 *** VW compatibility: 7.6 ***
 --------------------- 2013.12.8 - 13:38:7 --------------------- 
Bug fix for cormas primitives access on contextual menu of the BrowserCodeTool

 *** Developer: Nicolas Becu ***
 *** kernel FileName: Kernel-v.2013.11.27 - 23:47:33 ***
 *** VW compatibility: 7.6 ***
 --------------------- 2013.12.16 - 14:7:27 --------------------- 
From the Version of N. B√©cu and J.F. Lefevre, add all the modifications made by P.Bommel. Mainly:
 - ClassAttributeValue, ParameterInterface, DefaultAttributeSetter
 - ChartsInterface
 *** Developer: Nicolas Becu ***
 *** kernel FileName: Kernel-v.2013.12.8 - 13:38:7 ***
 *** VW compatibility: 7.6 ***
 --------------------- 2013.12.16 - 18:35:24 --------------------- 

 *** Developer: Pierre Bommel ***
 *** kernel FileName: Kernel-v.2013.12.16 - 14:7:27 ***
 *** VW compatibility: 7.6 ***
 --------------------- 2013.12.16 - 18:49:6 --------------------- 
Cormas closeDialog => more simple: Save then Exit - Just Exit - Cancel
 *** Developer: Pierre Bommel ***
 *** kernel FileName: Kernel-v.2013.12.16 - 18:35:24 ***
 *** VW compatibility: 7.6 ***
 --------------------- 2014.2.28 - 15:20:51 --------------------- 
Int√®gre le patch de NB (Delay changes:  false by default)
 *** Developer: Pierre Bommel ***
 *** kernel FileName: Kernel-v.2013.12.16 - 18:49:6 ***
 *** VW compatibility: 7.6 ***
 --------------------- 2014.4.3 - 14:18:43 --------------------- 
CormasModel: removeMultipleChanges (for optimization).
EntityPOV: calculateNewPositionOnPatchBounds (for real random position of an agent on a cell).
Does not yet includes the optim_20140316.st from Jean-Fran√ßois.
 *** Developer: Pierre Bommel ***
 *** kernel FileName: Kernel-v.2014.2.28 - 15:20:51 ***
 *** VW compatibility: 7.6 ***
 --------------------- 2014.4.4 - 18:40:58 --------------------- 
- Includes the optimizations from JF. Lefevre.
- Real random position of the agent"s figures on the cell
- distortable (or not) vectorial figures
- The agents" figures can be displayed on the border of the cell (position = #border_topRight, ...)
- unregisterEntityReferences on SpaceView
 *** Developer: Pierre Bommel ***
 *** kernel FileName: Kernel-v.2014.4.3 - 14:18:43 ***
 *** VW compatibility: 7.6 ***
 --------------------- 2014.4.6 - 18:29:49 --------------------- 
- NewLibrary of Vectorial Figures.
- VectorialPOVEditor has been improved, with sliders
- 2 buttons to magnify or Shrunk the bitmapFigure (instead of the size slider)
 *** Developer: Pierre Bommel ***
 *** kernel FileName: Kernel-v.2014.4.4 - 18:40:58 ***
 *** VW compatibility: 7.6 ***
 --------------------- 2014.4.18 - 1:26:15 --------------------- 
Backward steping option, using BOSS.
Clean up the SimManager class.
Integration of the SimWindow into Cormas Interface.
 *** Developer: Pierre Bommel ***
 *** kernel FileName: Kernel-v.2014.4.6 - 18:29:49 ***
 *** VW compatibility: 7.6 ***
 --------------------- 2014.4.21 - 23:3:6 --------------------- 
Stabilized version with backward and forward replays.
SimManager has been completly modified.
Distribution must be checked.
The Undo/Redo on the spaceInterface are still missing (very soon...)
 *** Developer: Pierre Bommel ***
 *** kernel FileName: Kernel-v.2014.4.18 - 1:26:15 ***
 *** VW compatibility: 7.6 ***
 --------------------- 2014.4.22 - 19:38:42 --------------------- 
Some debugs: CormasModel: do not save attributes type UiBuilder (specific interface of a model)
 *** Developer: Pierre Bommel ***
 *** kernel FileName: Kernel-v.2014.4.21 - 23:3:6 ***
 *** VW compatibility: 7.6 ***
 --------------------- 2014.4.24 - 16:4:23 --------------------- 
Version for official release Cormas2014 (1).
Backward & Forward replay are OK.
Run backward & forward as threads.
Analysis as thread.
 *** Developer: Pierre Bommel ***
 *** kernel FileName: Kernel-v.2014.4.22 - 19:38:42 ***
 *** VW compatibility: 7.6 ***
 --------------------- 2014.4.24 - 16:39:30 --------------------- 
Cormas2014 (2)
Cormas interface background = White
Simulation buttons = opaque
FinalStep changed by user (change #run button)
 *** Developer: Pierre Bommel ***
 *** kernel FileName: Kernel-v.2014.4.24 - 16:4:23 ***
 *** VW compatibility: 7.6 ***
 --------------------- 2014.5.13 - 9:40:33 --------------------- 
- Opentalk as prerequisite (+ patch NB & JFR)
- SpaceInterface with Undo/Redo butons
 *** Developer: Pierre Bommel ***
 *** kernel FileName: Kernel-v.2014.4.24 - 16:39:30 ***
 *** VW compatibility: 7.6 ***
 --------------------- 2014.5.14 - 5:58:56 --------------------- 
3 processes in SimManager (instead of 1): processRun, processReplayForward and processReplayBackward
 *** Developer: Pierre Bommel ***
 *** kernel FileName: Kernel-v.2014.5.13 - 9:40:33 ***
 *** VW compatibility: 7.6 ***
 --------------------- 2014.5.14 - 10:11:0 --------------------- 
Recuperate VectorialImageLibrary.
 *** Developer: Pierre Bommel ***
 *** kernel FileName: Kernel-v.2014.5.14 - 5:58:56 ***
 *** VW compatibility: 7.6 ***
 --------------------- 2014.5.16 - 4:40:27 --------------------- 

 *** Developer: Pierre Bommel ***
 *** kernel FileName: Kernel-v.2014.5.14 - 10:11:0 ***
 *** VW compatibility: 7.6 ***
 --------------------- 2014.6.12 - 20:22:15 --------------------- 
some work on Networks.
 *** Developer: Pierre Bommel ***
 *** kernel FileName: Kernel-v.2014.5.16 - 4:40:27 ***
 *** VW compatibility: 7.6 ***
 --------------------- 2014.6.21 -  --------------------- 

 *** Developer: Pierre Bommel ***
 *** kernel FileName: Kernel-v.2014.6.12 - 202215.st ***
 *** VW compatibility: 7.6 ***
 --------------------- 2014.6.22 -  --------------------- 
- Position of occupants
- debug zoom
- add all work of Nico (SpaceInterfaceConfig)
- merging cells
 *** Developer: Pierre Bommel ***
 *** kernel FileName: Kernel-v.2014.6.21 -  ***
 *** VW compatibility: 7.6 ***
 --------------------- 2014.6.23 -  --------------------- 
- SpaceView: setBackgroundColor -> OK
- PovSetter: tailleSlider set to 100% when Apply
- SpaceInterface menu, display -> Bidon suppressed (Still need to fix the delimitor size of the Spatial ENtities)
 *** Developer: Pierre Bommel ***
 *** kernel FileName: Kernel-v.2014.6.22 -  ***
 *** VW compatibility: 7.6 ***'