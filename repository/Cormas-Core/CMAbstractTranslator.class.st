Class {
	#name : #CMAbstractTranslator,
	#superclass : #Object,
	#category : #'Cormas-Core-Project'
}

{ #category : #'as yet unclassified' }
CMAbstractTranslator class >> languageName [

	| className |
	className := self name.
	
	^ className copyFrom: 3 to: (className size - 10).
]

{ #category : #translations }
CMAbstractTranslator >> tAbout [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tAboutModel [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tAbstract [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tActivityDiagrams [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tAddSymbols [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tAlreadyUsed [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tAnalysis [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tAppTitle [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tApply [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tArray [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tAttributes [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tAttributesSuperLabel [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tAttributesTargetLabel [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tBackwardLabel [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tBoolean [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tBrowseModel [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tCORMASBrowser [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tCancel [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tCellAutomatonHelp [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tCellularAutomaton [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tChange [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tChangeColor [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tChangeModelComments [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tChooseColor [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tChooseDumpDir [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tChooseStFile [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tChooseTokenColor [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tClassifyByParams [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tClose [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tCollectionEmpty [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tCommunication [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tConfirmAbstractEntity [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tConfirmBeforeLaunch [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tConfirmConcreteEntity [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tConfirmDeleteAttribute [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tConfirmDeleteEntity [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tCreateAgent [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tCreateEntityKind [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tCreateInstances [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tCreatePoVAtt [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tCreationDate [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tCrossSensAnalysis [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tCrossedPredefValues [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tCrossedSeqValues [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tCurrentStep [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tDefineControl4Scenario [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tDefineEntities [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tDefineInit4Scenario [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tDeveloperTools [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tDisplayLegends [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tDisplayModelVersions [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tDisplayParams [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tDistributeAsClient [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tDistributeAsServer [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tEdit [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tEditActivityDiagrams [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tEditAttributes [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tEditInit [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tEditSteps [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tEnableStepBack [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tEnterAttName [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tEntities [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tExplore [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tFile [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tFillArray [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tFinalStep [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tFinalStepChoice [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tFixRandomSeed [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tForwardLabel [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tFullNetwork [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tFullNetworkHelp [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tGetterAccessor [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tGroup [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tHelp [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tHelpAddClassAttr [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tHelpAddInstAtt [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tHelpRemoveInstAtt [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tHowToRunModel [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tInitInstantiation [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tInitialValueChooser [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tInitialValueLabel [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tInitialize [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tInitializeRandomness [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tInspectModel [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tInvalidName [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tLanguage [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tLocalImage [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tLocalStorage [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tLocatedObject [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tLocatedObjectHelp [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tLocation [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tManipulateInstances [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tMessage [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tMessageHelp [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tMessages [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tMessagesProgramming [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tMethods [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tMissingControlMethods [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tMissingInitMethods [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tModelComments [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tModelGlossary [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tModelListing [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tModifiedModelName [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tMonteCarlo [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tName [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tNetworkArc [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tNetworkArcHelp [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tNetworkNode [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tNetworkNodeHelp [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tNew [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tNewEntity [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tNewProjectInvalidName [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tNewProjectName [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tNoStoredSim [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tNoStoredSimFolder [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tNoValue [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tNoVersion [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tNotifyObs [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tNumber [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tNumberOfEntities [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tOATPredefValues [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tOATSensAnalysis [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tOATSeqValues [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tObject [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tObjectHelp [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tObserver [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tOk [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tOpen [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tOpenCormasIssue [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tOpenPharoMenu [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tPackageDepedenciesGraph [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tPackageDepedenciesTool [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tPassive [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tPhoto [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tPoV [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tPoVDefinition [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tPoVInfoDisplayed [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tPoVListInfo [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tPoVListMethods [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tPoVListSymbols [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tPoVSetColor [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tPoVSetter [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tProbes [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tProbesProgramming [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tProgramming [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tProgrammingEntityClass [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tProjectOpenFailed [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tProperties [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tQuerySaveProject [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tQuit [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tRandom [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tReleaseRandomSeed [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tRemoteImage [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tRemove [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tRename [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tRenameEntityDialogText [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tReplay [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tReplayStartStep [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tRunCormasTests [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tSave [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tSaveAs [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tScheduler [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tSelectControlMethod [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tSelectInitMethod [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tSelectMethod [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tSelectProbesToRecord [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tSetterAccessor [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tSimCloseHelp [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tSimFinalStepHelp [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tSimInformation [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tSimInterface [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tSimOrganization [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tSimStepHelp [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tSimpleCell [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tSimpleCellHelp [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tSimpleStochAnalysis [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tSimulate [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tSimulation [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tSnapshot [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tSocial [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tSpace [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tSpaceEntities [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tSpaceInterface [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tSpatial [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tSpecialization [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tSpecialize [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tSpecializeEntityDialogText [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tStFiles [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tStartRWebService [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tStopRWebService [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tStringSymbol [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tTools [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tUsefulExpressions [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tValidNameRequired [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tVersionName [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tVideo [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tVisualization [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tWhichModel [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tWhichOpeningLocation [

	self subclassResponsibility
]
