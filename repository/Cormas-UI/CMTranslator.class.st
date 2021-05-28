"
Contains CORMAS translations for user messages.

See superclass for usage and description.

"
Class {
	#name : #CMTranslator,
	#superclass : #PFTranslator,
	#category : #'Cormas-UI-Project'
}

{ #category : #accessing }
CMTranslator >> addTranslationsForEN [
	" Private - See superimplementor's comment "

	super addTranslationsForEN.
	self addTranslationsForENPart1.
	self addTranslationsForENPart2.
	self addTranslationsForENPart3.

]

{ #category : #accessing }
CMTranslator >> addTranslationsForENPart1 [
	" Private - See superimplementor's comment "

	^ (self translatorClass forLanguage: #EN) translationMap
		at: #tVersionName put: 'Version name';
		at: #tCreationDate put: 'Creation date';
		at: #tModelComments put: 'Model Comments';
		at: #tModelRename
			put:
			'The model has been renamed as {1}.
A new class category has been created and all the classes of the previous model have ben copied

We recommend you:
- To save and reload this model, then
- To copy the required directories (Maps, Data, ...) from {2} to {1}
';
		at: #tCreateNewModel put: 'Create a new model!!';
		at: #tCreateEntityKind put: 'Create a kind of Entity';
		at: #tCreateAgent put: 'Create a kind of Agent';
		at: #tCommunication put: 'Communication';
		at: #tGroup put: 'Group';
		at: #tLocation put: 'Location';
		at: #tElement put: 'Element';
		at: #tSimpleCell put: 'Simple Cell';
		at: #tCellularAutomaton put: 'Cellular Automaton';
		at: #tAggregate put: 'Aggregate';
		at: #tSetNotConnex put: 'Set no connex';
		at: #tName put: 'Name';
		at: #tDefineEntities put: 'Define the entities';
		at: #tAbstract put: 'Abstract / No abstract';
		at: #tSpatial put: 'Spatial';
		at: #tSocial put: 'Social';
		at: #tPassive put: 'Passive';
		at: #tProgrammingEntityClass put: 'the class for each Entity...';
		at: #tSimOrganization put: 'the simulation Organization...';
		at: #tObserver put: 'the Observer...';
		at: #tMessages put: 'Messages';
		at: #tProbes put: 'Probes';
		at: #tInitInstantiation put: 'the initial instantiation';
		at: #tScheduler put: 'the scheduler';
		at: #tSpaceEntities put: 'Space and Entities';
		at: #tEdit put: 'Edit';
		at: #tSpecialize put: 'Specialize';
		at: #tRemove put: 'Remove';
		at: #tAttributes put: 'Attributes';
		at: #tMethods put: 'Methods';
		at: #tActivityDiagrams put: 'Activity diagrams';
		at: #tPoVSetter put: 'PoV Setter';
		at: #tObject put: 'Object';
		at: #tObjectHelp put: 'A simple passive entity';
		at: #tLocatedObject put: 'Located Object';
		at: #tLocatedObjectHelp put: 'A passive entity located on a cell';
		at: #tNetworkNode put: 'Network Node';
		at: #tNetworkNodeHelp put: 'A Node of a Network located on a Cell';
		at: #tNetworkArc put: 'Network Arc';
		at: #tNetworkArcHelp put: 'An Arc of a Network located on 2 Cells';
		at: #tFullNetwork put: 'Full Network';
		at: #tFullNetworkHelp
			put: 'An oriented Network composed of a Set of Arc and Nodes';
		at: #tMessage put: 'Message';
		at: #tMessageHelp
			put: 'Message for AgentCommunication (with mailbox)';
		at: #tEditActivityDiagrams put: 'edit activity diagrams';
		at: #tEditAttributes put: 'edit attributes';
		at: #tEditInit put: 'edit initialization';
		at: #tEditSteps put: 'edit steps';
		at: #tMissingClassName
			put: 'Please enter a name for the new class.';
		at: #tAlreadyUsed put: 'Already used!!';
		at: #tWhichModel put: 'Which Model?';
		at: #tVisualization put: 'Visualization';
		at: #tProgramming put: 'Programming';
		at: #tSimulation put: 'Simulation';
		at: #tEnterClassName put: 'Please enter a name for the new class!';
		at: #tSpatialEntityCellHelp
			put:
			'SpatialEntityCell: the cell is the basic entity of the space (as Cellular Automata)';
		at: #tSimpleCellHelp
			put: 'SpatialEntityElement is the basic Cell entity';
		at: #tSpatialEntityHelp
			put: 'SpatialEntityAggregate is composed of connected cells';
		at: #tSetNotConnexHelp
			put:
			'SpatialEntityNotConnex is composed of unconnected cells or aggregates';
		at: #tCellAutomatonHelp
			put: 'CA is usefull for dynamics between cells';
		at: #tOATPredefValues put: 'Predefined by list of values';
		at: #tOATSeqValues put: 'Sequential values';
		at: #tCrossedSeqValues put: 'Sequential values';
		at: #tCrossedPredefValues put: 'Predefined by list of values';
		at: #tCrossSensAnalysis put: 'Crossed Sensitivity Analysis';
		at: #tDisplayParams put: 'Display Parameters';
		at: #tOATSensAnalysis put: 'OAT Sensitivity Analysis';
		at: #tSimpleStochAnalysis put: 'Simple Stochastic Analysis';
		at: #tMonteCarlo put: 'Monte Carlo';
		at: #tClassifyByParams put: 'Classify by parameters';
		at: #tSimInformation put: 'Simulation Information';
		at: #tSimInterface put: 'Simulation Interface';
		at: #tStartRWebService put: 'Start Web Service for R';
		at: #tStopRWebService put: 'Stop Web Service for R';
		at: #tAnalysis put: 'Analysis';
		at: #tCreateInstances put: 'Create Instances';
		at: #tOpenPharoMenu put: 'Open Pharo Menu';
		at: #tManipulateInstances put: 'Manipulate Instances';
		at: #tModelGlossary put: 'Model Glossary';
		at: #tModelListing put: 'Model listing as text file';
		at: #tPackageClient put: 'Package client';
		at: #tSpace put: 'Space';
		at: #tDisplayModelVersions put: 'Display model versions';
		at: #tSnapshot put: 'Snapshot current state';
		at: #tModifiedModelName put: 'The name has been renamed as ';
		at: #tDisplayLegends put: 'Display Legends';
		at: #tPhoto put: 'Photo';
		at: #tVideo put: 'Video';
		at: #tClickTo put: 'Click to...';
		at: #tHabitus put: 'Habitus';
		at: #tUnmoveableZoom put: 'Unmoveable zoom';
		at: #tMoveableZoom put: 'Moveable zoom';
		at: #tSetTrackLength put: 'Set track length';
		at: #tEnableUndoRedo put: 'Enable Undo/Redo...';
		at: #tTouchpad put: 'Touchpad manipulate mode';
		at: #tEnvironment put: 'Environment';
		at: #tGridSize put: 'Grid size';
		at: #tLoad put: 'Load';
		at: #tModify put: 'Modify';
		at: #tReOpen put: 'Re-Open';
		at: #tPoV put: 'PoV';
		at: #tAttribute put: 'Attribute';
		at: #tClassVariable put: 'Class variable';
		at: #tAttributesSuperLabel
			put: 'Attributes and class Variables of the super classes';
		at: #tAttributesTargetLabel
			put: 'Attributes and class Variables of the target class';
		at: #tReset put: 'Reset';
		at: #tApply put: 'Apply';
		at: #tEnterAttName
			put: 'Enter an attribute name (without white spaces, numbers or symbols)';
		at: #tAppTitle put: 'CORMAS';
		at: #tInvalidName
			put: ' is not a valid name. Please, enter a valid name';
		at: #tHelpAddInstAtt put: 'Add a new attribute to the target class';
		at: #tHelpRemoveInstAtt
			put: 'Remove an attribute from the target class';
		at: #tHelpAddClassAttr
			put: 'Add a new class attribute to the target class';
		at: #tHelpRemoveClassAtt
			put: 'Remove an attribute from the target class';
		at: #tClassEditor put: 'UML - Class Editor';
		yourself
]

{ #category : #accessing }
CMTranslator >> addTranslationsForENPart2 [
	" Private - See superimplementor's comment "

	^ (self translatorClass forLanguage: #EN) translationMap 
		at: #tInitialValueChooser 			put: 'Initial value chooser';
		at: #tSetterAccessor 					put: 'Setter accessor';
		at: #tGetterAccessor 					put: 'Getter accessor';
		at: #tNotifyObs 						put: 'Notify observers when changed';
		at: #tInitialValueLabel				put: 'Enter an initial value for this attribute';
		at: #tNumber 							put: 'Number';
		at: #tRandom 							put: 'Random';
		at: #tBoolean 							put: 'Boolean';
		at: #tStringSymbol 					put: 'String / Symbol';
		at: #tArray 								put: 'Array';
		at: #tNewEntity 						put: 'New Entity';
		at: #tCollectionEmpty 				put: 'Collection (empty)';
		at: #tNoValue 							put: 'No value or another instance (to be sent in #init)';
		at: #tFillArray							put: 'Fill the Array with values';
		at: #tSimulate 							put: 'simulate';
		at: #tReplay 							put: 'replay';
		at: #tCurrentStep 						put: 'current step';
		at: #tInitialize 						put: 'Initialize';
		at: #tBackwardLabel 					put: 'Backward';
		at: #tForwardLabel 					put: 'Forward';
		at: #tFinalStep 						put: 'final step';
		at: #tChange 							put: 'Change';
		at: #tSimCloseHelp 					put: 'Close the simulation interface';
		at: #tSimStepHelp 						put: 'Current time';	
		at: #tSimFinalStepHelp 				put: 'Enter the final step';
		at: #tSelectMethod 					put: 'Select a method of ';
		at: #tFinalStepChoice 				put: 'Final step:';
		at: #tInitializeRandomness 			put: 'Initialize randomness';
		at: #tMissingInitMethods 			put: 'The model does not define any method for initialization !';
		at: #tMissingControlMethods 		put: 'The model does not define any method for control !';
		at: #tNoStoredSim 						put: 'The "Dump" directory does not contain stored simulations';
		at: #tNoStoredSimFolder				put: ' directory does not contain stored simulations';
		at: #tReplayStartStep 				put: 'The replay will starts at step ';
		at: #tChooseDumpDir					put: 'Choose a ''Dump'' Directory:';
		at: #tCreatePoVAtt 					put: 'Create PoV on which attribute?';
		at: #tFoundPoVValues 					put: 'Cormas found the following values for the attribute ';
		at: #tAddSymbols 						put: 'Do you want to create the symbols associated to these values?';
		at: #tEnterNewSymbol 					put: 'Enter a new symbol';
		at: #tSelectEntity 					put: 'An entity must be selected';
		at: #tNoMoreMethods 					put: 'No more methods can be added to this list';
		at: #tNoMorePoVMethods				put: 'No more pov can be added to this list';
		at: #tNoMoreEntities 					put: 'No more entities can be added to this list';
		at: #tNoMoreInfo 						put: 'No more info can be added to this list';
		at: #tPoVMethods 						put: 'POV Methods';
		at: #tAgentTracksSize 				put: 'Choose the size of the agents tracks';
		at: #tSpaceNotAllowed 				put: 'Space characters are not allowed for Habitus names. Do you want to replace by ''_'' character ?';
		at: #tConfigTitle 						put: 'Please enter a title for that configuration';
		at: #tOneInfo 							put: 'Only one info can be set as default';
		at: #tInfoDefault 						put: 'This info is already set as default';
		at: #tPoVDefault 						put: 'This pov is already set as default';
		at: #tMustSelectEntity 				put: 'An entity must be selected';
		at: #tEntitiesToCreate 				put: 'Entities to be Created';
		at: #tManipulationEntities			put: 'Manipulation Entities';
		at: #tObservedEntities 				put: 'Observed Entities';
		at: #tChooseConfig 					put: 'Choose a configuration';
		at: #tNoInfoSelected 					put: 'No info selected';							
		at: #tNoAttribSelected 				put: 'No attribute selected';
		at: #tNoEntitySelected 				put: 'No entity selected';
		at: #tNoMethodSelected 				put: 'No method selected';
		at: #tNoPoVSelected 					put: 'No pov selected';
		at: #tOnePoV 							put: 'Only one pov can be set as default';
		at: #tHabitusTitle 					put: 'Habitus from Bourdieu';
		at: #tHabitusText 						put: 'L''habitus est un système de disposition acquises par l''apprentissage implicite ou explicite qui fonctionne comme un système de schèmes générateurs. L''habitus est générateur de stratégies qui peuvent être objectivement conformes aux intérêts objectifs de leurs auteurs sans en avoir été expressément conçues à cette fin. (Bourdieu 1972)
Autre définition : L''habitus est un ensemble de manière d''être, d''agir et de penser propre à un individu, fruit d''un apprentissage particulier lié à son groupe d''appartenance, qui diffère selon sa classe sociale, sa disposition en capital, et sa place occupée dans l''espace social. L''habitus structure les comportements et les actions de l''individu, et à la fois, structure les positions dans l''espace social.';
		at: #tSelectPoVSymbol 				put: 'Please, select a pov symbol';
		at: #tSymbolAlreadyExists 			put: 'This symbol already exists !!!';
		at: #tSelectSymbol 					put: 'Select a symbol !!!';
		at: #tChooseTokenColor 				put: 'Choose token color';
		at: #tNoModel 							put: 'Select or create a model';
		at: #tWhichAttribute					put: 'Which attribute !!';
		at: #tPoVDefinition 					put: 'PoV definition';
		at: #tPoVListMethods 					put: 'Methods returning a Color or Symbol';
		at: #tPoVListSymbols 					put: 'Associated Symbols';
		at: #tPoVInfoDisplayed				put: 'Information to be displayed';
		at: #tPoVListInfo 						put: 'Methods returning a String';
		at: #tPoVSetColor 						put: 'Set the Color';
		yourself
]

{ #category : #accessing }
CMTranslator >> addTranslationsForENPart3 [
	" Private - See superimplementor's comment "

	^ (self translatorClass forLanguage: #EN) translationMap
		at: #tDistributeAsServer 		put: 'Distribute (act as a server)';
		at: #tDistributeAsClient 		put: 'Distribute (act as a client)';
		at: #tAboutModel 					put: 'About this model';
		at: #tHowToRunModel 				put: 'How to run this model';
		at: #tChangeModelComments 		put: 'Change model Comments';
		at: #tWhichOpeningLocation 		put: 'Select open location';
		at: #tOptions 						put: 'Options';		
		at: #tNoVersion 					put: 'No version';
		at: #tLocalStorage 				put: 'Local disk';
		at: #tLocalImage 					put: 'Local image';
		at: #tRemoteImage 					put: 'Remote image';
		at: #tConfirmDeleteEntity 		put: 'Are you sure to remove the selected entity';
		at: #tEntities 						put: 'Entities';
		at: #tRenameEntityDialogText 	put: 'Enter the entity''s name:';
		at: #tSpecializeEntityDialogText put: 'Create a new kind of Entity: Please enter the entity''s name';
		at: #tSpecialization 				put: 'Specialization';
		at: #tConfirmAbstractEntity 	put: ' is abstract. It will be changed as concrete class. Ok?';
		at: #tConfirmConcreteEntity 	put: ' is concrete. It will be changed as abstract class. Ok?';
		at: #tConfirmDeleteAttribute	put: 'Are you sure to remove the selected attribute';
		at: #tFixRandomSeed 				put: 'Fix the random seed to';
		at: #tSelectProbesToRecord		put: 'Select probes to record';
		at: #tEnableStepBack 				put: 'Enable stepping back';
		at: #tReleaseRandomSeed 			put: 'Release random seed after initialization';
		at: #tSelectInitMethod			put: 'Select a method of initialization';
		at: #tSelectControlMethod 		put: 'Select a method of control';
		at: #tUsefulExpressions 			put: 'Useful Expressions';
		at: #tPreferences 					put: 'Preferences';
		at: #tNumberOfClasses 			put: 'Number of Classes';
		at: #tNumberOfEntities 			put: 'Number of Entities';
		at: #tNumberOfAgents 				put: 'Number of Agents';
		at: #tSize 							put: 'Size';
		at: #tIncludesMaps 				put: 'Includes maps';
		at: #tIncludesInputs 				put: 'Includes inputs';
		at: #tIncludesSims 				put: 'Includes simulations';
		at: #tCreatedCormasVersion 		put: 'Created in CORMAS version';
		at: #tAuthors 						put: 'Authors';
		at: #tOwner 							put: 'Owner';
		at: #tRelatedProjects 			put: 'Related projects';
		at: #tChooseStFile 				put: 'Choose st file';
		at: #tStFiles 						put: 'st files';
		at: #tConfirmBeforeLaunch 		put: 'Confirmation before launching';
		at: #tInspectModel 				put: 'Inspect model';
		at: #tValidNameRequired 			put: 'Please provide a valid name';
		at: #tDefineInit4Scenario 		put: 'Please define at least one init method for preparing a scenario';
		at: #tDefineControl4Scenario	put: 'Please define at least one control method for preparing a scenario';
		at: #tDeveloperTools 				put: 'Developer tools';
		at: #tRunCormasTests 				put: 'Run CORMAS tests';
		at: #tOpenCormasIssue 			put: 'Open an issue';
		at: #tPackageDepedenciesTool 	put: 'Open Package Dependencies Analyzer';
		at: #tPackageDepedenciesGraph 	put: 'Open Package Dependencies Graph';
		at: #tCORMASBrowser 				put: 'CORMAS Browser';
		at: #tNoSpaceModel 				put: 'No space model to visualize';
		yourself
]

{ #category : #accessing }
CMTranslator >> addTranslationsForES [
	" See superimplementor's comment "

	super addTranslationsForES.
	self addTranslationsForESPart1.
	self addTranslationsForESPart2.
	self addTranslationsForESPart3.
]

{ #category : #accessing }
CMTranslator >> addTranslationsForESPart1 [
	" See superimplementor's comment "

	^ (self translatorClass forLanguage: #ES) translationMap 
		at: #tVersionName 						put: 'Versión';
		at: #tCreationDate 					put: 'Fecha de creación';
		at: #tModelComments 					put: 'Comentarios';	
		at: #tModelRename 						put: 'El modelo fue renombrado como {1}.
Una nueva categoría de clase fue creada y todas las clases del modelo anterior fueron copiadas.

Le recomendamos que:
- Guarde y recargue este modelo, y luego
- Copie los directorios requeridos (Mapas, Datos, ...) de {2} a {1}
';								
		at: #tCreateNewModel 					put: 'Cree un nuevo modelo!!';
		at: #tCreateEntityKind 				put: 'Crear un nuevo tipo de Entidad';
		at: #tCreateAgent 						put: 'Crear un tipo de Agente';
		at: #tCommunication 					put: 'Comunicación';
		at: #tGroup 								put: 'Grupo';
		at: #tLocation 							put: 'Ubicación';												
		at: #tElement 							put: 'Elemento';
		at: #tSimpleCell 						put: 'Célula Simple';
		at: #tCellularAutomaton 				put: 'Autómata Celular';
		at: #tAggregate 						put: 'Agrupado';
		at: #tSetNotConnex 					put: 'No connex';
		at: #tName 								put: 'Nombre';
		at: #tDefineEntities 					put: 'Definir las entidades';
		at: #tAbstract 							put: 'Abstracta / No abstracta';
		at: #tSpatial 							put: 'Espacial';
		at: #tSocial 							put: 'Social';
		at: #tPassive 							put: 'Pasiva';
		at: #tProgrammingEntityClass		put: 'la clase de cada Entidad...';
		at: #tSimOrganization 				put: 'la Organización de la simulación...';	
		at: #tObserver 							put: 'el Observador...';
		at: #tMessages 							put: 'Mensajes';
		at: #tProbes 							put: 'Probes';
		at: #tInitInstantiation 				put: 'la instanciación inicial';
		at: #tScheduler 						put: 'el planificador';
		at: #tSpaceEntities 					put: 'Espacio y Entidades';
		at: #tEdit 								put: 'Editar';
		at: #tSpecialize						put: 'Especializar';
		at: #tAttributes 						put: 'Atributos';
		at: #tMethods 							put: 'Métodos';
		at: #tActivityDiagrams 				put: 'Diagramas de actividad';
		at: #tPoVSetter 						put: 'Configuración PoV';
		at: #tObject  							put: 'Object';
		at: #tObjectHelp 						put: 'Una entidad pasiva';									
		at: #tLocatedObject 					put: 'Objeto Situado';
		at: #tLocatedObjectHelp 				put: 'Una entidad pasiva situada en una celda/célula';							
		at: #tNetworkNode 						put: 'Nodo de Red';
		at: #tNetworkNodeHelp 				put: 'Un Nodo de una Red situado en una Célula';								
		at: #tNetworkArc 						put: 'Arco de Red';
		at: #tNetworkArcHelp 					put: 'Un Arco de una Red situado en 2 Células';
		at: #tFullNetwork 						put: 'Red Completa';
		at: #tFullNetworkHelp 				put: 'Una Red compuesta de un Conjunto de Arcos y Nodos';
		at: #tMessage 							put: 'Mensaje';
		at: #tMessageHelp 						put: 'Mensaje para un AgentCommunication (con mailbox)';
		at: #tRemove 							put: 'Eliminar';	
		at: #tEditActivityDiagrams 			put: 'editar diagramas de actividad';
		at: #tEditAttributes 					put: 'editar atributos';
		at: #tEditInit 							put: 'editar inicialización';
		at: #tEditSteps 						put: 'editar pasos';
		at: #tMissingClassName 				put: 'Por favor ingrese un nombre para la nueva clase!!';
		at: #tAlreadyUsed 						put: 'Ya está en uso!!';
		at: #tWhichModel 						put: '¿Qué Modelo?';
		at: #tVisualization 					put: 'Visualización';
		at: #tProgramming 						put: 'Programación';
		at: #tSimulation 						put: 'Simulación';
		at: #tEnterClassName 					put: 'Por favor ingrese un nombres para la nueva clase!';
		at: #tSpatialEntityCellHelp 		put: 'SpatialEntityCell: la célula es la entidad básica del espacio (como Autómata Celular)';
		at: #tSimpleCellHelp 					put: 'SpatialEntityElement es la entidad Célula básica';
		at: #tSpatialEntityHelp 				put: 'SpatialEntityAggregate está compuesto de células conectadas';
		at: #tSetNotConnexHelp 				put: 'SpatialEntityNotConnex está compuesto de agreggates o células desconectadas';
		at: #tCellAutomatonHelp 				put: 'El autómata celular es útil para dinámicas entre células';
		at: #tOATPredefValues 				put: 'Predefinido por lista de valores';
		at: #tOATSeqValues 					put: 'Valores secuenciales';						
		at: #tCrossedPredefValues 			put: 'Predefinido por lista de valores';						
		at: #tCrossSeqValues 					put: 'Valores secuenciales';
		at: #tCrossSensAnalysis 				put: 'Análisis de Sensitividad Cruzado';
		at: #tDisplayParams 					put: 'Visualizar parámetros';
		at: #tOATSensAnalysis 				put: 'Análisis de Sensitividad OAT';
		at: #tSimpleStochAnalysis 			put: 'Análisis Estocástico Simple';
		at: #tMonteCarlo 						put: 'Monte Carlo';
		at: #tClassifyByParams 				put: 'Classify by parameters';
		at: #tSimInformation 					put: 'Información de Simulación';
		at: #tSimInterface 					put: 'Interface de Simulación';
		at: #tStartRWebService 				put: 'Arrancar Servicio Web para R';
		at: #tStopRWebService 				put: 'Detener Servicio Web para R';
		at: #tAnalysis 							put: 'Análisis';
		at: #tCreateInstances 				put: 'Crear Instancias';
		at: #tOpenPharoMenu 					put: 'Abrir Menú de Pharo';
		at: #tManipulateInstances 			put: 'Manipular Instancias';
		at: #tModelGlossary 					put: 'Glosario de Modelo';
		at: #tModelListing 					put: 'Listado de Modelo como archivo de texto';
		at: #tPackageClient 					put: 'Empaquetar cliente';
		at: #tSpace 								put: 'Espacio';
		at: #tDisplayModelVersions 			put: 'Visualizar versiones de modelo';
		at: #tSnapshot 							put: 'Guardar estado actual';
		at: #tModifiedModelName 				put: 'El nombre ha sido renombrado como ';
		at: #tDisplayLegends 					put: 'Mostrar Leyendas';
		at: #tPhoto 								put: 'Foto';
		at: #tVideo 								put: 'Video';
		at: #tClickTo 							put: 'Clickear...';
		at: #tHabitus 							put: 'Habitus';
		at: #tUnmoveableZoom 					put: 'Zoom no movible';
		at: #tMoveableZoom						put: 'Zoom movible';
		at: #tSetTrackLength					put: 'Configurar pista';
		at: #tEnableUndoRedo					put: 'Habilitar hacer/deshacer...';
		at: #tTouchpad 							put: 'Modo de manipulación touchpad';
		at: #tEnvironment 						put: 'Ambiente';
		at: #tGridSize 							put: 'Tamaño de grilla';
		at: #tLoad 								put: 'Cargar';
		at: #tModify 							put: 'Modificar';
		at: #tReOpen 							put: 'Recargar';
		at: #tPoV 								put: 'PoV';
		at: #tAttribute 						put: 'Atributo';
		at: #tClassVariable 					put: 'Variable de clase';
		at: #tAttributesSuperLabel 			put: 'Atributos y Variables de clase de las superclases';
		at: #tAttributesTargetLabel 		put: 'Atributos y Variables de clase de la clase destino';
		at: #tReset 								put: 'Resetear';
		at: #tApply 								put: 'Aplicar';	
		at: #tEnterAttName 					put: 'Ingrese el nombre del atributo (sin espacios, números o símbolos)';
		at: #tAppTitle 							put: 'CORMAS';
		at: #tInvalidName 						put: ' no es un nombre válido. Por favor, ingrese un nombre válido';
		at: #tHelpAddInstAtt 					put: 'Agregar un nuevo atributo a la clase destino';
		at: #tHelpRemoveInstAtt 				put: 'Eliminar un atributo de la clase destino';
		at: #tHelpAddClassAttr				put: 'Agregar un nuevo atributo de clase a la clase destino';
		at: #tHelpRemoveClassAtt 			put: 'Eliminar un atributo de clase de la clase destino';
		at: #tClassEditor 						put: 'UML - Editor de Clases';																																				
		yourself
]

{ #category : #accessing }
CMTranslator >> addTranslationsForESPart2 [
	" See superimplementor's comment "

	^ (self translatorClass forLanguage: #ES) translationMap 
		at: #tInitialValueChooser 			put: 'Selector de valor inicial';
		at: #tSetterAccessor 					put: 'Accesor de escritura';
		at: #tGetterAccessor 					put: 'Accesor de lectura';
		at: #tNotifyObs 						put: 'Notificar observadores cuando haya cambios';
		at: #tInitialValueLabel				put: 'Ingrese un valor inicial para el atributo';
		at: #tNumber 							put: 'Number';
		at: #tRandom 							put: 'Random';
		at: #tBoolean 							put: 'Boolean';
		at: #tStringSymbol 					put: 'String / Symbol';
		at: #tArray 								put: 'Array';
		at: #tNewEntity 						put: 'Nueva Entidad';							
		at: #tCollectionEmpty 				put: 'Collection (vacía)';
		at: #tNoValue 							put: 'Sin valor u otra instancia (a ser configurada en #init)';
		at: #tFillArray							put: 'Complete el Array con valores';
		at: #tSimulate 							put: 'simular';
		at: #tReplay 							put: 'reiniciar';
		at: #tCurrentStep 						put: 'paso actual';
		at: #tInitialize 						put: 'Inicializar';
		at: #tBackwardLabel 					put: 'Reversa';
		at: #tForwardLabel 					put: 'Adelantar';
		at: #tFinalStep 	 					put: 'paso final';
		at: #tChange 							put: 'Cambiar';
		at: #tSimCloseHelp 					put: 'Cerrar la interface de simulación';
		at: #tSimStepHelp 						put: 'Tiempo actual';	
		at: #tSimFinalStepHelp 				put: 'Ingrese el paso final';
		at: #tSelectMethod 					put: 'Seleccione un método de ';
		at: #tFinalStepChoice 				put: 'Paso final:';
		at: #tInitializeRandomness 			put: 'Inicializar aleatoriedad';
		at: #tMissingInitMethods 			put: 'El modelo no define ningún método de inicialización !';
		at: #tMissingControlMethods 		put: 'El modelo no define ningún método de control !';
		at: #tNoStoredSim 						put: 'El directorio "Dump" no contiene ninguna simulación';
		at: #tNoStoredSimFolder				put: ' el directorio no contiene ninguna simulación';
		at: #tReplayStartStep 				put: 'La repetición comenzará en el paso ';								
		at: #tChooseDumpDir					put: 'Seleccione un directorio de ''Volcado''';
		at: #tCreatePoVAtt 					put: '¿Crear PoV en qué atributo?';
		at: #tFoundPoVValues 					put: 'CORMAS encontró los siguientes valores para el atributo ';
		at: #tAddSymbols 						put: '¿Desea crear los símbolos asociados a estos valores?';	
		at: #tEnterNewSymbol 					put: 'Ingrese un nuevo símbolo';
		at: #tSelectEntity 					put: 'Debe seleccionar una entidad';
		at: #tNoMoreMethods 					put: 'No se pueden agregar más métodos a esta lista';
		at: #tNoMorePoVMethods				put: 'No se pueden agregar más pov a esta lista';
		at: #tNoMoreEntities 					put: 'No se pueden agregar más entidades a esta lista';
		at: #tNoMoreInfo 						put: 'No se pueden agregar más info a esta lista';
		at: #tPoVMethods 						put: 'Métodos POV';
		at: #tAgentTracksSize 				put: 'Choose the size of the agents tracks';
		at: #tSpaceNotAllowed 				put: 'Los espacios no están permitidos para nombres de Habitus. ¿Quiere reemplazarlos con el caracter ''_''?';
		at: #tConfigTitle 						put: 'Por favor, ingrese el título para la configuración';
		at: #tOneInfo 							put: 'Only one info can be set as default';
		at: #tInfoDefault 						put: 'This info is already set as default';
		at: #tPoVDefault 						put: 'This pov is already set as default';
		at: #tMustSelectEntity 				put: 'Se debe seleccionar una entidad';
		at: #tEntitiesToCreate 				put: 'Entidades a ser creadas';
		at: #tManipulationEntities			put: 'Manipulation Entities';
		at: #tObservedEntities 				put: 'Entidades Observadas';
		at: #tChooseConfig 					put: 'Seleccione una configuración';
		at: #tNoInfoSelected 					put: 'No se seleccionó ningún info';
		at: #tNoAttribSelected 				put: 'No se seleccionó ningún atributo';
		at: #tNoEntitySelected 				put: 'No se seleccionó ninguna entidad';
		at: #tNoMethodSelected 				put: 'No se seleccionó ningún método';
		at: #tNoPoVSelected 					put: 'No se seleccionó ningún POV';
		at: #tOnePoV 							put: 'Solo un POV puede ser seleccionado por omisión';
		at: #tHabitusTitle 					put: 'Habitus de Bourdieu';
		at: #tHabitusText 						put: 'L''habitus est un système de disposition acquises par l''apprentissage implicite ou explicite qui fonctionne comme un système de schèmes générateurs. L''habitus est générateur de stratégies qui peuvent être objectivement conformes aux intérêts objectifs de leurs auteurs sans en avoir été expressément conçues à cette fin. (Bourdieu 1972)
Autre définition : L''habitus est un ensemble de manière d''être, d''agir et de penser propre à un individu, fruit d''un apprentissage particulier lié à son groupe d''appartenance, qui diffère selon sa classe sociale, sa disposition en capital, et sa place occupée dans l''espace social. L''habitus structure les comportements et les actions de l''individu, et à la fois, structure les positions dans l''espace social.';
		at: #tSelectPoVSymbol 				put: 'Por favor, seleccione un Symbol de PoV';
		at: #tSymbolAlreadyExists 			put: 'El Symbol ya existe !!!';
		at: #tSelectSymbol 					put: 'Seleccione un símbolo !!!';
		at: #tPoVDefinition 					put: 'Definición del PoV';
		at: #tPoVListMethods 					put: 'Métodos que responden un Color ó Symbol';
		at: #tPoVListSymbols 					put: 'Símbolos Asociados';
		at: #tPoVInfoDisplayed				put: 'Información a visualizar';
		at: #tPoVListInfo 						put: 'Métodos que responden un String';
		at: #tPoVSetColor 						put: 'Configurar el Color';
		yourself
]

{ #category : #accessing }
CMTranslator >> addTranslationsForESPart3 [
	" Private - See superimplementor's comment "

	^ (self translatorClass forLanguage: #ES) translationMap 
		at: #tDistributeAsServer 			put: 'Distribuir (actar como servidor)';
		at: #tDistributeAsClient  			put: 'Distribuir (actuar como cliente)';
		at: #tAboutModel 						put: 'Sobre este modelo';
		at: #tHowToRunModel 					put: 'Como ejecutar este modelo';
		at: #tChangeModelComments 			put: 'Modificar comentarios del modelo';
		at: #tWhichOpeningLocation 			put: 'Seleccione la ubicacion del elemento';
		at: #tNoVersion 						put: 'Sin versión';
		at: #tLocalStorage 					put: 'Almacenamiento local';
		at: #tLocalImage 						put: 'Imagen local';
		at: #tRemoteImage 						put: 'Imagen remota';
		at: #tConfirmDeleteEntity 			put: '¿Está seguro de borrar la entidad seleccionada?';
		at: #tEntities 							put: 'Entidades';
		at: #tRenameEntityDialogText 		put: 'Ingrese el nombre de la entidad:';
		at: #tSpecializeEntityDialogText 	put: 'Crear un nuevo tipo de Entidad: Por favor ingrese el nombre de la entidad';
		at: #tSpecialization 					put: 'Especialización';
		at: #tConfirmAbstractEntity 		put: ' es abstracta. Será cambiada a una clase concreta. Ok?';
		at: #tConfirmConcreteEntity 		put: ' es concreta. Será cambiada a una clase abstracta. Ok?';
		at: #tConfirmDeleteAttribute		put: 'Está seguro de borrar el atributo seleccionado?';
		at: #tFixRandomSeed 					put: 'Fijar semilla aleatoria de inicialización a';
		at: #tSelectProbesToRecord			put: 'Seleccione probes a registrar';
		at: #tEnableStepBack 					put: 'Habilitar retroceso paso a paso';
		at: #tReleaseRandomSeed 				put: 'Liberar semilla aleatoria luego de inicializar';
		at: #tSelectInitMethod				put: 'Seleccione un método de inicialización';
		at: #tSelectControlMethod 			put: 'Seleccione un método de control';
		at: #tUsefulExpressions 				put: 'Expresiones útiles';
		at: #tPreferences 						put: 'Configuración';
		at: #tNumberOfClasses 				put: 'Número de Clases';
		at: #tNumberOfEntities 				put: 'Número of Entidades';
		at: #tNumberOfAgents 					put: 'Número of Agentes';
		at: #tSize 								put: 'Tamaño';
		at: #tIncludesMaps 					put: 'Incluye mapas';
		at: #tIncludesInputs 					put: 'Incluye entradas';
		at: #tIncludesSims 					put: 'Incluye simulaciones';
		at: #tCreatedCormasVersion 			put: 'Creado en CORMAS';
		at: #tAuthors 							put: 'Autores';
		at: #tOwner 								put: 'Propietarip';
		at: #tRelatedProjects  				put: 'Projectos relacionados';
		at: #tChooseStFile 					put: 'Seleccionar archivo st';
		at: #tStFiles 							put: 'archivos st';
		at: #tConfirmBeforeLaunch 			put: 'Confirmación pre-lanzamiento';
		at: #tInspectModel 					put: 'Inspeccionar modelo';
		at: #tValidNameRequired 				put: 'Por favor escriba un nombre válido';
		at: #tDefineInit4Scenario 			put: 'Por favor define al menos un método de inicialización para preparar un escenario';
		at: #tDefineControl4Scenario		put: 'Por favor define al menos un método de control para preparar un escenario';
		at: #tDeveloperTools 					put: 'Herramientas de desarrollo';
		at: #tRunCormasTests 					put: 'Ejecutar tests de  CORMAS';
		at: #tOpenCormasIssue 				put: 'Abrir una incidencia';
		at: #tPackageDepedenciesTool 		put: 'Abrir Analizador de Dependencias de Paquetes';
		at: #tPackageDepedenciesGraph 		put: 'Abrir Visualización de Dependencias de Paquetes';
		at: #tCORMASBrowser 					put: 'Navegador de CORMAS';
		at: #tNoSpaceModel 					put: 'No hay ningún space model para visualizar';
		yourself

]
