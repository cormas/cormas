# [v0.6](https://github.com/cormas/cormas/compare/v0.5...v0.6) (16 June 2023)

- Introduced `TCMLocated` trait to replace the class hierarchy of located agents and groups
- Introduced `TCMCommunicating` trait to replace the class hierarchy of communicating agents and groups

### Renamed

_(all the original class and method names in this list were retained as deprecations)_

**Methods:**

- (https://github.com/cormas/cormas/issues/654) All implementors of `initSimulation` ---> `initializeSimulation`

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
