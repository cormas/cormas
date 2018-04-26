interface opening
forClass: anEntityClass method: aMethodName
	"Open an Editor interface to install the activity created as aMethodName of anEntityClass.
	Ex: ActivityDiagramEditor forClass:  CormasNS.Kernel.Entity  method: #bidon"
	
	| editor |
	editor := self forClass: anEntityClass.
	editor name: aMethodName.
	editor setTitle.
	^editor