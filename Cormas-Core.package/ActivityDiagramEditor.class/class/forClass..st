interface opening
forClass: anEntityClass
	"Open an Editor interface to install the activity created as method of anEntityClass.
	Ex: ActivityDiagramEditor forClass:  CormasNS.Kernel.Entity  "
	
	| editor |
	editor := self new.
	editor targetClass: anEntityClass.
	editor open.
	editor setTitle.
	^editor