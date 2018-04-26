interface actions
ensureSimulationGUIisOpen
	"Test if the simulation subCanvas of the main window is visible. If not then makes it visible"
	
	| subcanvas spec |
	self cormasModelClass isNil ifTrue: [^self alert_NewModel].
	subcanvas := self mainBuilder componentAt: #subcanvasSim.
	subcanvas isVisible
		ifFalse:
			[self resizeWindowToMax.
			subcanvas beVisible.
			spec := self class interfaceSpecFor: #simulationWindow.
			subcanvas := subcanvas widget.
			subcanvas
				client: self
				spec: spec
				builder: self mainBuilder]