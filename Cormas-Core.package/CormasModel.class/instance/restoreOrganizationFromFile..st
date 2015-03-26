- binary storage
restoreOrganizationFromFile: aFileName
	"Purpose: [Backward] Restore the complete state of the organization by reading the BOSS file contents of aFileName"
	
	| bos array myClone classes arcs |
	aFileName exists
		ifFalse:
			[self cormas
				warn: 'Sorry, <1s> does not exist !  Loading entities canceled'
				with: aFileName asString.
			^false].	"instanciate the stored CormasModel = myClone"
	bos := BinaryObjectStorage onOldNoScan: aFileName readStream.
	[array := bos contents] ensure: [bos close].
	myClone := array first.	"finalize the new organization by using the data into myClone"
	self setClassVarValueUsing: myClone allClassVarBOSS.
	Cormas Rand class Ui: self class randUi.
	self timeStep: self class timeStep.
	self data: myClone data copy.
	self cormas refreshCharts.
	self class currentSimulation: self.
	self spaceModel isNil
		ifFalse:
			[self spaceModel resetSpatialEntities.
			self spaceModel settingsFrom: array last]
		ifTrue: [spaceModel := array at: 2].	"il faut replacer les arcs en dernier"
	classes := self class allTerminalClasses.
	arcs := classes removeAllSuchThat: [:cl | cl inheritsFrom: ArcEntity].
	classes addAllLast: arcs.
	classes do: [:cl | self removeOldEntities: cl].
	classes do: [:cl | self installNewEntities: cl fromClone: myClone].
	^true