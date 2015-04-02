interface actions
closeMyWindows
	"Close all the opened windows except the main interface"
	"self spaceInterfaces do:[: spaceWin | spaceWin closeRequest].
	self spaceInterfaces: nil."
	
	| subcanvas |
	self spaceModel ifNotNil: [:sm | sm closeGraphicWindows].
	self obsWin notNil
		ifTrue:
			[self obsWin observateur actionQuitter.
			self obsWin: nil].
	self visualStateWin notNil
		ifTrue:
			[self visualStateWin close.
			self visualStateWin: nil].
	self defineEntityWin notNil
		ifTrue:
			["self defineEntityWin close"
			self defineEntityWin controller closeAndUnschedule.
			self defineEntityWin: nil].
	self simulationWin notNil
		ifTrue:
			[self simulationWin controller closeAndUnschedule.
			self simulationWin: nil].
	subcanvas := self mainBuilder componentAt: #subcanvasSim.
	subcanvas isVisible
		ifTrue:
			[self resizeWindowToMin.
			subcanvas beInvisible].	"self defineSchedulerWin notNil 
		ifTrue: 
			[self defineSchedulerWin closeRequest.
			self defineSchedulerWin: nil]."
	self defineCommWin notNil
		ifTrue:
			[self defineCommWin closeRequest.
			self defineCommWin: nil].
	self displayChartsWin notNil
		ifTrue:
			[self displayChartsWin do: [:win | win closeRequest].
			self displayChartsWin: nil].
	self defineChartsWin notNil
		ifTrue:
			[self defineChartsWin closeRequest.
			self defineChartsWin: nil].
	self definePatchWin notNil
		ifTrue:
			[self definePatchWin closeRequest.
			self definePatchWin: nil].
	CreateInstances allInstances do: [:aWin | aWin closeRequest].
	ManipulateInstances allInstances do: [:aWin | aWin closeRequest].
	DefaultAttributesSetter allInstances do: [:aWin | aWin closeRequest].
	HistogramsInterface allInstances do: [:aWin | aWin closeRequest].
	(Cormas allTerminalClassesOf: SensitivitySetter)
		do: [:aClass | aClass allInstances do: [:aWin | aWin closeRequest]]