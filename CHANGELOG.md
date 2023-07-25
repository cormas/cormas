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

- (https://github.com/cormas/cormas/issues/657) `CMLocatedAgent >> logMovementTo:`
- (https://github.com/cormas/cormas/issues/658) All implementors of `displayOn:` and `displayOn:at:`
- (https://github.com/cormas/cormas/issues/658) Deprecated methods of `TCMLocated`: `moveAndTrackTo:`, `nearestEmptyLocation:`, `perceivedCellsWithinRange:`, `perceivedEntities:withinRange:`, `perceivedSimilarAgentsWithinRange:`, `perception:`
- (https://github.com/cormas/cormas/issues/659) `agentObs` property and accessors from `TCMCommunicating`
- (https://github.com/cormas/cormas/issues/665) `acquaintances` property and accessors from `TCMCommunicating`
- (https://github.com/cormas/cormas/issues/662) `TCMCommunicating >> isAgentCommClass`
- (https://github.com/cormas/cormas/issues/661) Deprecated methods of `CMMessage class`: `from: to: content:` and `to: content:`
- ([3adf408](https://github.com/cormas/cormas/commit/3adf408a8184675c501ddd9606b841ac52f4b9dc)) Removed unused parameters and accessors of `CMChannel`: `messages`, `observerFunctions`, `population`
- ([c4ab3c0](https://github.com/cormas/cormas/commit/c4ab3c0c7f961a3fd58c3e8c2c8bf1951183824d)) `ConfigurationOfCormas` package

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
