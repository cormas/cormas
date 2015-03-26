actions
compileForClass: aTargetClass selector: selectorName
	"this method is called from the #install button. 
	It creates 2 methods in the aTargetClass: 
			an instance method (into the #@ control_diagram protocol) called selectorName, and 
			a class method (into the #+ activityDiagram protocol) called activity_SelectorName"
	
	| codeStream string protocol |
	self setActivitiesId.	" ****    writting the #activity_method as CLASS Method: activity_selectorName   **** "
	codeStream := String new writeStream.
	codeStream
		nextPutAll:
				aTargetClass preStringForActivitySelector , selectorName asString;
		cr.
	self writeCommentForClassMethodOn: codeStream.
	self writeDiagramDefinitionOn: codeStream.
	string := codeStream contents.
	protocol := '+ activityDiagram'.
	self option isSymbol ifTrue: [protocol := protocol , '_' , self option].
	aTargetClass class compile: string classified: protocol notifying: nil.	" ****    writting the #method as INSTANCE Method: selectorName    **** "
	codeStream := String new writeStream.
	codeStream
		nextPutAll: selectorName;
		cr.
	self writeCommentForInstanceMethodOn: codeStream.
	codeStream nextPutAll: '	self performActivityDiagram: #' , selectorName.
	string := codeStream contents.
	protocol := '@ control_diagram'.
	(aTargetClass includesBehavior: CormasModelOld)
		ifTrue:
			[protocol := Dialog choose:
					'Please, choose a protocol to install the diagram?'
				fromVerticallyAlignedButtonsWithLabels:
					#('init' 'control' '@ control_diagram') values:
					#('init' 'control' '@ control_diagram') default: '@ control_diagram'].
	aTargetClass compile: string classified: protocol notifying: nil.
	self cormasModel isNil ifFalse: [self cormasModel addDiagram: self]