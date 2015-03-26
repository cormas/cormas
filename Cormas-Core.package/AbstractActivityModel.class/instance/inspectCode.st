controlling
inspectCode
	"Open a Browser on the selected method, or open an activity Diagram if available"
	
	((self targetClass methodsOfProtocol: #'@ control_diagram')
		includes: self selectedActivity value asSymbol)
		ifFalse:
			[Cormas
				editMethod: self selectedActivity value asSymbol
				fromClass: self targetClass]
		ifTrue:
			[self targetClass openActivityDiagram: self selectedActivity value asSymbol]