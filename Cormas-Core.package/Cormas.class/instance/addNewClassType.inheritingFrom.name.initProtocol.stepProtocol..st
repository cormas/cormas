model entities
addNewClassType: aType inheritingFrom: aSuperclass name: aName initProtocol: createInit stepProtocol: createStep
	
	| newClass selectionInList selector newList |
	self cormasModelClass isNil ifTrue: [^self alert_NewModel].
	(aName isNil or: [aName isEmpty]) ifTrue: [^nil].
	newClass := self createClassNamed: aName from: aSuperclass.
	selector := ((Cormas lowerCaseString: aType) , 'Classes') asSymbol.
	(self cormasModelClass perform: selector) add: newClass.
	(newClass inheritsFrom: SpatialEntityElement)
		ifTrue: [self cormasModelClass cellClass: newClass].
	selectionInList := self perform: ('list' , aType , 'Entities') asSymbol.	"selectionInList list add: aName asSymbol."
	newList := self getSortedListEntityClassType: aType.
	selectionInList list: newList.
	selectionInList
		selection:
			(newList
				detect: [:s | (Cormas dropBlanksFromString: s) = aName]
				ifNone: [self halt]).
	self createModelAccessors: newClass.
	self createProtocol: #control forClass: newClass.
	createInit ifTrue: [self createInit: newClass].
	createStep ifTrue: [self createStep: newClass].	"self modifyEntityClassType: aType."
	^newClass