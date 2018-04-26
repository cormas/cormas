interface actions
openSimulationGUI
	"Open the Simulation GUI. Now theSimulationGUI is a subCanvas of main application"
	
	| subcanvas spec |
	self cormasModelClass isNil ifTrue: [^self alert_NewModel].	"Ancienne version avec petite fenetre ind√©pendante."	"self simulationWin isNil 
		ifTrue: [self simulationWin: (self class openOn: self withSpec: #simulationWindow) window]
		ifFalse: [(self simulationWin) raise; expand]."
	subcanvas := self mainBuilder componentAt: #subcanvasSim.
	subcanvas isVisible
		ifTrue:
			[self resizeWindowToMin.
			subcanvas beInvisible]
		ifFalse:
			[self resizeWindowToMax.
			subcanvas beVisible.
			spec := self class interfaceSpecFor: #simulationWindow.
			subcanvas := subcanvas widget.
			subcanvas
				client: self
				spec: spec
				builder: self mainBuilder	"subcanvas client: self spec: spec"]	"	spec := self class interfaceSpecFor: #simulationWindow.
	subcanvas := (self builder componentAt: #subcanvasSim) widget.
	subcanvas client: self spec: spec builder: self mainBuilder."	"
	subcanvas client: self spec: spec.
	(self mainBuilder componentAt: #runBackButton) disable."