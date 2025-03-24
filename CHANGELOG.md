# Changelog

## [v0.96](https://github.com/cormas/cormas/compare/v0.95..v0.96) (24 March 2025)

- ([fb72eb4](https://github.com/cormas/cormas/commit/fb72eb48d46ee6d1e01e289896a6d99c004a1f83)) Wrote a script to generate Cormas app for Mac

### New UI Tools & Features

- ([58cb9be](https://github.com/cormas/cormas/commit/58cb9be17083bf447b2673a38f92d97160da0086), [c0c75e8](https://github.com/cormas/cormas/commit/c0c75e8fa02589b5afa9ac22bef0a4b077dc114c)) Implemented example model loader
- ([683e034](https://github.com/cormas/cormas/commit/683e0349a8e2a58140e5b25512779683a6805ecc)) Implemented a UI for creating new models
- ([8587f91](https://github.com/cormas/cormas/commit/8587f91e3a640595fb94c5012c97bda060be8edc), [f2d3e11](https://github.com/cormas/cormas/commit/f2d3e11b83c649df047b0d5977c903313fcf0e80), [9becd42](https://github.com/cormas/cormas/commit/9becd42a4edf7f4b4c520ea435dfdf87e68d67a8), [9dcc791](https://github.com/cormas/cormas/commit/9dcc7911d84fa7563efe51bd9c1e87bbef6d6d63), [c73fb7f](https://github.com/cormas/cormas/commit/c73fb7fc8ca7d46d9b9c4e2d24d1d454c1aaf553), [8659b36](https://github.com/cormas/cormas/commit/8659b36022cf599a3eba610f52b984b18407f12c)) Implemented the first prototype of `CMModeDesigner`
- Implemented parameters editor
- Improved the UI of sensitivity analysis
- ([24e836c](https://github.com/cormas/cormas/commit/24e836c74dc97e75a937406966de1d56151e441b)) Added a context menu for entities in the space view and defined the `<action>` pragma
- ([9682e64](https://github.com/cormas/cormas/commit/9682e648b4617cdbfc9b6a4d6e2707672fdfb9b5)) Added a fullscreen button
- ([e3903a6](https://github.com/cormas/cormas/commit/e3903a639df995cfea2075171744369b3ad4cad3)) Improved Cormas logo (better resolution, different colors)
- ([68ae7b6](https://github.com/cormas/cormas/commit/68ae7b6c81ec1941e3eedeadf4beba2de6e6eea7)) Don't force the light theme
- ([cebf019](https://github.com/cormas/cormas/commit/cebf01995837c5ac3a1b8d787e868368dd4a2ca4)) Added a checkbox to disable the warning when reinitialized
- ([c4f5230](https://github.com/cormas/cormas/commit/c4f5230df787061a40d6e674b2c120032cae5173)) Setting the random seed

### Point of View (POV)

- ([249638a](https://github.com/cormas/cormas/commit/249638ab4da3ca97fe4feda2dd3537ce6d15babb)) Implemented PoV with tilesets (image PoV)
- ([fb8d66c](https://github.com/cormas/cormas/commit/fb8d66cf7948d224b6b59567d8d8e4c2f39bf863)) Added `CMColor` class and allowed specifying color by its name in a probe
- ([f2823fc](https://github.com/cormas/cormas/commit/f2823fc267fe61b9ebe29e49653d995db641e46c)) Made PoV size proportional to cell size
- ([6d0c36b](https://github.com/cormas/cormas/commit/6d0c36b04c010cee40f985d0f3659b7c65844619)) Positioning agents at given coordinates inside a cell
- ([497285d](https://github.com/cormas/cormas/commit/497285d28d4a330a7fb9cb32c106dec0712b8784), [225590f](https://github.com/cormas/cormas/commit/225590f2b8937ba362e7f464cbd5ea1babbcbfa8)) Added `povInvisible`

### Aggregates & Groups

- ([b0334a6](https://github.com/cormas/cormas/commit/b0334a6b11537dfd284624e92f38c583ea750352)) Added a `CMAgentGroup` class
- ([9392791](https://github.com/cormas/cormas/commit/9392791d49ed5f6a5cd4a3ce1185d51f35470606), [776ba68](https://github.com/cormas/cormas/commit/776ba6859e539db2f04edd5ce486bd2ede33986a)) Added `CMSpatialEntityAggregate` class and associated methods:
    - In `CMAbstractModel`: `createAggregate: from:`, `createAggregates: from: attribute:`, `createAggregates: from: attribute: minimumSize:`, `createAggregates: from: verifying:`, `createAggregates: from: verifying: minimumSize:`, `releaseAggregateType:`, `createAggregates: horizontalDividers: verticalDividers:`, 
    - In `CMSpaceModel`: `createAggregates: from: attribute: minimumSize:`, `createAggregates: from: verifying: minimumSize:`, `createOneAggregate: from:`, `getGroupsOfConnectedEntiesFrom: attribute:`, `createAggregates: horizontalDividers: verticalDividers:`, `getSetsOfContiguousCellsHorizontalDividers: verticalDividers:`
    - In `CMSpatialEntity`: `connectedCellsAmong:`, `neighborsOf:`, `aggregates`, `aggregates:`, `belongsToAggregateType:`
    - In `CMSpatialEntityElement`: `distanceTo: constraintOnPath:`, `isOnTheEdge`

### Better architecture

- ([ec7c49e](https://github.com/cormas/cormas/commit/ec7c49ea2fea84f5573195a2f8058626e28334c1), [b931e3c](https://github.com/cormas/cormas/commit/b931e3cad5c048c1565890f74be9f2405d4389ee)) Extracted menu buttons as commands
- ([55c9f31](https://github.com/cormas/cormas/commit/55c9f3194975e565308b811e5c1b825289f642b2)) Replaced hardcoded toolbar of `CMDataPresenter` with commands

### Removed

- Classes:
    - ([243dfc2](https://github.com/cormas/cormas/commit/243dfc2304ecebac0b50e1b7a2f4eb4581fa2876)) `CMSpacePolygonNeighbourhood`
    - ([d857221](https://github.com/cormas/cormas/commit/d857221b28436e559d7e8cce3e2cb005aa2d5409)) `CMPassiveObject` and `CMLocatedObject`
    - ([fbd6a1f](https://github.com/cormas/cormas/commit/fbd6a1f3b6276dd307c21edbc5104aeef4ccfa45)) `CMGroup`
    - ([6cdfc21](https://github.com/cormas/cormas/commit/6cdfc21dadafab435c397084876576f4caadd0da)) `CMMessage`, `CMChannel`, and `TCMCommunicating`
    - ([0bba453](https://github.com/cormas/cormas/commit/0bba453874f1de903fd1f8e365e7b46b5a478850)) `CMSpace3Neighbourhood` and `CMSpace6Neighbourhood`
- Variables and associated accessors:
    - ([417f264](https://github.com/cormas/cormas/commit/417f2647ef707de330527f59b02dfda5f447fc41)) `edge` and `outline` from `CMSpatialEntity`
    - ([6e2f4ca](https://github.com/cormas/cormas/commit/6e2f4ca291f8a053822751bc7fadd13d6a96d211)) `bounds` from `CMSpatialEntity`
    - ([005b541](https://github.com/cormas/cormas/commit/005b541c8e31bc22c5e73e1ec76b2759ec58695d)) `theAggregates` from `CMSpatialEntity`
    - ([b946813](https://github.com/cormas/cormas/commit/b946813ae8756c83b3a5a838155610eedd02c143)) `flag` from `CMEntity` 
    - ([2c718b1](https://github.com/cormas/cormas/commit/2c718b1c109e22b5c4426e3a0e73c808e90e8d9d)) `authors`, `comment`, `version`, and `creationDate` from `CMAbstractModel`
    - ([6229185](https://github.com/cormas/cormas/commit/6229185e4f0c8aed85bce4c981c63441ead1e08f)) `spatialClasses` from `CMAbstractModel`
    - ([beaba26](https://github.com/cormas/cormas/commit/beaba26910976a45a3adb0c0251bb22c19d22caa)) `elementaryEntitiesDefaultPovs` and `autoResizeBounds` from `CMSpaceModel`
    - ([494687d](https://github.com/cormas/cormas/commit/494687d61c4c50549d75ebf891681c49d87cc9d7)) `channel` from `CMAbstractModel`
- Dead methods from `CMAbstractModel`:
    - ([cadabb3](https://github.com/cormas/cormas/commit/cadabb39642eeb03b6926c3a31d67127585e4cb6)) `locatedObjectClasses`, `messages`, `passiveObjectClasses`
    - ([7919dc9](https://github.com/cormas/cormas/commit/7919dc9715d40d93e8d27d68baadc0aa0c9335da)) `allClassesNames`, `nPatches:`, `nbDistinctValuesOf:`
    - ([28e40bf](https://github.com/cormas/cormas/commit/28e40bffdca7dced27eebd91ff88517e203bb2e9)) `occupantClasses`, `allTheLocatedEntities`, `removeDeadEntities:`
    - ([23135e6](https://github.com/cormas/cormas/commit/23135e69d2718218683ce22b3186c039bea0fe69) `theAgentsComm`
    - ([ec99c1e](https://github.com/cormas/cormas/commit/ec99c1e59a471c9254f4015ff81807636fba06f1)) `edgeDensity:`, `edgeDensity: totalArea:`, `patchDensity:`, `patchDensity: totalArea:`
    - ([59d4ab6](https://github.com/cormas/cormas/commit/59d4ab6b64e87ec82255561f35ec3571b8cb2195)) `allTheSituatedEntities:`
 - Dead methods from `CMEntity class`:
    - ([28e40bf](https://github.com/cormas/cormas/commit/28e40bffdca7dced27eebd91ff88517e203bb2e9)) `isCellularAutomatonClass`, `isCompoundSpatialClass`, `isCormasEntityClass`, `isGenericEntity`, `isNodeClass`, `isObjectLocationClass`, `isSituatedClass`, `isSpatialEntitySetClass`
- Dead methods from `CMSpatialEntity`:
    - ([66d2762](https://github.com/cormas/cormas/commit/66d276207121f909bf14c2a4137438a0a11e9e43)) `isCrossedByArc:`, `myOccupantAt:`, `myOccupants:`, `nciAbout:`
- Methods from `CMSpatialEntityElement`:
    - ([ec99c1e](https://github.com/cormas/cormas/commit/ec99c1e59a471c9254f4015ff81807636fba06f1)) `boundaryDirections:`
- Methods from `CMSpaceModel`:
    - ([9973c01](https://github.com/cormas/cormas/commit/9973c01b5be1adc4f09661de0b0c996b4e2bd5cf)) `cellClass`
    - ([ec99c1e](https://github.com/cormas/cormas/commit/ec99c1e59a471c9254f4015ff81807636fba06f1)) `defaultGridSize`, `edgeDensity:`, `edgeDensity: totalArea:`, `nPatches:`, `patchDensity:`, `patchDensity: totalArea:`, setBoundaryDirectionsFor:`, `spaceModel`
    - ([59d4ab6](https://github.com/cormas/cormas/commit/59d4ab6b64e87ec82255561f35ec3571b8cb2195)) `allOccupants`, `allTheEntities:`, `allTheSituatedEntities:`
- Methods from `CMSpaceNeighbourhood`:
    - ([ec99c1e](https://github.com/cormas/cormas/commit/ec99c1e59a471c9254f4015ff81807636fba06f1)) `setBoundaryDirectionsFor:`

### Renamed

- ([b0c2137](https://github.com/cormas/cormas/commit/b0c21371234c03623e43c5aee3ad7705f382928c)) `socialClasses` ---> `agentClasses`
- ([3bef715](https://github.com/cormas/cormas/commit/3bef7156f39e8fac08cd292db665d8f528fb79f3)) `initEntitiesForSocialClass:` ---> `initializeAgentsOfClass:`
- ([354b2aa](https://github.com/cormas/cormas/commit/354b2aabdb0d663c56abf9cea8fc9936920ce8c7)) `theEntities:` ---> `entitiesOfClass:`
- ([edfcdcd](https://github.com/cormas/cormas/commit/edfcdcd163504c45de91a9b35f074efb1aeef7a7)) `theCells` ---> `cells`
- ([0bba453](https://github.com/cormas/cormas/commit/0bba453874f1de903fd1f8e365e7b46b5a478850)) `nbCount` ---> `numberOfNeighbours`
- ([0bba453](https://github.com/cormas/cormas/commit/0bba453874f1de903fd1f8e365e7b46b5a478850)) `nbNeighbours` ---> `numberOfNeighbours`
- ([0bba453](https://github.com/cormas/cormas/commit/0bba453874f1de903fd1f8e365e7b46b5a478850)) `nbConfiguration` ---> `neighbourhoodConfiguration`
- ([fe398e0](https://github.com/cormas/cormas/commit/fe398e039245230c1c250957983cd9d10ba01c10)) `centralLocation` ---> `centralCell`
- ([fe398e0](https://github.com/cormas/cormas/commit/fe398e039245230c1c250957983cd9d10ba01c10)) `lowerLeftLocation` ---> `lowerLeftCell`
- ([fe398e0](https://github.com/cormas/cormas/commit/fe398e039245230c1c250957983cd9d10ba01c10)) `lowerRightLocation` ---> `lowerRightCell`
- ([fe398e0](https://github.com/cormas/cormas/commit/fe398e039245230c1c250957983cd9d10ba01c10)) `selectCellsBetweenLine1: line2: andColumn1: column2:` ---> `selectCellsBetweenRow: andRow: column: andColumn:`
- ([fe398e0](https://github.com/cormas/cormas/commit/fe398e039245230c1c250957983cd9d10ba01c10)) `cellsIntoRectangleFrom:` ---> `cellsInRectangleFrom:`
- ([fe398e0](https://github.com/cormas/cormas/commit/fe398e039245230c1c250957983cd9d10ba01c10)) `cellsOfLine:` ---> `cellsOfRow:`
- ([fe398e0](https://github.com/cormas/cormas/commit/fe398e039245230c1c250957983cd9d10ba01c10)) `upperLeftLocation` ---> `upperLeftCell`
- ([fe398e0](https://github.com/cormas/cormas/commit/fe398e039245230c1c250957983cd9d10ba01c10)) `upperRightLocation` ---> `upperRightCell`
- ([fe398e0](https://github.com/cormas/cormas/commit/fe398e039245230c1c250957983cd9d10ba01c10)) `cellsBetweenColumn1: andColumn2:` ---> `cellsBetweenColumn: andColumn:`
- ([fe398e0](https://github.com/cormas/cormas/commit/fe398e039245230c1c250957983cd9d10ba01c10)) `cellsBetweenLine1: andLine2:` ---> `cellsBetweenRow: andRow:`
- ([fe398e0](https://github.com/cormas/cormas/commit/fe398e039245230c1c250957983cd9d10ba01c10)) `cellsBetweenLine1: line2: andColumn1: column2:` ---> `cellsBetweenRow: andRow: column: andColumn:`

### Minor Changes

- ([7b6eace](https://github.com/cormas/cormas/commit/7b6eace9ea589ce5172dcf10f1b43edd4bec4bf6), [2426957](https://github.com/cormas/cormas/commit/242695775b76e13e40eb384bcbb4e5ac8fcaf6a7)) Use selectors instead of methods in parameters, init and control
- ([5470f90](https://github.com/cormas/cormas/commit/5470f90e076dfd6fa159eb3acc4530c9389c9228)) Added methods to `CMSpatialEntityElement`: `hasNeighbourN`, `hasNeighbourS`, `hasNeighbourE`, `hasNeighbourW`, `hasNeighbourNE`, `hasNeighbourNW`, hasNeighbourSE`, `hasNeighbourSW`
- ([70b31e5](https://github.com/cormas/cormas/commit/70b31e5d71291572ede334fbf5d5c325d2a38f40)) Added a helper method `CMAbstractModel >> openSpacePresenter` to quickly open a space presenter
- ([65b60f8](https://github.com/cormas/cormas/commit/65b60f884056378da535466a2972189767c77575)) Added a helper method `CMDataPresenter >> data` to quickly access the data
- ([fa57860](https://github.com/cormas/cormas/commit/fa57860552ab605148f77dbd3b251f214bd0bf05)) Added `TCMRandom >> randomIntegerBetween:and:`
- ([acfa51d](https://github.com/cormas/cormas/commit/acfa51ddbd2e93ed691c72d1c031dc1d0b5ae1cd)) Retaining the final time step from previous simulation
- ([d4e696f](https://github.com/cormas/cormas/commit/d4e696fd52671f29217aa6876ae0b540c271c1dc)) Use the same class for all data tables
- ([cb0783f](https://github.com/cormas/cormas/commit/cb0783fab1da9ef938aefd89014d7de1556838e8)) Implemented instance parameters
- ([f33812e](https://github.com/cormas/cormas/commit/f33812e2dee5d86c33c28c26c22aca0e0c6b1d05)) Replaced `isLocatedEntity` with `isLocated` on the class side
- ([0bba453](https://github.com/cormas/cormas/commit/0bba453874f1de903fd1f8e365e7b46b5a478850)) Do not store cells in space model

## [v0.95](https://github.com/cormas/cormas/compare/v0.9..v0.95) (2 September 2024)

_(beginning of MISS ABMS 2024 -- very big changes)_

_(the detailed list is inclomplete... we did too many changes and it takes too much time to list all of the here)_

### In a Nutshell

- Reimplemented the entire UI in Spec 2
- Support all the latest Pharo versions (Pharo 11, 12, 13)
- Dropped support for the old Pharo versions (Pharo 9, 10)
- Removed a big portion of dead and broken code
- Removed dependency on Project Framework 🥳 - now cormas has only one external dependency: [PolyMathOrg/random-numbers](https://github.com/PolyMathOrg/random-numbers)

### Language (model definition)

- ([f62612b](https://github.com/cormas/cormas/commit/fb6f79a53618a3f205efd66d32374c268d50fe2a)) pov methods must now be defined with `<pov>` pragma. Before, they had to be placed in the `pov` protocol. Now protocol is now irrelevant.

### Added

#### New UI

- ([6f142ad](https://github.com/cormas/cormas/commit/5cfb78423d33ea709c5498d62b45a921fd900f02)) `CMSimulationPresenter`

### Removed

- ([8b7fb17](https://github.com/cormas/cormas/commit/8b7fb1771dddc7b69d7c82dfcc93f88fe93dd856), [d9c0ec2](https://github.com/cormas/cormas/commit/d9c0ec2ec0b331079787db1fb0da157c8d565f1c)) Removed deprecated classes: `CMAgentComm`, `CMApplicationProject`, `CMCommunicatingAgent`, `CMCommunicatingGroup`, `CMGroupComm`, `CMAgentCommLocation`, `CMAgentLocation`, `CMGroupCommLocation`, `CMGroupLocation`, `CMLocatedAgent`, `CMLocatedCommunicatingAgent`, `CMLocatedCommunicatingGroup`, `CMLocatedGroup`, `CMMsg`, `CMObjectLocation`, `CMResourceLocator`, `CMSimInitializationAnnouncement`, `CMSimManager`
- ([69acf4f](https://github.com/cormas/cormas/commit/69acf4f3ce315fe0398d66f830048d0fc0170094)) Removed deprecated methods from Core
    - From `CMAbstractModel` class: `initSimulation`, `simManager`, `simManager:`
    - From `CMAgent` class: `dead`, `dead:`, `destroyed`, `isDestroyed`
    - From `CMSpatialEntity` class: `hasOccupantType:`, `hasOccupantType:`, `noOccupantBut:`, `noOccupantType:`, `occupants:`, `occupantsAt:`,  `occupantsType:`
    - From `CMSpatialEntityElement` class: `numCol`, `numLine`, `orderedNeighbourhood`, `orderedNeighbourhood:`
    - From `TCMCommunicating` trait: `sendAsynchronouslyMsgTo: topic:`, `sendAsynchronouslyMsgTo: topic: content:`, `sendAsynchronouslyMsgToAll: topic:`, `sendAsynchronouslyMsgToAll: topic: content:`, `sendSynchronouslyMsgTo: topic:`, `sendSynchronouslyMsgTo: topic: content:`, `sendSynchronouslyMsgToAll: topic:`, `sendSynchronouslyMsgToAll: topic: content:`
    - `Cormas >> simManager`
    - `DefaultAttributesSetter >> simManager`
- ([df6003a](https://github.com/cormas/cormas/commit/df6003a3198e6fae1e63e73f256c205bbff1f68f)) Removed deprecated methods from UI:
    - `CMSpChartProbesMinMaxPresenter >> simManager`
    - `CMSpecSimulationWindow >> simManager`
- ([d5b3b11](https://github.com/cormas/cormas/commit/d5b3b118f94d4d7507dac0036d9ce44ac55ed6e7), [adcf811](https://github.com/cormas/cormas/commit/adcf8112c7d7cf1c9d334397bdb1f68bcb7c323e), [e4f8abb](https://github.com/cormas/cormas/commit/e4f8abbebbdcb6a343b08a5f4143453c7b5e5f06), [ca2c893](https://github.com/cormas/cormas/commit/ca2c893d7c51b1dcf0eb0e57858fc1e47ed6e57b), [b84cb9b](https://github.com/cormas/cormas/commit/b84cb9b7e30e2c97489cab863b50e54d121fa809), [4ce77ad](https://github.com/cormas/cormas/commit/4ce77adbec5b96f1cd66c13add248a6e9b84ef99)) Removed all the old Cormas Spec classes: _(... a long list of 87 classes ...)_ and extension methods
- ([9fac9d8](https://github.com/cormas/cormas/commit/9fac9d8acb050a90bb94665914f0b9a2206a2514)) Removed the old translator
- ([9565074](https://github.com/cormas/cormas/commit/9565074edb5fe821c6e4eb9cce0b1b88e3cea231), [98c8cf3](https://github.com/cormas/cormas/commit/98c8cf3731de397d4248f16e0876867c1eec43fa), [a63126f](https://github.com/cormas/cormas/commit/a63126f923375284f90e375b3d9bfad635e922f2)) Removed all Project Framework classes: `CMApplication`, `CMCellsLoader`, `CMProjectBuilder`, `CMProjectFile`, `CMProjectManager`, `CMProjectModel`, `CMProjectTracker`
- ([e626e46](https://github.com/cormas/cormas/commit/e626e46d456cb954e70b35b514bbfcd6412770da)) Removed all the announcements
- ([00575f2](https://github.com/cormas/cormas/commit/00575f28d9a57c3ebd2aca23663cae9bba6d6bfb)) Removed Cormas exceptions because they were never used: `CMException`, `CMLoadException`, `CMLoadIgnoreException`, `CMLoadInformException`, `CMLoadLogException`
- ([7cf3391](https://github.com/cormas/cormas/commit/7cf339130246958aded4500f4290120fbdd059cf), [98785df](https://github.com/cormas/cormas/commit/98785dfcb185569c16aeaac3e21f7f822c221b89), [b86dfee](https://github.com/cormas/cormas/commit/b86dfeea0a00b93321750da478f6329386add363), [6f142ad](https://github.com/cormas/cormas/commit/6f142ada4c371d47df0d80cc0e5268ecb0ffb8f2), [b83df1b](https://github.com/cormas/cormas/commit/4940bbdd8d188429ad9a51f764ced9a4151a91e8), [00b2527](https://github.com/cormas/cormas/commit/00b25273c411ea5e3171a3be364f37da327fb319), [d3ceab1](https://github.com/cormas/cormas/commit/d3ceab15ec2b1bbd1b585949d7dcd2706f0f432d)) Removed dead code. Classes that were never used: `EntityPOVSpec`, `EntityPOVView`, `CMAddOnManager_ListItem`, `CMModelResource` (for tests), `CMEnv2CellsConverter`. Methods that were never used:
    - From `CMAbstractModel` class:
        - `allEntitiesFrom: povAt:`
        - `removeMultipleChanges`
        - `situatedEntitiesFrom: povAt:`
        - `createGridNeighbourhood: closed: fromMatrixCsvFile: attribute:`
        - `readCsvFile:`
        - `classNameFromEntityName:`
        - `askRandom: select: toDo:`
        - `askRandom: select: toDo: with:`
        - `createAggregates: fromSeeds:`
        - `createAggregates: fromSeeds: maxSize:`
        - `createAggregates: fromSeeds: sizeDistribution:`
        - `createAggregates: fromSeeds: verifying:`
        - `createAggregates: fromSeeds: verifying: sizeDistribution:`
        - `createN: groups: from:`
        - `generateAsymetricNetworkDensity: forAgents:`
        - `generateSymetricNetworkDensity: forAgents:
    - From `CMAbstractModel class` class:
        - `activityDiagrams`
        - `activityDiagrams:`
        - `activityDiagramsAt:`
        - `activitySelectorOf:`
        - `allActivityDiagramSelectors`
        - `allActivitySelectors`
        - `allInstanceSelectors`
        - `chooseActivityDiagramEditorToRemove`
        - `instanceSelectorFrom:`
        - `methodsForControl`
        - `methodsForControlNoArg`
        - `methodsForTesting`
        - `methodsOfProtocol:`
        - `modelMethodsForManipulation`
        - `preStringForActivitySelector`
        - `removeActivityDiagram:`
        - `superClassesUntil:`
        - `superClassesUntilEntity`
    - From `CMEntity` class:
        - `figureAt:`
        - `getPovSpecForSelector: andInfo:`
        - `povAt:`
        - `manipulationMenu:`
        - `manipulationMenuItems`
    - From `CMEntity class` class:
        - `activityDiagrams`
        - `activityDiagrams:`
        - `activityDiagramsAt:`
        - `activitySelectorOf:`
        - `allActivityDiagramSelectors`
        - `allActivitySelectors`
        - `allAttributesUntil:`
        - `allAttributesUntilEntity`
        - `allClassSelectors`
        - `allClassSelectorsInProtocol:`
        - `allClassVariablesUntil:`
        - `allClassVariablesUntilEntity`
        - `allInstanceSelectors`
        - `allMethodsBut:`
        - `allMethodsButProtocols:`
        - `allSpecificAttributes`
        - `allSpecificClassVariables`
        - `getActivityDiagram:`
        - `instanceSelectorFrom:`
        - `methodsForControl`
        - `methodsForControlNoArg`
        - `methodsForInit`
        - `methodsForInitNoArg`
        - `methodsForTesting`
        - `methodsForTestingNoArg`
        - `methodsOfProtocol:`
        - `methodsOfProtocolStartingWith:`
        - `modelMethodsForManipulation`
        - `openActivityDiagram:`
        - `preStringForActivitySelector`
        - `refactorActivityDiagram: forClass:`
        - `removeActivityDiagram:`
        - `superClassesUntilEntity`
    - From `CMSpaceModel` class:
        - `getPovsDataOfArcEntity: forSelector: andInfo:`
        - `getPovsDataOfEntity: forSelector: andInfo:`
        - `getPovsDataOfOccupantEntity: forSelector: andInfo:`
        - `dimensions:`
        - `setAggregates: fromSeeds:`
        - `setAggregates: fromSeeds: sizeDistribution:`
        - `setAggregates: fromSeeds: verifying:`
        - `setAggregates: fromSeeds: verifying: sizeDistribution:`
        - `setPartitionsFromSeeds: into:`
        - `setSpatialEntitiesAttributsValueFromStream:`
        - `swell:`
        - `swell: verifying:`,
        - `loadNeighboorsClass: separator:`
    - From `Cormas` class: `selectRandomlyFrom: subCollectionSize: constrainedBy:`, `valueOfValueInString:`
    - Extension methods:
        - `RPackage` extension methods: `fileOutOn:`, `fileOutOn: named:`
        - `OrderedCollection` extension methods: `elementsWithMaxValue:`, `elementsWithMaxValue: verifying:`, `maxOf: verifying:`, `selectRandomlySubCollectionSize:`
    - `CMSpatialEntitySet >> getPovSpecWithComponentsForSelector: andInfo:`
    - `CMGroup >> stepDynPop`
    - `CMMessage class >> superClassesUntilEntity`
    - `OrderedCollection` extension methods: `elementsWithMaxValue:`, `elementsWithMaxValue: verifying:`, `maxOf: verifying:`, `selectRandomlySubCollectionSize:`
    - `SequenceableCollection` extension method `spaceModelDimensionsFor:`
    - `String` extension methods: `asBoolean`, `asValidCormasClassName:`, `withoutBlanks`
    - `ZnCharacterReadStream` extension method `skipSeparators`
- ([80f91fc](https://github.com/cormas/cormas/commit/80f91fcb1d695e50516ee320118c839e197b6041)) Removed `colorDict` and all related methods
- ([520bb4c](https://github.com/cormas/cormas/commit/520bb4c13a67ef53a3d883698f9aaa970ee97020)) Removed `povDict` variable and its accessor from `CMEntity`
- ([3292746](https://github.com/cormas/cormas/commit/32927467af6226123c2722ed7dee37c79db4628d)) Removed `image` class variable from `CMEntity` as well as the related methods: `CMSpatialEntityAggregate >> imageIncludes:`, `CMSpatialEntityElement >> outlinePatch` and all methods or `CMSpatialEntityElement` related to line segments: `lineSegmentE`, `lineSegmentEf`, `lineSegmentEfh`, `lineSegmentN`, `lineSegmentNE`, `lineSegmentNEf`, `lineSegmentNEfh`, `lineSegmentNW`, `lineSegmentNWf`, `lineSegmentNWfh`, `lineSegmentNf`, `lineSegmentS`, `lineSegmentSE`, `lineSegmentSEf`, `lineSegmentSEfh`, `lineSegmentSW`, `lineSegmentSWf`, `lineSegmentSWfh`, `lineSegmentSf`, `lineSegmentW`, `lineSegmentWf`, `lineSegmentWfh`, `segments`
- ([9b3848b](https://github.com/cormas/cormas/commit/9d72696e646bdabf618b0de8aae355f3582b9ff9)) Removed `CMAbstractModel class >> allClassesInPackage` because we should simply use `self package classes` instead

### Dependencies

- ([a63126f](https://github.com/cormas/cormas/commit/a63126f923375284f90e375b3d9bfad635e922f2)) Removed the dependency on [ProjectFramework](https://github.com/cormas/ProjectFramework)
- ([4c716da](https://github.com/cormas/cormas/commit/4c716da0a3d2784437277e1a2c79f013bf5fe022)) Removed the explicit dependency on Roassal3
- ([a1580c3](https://github.com/cormas/cormas/commit/a1580c3df1886adefc7947c8716a840f62421ef4), [13ab17a](https://github.com/cormas/cormas/commit/13ab17a414b55cd276cee04e537764cb8d3e6a7b)) Removed unused dependencies: SMark, PetitParser, ESRIASCIIRaster, SingularizePluralize, CollectionExtensions

### Compatibility with Pharo 11

_(inside a package `Cormas-Pharo11` that is only loaded for Pharo 11)_

- ([674a701](https://github.com/cormas/cormas/commit/830ba07e169aa18524932fae9ed53deab9c1e791)) Added `RPackage >> tags` as alias for `RPackage >> classTags`
- ([8517df2](https://github.com/cormas/cormas/commit/cc4c0802146fa51bb5be5f5d53d878b10b8207fd)) Added missing method: `RPackage >> tagNamed:`

## [v0.9](https://github.com/cormas/cormas/compare/v0.8..v0.9) (17 July 2024)

_(an intermediate release before introducing major breaking changes)_

### Removed

- ([PR #748](https://github.com/cormas/cormas/pull/748)) `CMSpaceModel >> isNotTorroidal`
- ([PR #746](https://github.com/cormas/cormas/pull/746)) `String >> asGetterForEntityClass`

### Renamed

- ([PR #748](https://github.com/cormas/cormas/pull/748)) `torroidal` --> `isClosedEnvironment`

### Bug fixes

- ([ef2336d](https://github.com/cormas/cormas/pull/751/commits/ef2336da3e162b86e5b532d62fb9a8b233e725eb)) Added extension method to fix the open of I18NTranslationView class
- ([PR #749](https://github.com/cormas/cormas/pull/749)) neighbour e neighbour n etc dont work properly on edges
- ([PR #745](https://github.com/cormas/cormas/pull/745)) `moveTowards:constraintOnPath:` is throwing SubscriptOutOfBounds exception

## [v0.8](https://github.com/cormas/cormas/compare/v0.7..v0.8) (18 December 2023)

_(those are mostly the changes introduced during [MISS ABMS 2023](https://www.agropolis.fr/MISS-ABMS-2023))_

- ([cac44eb](https://github.com/cormas/cormas/commit/cac44ebe302f7a30917aa54d4e3a152fe674b93e)) Changed package generation: Removed the `Cormas-Model-` package prefix and added a `-Model` suffix instead
- ([304b693](https://github.com/cormas/cormas/commit/304b693bc3d499afe7aa5a2343fd5505dc17fc6b)) Changed class generation: Removed the `CM` prefix from generated class names
- ([PR #734](https://github.com/cormas/cormas/pull/734)) Removed `asGetterForEntityClass` and added `<getterFor: #ClassName>` pragmas instead. The latter was a bad practice based on lazy initialization of a class variable and it forced us to depend on correct pluralization
- ([PR #736](https://github.com/cormas/cormas/pull/736)) Removed dependency on `Model` which was an old Morphic class and had nothing to do with Cormas
- ([PR #740](https://github.com/cormas/cormas/pull/740)) Added a possibility to have multiple shapes for agent pov

### Added

- ([24fba8b](https://github.com/cormas/cormas/commit/24fba8be4cdf006c3a3151380cbfcfc21d1b7837)) `TCMLocated >> randomJumpConstrainedBy:`
- ([d159565](https://github.com/cormas/cormas/commit/d1595655ba2860e7d5b40dd41d8c17530509bbf6)) `CMSpaceModel >> cellAt:at:`

### Removed

- ([f5a2084](https://github.com/cormas/cormas/commit/f5a20842ac869733d17d5eb03c2ef8121cd72605)) `Cormas class >> randomCell`
- ([66d5921](https://github.com/cormas/cormas/commit/66d5921f9e78adb9ca09205b3a5d6b8b15256770)) `Cormas class >> selectSimpleRandomlyFrom:`

### Renamed

- ([6536508](https://github.com/cormas/cormas/commit/6536508de7958f62e694b11b6da43964421a788c)) class `CMApplicationProject` ---> `CMApplication` (and deprecated the old name)

### Fixed Bugs

- ([48c6462](https://github.com/cormas/cormas/commit/48c64626cce66a9d613762a9285b2c466f36d949)) Fixed a bug with currentProject reference
- (https://github.com/cormas/cormas/pull/727) Fixed a bug with saving a project to a file
- ([8c810ce](https://github.com/cormas/cormas/commit/8c810ce6691bb1dff603a5206b12dd765ed55a8c)) Fixed a bug with opening the attributes interface
- ([035d1e2](https://github.com/cormas/cormas/commit/035d1e26922498c05fa8665650131f87908cc224)) Fixed the problem with `Cormas >> mix:` (it was modifying the original collection)
- (https://github.com/cormas/cormas/pull/730) Cormas space view was blinking
- ([86cf178](https://github.com/cormas/cormas/commit/86cf17865796016350b6382318138af4920e19b5)) Fixed an error when creating project name
- ([4d261ec](https://github.com/cormas/cormas/commit/4d261ec2dbe5d02d8763fb1b3db83dc0974b94f6)) Fixed a bug with random number generator
- ([2fefa18](https://github.com/cormas/cormas/commit/2fefa18603a0be909aa1701f13050ce105b9fdbd)) Fixed a bug with collocated entities

## [v0.7](https://github.com/cormas/cormas/compare/v0.6...v0.7) (18 August 2023)

- (https://github.com/cormas/cormas/pull/692) Created a new translator class hierarchy to replace the old l18N translator.
- ([1ecc9e9](https://github.com/cormas/cormas/pull/710/commits/1ecc9e96f8b6b8dea4b1ca81077066a5e386e04f)) Fixed the randomness of `Cormas class >> selectRandomlyFrom: aCollection`
- (https://github.com/cormas/cormas/pull/717) The default model creation date is now properly saved
- (https://github.com/cormas/cormas/pull/721) Fixed the capitalization of a new model name

### Improved Roassal3 implementation of space diagram

- (https://github.com/cormas/cormas/pull/687) Replaced `CMR3SpaceDiagram` with `CMR3SpaceDiagramBuilder`. This clearly separates Roassal code from Spec code.
- ([29471d8](https://github.com/cormas/cormas/commit/29471d820c8da01195493d02b411c441183aa371)) Implemented animation of dragging'n'dropping agents

### Spec User Interface

- ([81fa227](https://github.com/cormas/cormas/commit/81fa22772a235cc90a75d52ef80b73001958693f)) Remove UML and Source tabs from project opener because they were broken and trivial
- (https://github.com/cormas/cormas/pull/694) Added Language menu item to switch between translators
- (https://github.com/cormas/cormas/pull/711) Added a Programming menu item to open System Browser
- ([3fd9805](https://github.com/cormas/cormas/pull/714/commits/3fd9805f20f243e1db35ef6b7412266e672a783e)) Removed the menu item to show the list of methods with flags
- ([a388f6a](https://github.com/cormas/cormas/commit/a388f6a7256cad95b47a89b91e644a57ad8b61de)) Migrated CMSpecModelComments to Spec2

### Removed

- (https://github.com/cormas/cormas/pull/687) `CMApplicationPreferences` class
- ([c5e2514](https://github.com/cormas/cormas/pull/687/commits/c5e2514ae6dfdd351041dc1e125de58bf9cb9644)) `CMSpaceSettingsBrowser` class
- ([9256b2a](https://github.com/cormas/cormas/pull/687/commits/9256b2ad6835a37ab4e72bbefc8b6632e2643a86)) `CMSettingsBrowser` class
- ([3e7ce77](https://github.com/cormas/cormas/pull/690/commits/3e7ce772a0f4ced2c5d2e10a3db9d7a4ce987841)) `CMSpacePreferences` class
- ([7bdf11b](https://github.com/cormas/cormas/pull/687/commits/7bdf11be835fc40da6264da57dd4cce1724db054)) Redundand extension methods: `RSCanvas >> removeAllElements`, `RSCanvas >> removeAllPlots`, and `RSEvent >> cormasEntity`
- ([77e4494](https://github.com/cormas/cormas/pull/709/commits/77e4494658c19520514405a77a1cbf95bad2bf3f), [707944a](https://github.com/cormas/cormas/pull/709/commits/707944a9f3835b3c52df9d0513c44289a922f4af)) Old deprecated methods of `CMSpatialEntityElement`: `x`, `y`, `relativeDistanceTo:constraint:`, `shortestDistanceTo:constraintOnPath:`, and `wayTo:constrainedBy:`
- ([4125eca](https://github.com/cormas/cormas/pull/710/commits/4125eca4fcc70d56ce658346d29213b21e050de6)) `CMSpatialEntity >> noOccupantType:`
- ([e48431d](https://github.com/cormas/cormas/pull/714/commits/e48431d77a78a500094e967b3eac3d6e47509f58)) `CMSpatialEntityAggregate >> connexityTest` because it was poorly implemented and never used
- ([df3c3d5](https://github.com/cormas/cormas/pull/714/commits/df3c3d54d9c4ba811bb6422da7a8972ea6c4ae23)) Removed flags from methods (TODO, to be revised, etc.)
- ([834aa88](https://github.com/cormas/cormas/pull/714/commits/834aa887927c1902676a22113b0cbc365e2bc11e)) `request` instance variable from `CMEntity` and all methods that were using it. Those methods were never called
- ([4fc0b32](https://github.com/cormas/cormas/pull/714/commits/4fc0b327151435f0d79ab6fb8f78ede4c33a87a7)) Methods of `CMSpatialEntityAggregate` that were never called: `setImage`, `setImage4`, `setImageFromIrregularCells`, as well as `CMSpatialEntityNotConnex >> setImage`
- ([289ba64](https://github.com/cormas/cormas/pull/714/commits/289ba643be58f7fda32edbd82aed66ca86ea5e00)) `includedEntities` instance variable from `CMSpatialEntity` and all methods that were using it but were never called: `CMSpaceModel >> updateIncludedEntities:`, `CMSpatialEntity >> colorI:`, and `CMSpatialEntity >> colorN:`
- ([9b90747](https://github.com/cormas/cormas/pull/714/commits/9b907478c3df643755fcb65ef2ee03f660937ee4)) `default` instance variable from `CMSpatialEntityElement` class
- ([085c908](https://github.com/cormas/cormas/pull/715/commits/085c908b6cec5abf366bd6a7f382048e023e06eb)) `CMSpatialEntity class >> theCSE_default`
- (https://github.com/cormas/cormas/pull/716) Removed `orderedNeighbourhood` and used `neighbourhood` instead
- ([30dd507](https://github.com/cormas/cormas/commit/30dd5078a817c8869929217fd9fc5ea1224d61eb)) `currentProjectVersion` and `currentProjectClass` from `CMSpecModelComments`

### Renamed

- ([ff34944](https://github.com/cormas/cormas/pull/709/commits/ff349443e4023e180f530725817bf99cfc2dffd1)) `numLine` ---> `rowIndex`
- ([ff34944](https://github.com/cormas/cormas/pull/709/commits/ff349443e4023e180f530725817bf99cfc2dffd1)) `numCol` ---> `columnIndex`
- ([5ca947b](https://github.com/cormas/cormas/pull/710/commits/5ca947b8df2568f6fb692c0450e7d842fdf8d359)) `occupants:` ---> `occupantsOfClassNamed:`
- ([5ca947b](https://github.com/cormas/cormas/pull/710/commits/5ca947b8df2568f6fb692c0450e7d842fdf8d359)) `occupantsType:` ---> `occupantsOfClass:`
- ([4125eca](https://github.com/cormas/cormas/pull/710/commits/4125eca4fcc70d56ce658346d29213b21e050de6)) `hasOccupantType:` ---> `hasOccupantOfClass:`
- ([4125eca](https://github.com/cormas/cormas/pull/710/commits/4125eca4fcc70d56ce658346d29213b21e050de6)) `noOccupant` ---> `hasNoOccupants`
- ([4125eca](https://github.com/cormas/cormas/pull/710/commits/4125eca4fcc70d56ce658346d29213b21e050de6)) `noOccupantBut:` ---> `hasNoOccupantsExcept:`
- ([6b366e2](https://github.com/cormas/cormas/pull/715/commits/6b366e20ec9ac152a00583905e6f6f250fdfbb43)) `theESE` ---> `theCells` (variable and accessors)
- ([a657463](https://github.com/cormas/cormas/pull/715/commits/a6574634b6b6db07f796fab9594d3c7d2dfb8e6d)) `theCSE` ---> `theAggregates` (variable and accessors)
- ([d68f6e5](https://github.com/cormas/cormas/pull/715/commits/d68f6e5800966b129644c3bad3e97594a8f852dc)) `myCSE:` ---> `myAggregateOfClass:`


### Improved the Mock model

- ([f0d82c2](https://github.com/cormas/cormas/pull/687/commits/f0d82c2f4847ed00275117edd3abe5dc86565016)) Added pov
- ([57f86dd](https://github.com/cormas/cormas/pull/688/commits/57f86ddf439cca86c1ed09c52ef7fc2601083f3b)) Added random seed
- ([769fb8c](https://github.com/cormas/cormas/pull/710/commits/769fb8ce8a7a70756d0c843b0a3ff5ba8290d11a)) Replaced `CMMockAgent` with `CMMockAnimal` and two subclasses: `CMMockCow` and `CMMockGoat`

### Decoupling

- ([e2c000c](https://github.com/cormas/cormas/commit/e2c000c75fd24e55518d1e3b2a0efbf0e38df79f)) Moved `applicationExtension`, `baseDirectory`, and `cormasRepository` from `CMApplicationProject` to `CMGitBridge` to reduce dependency on ProjectFramework
- ([594e0a4](https://github.com/cormas/cormas/commit/594e0a4715cdd7016daf5d65a73587218a85fbf4)) Moved model metadata to AbstractModel to reduce dependency on ProjectFramework
- (https://github.com/cormas/cormas/pull/724) `CMApplicationProject` does not inherit from `PFApplicationProject` anymore

## [v0.6](https://github.com/cormas/cormas/compare/v0.5...v0.6) (25 July 2023)

- Introduced `TCMLocated` trait to replace the class hierarchy of located agents and groups
- Introduced `TCMCommunicating` trait to replace the class hierarchy of communicating agents and groups
- Removed all model packages from this repository and created a separate repository for each one of them (https://github.com/cormas/example-models):
    - (https://github.com/cormas/cormas/pull/669) ECEC Model ---> https://github.com/cormas/ecec-model
    - (https://github.com/cormas/cormas/pull/670) Fire Automata Model ---> https://github.com/cormas/fire-automata-model
    - ([5ef2cb6](https://github.com/cormas/cormas/commit/5ef2cb69aaa28dc47a919af526adcde52a0b0815)) Bushmeat Hunting Model ---> https://github.com/cormas/bushmeat-hunting-model
    - ([a3d0285](https://github.com/cormas/cormas/commit/a3d028525b3ab2942a0aba9582f2dd10b165f72b)) ReHab Model ---> https://github.com/cormas/rehab-model
    - ([c72a58b](https://github.com/cormas/cormas/commit/c72a58b8e12e5a97f6e026f66daa2d77a6c9ac37)) Conway Model ---> https://github.com/cormas/conway-model
    - ([44b0c6f](https://github.com/cormas/cormas/commit/44b0c6f9749e818804d6bf10fcbee4ea4c14503c)) Plots Rental Model ---> https://github.com/cormas/plot-rental-model
    - ([e3f5b5d](https://github.com/cormas/cormas/commit/e3f5b5d90051a6bd89cff1b40b22322f63259be9)) Diffuse Model ---> https://github.com/cormas/diffuse-model
    - ([ada2d8c](https://github.com/cormas/cormas/commit/ada2d8c95ac172c6c1714ea4dd1d67dd142c0d49)) Stupid Model ---> https://github.com/cormas/stupid-model
    - ([1a264bf](https://github.com/cormas/cormas/commit/1a264bf4eda0d410d3b7499e9038e6d8d82fb7df)) Demo Aggregates Model ---> https://github.com/cormas/demo-aggregates-model

### Added

- ([3adf408](https://github.com/cormas/cormas/commit/3adf408a8184675c501ddd9606b841ac52f4b9dc)) `CMMessage >> send`

### Removed

- ([ca1a04a](https://github.com/cormas/cormas/commit/ca1a04a2113dc984696aa04797f9afde7e618bf7)) `Programming > UML` menu item and all the dedicated methods
- (https://github.com/cormas/cormas/issues/657) `CMLocatedAgent >> logMovementTo:`
- (https://github.com/cormas/cormas/issues/658) All implementors of `displayOn:` and `displayOn:at:`
- (https://github.com/cormas/cormas/issues/658) Deprecated methods of `TCMLocated`: `moveAndTrackTo:`, `nearestEmptyLocation:`, `perceivedCellsWithinRange:`, `perceivedEntities:withinRange:`, `perceivedSimilarAgentsWithinRange:`, `perception:`
- (https://github.com/cormas/cormas/issues/659) `agentObs` property and accessors from `TCMCommunicating`
- (https://github.com/cormas/cormas/issues/665) `acquaintances` property and accessors from `TCMCommunicating`
- (https://github.com/cormas/cormas/issues/662) `TCMCommunicating >> isAgentCommClass`
- (https://github.com/cormas/cormas/issues/661) Deprecated methods of `CMMessage class`: `from: to: content:` and `to: content:`
- ([3adf408](https://github.com/cormas/cormas/commit/3adf408a8184675c501ddd9606b841ac52f4b9dc)) Removed unused parameters and accessors of `CMChannel`: `messages`, `observerFunctions`, `population`
- ([c4ab3c0](https://github.com/cormas/cormas/commit/c4ab3c0c7f961a3fd58c3e8c2c8bf1951183824d)) `ConfigurationOfCormas` package
- ([77c902b](https://github.com/cormas/cormas/commit/77c902b55c582c07349f2d2836de8c7b6a3d7370)) `CMProjectBuilder class >> resourceDirectoryNames`, because it is redundant and simply calls the `CMGitBridge class >> resourceDirectoryNames`
- ([38279f2](https://github.com/cormas/cormas/commit/38279f2a705de3cf1c788657dcd5f183a9e907be), [46b71c0](https://github.com/cormas/cormas/commit/46b71c049a5a01836ac26a54178be47794d2f4ec)) Methods related to building demo projects: `CMApplicationProject class >> hasCormasDemos` and `hasDemos`, `CMProjectBuilder class >> buildProjectDemos`, `CMProjectBuilder >> buildDemoProjects`, and `CMApplicationProject >> hasUserProjects`
- ([b002bff](https://github.com/cormas/cormas/commit/b002bff1b78427e4c0e5890682ec931b2397dded)) Methods of `CMProjectBuilder` that were never called
- ([4eb3f61](https://github.com/cormas/cormas/commit/4eb3f61925227e0c42d6daae7d2a40ffaf2e0fca)) `CMSpecObject >> iconNamed:` - bad case of polymorphism

### Renamed

_(all the original class and method names in this list were retained as deprecations)_

**Classes:**

- ([80063a1](https://github.com/cormas/cormas/commit/80063a1adaa61e7cfab0f209978d374d6a043510)) `CMMockLocatedAgent` ---> `CMMockAgent`

**Methods:**

- (https://github.com/cormas/cormas/pull/655) All implementors of `initSimulation` ---> `initializeSimulation`
- (https://github.com/cormas/cormas/issues/660, https://github.com/cormas/cormas/issues/663) All implementors of `isAgentComm` ---> `isCommunicatingEntity`
- (https://github.com/cormas/cormas/issues/663) All implementors of `isClassLocation` ---> `isLocatedEntity`
- (https://github.com/cormas/cormas/issues/661) Message-sending methods of `TCMCommunicating`:
    - `sendAsynchronouslyMsgTo: topic:` ---> `sendMessageAsynchronouslyTo: topic:`
    - `sendAsynchronouslyMsgTo: topic: content:` ---> `sendMessageAsynchronouslyTo: topic: content:`
    - `sendAsynchronouslyMsgToAll: topic:` ---> `sendMessageAsynchronouslyToAll: topic:`
    - `sendAsynchronouslyMsgToAll: topic: content:` ---> `sendMessageAsynchronouslyToAll: topic: content:`
    - `sendSynchronouslyMsgTo: topic:` ---> `sendMessageSynchronouslyTo: topic:`
    - `sendSynchronouslyMsgTo: topic: content:` ---> `sendMessageSynchronouslyTo: topic: content:`
    - `sendSynchronouslyMsgToAll: topic:` ---> `sendMessageSynchronouslyToAll: topic:`
    - `sendSynchronouslyMsgToAll: topic: content:` ---> `sendMessageSynchronouslyToAll: topic: content:`
- ([3adf408](https://github.com/cormas/cormas/commit/3adf408a8184675c501ddd9606b841ac52f4b9dc)) `TCMCommunicating >> messageFromChannel:` ---> `receiveMessage:`
- ([3adf408](https://github.com/cormas/cormas/commit/3adf408a8184675c501ddd9606b841ac52f4b9dc)) `CMChannel >> flush` ---> `sendAllMessages`

### Replaced

- ([ba2e185](https://github.com/cormas/cormas/commit/ba2e185d92fefbfdc5fac299432314c068ba446e)) Introduced `CMAgent >> isAlive`, `isDead`, and `die` instead of `isDestroyed`, `dead`, and `dead:`. Deprecated the old messages.

## [v0.5](https://github.com/cormas/cormas/compare/pre-v0.5...v0.5) (9 June 2023)

### Removed 

_(those packages, classes, and methods have been removed because they were outdated, broken, and never used)_

- (https://github.com/cormas/cormas/pull/634) `Cormas-UI-Roassal2` package
- (https://github.com/cormas/cormas/pull/592) Helper classes (`CMHelper`, `CMObjectHelper`, `CMBooleanHelper`, ect.)
- (https://github.com/cormas/cormas/pull/603) Classes in the Analysis tag (`CrossedSensitivity`, `DistributionListCrossedAnalysis`, `MonteCarloCrossedAnalysis`, `SequentialCrossedAnalysis`)
- (https://github.com/cormas/cormas/pull/594) Classes in the Observer tag (`BBaseVisuel`, `AgentObs`, `ControllerObs`, `FonctionObs`, `ModeleObs`, `Pref`)
- (https://github.com/cormas/cormas/pull/604) Classes in the Connector tag (`CMToExcel`, `ExcelSheet`)
- (https://github.com/cormas/cormas/pull/611) Cormas-OpenMole package (`CMOpenMoleExchange`, `CormasOpenMoleTest`)
- (https://github.com/cormas/cormas/pull/635) `CMResourceCreator`
- (https://github.com/cormas/cormas/pull/608) `DataSaver` and `DataSaver_Asci`
- (https://github.com/cormas/cormas/pull/605) `CormasModelGameInterface`
- (https://github.com/cormas/cormas/pull/610) `ManifestOfCormas`
- (https://github.com/cormas/cormas/pull/619) Some Baseleine methods (`platformAssetsUrls`, `findCurrentOwner`)

### Renamed

_(all the original class and method names in this list were retained as deprecations: https://github.com/cormas/cormas/pull/600, https://github.com/cormas/cormas/pull/632)_

**Classes:**
- (https://github.com/cormas/cormas/pull/630) `CMResourceLoader` ---> `CMGitBridge`
- (https://github.com/cormas/cormas/pull/596) `CMMsg` ---> `CMMessage`
- (https://github.com/cormas/cormas/pull/596) `CMAgentComm` ---> `CMCommunicatingAgent`
- (https://github.com/cormas/cormas/pull/596) `CMGroupComm` ---> `CMCommunicatingGroup`
- (https://github.com/cormas/cormas/pull/596) `CMAgentLocation` ---> `CMLocatedAgent`
- (https://github.com/cormas/cormas/pull/596) `CMAgentCommLocation` ---> `CMLocatedCommunicatingAgent`
- (https://github.com/cormas/cormas/pull/596) `CMGroupCommLocation` ---> `CMLocatedCommunicatingGroup`
- (https://github.com/cormas/cormas/pull/596) `CMGroupLocation` ---> `CMLocatedGroup`
- (https://github.com/cormas/cormas/pull/596) `CMObjectLocation` ---> `CMLocatedObject`
- (https://github.com/cormas/cormas/pull/596) `CMSimManager` ---> `CMSimulationManager`
- (https://github.com/cormas/cormas/pull/596) `CMSimInitializationAnnouncement` ---> `CMSimulationInitializationAnnouncement`

**Methods:**
- (https://github.com/cormas/cormas/pull/596) all implementors of `simManager` ---> `simulationManager`
- (https://github.com/cormas/cormas/pull/596) all implementors of `simManager:` ---> `simulationManager:`
- (https://github.com/cormas/cormas/pull/649) all implementors of `resourceLocator` ---> `gitBridge`
- (https://github.com/cormas/cormas/pull/652) all implementors of `simWindow` ---> `simulationWindow`

### Baseline

- (https://github.com/cormas/cormas/pull/619) Removed Pharo 8 from baseline
- (https://github.com/cormas/cormas/pull/625) Added `Cormas-Tests` and `Cormas-Mocks` to the `Core` baseline group
- (https://github.com/cormas/cormas/pull/619) Removed methods for closing Pharo Welcome window (`isWelcomeWindow:`, `closePharoWelcomeWindow`)
- (https://github.com/cormas/cormas/pull/611) Removed dependency on NeoJSON
- (https://github.com/cormas/cormas/pull/638) Only loading Cormas background image (logo) when UI is loaded
- (https://github.com/cormas/cormas/pull/639) Removed the unloadPackages method from the baseline
- (https://github.com/cormas/cormas/pull/640) Added dependency on SingularizePluralize to replace the Grease inflector
- (https://github.com/cormas/cormas/pull/646) Replaced Hernan's ProjectFramework and CodeGenerator with our forks
- (https://github.com/cormas/cormas/pull/648) Added dependency on juliendelplanque/PharoCodeGenerator and used it to replace the generation of model's creationDate, which was broken. Gradually, PharoCodeGenerator will replace Hernan's CodeGenerator

### Continuous Integration (CI)

- Created a separate workflow for `Cormas Core`
- ([4dae82c](https://github.com/cormas/cormas/commit/4dae82cf412666cd720f432367438f533ebe9183)) Added Pharo 10 and 11 to the CI of `Cormas Core`
- ([9ca44f6](https://github.com/cormas/cormas/pull/649/commits/9ca44f60694ca55a8adae01d8ff69fba94a03e95)) Allowed CI to work with GitBridge
- (https://github.com/cormas/cormas/pull/651) Removed the separate functionality of GitBridge for CI. It was broken and confusing

### Decoupling

- ([12349d9](https://github.com/cormas/cormas/commit/12349d9658669de7f6be38ab30f87158c86d2359)) Moved `DefaultAttributeSetter` from `Cormas-UI` to `Cormas-Core`
- (https://github.com/cormas/cormas/pull/613) Removed the dependency from `Cormas-UI` to `Cormas-Mocks`
- The `Core` group (`Cormas-Core`, `Cormas-Tests`, and `Cormas-Mocks`) is now fully independent from the `UI` group (`Cormas-UI`, `Cormas-UI-Roassal3`, and `Cormas-UI-Tests`)
- (https://github.com/cormas/cormas/pull/651) Removed the weird dependency from Core packages to Test packages (GitBridge was returning a TestResource)

### Documentation

- Improved the hat of README (bigger image size, centered badges)
- Added a Metacello script for loading the stable and dev versions
