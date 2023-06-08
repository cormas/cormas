# v0.5 (tomorrow)

### Removed 
- Helper classes (`CMHelper`, `CMObjectHelper`, `CMBooleanHelper`, ect.)
- Classes in the Analysis tag (`CrossedSensitivity`, `DistributionListCrossedAnalysis`, `MonteCarloCrossedAnalysis`, `SequentialCrossedAnalysis`)
- Classes in the Observer tag (`BBaseVisuel`, `AgentObs`, `ControllerObs`, `FonctionObs`, `ModeleObs`, `Pref`)
- Classes in the Connector tag (`CMToExcel`, `ExcelSheet`)
- Cormas-OpenMole package (`CMOpenMoleExchange`, `CormasOpenMoleTest`)
- `DataSaver` and `DataSaver_Asci`
- `CormasModelGameInterface`
- `ManifestOfCormas`

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

### CI

- Created a separate workflow for `Cormas Core`

### Decoupling

- Removed the dependency from `Cormas-UI` to `Cormas-Mocks`
- The `Core` group (`Cormas-Core`, `Cormas-Tests`, and `Cormas-Mocks`) is now fully independent from the `UI` group (`Cormas-UI`, `Cormas-UI-Roassal3`, and `Cormas-UI-Tests`)

### Documentation

- Improved the hat of README (bigger image size, centered badges)
- Added a Metacello script for loading the stable and dev versions
