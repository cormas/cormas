# [v0.5](https://github.com/cormas/cormas/compare/pre-v0.5...master) (tomorrow)

### Removed 

_(those classes and methods have been removed because they were outdated, broken, and never used)_

- [PR https://github.com/cormas/cormas/pull/592] Helper classes (`CMHelper`, `CMObjectHelper`, `CMBooleanHelper`, ect.)
- [PR https://github.com/cormas/cormas/pull/603] Classes in the Analysis tag (`CrossedSensitivity`, `DistributionListCrossedAnalysis`, `MonteCarloCrossedAnalysis`, `SequentialCrossedAnalysis`)
- [PR https://github.com/cormas/cormas/pull/594] Classes in the Observer tag (`BBaseVisuel`, `AgentObs`, `ControllerObs`, `FonctionObs`, `ModeleObs`, `Pref`)
- [PR https://github.com/cormas/cormas/pull/604] Classes in the Connector tag (`CMToExcel`, `ExcelSheet`)
- [PR https://github.com/cormas/cormas/pull/611] Cormas-OpenMole package (`CMOpenMoleExchange`, `CormasOpenMoleTest`)
- [PR https://github.com/cormas/cormas/pull/608] `DataSaver` and `DataSaver_Asci`
- [PR https://github.com/cormas/cormas/pull/605] `CormasModelGameInterface`
- [PR https://github.com/cormas/cormas/pull/610] `ManifestOfCormas`
- [PR https://github.com/cormas/cormas/pull/619] Some Baseleine methods (`platformAssetsUrls`, `findCurrentOwner`)

### Renamed

_(all the original class and method names in this list were retained as deprecations)_

**Classes:**
- `CMResourceLoader` ---> `CMGitBridge`
- `CMMsg` ---> `CMMessage`
- `CMAgentComm` ---> `CMCommunicatingAgent`
- `CMGroupComm` ---> `CMCommunicatingGroup`
- `CMAgentLocation` ---> `CMLocatedAgent`
- `CMAgentCommLocation` ---> `CMLocatedCommunicatingAgent`
- `CMGroupCommLocation` ---> `CMLocatedCommunicatingGroup`
- `CMGroupLocation` ---> `CMLocatedGroup`
- `CMObjectLocation` ---> `CMLocatedObject`
- `CMSimManager` ---> `CMSimulationManager`
- `CMSimInitializationAnnouncement` ---> `CMSimulationInitializationAnnouncement`

**Methods:**
- all implementors of `simManager` ---> `simulationManager`
- all implementors of `simManager:` ---> `simulationManager:`

### Baseline

- Removed Pharo 8 from baseline
- Added `Cormas-Tests` and `Cormas-Mocks` to the `Core` baseline group
- Removed methods for closing Pharo Welcome window (`isWelcomeWindow:`, `closePharoWelcomeWindow`)

### Continuous Integration (CI)

- Created a separate workflow for `Cormas Core`

### Decoupling

- Moved `DefaultAttributeSetter` from `Cormas-UI` to `Cormas-Core`
- Removed the dependency from `Cormas-UI` to `Cormas-Mocks`
- The `Core` group (`Cormas-Core`, `Cormas-Tests`, and `Cormas-Mocks`) is now fully independent from the `UI` group (`Cormas-UI`, `Cormas-UI-Roassal3`, and `Cormas-UI-Tests`)

### Documentation

- Improved the hat of README (bigger image size, centered badges)
- Added a Metacello script for loading the stable and dev versions
