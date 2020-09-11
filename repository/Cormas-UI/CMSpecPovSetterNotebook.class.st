"
Container for PoV Setter palettes.

CMPovSetterNotebook example.

For the Collaborators Part: State my main collaborators and one line about how I interact with them. 

Public API and Key Messages

- message one   
- message two 
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.

    Instance Variables
	cormas:		<Object>
	cormasModel:		<Object>
	majorKeys:		<Object>


    Implementation Points
"
Class {
	#name : #CMSpecPovSetterNotebook,
	#superclass : #CMSpecObject,
	#instVars : [
		'tabManager',
		'cormasModel',
		'cormas'
	],
	#category : #'Cormas-UI-PoV'
}

{ #category : #specs }
CMSpecPovSetterNotebook class >> defaultSpec [
	<spec>

	^ SpecLayout composed
		newRow: [ : col | 
			col
				add: #tabManager ]
]

{ #category : #'change messages' }
CMSpecPovSetterNotebook >> changedExample [
	
	| sel modelClass povSetter |
	
	(sel := self tabManager selectedTab) isNil 
		ifTrue: [ ^ self ].
	((modelClass := ('CM' , sel label) asClass) inheritsFrom: CMArcEntity)
		ifTrue: [povSetter := PovSetter_Arc new]
		ifFalse: [ 
			modelClass isSpatialClass
				ifTrue: [ povSetter := CMSpecPovSetter_SpatialEntity new ]
				ifFalse: [ povSetter := CMSpecPovSetter_Agent new ] ].
	povSetter cormas: cormas.
	(self builder componentAt: #pageHolder) widget client: povSetter spec:
			#windowSpec.
	povSetter setModelClass: modelClass
]

{ #category : #initialization }
CMSpecPovSetterNotebook >> findPovSetterTabFor: anEntity [

	| modelClass |
	
	modelClass := (anEntity inheritsFrom: CMArcEntity)
		ifTrue: [ CMSpecPovSetter_Agent  ]
		ifFalse: [ 
			anEntity isSpatialClass 
				ifTrue: [ CMSpecPovSetter_SpatialEntity ]
				ifFalse: [ CMSpecPovSetter_Agent ] ].
	^ (modelClass for: self projectManager) setModelClass: anEntity
]

{ #category : #initialization }
CMSpecPovSetterNotebook >> initializePresenter [
	" Private - See superimplementor's comment "

	self populateManager.
	self tabManager whenTabSelected: [ 
		self changedExample ].
]

{ #category : #initialization }
CMSpecPovSetterNotebook >> initializeWidgets [
	" Private - See superimplementor's comment "

	tabManager := self newTabManager.
	tabManager owner: self.
	self prepareClasses.
]

{ #category : #initialization }
CMSpecPovSetterNotebook >> newTabFor: anEntity [
	| tab modelClass |
	modelClass := self findPovSetterTabFor: anEntity.
	(tab := self newTab)
		label: anEntity entityName;
		" Cell, Node, Arc, etc "
			model: modelClass;
		owner: self.
	^ tab
]

{ #category : #initialization }
CMSpecPovSetterNotebook >> populateManager [
	" Add dynamic tabs "

	self prepareClasses do: [ : entity |
		| tab |
		tab := (self newTabFor: entity)
				closeable: false;
				yourself.
		self tabManager addTab: tab ]
]

{ #category : #private }
CMSpecPovSetterNotebook >> prepareClasses [
	
	| modelClasses |
	modelClasses := OrderedCollection new.
	^ modelClasses 
		add: self cormasModelClass cellClass;
		addAll: self cormasModelClass compoundSpatialClasses;
		addAll: (self cormasModelClass socialClasses select: #isSituatedClass);
		addAll: (self cormasModelClass passiveObjectClasses select: #isSituatedClass);
		yourself

]

{ #category : #accessing }
CMSpecPovSetterNotebook >> tabManager [
	^ tabManager
]

{ #category : #accessing }
CMSpecPovSetterNotebook >> tabManager: anObject [
	tabManager := anObject
]

{ #category : #accessing }
CMSpecPovSetterNotebook >> title [

	^ self translator tPoVSetter
]
