Class {
	#name : #EntityAdditionInterface,
	#superclass : #UIApplicationModel,
	#instVars : [
		'newClassName',
		'cbLocation',
		'cbComm',
		'cbGroup',
		'spatialEntitySuperclass',
		'cormas',
		'passiveEntitySuperclass',
		'cellOrCA',
		'entityName',
		'entityElementType',
		'toolbar'
	],
	#category : 'Cormas-Core-Tools'
}

{ #category : #compiling }
EntityAdditionInterface class >> acceptsLoggingOfCompilation [
	^ true
]

{ #category : #'interface specs' }
EntityAdditionInterface class >> addAgent [
	"Tools.UIPainter new openOnClass: self andSelector: #addAgent"
	
	<resource: #canvas>
	^#(FullSpec 
		#window: #(WindowSpec 
			#properties: #(PropertyListDictionary #sizeType #specifiedSize #openType #advanced #openPosition #(Point 10 130) #positionType #specifiedPosition) 
			#label: 'Create a kind of Agent' 
			#min: #(Point 311 126) 
			#max: #(Point 311 126) 
			#bounds: #(Rectangle 720 450 1031 576)) 
		#component: #(SpecCollection 
			#collection: #(#(InputFieldSpec 
				#layout: #(Rectangle 135 36 287 59) 
				#name: #InputField1 
				#model: #newClassName 
				#helpText: 'Enter the name of the new class') #(LabelSpec 
				#layout: #(Point 190 16) 
				#name: #name 
				#label: 'Name') #(ActionButtonSpec 
				#layout: #(Rectangle 168 67 249 90) 
				#name: #Ok 
				#model: #addNewSocialEntityGUI 
				#label: 'Ok' 
				#defaultable: true) #(CheckBoxSpec 
				#layout: #(Point 17 18) 
				#name: #cbComm 
				#model: #cbComm 
				#helpText: 'Agent with mailbox' 
				#label: 'Communication') #(CheckBoxSpec 
				#layout: #(Point 17 45) 
				#name: #cbGroup 
				#model: #cbGroup 
				#helpText: 'Agent as a group of agents' 
				#label: 'Group') #(CheckBoxSpec 
				#layout: #(Point 17 72) 
				#name: #cbLocation 
				#model: #cbLocation 
				#helpText: 'Agent located on a Cell' 
				#label: 'Location') #(LabelSpec 
				#layout: #(Point 35 99) 
				#name: #Label1 
				#label: '(or right-click on your own class to specialize it)'))))
]

{ #category : #'interface specs' }
EntityAdditionInterface class >> addPassiveEntity [
	"Tools.UIPainter new openOnClass: self andSelector: #addPassiveEntity"
	
	<resource: #canvas>
	^#(FullSpec 
		#window: #(WindowSpec 
			#properties: #(PropertyListDictionary #sizeType #specifiedSize #openType #advanced #openPosition #(Point 10 130) #positionType #specifiedPosition) 
			#label: 'Create a kind of Passive Entity' 
			#min: #(Point 300 213) 
			#max: #(Point 300 213) 
			#bounds: #(Rectangle 718 450 1018 663)) 
		#component: #(SpecCollection 
			#collection: #(#(InputFieldSpec 
				#layout: #(Rectangle 132 29 289 52) 
				#name: #InputField1 
				#model: #newClassName 
				#helpText: 'Enter the name of the new class') #(LabelSpec 
				#layout: #(Point 190 9) 
				#name: #name 
				#label: 'Name') #(ActionButtonSpec 
				#layout: #(Rectangle 166 157 247 180) 
				#name: #Ok 
				#model: #addNewPassivelEntityGUI 
				#label: 'Ok' 
				#defaultable: true) #(RadioButtonSpec 
				#layout: #(Point 19 158) 
				#name: #Msg 
				#model: #passiveEntitySuperclass 
				#helpText: 'Message for AgentCommunication (with mailbox)' 
				#label: 'Message' 
				#select: #Msg) #(RadioButtonSpec 
				#layout: #(Point 19 12) 
				#name: #PassiveObject 
				#model: #passiveEntitySuperclass 
				#helpText: 'A simple passive entity' 
				#label: 'Object' 
				#select: #PassiveObject) #(RadioButtonSpec 
				#layout: #(Point 19 37) 
				#name: #CMObjectLocation 
				#model: #passiveEntitySuperclass 
				#helpText: 'A passive entity located on a Cell' 
				#label: 'Located Object' 
				#select: #CMObjectLocation) #(LabelSpec 
				#layout: #(Point 33 189) 
				#name: #Label3 
				#label: '(or right-click on your own class to specialize it)') #(RadioButtonSpec 
				#layout: #(Point 19 123) 
				#name: #CMNetworkEntity 
				#model: #passiveEntitySuperclass 
				#helpText: 'An oriented Network composed of a set of Arcs and Nodes' 
				#label: 'Full Network' 
				#select: #CMNetworkEntity) #(RadioButtonSpec 
				#layout: #(Point 19 97) 
				#name: #CMArcEntity 
				#model: #passiveEntitySuperclass 
				#helpText: 'An Arc of a Network located on 2 Cells' 
				#label: 'Network Arc' 
				#select: #CMArcEntity) #(RadioButtonSpec 
				#layout: #(Point 19 72) 
				#name: #CMNodeEntity 
				#model: #passiveEntitySuperclass 
				#helpText: 'A Node of a Network located on a Cell' 
				#label: 'Network Node' 
				#select: #CMNodeEntity))))
]

{ #category : #'interface specs' }
EntityAdditionInterface class >> addSpatialEntity [
	"Tools.UIPainter new openOnClass: self andSelector: #addSpatialEntity"
	
	<resource: #canvas>
	^#(FullSpec 
		#window: #(WindowSpec 
			#properties: #(PropertyListDictionary #sizeType #specifiedSize #openType #advanced #openPosition #(Point 10 130) #positionType #specifiedPosition) 
			#label: 'Create a kind of Spatial Entity' 
			#min: #(Point 260 205) 
			#max: #(Point 300 250) 
			#bounds: #(Rectangle 209 232 469 437)) 
		#component: #(SpecCollection 
			#collection: #(#(InputFieldSpec 
				#layout: #(Rectangle 51 128 214 151) 
				#name: #InputField1 
				#model: #newClassName) #(LabelSpec 
				#layout: #(Point 113 108) 
				#name: #name 
				#label: 'Name:') #(ActionButtonSpec 
				#layout: #(Rectangle 91 160 172 183) 
				#name: #Ok 
				#model: #addNewSpatialEntityGUI 
				#label: 'Ok' 
				#defaultable: true) #(RadioButtonSpec 
				#layout: #(Point 18 16) 
				#name: #CMSpatialEntityCell 
				#model: #spatialEntitySuperclass 
				#helpText: 'SpatialEntityCell: the cell is the basic entity of the space (as Cellular Automata)' 
				#label: 'Element' 
				#select: #CMSpatialEntityCell) #(RadioButtonSpec 
				#layout: #(Point 18 58) 
				#name: #CMSpatialEntityAggregate 
				#flags: 32 
				#model: #spatialEntitySuperclass 
				#helpText: 'SpatialEntityAggregate is composed of connected cells' 
				#label: 'Aggregate' 
				#select: #CMSpatialEntityAggregate) #(RadioButtonSpec 
				#layout: #(Point 18 87) 
				#name: #CMSpatialEntityNotConnex 
				#flags: 32 
				#model: #spatialEntitySuperclass 
				#helpText: 'SpatialEntityNotConnex is composed of unconnected cells or aggregates' 
				#label: 'Set not connex' 
				#select: #CMSpatialEntityNotConnex) #(LabelSpec 
				#layout: #(Point 23 180) 
				#name: #LabelSpecialize 
				#label: '(or right-click on your own class to specialize it)') #(RadioButtonSpec 
				#layout: #(Point 92 16) 
				#name: #simpleCell 
				#model: #cellOrCA 
				#helpText: 'SpatialEntityElement is the basic Cell entity' 
				#label: 'Simple Cell' 
				#style: #small 
				#select: #CMSpatialEntityElement) #(RadioButtonSpec 
				#layout: #(Point 92 36) 
				#name: #cellAutomaton 
				#model: #cellOrCA 
				#helpText: 'CA is usefull for dynamics between cells' 
				#label: 'Cellular Automaton' 
				#style: #small 
				#select: #CMSpatialEntityCell))))
]

{ #category : #initialization }
EntityAdditionInterface class >> defaultSpec [
	<spec>
	^ SpecLayout composed
]

{ #category : #'resources-icons' }
EntityAdditionInterface class >> messageImage [
	
	^Cormas messageImage
]

{ #category : #actions }
EntityAdditionInterface >> addNewPassivelEntityGUI [
	
	| superClass newName |
	newName := self getNewClassNameFromGUI.
	newName isNil
		ifTrue: [^self cormas warn: 'Please enter a name for the new class!'].
	self passiveEntitySuperclass value isNil
		ifTrue: [^self cormas warn: 'Please tick a super class!'].
	superClass := self passiveEntitySuperclass value class.
	self cormas addNewClassType: 'Passive' inheritingFrom: superClass name:
			newName initProtocol: false stepProtocol: false.
	self closeRequest
]

{ #category : #actions }
EntityAdditionInterface >> addNewSocialEntityGUI [
	
	| newName superClass |
	newName := self getNewClassNameFromGUI.
	newName isNil
		ifTrue: [^self cormas warn: 'Please enter a name for the new class!'].
	superClass := self getAgentSuperclassFromGUI.
	self cormas addNewClassType: 'Social' inheritingFrom: superClass name:
			newName initProtocol: false stepProtocol: false.
	self closeRequest
]

{ #category : #actions }
EntityAdditionInterface >> addNewSpatialEntityGUI [
	
	| superClass newName aClass |
	newName := self getNewClassNameFromGUI.
	newName isNil
		ifTrue: [^self cormas warn: 'Please enter a name for the new class!'].
	self spatialEntitySuperclass value isNil
		ifTrue: [^self cormas warn: 'Please tick a super class!'].
	aClass := self spatialEntitySuperclass value = #CMSpatialEntityCell
		ifTrue: [self cellOrCA value]
		ifFalse: [self spatialEntitySuperclass value].
	superClass := aClass class.
	self cormas addNewClassType: 'Spatial' inheritingFrom: superClass name:
			newName initProtocol: false stepProtocol: false.
	self closeRequest
]

{ #category : #aspects }
EntityAdditionInterface >> cbComm [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^cbComm isNil
		ifTrue: [cbComm := false asValue]
		ifFalse: [cbComm]
]

{ #category : #aspects }
EntityAdditionInterface >> cbGroup [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^cbGroup isNil
		ifTrue: [cbGroup := false asValue]
		ifFalse: [cbGroup]
]

{ #category : #aspects }
EntityAdditionInterface >> cbLocation [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^cbLocation isNil
		ifTrue: [cbLocation := false asValue]
		ifFalse: [cbLocation]
]

{ #category : #changed }
EntityAdditionInterface >> cbSuperclassChanged [
	
	(self builder notNil and: [self builder window isActive])
		ifTrue:
			[self builder window
				label:
					'Create a kind of ' , self getAgentSuperclassFromGUI name asString]
]

{ #category : #aspects }
EntityAdditionInterface >> cellOrCA [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^cellOrCA isNil
		ifTrue: [cellOrCA := nil asValue]
		ifFalse: [cellOrCA]
]

{ #category : #accessing }
EntityAdditionInterface >> cormas [
	
	^cormas
]

{ #category : #accessing }
EntityAdditionInterface >> cormas: anObject [
	
	cormas := anObject
]

{ #category : #changed }
EntityAdditionInterface >> crPassiveSuperclassChanged [
	
	(self builder notNil and: [self builder window isActive])
		ifTrue:
			[self builder window
				label:
					'Create a kind of ' , self passiveEntitySuperclass value asString]
]

{ #category : #changed }
EntityAdditionInterface >> crSpatialSuperclassChanged [
	
	(self builder notNil and: [self builder window isActive])
		ifTrue:
			[self builder window
				label:
					'Create a kind of '
						,
							(self spatialEntitySuperclass value asString
								copyFrom: 14
								to: self spatialEntitySuperclass value asString size)]
]

{ #category : #accessing }
EntityAdditionInterface >> entityName [
	" Answer the entityName of this EntityAdditionInterface "

	^ entityName
]

{ #category : #accessing }
EntityAdditionInterface >> entityName: anObject [
	" Sets the entityName of this EntityAdditionInterface "

	entityName := anObject
]

{ #category : #accessing }
EntityAdditionInterface >> getAgentSuperclassFromGUI [
	
	self cbComm value not & self cbLocation value not & self cbGroup value not
		ifTrue: [^Agent].
	self cbComm value & self cbLocation value not & self cbGroup value not
		ifTrue: [^AgentComm].
	self cbComm value not & self cbLocation value & self cbGroup value not
		ifTrue: [^AgentLocation].
	self cbComm value & self cbLocation value & self cbGroup value not
		ifTrue: [^CMAgentCommLocation].
	self cbComm value not & self cbLocation value not & self cbGroup value
		ifTrue: [^CMGroup].
	self cbComm value & self cbLocation value not & self cbGroup value
		ifTrue: [^CMGroupComm].
	self cbComm value not & self cbLocation value & self cbGroup value
		ifTrue: [^CMGroupLocation].
	self cbComm value & self cbLocation value & self cbGroup value
		ifTrue: [^CMGroupCommLocation]
]

{ #category : #accessing }
EntityAdditionInterface >> getNewClassNameFromGUI [
	
	| aName |
	aName := self newClassName value.
	aName isEmpty
		ifFalse:
			[aName beMutable.
			aName first isAlphabetic ifFalse: [aName := 'X_' , aName].
			aName
				at: 1
				put: aName first asUppercase.
			(self cormas verifyClassExist: aName)
				ifTrue:
					[self cormas alert_NameAlreadyExist.
					^nil]]
		ifTrue: [^nil].
	^aName
]

{ #category : #initialization }
EntityAdditionInterface >> initialExtent [
	^ 600 @ 400
]

{ #category : #'initialize-release' }
EntityAdditionInterface >> initialize [
	
	super initialize.
	self cbComm onChangeSend: #cbSuperclassChanged to: self.
	self cbGroup onChangeSend: #cbSuperclassChanged to: self.
	self cbLocation onChangeSend: #cbSuperclassChanged to: self.
	self spatialEntitySuperclass onChangeSend: #crSpatialSuperclassChanged to:
			self.
	self passiveEntitySuperclass onChangeSend: #crPassiveSuperclassChanged to:
			self
]

{ #category : #initialization }
EntityAdditionInterface >> initializePresenter [
	
]

{ #category : #initialization }
EntityAdditionInterface >> initializeWidgets [
	| tmp2 |
	self instantiateModels: #().
	tmp2 := self focusOrder.
	tmp2
		add: nil;
		add: nil
]

{ #category : #aspects }
EntityAdditionInterface >> newClassName [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^newClassName isNil
		ifTrue: [newClassName := String new asValue]
		ifFalse: [newClassName]
]

{ #category : #aspects }
EntityAdditionInterface >> passiveEntitySuperclass [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^passiveEntitySuperclass isNil
		ifTrue: [passiveEntitySuperclass := nil asValue]
		ifFalse: [passiveEntitySuperclass]
]

{ #category : #'interface opening' }
EntityAdditionInterface >> postBuildWith: aBuilder [
	
	('*Spatial*' match: aBuilder window label)
		ifTrue:
			[self cormas currentModel cellClass isNil
				ifFalse:
					[self spatialEntitySuperclass value: #CMSpatialEntityAggregate.
					(aBuilder componentAt: #CMSpatialEntityCell) disable.
					(aBuilder componentAt: #simpleCell) disable.
					(aBuilder componentAt: #cellAutomaton) disable.
					(aBuilder componentAt: #LabelSpecialize) enable.
					(aBuilder componentAt: #CMSpatialEntityAggregate) enable.
					(aBuilder componentAt: #CMSpatialEntityNotConnex) enable]
				ifTrue:
					[self spatialEntitySuperclass value: #CMSpatialEntityCell.
					self cellOrCA value: #CMSpatialEntityElement.
					(aBuilder componentAt: #CMSpatialEntityCell) enable.
					(aBuilder componentAt: #simpleCell) enable.
					(aBuilder componentAt: #cellAutomaton) enable.
					(aBuilder componentAt: #LabelSpecialize) disable.
					(aBuilder componentAt: #CMSpatialEntityAggregate) disable.
					(aBuilder componentAt: #CMSpatialEntityNotConnex) disable]].
	('*Passive*' match: aBuilder window label)
		ifTrue:
			[self cormas currentModel commClasses isEmpty
				ifFalse: [(aBuilder componentAt: #Msg) enable]
				ifTrue: [(aBuilder componentAt: #Msg) disable]]
]

{ #category : #accessing }
EntityAdditionInterface >> rbEntityElementType [
	" Answer the entityElementType of this EntityAdditionInterface "

	^ entityElementType
]

{ #category : #accessing }
EntityAdditionInterface >> rbEntityElementType: anObject [
	" Sets the entityElementType of this EntityAdditionInterface "

	entityElementType := anObject
]

{ #category : #aspects }
EntityAdditionInterface >> spatialEntitySuperclass [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^spatialEntitySuperclass isNil
		ifTrue: [spatialEntitySuperclass := nil asValue]
		ifFalse: [spatialEntitySuperclass]
]

{ #category : #initialization }
EntityAdditionInterface >> title [
	^ 'Create a kind of Entity'
]

{ #category : #accessing }
EntityAdditionInterface >> toolbar [
	" Answer the toolbar of this EntityAdditionInterface "

	^ toolbar
]

{ #category : #accessing }
EntityAdditionInterface >> toolbar: anObject [
	" Sets the toolbar of this EntityAdditionInterface "

	toolbar := anObject
]
