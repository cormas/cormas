Class {
	#name : #ElementActivityDiagramModel,
	#superclass : #UIApplicationModel,
	#instVars : [
		'incoming',
		'outgoing',
		'id'
	],
	#category : 'Cormas-Core-Tools'
}

{ #category : #'interface specs' }
ElementActivityDiagramModel class >> windowSpec [
	"Tools.UIPainter new openOnClass: self andSelector: #windowSpec"
	
	<resource: #canvas>
	^#(FullSpec 
		#window: #(WindowSpec 
			#label: 'Unlabeled Canvas' 
			#min: #(Point 40 20) 
			#max: #(Point 0 0) 
			#bounds: #(Rectangle 840 525 990 567) 
			#colors: #(LookPreferences 
				#setForegroundColor: #(ColorValue 6143 4096 8191) 
				#setBackgroundColor: #(ColorValue 5119 6655 8191) 
				#setSelectionForegroundColor: nil 
				#setSelectionBackgroundColor: nil) 
			#isEventDriven: true) 
		#component: #(SpecCollection 
			#collection: #(#(InputFieldSpec 
				#layout: #(LayoutFrame 1 0 7 0 -1 1 35 0) 
				#name: #nameHolder 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue 8191 7679 7167)) 
				#model: #nameHolder 
				#helpText: 'Choose activity name'))))
]

{ #category : #converting }
ElementActivityDiagramModel >> asFigure [
	
	| fig |
	fig := self figureType new.
	fig model: self.
	fig resetFigure.
	^fig
]

{ #category : #connection }
ElementActivityDiagramModel >> connectTo: destinationModel [
	
	self outgoing add: destinationModel.
	destinationModel incoming add: self
]

{ #category : #connection }
ElementActivityDiagramModel >> connectToDestination: destinationModel [
	
	self outgoing add: destinationModel.
	destinationModel incoming add: self
]

{ #category : #'initialize-release' }
ElementActivityDiagramModel >> delete [
	
	self outgoing do: [:destination | destination removeIncoming: self].
	self incoming do: [:origine | origine removeOutgoing: self].
	outgoing := nil.
	incoming := nil
]

{ #category : #connection }
ElementActivityDiagramModel >> disconnectFromDestination: destinationModel [
	
	self removeOutgoing: destinationModel.
	destinationModel removeIncoming: self
]

{ #category : #accessing }
ElementActivityDiagramModel >> figureType [
	
	self subclassResponsibility
]

{ #category : #accessing }
ElementActivityDiagramModel >> id [
	
	^id ifNil: [id := 0]
]

{ #category : #accessing }
ElementActivityDiagramModel >> id: anObject [
	
	id := anObject
]

{ #category : #accessing }
ElementActivityDiagramModel >> incoming [
	
	^incoming ifNil: [incoming := OrderedCollection new]
]

{ #category : #accessing }
ElementActivityDiagramModel >> incoming: anObject [
	
	incoming := anObject
]

{ #category : #testing }
ElementActivityDiagramModel >> isAlreadyConnected [
	
	^self outgoing isEmpty not
]

{ #category : #accessing }
ElementActivityDiagramModel >> name [
	
	^self class name asString
]

{ #category : #accessing }
ElementActivityDiagramModel >> outgoing [
	
	^outgoing ifNil: [outgoing := OrderedCollection new]
]

{ #category : #accessing }
ElementActivityDiagramModel >> outgoing: anObject [
	
	outgoing := anObject
]

{ #category : #connection }
ElementActivityDiagramModel >> removeIncoming: anIncomingActivity [
	
	self incoming
		remove: anIncomingActivity
		ifAbsent: [nil]
]

{ #category : #connection }
ElementActivityDiagramModel >> removeOutgoing: anOutgoingActivity [
	
	self outgoing
		remove: anOutgoingActivity
		ifAbsent: [nil]
]

{ #category : #printing }
ElementActivityDiagramModel >> storeOn: aStream [
	
	| deps outgo incom build uiSess |
	deps := self myDependents.
	self myDependents: nil.
	outgo := self outgoing.
	outgoing := nil.
	incom := self incoming.
	incoming := nil.
	build := builder.
	builder := nil.
	uiSess := uiSession.
	uiSession := nil.
	[super storeOn: aStream]
		ensure:
			[self myDependents: deps.
			outgoing := outgo.
			incoming := incom.
			builder := build.
			uiSession := uiSess]
]
