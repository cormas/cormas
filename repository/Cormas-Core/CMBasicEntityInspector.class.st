Class {
	#name : #CMBasicEntityInspector,
	#superclass : #Object,
	#instVars : [
		'attributesSpec',
		'object'
	],
	#category : #'Cormas-Core-Interface'
}

{ #category : #'view creation' }
CMBasicEntityInspector class >> openOn: anObject attributesSpec: aDico [
	
	| aInspector |
	aInspector := self new.
	aInspector attributesSpec: aDico.
	^self open: (aInspector inspect: anObject)
]

{ #category : #'interface specs' }
CMBasicEntityInspector class >> windowSpec [
	"Tools.UIPainter new openOnClass: self andSelector: #windowSpec"
	
	<resource: #canvas>
	^#(FullSpec 
		#window: #(WindowSpec 
			#label: #(UserMessage 
				#key: #UnlabeledCanvas 
				#defaultString: 'Unlabeled Canvas' 
				#catalogID: #labels) 
			#min: #(Point 20 20) 
			#max: #(Point 0 0) 
			#bounds: #(Rectangle 640 512 878 662)) 
		#component: #(SpecCollection 
			#collection: #(#(SequenceViewSpec 
				#layout: #(LayoutFrame 0 0 0 0 0 0.4 0 1) 
				#name: #fieldList 
				#model: #fieldListHolder 
				#callbacksSpec: #(UIEventCallbackSubSpec 
					#doubleClickSelector: #doubleClickField 
					#requestValueChangeSelector: #changeRequest)) #(TextEditorSpec 
				#layout: #(LayoutFrame 0 0.4 0 0 1 1 0 1) 
				#name: #text 
				#model: #textHolder 
				#callbacksSpec: #(UIEventCallbackSubSpec 
					#valueChangeSelector: #textAccepted: 
					#requestValueChangeSelector: #textAcceptAllowed:) 
				#tabRequiresControl: true))))
]

{ #category : #accessing }
CMBasicEntityInspector >> attributesSpec [
	
	^attributesSpec
]

{ #category : #accessing }
CMBasicEntityInspector >> attributesSpec: anObject [
	
	attributesSpec := anObject
]

{ #category : #'initialize-release' }
CMBasicEntityInspector >> basicPrintStringFor: anObject [
	"Answer a the name of the entity instance"
	
	^anObject class name asString , ' n¬∞ ' , anObject id printString
]

{ #category : #'initialize-release' }
CMBasicEntityInspector >> field: selection [
	"Set selection to be the currently selected variable."
	
	selection = '----------'
		ifFalse:
			[field := selection.
			self resetText]
]

{ #category : #'field list' }
CMBasicEntityInspector >> fieldList [
	
	| collec |
	self attributesSpec ifNotNil: [^self fieldList_SIconfig].
	collec := SortedCollection new.
	self objectClassAndItsUserDefinedSuperClasses
		do: [:c | collec addAll: c instVarNames].
	collec := collec asOrderedCollection.
	collec addFirst: '----------'.
	(((object class superClassesUntil: CMEntity) includes: CMAgentComm)
		or: [ (object class superClassesUntil: CMEntity) includes: CMAgentCommLocation ])
			ifTrue: [collec addFirst: 'mailBox'].
	(object class inheritsFrom: CMSpatialEntityCell)
		ifTrue: [collec addFirst: 'state'].
	(object class isSpatialClass and: [object isElementary not])
		ifTrue: [collec addFirst: 'destroyed'].
	object class isSpatialClass ifFalse: [collec addFirst: 'dead'].
	collec addFirst: 'id'.
	^collec
]

{ #category : #'field list' }
CMBasicEntityInspector >> fieldList_SIconfig [
	
	| collec |
	collec := SortedCollection new.
	collec
		addAll:
			((self attributesSpec at: object class) collect: [:att | att asString]).
	^collec
]

{ #category : #'initialize-release' }
CMBasicEntityInspector >> initialize [
	"Initialize a newly created instance. This method must answer the receiver."
	
	super initialize.	" *** Replace this comment with the appropriate initialization code *** "
	^self
]

{ #category : #'access classes' }
CMBasicEntityInspector >> objectClassAndItsUserDefinedSuperClasses [
	"Still used??"
	| collec |
	collec := object class superClassesUntil: CMEntity.
	CMAbstractModel allEntityClasses
		do:
			[:c | 
			collec
				remove: c
				ifAbsent: []].
	collec remove: CMEntity.
	(object isKindOf: CMArcEntity) ifTrue: [collec add: CMArcEntity].
	(object isKindOf: CMNodeEntity) ifTrue: [collec add: CMNodeEntity].
	^collec
]
