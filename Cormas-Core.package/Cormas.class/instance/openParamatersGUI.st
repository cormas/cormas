interface actions
openParamatersGUI
	"Open the Parameters GUI (in SimulationsManagers class)"
	
	self cormasModel isNil ifTrue: [^self alert_NewModel].
	self cormasModel openDataSetterInterface