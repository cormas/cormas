# [v0.7](https://github.com/cormas/cormas/compare/v0.6...v0.7) (17 August 2023)

- (https://github.com/cormas/cormas/pull/692) Created a new translator class hierarchy to replace the old l18N translator.

### Improved Roassal3 implementation of space diagram

- (https://github.com/cormas/cormas/pull/687) Replaced `CMR3SpaceDiagram` with `CMR3SpaceDiagramBuilder`. This clearly separates Roassal code from Spec code.
- ([29471d8](https://github.com/cormas/cormas/commit/29471d820c8da01195493d02b411c441183aa371)) Implemented animation of dragging'n'dropping agents

### Spec User Interface

- ([81fa227](https://github.com/cormas/cormas/commit/81fa22772a235cc90a75d52ef80b73001958693f)) Remove UML and Source tabs from project opener because they were broken and trivial
- (https://github.com/cormas/cormas/pull/694) Added Language menu item to switch between translators

### Removed

- (https://github.com/cormas/cormas/pull/687) `CMApplicationPreferences` class
- ([c5e2514](https://github.com/cormas/cormas/pull/687/commits/c5e2514ae6dfdd351041dc1e125de58bf9cb9644)) `CMSpaceSettingsBrowser` class
- ([9256b2a](https://github.com/cormas/cormas/pull/687/commits/9256b2ad6835a37ab4e72bbefc8b6632e2643a86)) `CMSettingsBrowser` class
- ([3e7ce77](https://github.com/cormas/cormas/pull/690/commits/3e7ce772a0f4ced2c5d2e10a3db9d7a4ce987841)) `CMSpacePreferences` class
- ([7bdf11b](https://github.com/cormas/cormas/pull/687/commits/7bdf11be835fc40da6264da57dd4cce1724db054)) Redundand extension methods: `RSCanvas >> removeAllElements`, `RSCanvas >> removeAllPlots`, and `RSEvent >> cormasEntity`
- ([77e4494](https://github.com/cormas/cormas/pull/709/commits/77e4494658c19520514405a77a1cbf95bad2bf3f), [707944a](https://github.com/cormas/cormas/pull/709/commits/707944a9f3835b3c52df9d0513c44289a922f4af)) Old deprecated methods of `CMSpatialEntityElement`: `x`, `y`, `relativeDistanceTo:constraint:`, `shortestDistanceTo:constraintOnPath:`, and `wayTo:constrainedBy:`
- ([4125eca](https://github.com/cormas/cormas/pull/710/commits/4125eca4fcc70d56ce658346d29213b21e050de6)) `CMSpatialEntity >> noOccupantType:`

### Renamed

- ([ff34944](https://github.com/cormas/cormas/pull/709/commits/ff349443e4023e180f530725817bf99cfc2dffd1)) `numLine` ---> `rowIndex`
- ([ff34944](https://github.com/cormas/cormas/pull/709/commits/ff349443e4023e180f530725817bf99cfc2dffd1)) `numCol` ---> `columnIndex`
- ([5ca947b](https://github.com/cormas/cormas/pull/710/commits/5ca947b8df2568f6fb692c0450e7d842fdf8d359)) `occupants:` ---> `occupantsOfClassNamed:`
- ([5ca947b](https://github.com/cormas/cormas/pull/710/commits/5ca947b8df2568f6fb692c0450e7d842fdf8d359)) `occupantsType:` ---> `occupantsOfClass:`
- ([4125eca](https://github.com/cormas/cormas/pull/710/commits/4125eca4fcc70d56ce658346d29213b21e050de6)) `hasOccupantType:` ---> `hasOccupantOfClass:`
- ([4125eca](https://github.com/cormas/cormas/pull/710/commits/4125eca4fcc70d56ce658346d29213b21e050de6)) `noOccupant` ---> `hasNoOccupants`
- ([4125eca](https://github.com/cormas/cormas/pull/710/commits/4125eca4fcc70d56ce658346d29213b21e050de6)) `noOccupantBut:` ---> `hasNoOccupantsExcept:`


### Improved the Mock model

- ([f0d82c2](https://github.com/cormas/cormas/pull/687/commits/f0d82c2f4847ed00275117edd3abe5dc86565016)) Added pov
- ([57f86dd](https://github.com/cormas/cormas/pull/688/commits/57f86ddf439cca86c1ed09c52ef7fc2601083f3b)) Added random seed

### Decoupling

- ([e2c000c](https://github.com/cormas/cormas/commit/e2c000c75fd24e55518d1e3b2a0efbf0e38df79f)) Moved `applicationExtension`, `baseDirectory`, and `cormasRepository` from `CMApplicationProject` to `CMGitBridge` to reduce dependency on ProjectFramework

# [v0.6](https://github.com/cormas/cormas/compare/v0.5...v0.6) (25 July 2023)

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

# [v0.5](https://github.com/cormas/cormas/compare/pre-v0.5...v0.5) (9 June 2023)

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
