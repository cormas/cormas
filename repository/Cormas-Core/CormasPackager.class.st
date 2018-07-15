"
This class is the entry point for packaging a cormas system.
Two sorts of packaging are provided with two subclasses :
- Packaging a model user installation
	Produce a directory which can be copied on a Windows system.
	The Cormas system is only available for running the already loaded model.
- Packaging a modeler installation
	Produce a directory which can be copied on a Windows system, containing Cormas with no model loaded.
	The Cormas system is fully available for creating or modyfing some models.
"
Class {
	#name : #CormasPackager,
	#superclass : #UIApplicationModel,
	#instVars : [
		'runtimePackager',
		'checkIcons',
		'checks',
		'targetFileVM',
		'userHasChoosedTargetFile'
	],
	#category : 'Cormas-Core-Others'
}

{ #category : #'description accessing' }
CormasPackager class >> describePackagingOn: aTextStream [
	
	| redStyle |
	redStyle := Array
		with: #underline
		with: #color -> ColorValue red.
	aTextStream
		emphasize: #bold;
		nextPutAll:
				'Packaging a Cormas installation for ' , self targetPublic , '.';
		deemphasize: #bold;
		crtab;
		nextPutAll:
				'Please, note that it is usually far better to package from a ';
		emphasize: redStyle;
		nextPutAll: 'fresh rebuilded';
		deemphasize: redStyle;
		nextPutAll: ' image.';
		crtab;
		nextPutAll:
				'This operation will produces a directory with an installation ready to copy and use.';
		cr;
		cr;
		emphasize: #bold;
		nextPutAll: 'In order to execute this procedure, you should : '
]

{ #category : #'description accessing' }
CormasPackager class >> description [
	
	| s |
	s := TextStream on: String new.
	self describePackagingOn: s.
	^s contents asParagraph
]

{ #category : #'class initialization' }
CormasPackager class >> initialize [
	"rebuild Comas menu when loading the packager (give a chance to add packager menu items appear)"
	
	"Cormas rebuildMenu"
	
]

{ #category : #resources }
CormasPackager class >> launchPackagingLabel [
	"redefines this method in order to chenge the button label"
	
	^'Package'
]

{ #category : #'description accessing' }
CormasPackager class >> targetPublic [
	"return the public used in the description"
	
	^'<public>'
]

{ #category : #'interface specs' }
CormasPackager class >> windowSpec [
	"Tools.UIPainter new openOnClass: self andSelector: #windowSpec"
	
	<resource: #canvas>
	^#(FullSpec 
		#window: #(WindowSpec 
			#properties: #(PropertyListDictionary #labelFromApplication true) 
			#label: #windowTitle 
			#bounds: #(Rectangle 960 525 1587 880)) 
		#component: #(SpecCollection 
			#collection: #(#(ActionButtonSpec 
				#properties: #(PropertyListDictionary #labelFromApplication true) 
				#layout: #(LayoutFrame -250 1 -50 1 -15 1 -15 1) 
				#name: #buttonLaunchPackaging 
				#model: #launchPackaging 
				#label: #launchPackagingLabel 
				#defaultable: true) #(LabelSpec 
				#properties: #(PropertyListDictionary #labelFromApplication true) 
				#layout: #(Point 24 24) 
				#name: #labelDescription 
				#label: #description 
				#hasCharacterOrientedLabel: false) #(InputFieldSpec 
				#layout: #(LayoutFrame 35 0 -98 1 -90 1 -75 1) 
				#name: #inputTargetPath 
				#model: #targetFileVM 
				#isReadOnly: false) #(ActionButtonSpec 
				#layout: #(LayoutFrame -80 1 -98 1 -15 1 -75 1) 
				#name: #btnChooseTargetPath 
				#model: #chooseTargetFile 
				#label: 'Choose' 
				#defaultable: true) #(ActionButtonSpec 
				#layout: #(LayoutFrame -80 1 13 0 -15 1 36 0) 
				#name: #btnRefresh 
				#model: #refresh 
				#label: 'Refresh' 
				#defaultable: true) #(LabelSpec 
				#layout: #(LayoutOrigin 24 0 -130 1) 
				#name: #Label1 
				#label: 'Target executable :'))))
]

{ #category : #resources }
CormasPackager class >> windowTitle [
	
	^'Cormas Packager - '
]

{ #category : #'initialize-release' }
CormasPackager >> addCheck: aPackagingCheck [
	"add a check to this packager. This method should be used during the initialization phase"
	
	self checks add: aPackagingCheck
]

{ #category : #'initialize-release' }
CormasPackager >> addCheckName: aSymbol description: aString action: aBlock [
	"utility method for check construction"
	
	self
		addCheck:
			(PackagingCheck name: aSymbol description: aString action: aBlock)
]

{ #category : #'interface opening' }
CormasPackager >> addCheckWidgetsIn: aBuilder [
	"we build dynamically the label spec and its widget from checks.
	the checks widgets should are below the labelDescription.
	we adjust the window's height since the numbers of checks is variable"
	
	| position descriptionLabelWrapper |
	descriptionLabelWrapper := aBuilder componentAt: #labelDescription.
	position := descriptionLabelWrapper bounds bottomLeft + (0 @ 10).
	self checks
		do:
			[:each | 
			self addSpecForCheck: each in: aBuilder at: position.
			position := position + (0 @ 40)].
	aBuilder windowSpec bounds height: position y + 150
]

{ #category : #'interface opening' }
CormasPackager >> addSpecForCheck: aPackagingCheck in: aBuilder at: position [
	"add dynamically a widget for aPackagingCheck"
	
	| aSpec layout |
	layout := (position extent: -20 @ 50) asOffsetLayout.
	layout rightFraction: 1.
	aSpec := ArbitraryComponentSpec
		named: aPackagingCheck name
		layout: layout.
	aSpec hasBorder: false.
	aSpec component: (PackagingCheckView model: aPackagingCheck).
	aBuilder add: aSpec
]

{ #category : #accessing }
CormasPackager >> basePackagingDirectory [
	"the directory where to generate all packaging installation"
	
	^Cormas cormasPath \ 'packaging'
]

{ #category : #checking }
CormasPackager >> checkConditions [
	"check if all condition are ok.
	reports directly in the interface.
	return true if all is ok.
	Subclasses shouldn't redefine this method"
	
	self resetAllChecks.
	self checks do: [:each | each checkWith: self].
	^self checks allSatisfy: [:each | each status == true]
]

{ #category : #accessing }
CormasPackager >> checkNamed: aSymbol [
	"return the check ideentified by aSymbol"
	
	^self checks
		detect: [:each | each name == aSymbol]
		ifNone: [nil]
]

{ #category : #accessing }
CormasPackager >> checks [
	"return all checks..
	Subclass should redefines the method initializeChecks"
	
	^checks
		ifNil:
			[checks := OrderedCollection new.
			self initializeChecks.
			checks]
]

{ #category : #actions }
CormasPackager >> chooseTargetFile [
	"ask the user for choosing a target file name"
	
	| dialog target directory filename result |
	target := self targetFile.
	directory := target directory.
	directory ensureDirectory.
	filename := target tail.
	dialog := SaveFileDialog new.
	dialog
		addFileFilter: 'Executable (*.exe)' pattern: '*.exe';
		fileCondition: #new;
		defaultDirectory: directory;
		defaultFilename: filename.
	result := dialog select.
	result isNil ifTrue: [^self].
	result extension = '.exe'
		ifFalse: [result := result directory / (result tail , '.exe')].
	self targetFileVM value: result asString.
	self userHasChoosedTargetFile: true
]

{ #category : #actions }
CormasPackager >> closeExtrasWindows [
	"close all undesired windows"
	
	| controllers |
	WindowManager allInstancesDo: [:each | each purgeDeadWindows].
	controllers := ScheduledControllers scheduledControllers
		reject: [:controller | self shouldLeaveOpened: controller].
	controllers do: [:each | each closeAndUnschedule]
]

{ #category : #accessing }
CormasPackager >> computeDefaultTargetFile [
	"the complete path to the generated exe (directory + imageName + .exe) as a Filename"
	
	self subclassResponsibility
]

{ #category : #private }
CormasPackager >> configurePackager [
	"configure the specifics options needs for packaging Cormas.
	Reproduce the manual settings done in an interactive runtime packager session"
	
	| options keptItems |
	options := runtimePackager options.
	options removeCompiler: false.
	options errorNotifierClass: RuntimeDebugNotifier value.
	options operatingSystems: (Set with: #win).
	options uiLooks: (Set with: #win).
	options imagePath: self targetImagePath asString.
	options removeOrganization: false.
	keptItems := runtimePackager keptItems.
	self keepClass: ListIconLibrary into: keptItems.
	self keepClass: ToolbarIconLibrary into: keptItems.
	keptItems keepSelector: #localPointToGlobal: inClass: VisualPart.
	self keepClass: ColoredArea into: keptItems.
	self keepClass: ColoredAreaController into: keptItems.
	self keepClass: TextFigure into: keptItems
]

{ #category : #private }
CormasPackager >> copyVMFiles [
	"copy the vm and its dll. The vm is renamed for an automatic loading of the corresponding image.
	manage the special case of the modeler environment (not a fully vw installation)"
	
	| winDir aFilename targetDir exeFile junQTDir |
	aFilename := self targetFile.
	targetDir := aFilename directory.
	targetDir ensureDirectory.
	Cormas isModelerMode
		ifTrue:
			[exeFile := CEnvironment commandLine first asFilename.
			winDir := exeFile directory.
			exeFile copyTo: aFilename.
			junQTDir := winDir]
		ifFalse:
			[winDir := '$(VisualWorks)\bin\win' asLogicalFileSpecification asFilename.
			winDir \ 'vwnt.exe' copyTo: aFilename.
			junQTDir := '$(VisualWorks)\contributed\Jun\Jun569WinQT'
				asLogicalFileSpecification asFilename].
	winDir \ 'vwntoe.dll' copyTo: targetDir \ 'vwntoe.dll'.
	winDir \ 'linkmaster.dll' copyTo: targetDir \ 'linkmaster.dll'.
	junQTDir \ 'JunWinQT.dll' copyTo: targetDir \ 'JunWinQT.dll'
]

{ #category : #private }
CormasPackager >> createReadmeFile [
	"create a readme file"
	
	| s |
	s := (self packagingDirectory \ 'readme.txt') writeStream.
	[s
		nextPutAll: 'Please, note the following :';
		cr;
		cr;
		nextPutAll: ' - This is a packaged version of Cormas';
		cr;
		cr;
		nextPutAll:
				' - The Photo and Video tools require to have QuickTime installed on your computer';
		cr] ensure: [s close]
]

{ #category : #'packager facility' }
CormasPackager >> createRuntimePackager [
	"initialize a runtimePackager.
	This facility is specifically for subclasses using the RuntimePackager.
	We load the parcel only if the RTP is used
	"
	
	self ensureRuntimePackagerLoaded.
	runtimePackager := RuntimeBuilderUI value new
]

{ #category : #accessing }
CormasPackager >> currentModel [
	"return the current model"
	
	^Cormas current currentModel
]

{ #category : #private }
CormasPackager >> disableComServerExamples [
	
	| exampleClassNames |
	exampleClassNames := #(COMDualInterfaceObject SmalltalkCommanderCOMObject AllDataTypesCOMObject AutomationAllDataTypes AutomationOnlySmalltalkCommander).
	exampleClassNames
		do:
			[:bnd | 
			bnd
				ifDefinedDo:
					[:b | 
					b
						unregister;
						removeSessionEventHandlers]]
]

{ #category : #actions }
CormasPackager >> doPackaging [
	"execute the packaging procedure.
	produce a directory with all files necessary for a standalone installation	"
	
	self copyVMFiles.
	self createReadmeFile.
	self closeExtrasWindows.
	self unloadExtrasParcels.
	Cormas runtimeMode: self targetRuntimeMode
]

{ #category : #private }
CormasPackager >> ensureRuntimePackagerLoaded [
	
	RuntimeBuilderUI isDefined
		ifFalse: [Parcel loadParcelByName: 'RuntimePackager']
]

{ #category : #'packager facility' }
CormasPackager >> executePackager [
	"execute the runtime packager. This is the final step.
	Hack 1 : the runtimePackager needs to be opened in order to work properly. We provide it the current builder.
	Hack 2 : the final steps are done by the special window controller class RuntimeStartUpController, we change the current controller on the fly.
	"
	
	runtimePackager interactWithUser: false.
	runtimePackager builder: self builder.	"runtimePackager traceMessages."
	self builder window controller: RuntimeStartupController value new.
	runtimePackager stripSystem
]

{ #category : #accessing }
CormasPackager >> extraParcelsNamesToUnload [
	"return the parcel names that should be unloaded before packaging"
	
	^Array new
]

{ #category : #'interface opening' }
CormasPackager >> inactivateTargetFilePath [
	
	(self wrapperAt: #inputTargetPath)
		ifNotNil: [:w | w widget controller: NoController new]
]

{ #category : #'initialize-release' }
CormasPackager >> initialize [
	
	super initialize.
	userHasChoosedTargetFile := false.
	self updateTargetFileVM
]

{ #category : #'initialize-release' }
CormasPackager >> initializeChecks [
	"construct the check list. This method should be redefined in subclasses in order to provide all checks.
	add here any default common check.
	redefinitions should use the method #addCheckName:description:action: or #addCheck:"
	
	
]

{ #category : #private }
CormasPackager >> installNotifierChanges [
	"install a new DebuggerService with no debug button"
	
	Notifier current: PackagedDebuggerService
]

{ #category : #private }
CormasPackager >> installPatchRes94469 [
	"install this needed patch. For simplicity, the patch is inlined here"
	
	'<?xml version="1.0"?>

<st-source>


<methods>
<class-id>RuntimePackager.RuntimeBuilderItems</class-id> <category>actions</category>

<body package="RuntimePackager" selector="patchKept">patchKept
	"Patch the list of deleted and kept classes and methods"
	self keepClass: VisualPart.
	self keepSelector: #localPointToGlobal: inClass: VisualPart</body>

<body package="RuntimePackager" selector="setDefaultValues">setDefaultValues
	"Set default values for classes and methods "

	| wasReset |
	wasReset := self canBeReset not.

	self resetUnreferencedItems.
	"Do packages first, so that specific items listed overrule them."
	self defaultPackagesDeleted do: [:each | self deleteAllInPundle: each].
	self defaultPackagesKept do: [:each | self keepAllInPundle: each].

	self defaultClassesDeleted do: [:each | self deleteClass: each].
	self defaultClassesKept do: [:each | self keepClass: each].
	self defaultGlobalsKept do: [:each | self keepGlobal: each].
	self defaultGlobalsDeleted do: [:each | self deleteGlobal: each].
	self defaultMethodsKept keysAndValuesDo: 
		[:eachClass :selectors | 
		selectors do: [:eachSelector |
			self keepSelector: eachSelector inClass: eachClass]].
	self defaultMethodsDeleted keysAndValuesDo: 
		[:eachClass :selectors | 
		selectors do: [:eachSelector |
			self deleteSelector: eachSelector inClass: eachClass]].
	self includeStartupCode.
	self patchKept.
	" ensure that kept classes are not deleted in their superclasses"
	self ensureValidHierarchy.

	" notify interested parties that things have changed."
	wasReset ifTrue: [ self changed. ].
	self refresh.</body>
</methods>

<methods>
<class-id>RuntimePackager.RuntimeManagerStripper class</class-id> <category>stripping</category>

<body package="RuntimePackager" selector="discardUnreferencedMethodsClassesAndGlobals:">discardUnreferencedMethodsClassesAndGlobals: notifier
	" discard unreferenced classes, methods and globals "
	
	| replacements specialCompilerClasses traceClassRemovals traceMethodRemovals traceCount |
	notifier log: ''Deleting unreferenced items''.
	RuntimeManager changed: #aboutToDeleteUnreferencedItems.	" discard unreferenced classes "
	notifier tickRate: DeletedClasses size // 50.	" check the TraceLevel "
	traceClassRemovals := false.
	traceMethodRemovals := false.
	self traceLevel &gt;= 2 ifTrue: [traceClassRemovals := true].
	self traceLevel &gt;= 4 ifTrue: [traceMethodRemovals := true].	"Special compiler classes are not removed removed from their name space to
	allow deleted behaviors to remain behind with just enough behavior."
	specialCompilerClasses := IdentitySet new.
	(StrippingOptions includes: #removeCompiler)
		ifTrue:
			[specialCompilerClasses add: (self hiddenReferenceTo: ''SmalltalkCompiler'').
			specialCompilerClasses add: (self hiddenReferenceTo: ''Compiler'').
			specialCompilerClasses add: (self hiddenReferenceTo: ''Scanner'').
			specialCompilerClasses add: (self hiddenReferenceTo: ''Parser'')].	"sort the deleted classes bottom up in the hierarchy"
	notifier log: ''  Deleting classes part 1''.	"Always, always keep method dictionaries"
	MethodDictionary withAllSubclasses
		do:
			[:cl | 
			DeletedClasses
				remove: cl
				ifAbsent: []].
	replacements := self prepareClassesForDeletionIn: notifier.	" remove classes from the System Dictionary and make them obsolete "
	notifier log: ''  Deleting classes part 2''.
	self purgeDependents: AllDeletedBehaviors.
	replacements
		do:
			[:repArray | 
			| cl |
			cl := repArray at: 1.	" For special compiler classes, leave alone until phase 2 "
			(specialCompilerClasses includes: cl)
				ifFalse:
					[" watch out for ghost classes "
					(cl format notNil
						and:
							[cl class format notNil and: [cl environment includesKey: cl name]])
						ifTrue:
							[traceClassRemovals
								ifTrue:
									[notifier
										cr;
										show: ''Removing '' , cl name].
							cl quietlyRemoveFromSystem]].
			notifier tick].	" replace each class with a naked behavior and replace old instances"
	notifier log: ''  Deleting classes part 3''.
	replacements
		do:
			[:x | 
			| cl meta replClass replMeta replInstBehavior |
			cl := x at: 1.
			meta := cl class.
			replInstBehavior := x at: 2.
			replClass := x at: 3.
			replMeta := x at: 4.	" dispose of old instances "
			cl
				allInstancesDo:
					[:obj | 
					| newObj |
					newObj := replInstBehavior new.
					newObj primBecome: obj].	" switch places between old and new classes "
			replClass become: cl.
			cl flushVMmethodCache.
			replMeta become: meta.
			meta flushVMmethodCache.
			notifier tick].
	replacements := nil.	" remove unreferenced methods "
	notifier log: ''  Deleting methods''.
	notifier tickRate: DeletedMethods size // 50.
	traceCount := 0.
	DeletedMethods
		keysAndValuesDo:
			[:behav :selectors | 
			" do not bother deleted classes (which still understand identity methods)"
			(AllDeletedBehaviors includes: behav)
				ifFalse:
					[selectors
						do:
							[:sel | 
							traceMethodRemovals
								ifTrue:
									[(traceCount := traceCount + 1) &gt; 20
										ifTrue:
											[notifier text value: String new.
											traceCount := 0].
									notifier
										cr;
										show: behav name , ''&gt;&gt;'' , sel].	" hard code keeping copyright methods "
							sel == #copyright ifFalse: [behav quietlyRemoveSelector: sel]].	" flush the method cache all at once "
					behav flushVMmethodCache].
			notifier tick].	" set unreferenced globals to nil "
	(StrippingOptions includes: #stripGlobals)
		ifTrue:
			[notifier log: ''  Removing unreferenced globals''.
			notifier tickRate: DeletedGlobals size // 50.
			traceCount := 0.
			self sortDeletedGlobals.
			DeletedGlobals
				do:
					[:ref | 
					| refBinding |
					refBinding := ref bindingOrNil.
					refBinding notNil
						ifTrue:
							[traceClassRemovals
								ifTrue:
									[(traceCount := traceCount + 1) &gt; 20
										ifTrue:
											[notifier text value: String new.
											traceCount := 0].
									notifier
										cr;
										show: ''Resetting '' , refBinding key].
							refBinding whileMutableDo: [refBinding setValue: nil].	"Remove the binding, notifying the change set so that it gets removed from the containing package.
				If the binding is for a shared variable on a class, its environment will be a class so coerce it to be
				a namespace.  This is a no-op for proper Namespaces."
							refBinding value isNameSpace
								ifTrue: [ref removeFromSystem: #(#changes)]
								ifFalse:
									[ref environment
										ifNotNil:
											[ref environment asNameSpace
												removeBinding: refBinding
												recordIn: #(#changes)
												ifAbsent: []]]]]].
	self purgeChangeSets.
	self removeExtraneousReferences</body>
</methods>

<do-it>ChangeSet current addPatch: ''Res94469''</do-it>

</st-source>
' readStream fileIn
]

{ #category : #private }
CormasPackager >> keepClass: aClass into: keptItems [
	"keep aClass and its methods"
	
	| instSide classSide |
	instSide := aClass instanceBehavior.
	classSide := aClass classBehavior.
	keptItems keepClass: instSide.
	instSide selectors
		do: [:each | keptItems keepSelector: each inClass: instSide].
	classSide selectors
		do: [:each | keptItems keepSelector: each inClass: classSide]
]

{ #category : #actions }
CormasPackager >> launchPackaging [
	"launch all conditions"
	
	self userHasChoosedTargetFile ifFalse: [self updateTargetFileVM].
	self checkConditions ifFalse: [^self].
	(Dialog
		confirm:
			'This is the last step before packaging the image.\The image will be closed at the end of the process.\Do you really want to package now ?'
				withCRs) ifFalse: [^self].
	self doPackaging
]

{ #category : #accessing }
CormasPackager >> packagingDirectory [
	"return the directory where to generate the installation"
	
	^self targetImagePath directory
]

{ #category : #'interface opening' }
CormasPackager >> postBuildWith: aBuilder [
	"we add dynamically the widgets for the checks"
	
	super postBuildWith: aBuilder.
	self addCheckWidgetsIn: aBuilder.
	self inactivateTargetFilePath
]

{ #category : #private }
CormasPackager >> pundleNamesToKeep [
	"Pundles that should be kept"
	
	^#('BGOK' 'BOSS' 'Collections-Abstract' 'Collections-Arrayed' 'Collections-Sequenceable' 'Collections-Streams' 'Collections-String Support' 'Collections-Support' 'Collections-Text' 'Collections-Unordered' 'Com- All' 'Com- Automation' 'Com- Automation Browser' 'Com- Automation Development' 'Com- Automation Examples' 'Com- Automation Examples Pools' 'Com- Automation Extensions' 'Com- Automation Extensions PostLoad' 'Com- Automation Pools' 'Com- Automation Shared Extensions' 'Com- Automation Trippy Extensions' 'Com- CodeAnnotations' 'COM- Decompiler' 'Com- Event-Enabled Application Extensions' 'Com- ExtensionsToBase' 'Com- External Data Development Enhancements' 'Com- External Data Enhancements' 'Com- Interface Adaptors' 'Com- List Choice Dialogs' 'Com- Ole' 'Com- Ole Development' 'Com- Ole Examples' 'Com- Ole Pools' 'Com- System Configuration Services' 'Com- Win32' 'Com- Win32 Development' 'Com- Win32 Pools' 'Compression-ZLib' 'Cormas' 'Database' 'Database-Namespace' 'DLLCC' 'Drag-And-Drop' 'ErrorNotifier' 'Examples' 'External-Collections' 'External-Data' 'External-Interface' 'External-Types' 'GF/ST Base' 'GF/ST Demo' 'GF/ST Visual Inspector' 'Graphics-Color Rendering' 'Graphics-Constants' 'Graphics-Fonts' 'Graphics-Geometrical Objects' 'Graphics-Geometry' 'Graphics-Images' 'Graphics-Palettes' 'Graphics-Printing-Host' 'Graphics-Printing-PostScript' 'Graphics-Printing-Support' 'Graphics-Support' 'Graphics-Text Scanning' 'Graphics-Text Support' 'Graphics-Visual Objects' 'HashesBase' 'HotDraw' 'HotDraw Animated Examples' 'HotDraw Animation Framework' 'HotDraw Drawing Inspector' 'HotDraw Framework' 'HotDraw HotPaint' 'HotDraw PERT Chart' 'HotDraw Tool Development' 'ImageReaders' 'Interface-Announcements' 'Interface-Dialogs' 'Interface-Events' 'Interface-Events-Support' 'Interface-Events-Trackers' 'Interface-Framework' 'Interface-Menus' 'Interface-Models' 'Interface-Support' 'Internationalization' 'Kernel-Classes' 'Kernel-Exception Handling' 'Kernel-Methods' 'Kernel-Objects' 'Kernel-Opcodes' 'Kernel-Processes' 'Kernel-Support' 'LDM-Framework' 'Lens-Dev' 'Lens-Namespace' 'Lens-Runtime' 'LoggingTool' 'Magnitude-General' 'Magnitude-Numbers' 'MD5' 'Non-Commercialization' 'OS-Constants' 'OS-ExternalProcess' 'OS-PC' 'OS-Sockets' 'OS-Streaming' 'OS-Support' 'OS-Window System' 'OSkLogger' 'OSkSocketServices' 'OSkStreams' 'PackageCategories' 'PostgreSQLDriver' 'PostgreSQLEXDI' 'PostgreSQLLogging' 'RBCodeHighlighting' 'Refactory-Namespace' 'RuntimePackager' 'SecurityBase' 'Shadowed Compiling' 'SmaCC Runtime' 'SpEnvironmental' 'SpExceptions' 'SpFiles' 'SpSockets' 'SpTimes' 'Standard IO Streams' 'Store-Base' 'Store-Change Management' 'Store-Database' 'Store-DB-BaseObjects' 'Store-DB-Broker' 'Store-DB-Pundles' 'Store-DB-Records' 'Store-DB-Subdefs' 'Store-ImageModel' 'Store-IMG-Configurations' 'Store-IMG-Pundles' 'Store-IMG-Records' 'Store-IMG-Subdefs' 'Store-Merge' 'Store-Ownership' 'Store-SourceManagement' 'Store-User Management' 'System-Announcements' 'System-Changes' 'System-Code Component Changes' 'System-Code Components' 'System-Code Storage' 'System-Compiler-Assembler' 'System-Compiler-Names and Scopes' 'System-Compiler-Program Objects' 'System-Compiler-Public Access' 'System-Compiler-Support' 'System-Dependency Events' 'System-Name Spaces' 'System-Overrides' 'System-Printing' 'System-Subsystems' 'System-Support' 'Test' 'Tools-File Browser' 'Tools-HoverHelp' 'Tools-IDE-ListIcons' 'Tools-Misc' 'Tools-Resources' 'Tools-State Machine' 'Tools-Trippy' 'Tools-Workspace' 'UIBasics-Collections' 'UIBasics-Components' 'UIBasics-Controllers' 'UIBasics-Datasets' 'UIBasics-Internationalization' 'UIBasics-Notebook' 'UIBasics-Support' 'UIBuilder-Framework' 'UIBuilder-Specifications' 'UIBuilder-Support' 'UILooks-Default' 'UILooks-MSWin' 'UILooks-Support' 'UILooks-WinXP' 'UIPainter' 'URISupport' 'Windows ColorDepth Workaround' 'XML' 'XML-source')
]

{ #category : #private }
CormasPackager >> recursiveCopy: sourceFilename to: targetDirectory matching: matchingBlock [
	"recursivly copy the sourceFilename into the targetDirectory for filenames which matchingBlock return true.
		CormasPackager new recursiveCopy: 'c:\path\to\mydir' asFilename to: 'c:\tmp' asFilename matching: [:fn | true ]
	Be carefull, the result will be c:\tmp\mydir
	This method accepts file or diretory as sourceFilename
	Caution : This has no been tested for special files nor access rights
	"
	
	| target |
	target := targetDirectory \ sourceFilename tail.
	(matchingBlock value: target) ifFalse: [^self].
	sourceFilename isDirectory
		ifTrue:
			[target ensureDirectory.
			sourceFilename directoryContents
				do:
					[:each | 
					self
						recursiveCopy: sourceFilename \ each
						to: target
						matching: matchingBlock]]
		ifFalse: [sourceFilename copyTo: target]
]

{ #category : #actions }
CormasPackager >> refresh [
	"reinit the state of the packager"
	
	self resetAllChecks.
	self updateTargetFileVM
]

{ #category : #checking }
CormasPackager >> resetAllChecks [
	"reset all checks widgets"
	
	self checks do: [:each | each resetStatus]
]

{ #category : #private }
CormasPackager >> shouldBeCopied: aFilename [
	"indicates if aFilename should be copied during the copyModelFiles step."
	
	| fn |
	fn := aFilename asString.
	('*.pcl' match: fn) ifTrue: [^false].
	('*.pst' match: fn) ifTrue: [^false].
	aFilename tail = 'video' ifTrue: [^false].
	^true
]

{ #category : #actions }
CormasPackager >> shouldLeaveOpened: aController [
	"indicate if aController controls a window that should be leave in the installation image"
	
	self mainWindow
		ifNotNil: [:win | win controller == aController ifTrue: [^true]].
	aController == Cormas current mainWin controller ifTrue: [^true].
	^false
]

{ #category : #aspects }
CormasPackager >> targetFile [
	
	^self targetFileVM value asFilename
]

{ #category : #aspects }
CormasPackager >> targetFileVM [
	
	^targetFileVM ifNil: [targetFileVM := String new asValue]
]

{ #category : #accessing }
CormasPackager >> targetImagePath [
	"the path to the generated image (directory + imageName without extension) as a Filename.
	this path give all informations about the directory and the filenames for the image and the vm.
	take the actual choosen targetFile without its extension (.exe)"
	
	| s |
	s := self targetFileVM value asString.
	s size <= 4 ifTrue: [self error: 'Problem with the targetFile'].
	^(s
		copyFrom: 1
		to: s size - 4) asFilename
]

{ #category : #accessing }
CormasPackager >> targetRuntimeMode [
	"return the target runtimeMode (aSymbol in the Cormas availableRuntimeModes)"
	
	self subclassResponsibility
]

{ #category : #private }
CormasPackager >> unloadExtrasParcels [
	"unload undesired parcels"
	
	self extraParcelsNamesToUnload
		do: [:each | Parcel unloadParcelNamed: each]
]

{ #category : #'interface opening' }
CormasPackager >> updateTargetFileVM [
	
	self targetFileVM value: self computeDefaultTargetFile asString.
	self userHasChoosedTargetFile: false
]

{ #category : #accessing }
CormasPackager >> userHasChoosedTargetFile [
	"indicates if the actual targetFile has been interactively choosed by the user "
	
	^userHasChoosedTargetFile
]

{ #category : #accessing }
CormasPackager >> userHasChoosedTargetFile: aBoolean [
	"store the information about the status of the target file"
	
	userHasChoosedTargetFile := aBoolean
]
