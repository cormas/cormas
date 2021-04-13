"
GroupComm  is a class which subclass instances need to have the functionalities of AgentComm and Group


Instance Variables:
	components			<(Set of: (Agent))>	members of the group
	newComponents	<(Set of: (Agent))>	buffered collection of group members to be added
	removedComponents<(Set of: (Agent))>	buffered collection of group members to be removed


"
Class {
	#name : #CMGroupComm,
	#superclass : #CMAgentComm,
	#instVars : [
		'components',
		'newComponents',
		'removedComponents'
	],
	#category : #'Cormas-Core-Entities'
}

{ #category : #'components - managing' }
CMGroupComm >> addComponent: anItem [
	"Purpose: add IMMEDIATELY a given item as a new component of the group
Argument: anItem = <Agent>"
	
	self components add: anItem
]

{ #category : #'components - managing' }
CMGroupComm >> addComponents: aCollec [
	"Purpose: add IMMEDIATELY a collection of agents as new components of the group
Argument: aCollec = <Collection(Agent)>"
	
	self components addAll: aCollec
]

{ #category : #'components - managing' }
CMGroupComm >> addSynchronouslyComponent: anItem [
	"Purpose: the given item will be added as a new component of the group when 'updateComponents' will be send to the receiver. Meanwhile, it is stored in the buffer attribute 'newComponents'
Argument: anItem = <Agent>"
	
	self newComponents add: anItem
]

{ #category : #'components - accessing' }
CMGroupComm >> components [
	
	^components ifNil: [components := Set new]
]

{ #category : #'components - accessing' }
CMGroupComm >> components: uneValeur [
	
	components := uneValeur
]

{ #category : #deprecated }
CMGroupComm >> contain: anItem [
	
	^self components includes: anItem
]

{ #category : #'components - managing' }
CMGroupComm >> deleteComponent: anItem [
	"Purpose: remove IMMEDIATELY a given item from the group components
Argument: anItem = <Agent>"
	
	self components
		remove: anItem
		ifAbsent: []
]

{ #category : #'components - managing' }
CMGroupComm >> deleteComponents: aCollec [
	"Purpose: remove IMMEDIATELY a collection of agents from the group components
Argument: aCollec = <Collection(Agent)>"
	
	| listeSet |
	listeSet := Set new.
	listeSet := aCollec.
	self components: self components - listeSet
]

{ #category : #'components - managing' }
CMGroupComm >> deleteSynchronouslyComponent: anItem [
	"Purpose: the given item will be removed from the group components when 'updateComponents' will be send to the receiver. Meanwhile, it is stored in the buffer attribute 'removedComponents'
Argument: anItem = <Agent>"
	
	self removedComponents add: anItem
]

{ #category : #'initialize - release' }
CMGroupComm >> initWith: anAgentsCollection [
	"Purpose: resets and fills with new components"
	
	self reset.
	self components: anAgentsCollection
]

{ #category : #'components - accessing' }
CMGroupComm >> newComponents [
	
	^newComponents ifNil: [newComponents := Set new]
]

{ #category : #'components - accessing' }
CMGroupComm >> newComponents: uneValeur [
	
	newComponents := uneValeur
]

{ #category : #'components - accessing' }
CMGroupComm >> othersBut: x [
	
	| collection |
	collection := OrderedCollection new.
	self components do: [:other | other ~= x ifTrue: [collection add: other]].
	^collection
]

{ #category : #'components - accessing' }
CMGroupComm >> removedComponents [
	
	^removedComponents ifNil: [removedComponents := Set new]
]

{ #category : #'components - accessing' }
CMGroupComm >> removedComponents: uneValeur [
	
	removedComponents := uneValeur
]

{ #category : #'initialize - release' }
CMGroupComm >> reset [
	"Purpose: resets inherited and specific attributes"
	
	super reset.
	self components: Set new.
	self newComponents: Set new.
	self removedComponents: Set new
]

{ #category : #accessing }
CMGroupComm >> size [
	
	^self components size
]

{ #category : #control }
CMGroupComm >> stepDynPop [
	"Purpose: activate the biological life cycle of each agent of the group. 
Nota: the 'step' method of the Agent must return a collection either empty if there is no successuful reproduction or made of newborn instances to be added as new components of the group"

	| newBorns repro firstComp |
	(self components notNil and: [ self components isNotEmpty ])
		ifTrue: [ firstComp := self components first.
			(firstComp cormasHelper isTypeEntity and: [ firstComp isAgent ])
				ifTrue: [ newBorns := OrderedCollection new.
					(Cormas mix: self components)
						do: [ :anAgent | 
							repro := anAgent step.
							newBorns addAll: repro ].
					self updateWith: newBorns ] ].
	^ newBorns
]

{ #category : #control }
CMGroupComm >> updateAgents [
	"Purpose: get rid of dead components"
	
	| theDeadAgents |
	theDeadAgents := self components select: [:a | a dead].
	theDeadAgents
		do:
			[:a | 
			a patch notNil ifTrue: [a leave].
			self deleteComponent: a]
]

{ #category : #'components - managing' }
CMGroupComm >> updateComponents [
	"Purpose: use the buffered collections 'newComponents' and 'removedComponents' to update the group components instantaneously"
	
	self components addAll: self newComponents.
	self newComponents: OrderedCollection new.
	self components: self components - self removedComponents.
	self removedComponents: OrderedCollection new
]

{ #category : #control }
CMGroupComm >> updateWith: aCollec [
	"Purpose: get rid of dead components and add new ones"

	self updateAgents.
	self addComponents: aCollec
]
