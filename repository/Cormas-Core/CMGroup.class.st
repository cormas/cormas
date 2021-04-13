"
Group is a subclass of Agent and is composed of Agents.

Instance Variables:
	components			<(Set of: (Agent))>	members of the group
	newComponents	<(Set of: (Agent))>	buffered collection of group members to be added
	removedComponents<(Set of: (Agent))>	buffered collection of group members to be removed


"
Class {
	#name : #CMGroup,
	#superclass : #CMAgent,
	#instVars : [
		'components',
		'newComponents',
		'removedComponents'
	],
	#category : #'Cormas-Core-Entities'
}

{ #category : #'instance creation' }
CMGroup class >> newWith: anAgentCollection [
	"Return a new instance of Group, composed with anAgentCollection."

	^ self new initWith: anAgentCollection
]

{ #category : #'components - managing' }
CMGroup >> addComponent: anAgent [
	"Add immediately an agent as a new component of the group"

	self components add: anAgent
]

{ #category : #'components - managing' }
CMGroup >> addComponents: aCollection [
	"Add immediately a collection of agents as new components of the group"

	self components addAll: aCollection
]

{ #category : #'components - managing' }
CMGroup >> addSynchronouslyComponent: anAgent [
	"Purpose: the given item will be added as a new component of the group when 'updateComponents' will be send to the receiver. Meanwhile, it is stored in the buffer attribute 'newComponents'
Argument: anItem = <Agent>"

	self newComponents add: anAgent
]

{ #category : #'components - accessing' }
CMGroup >> components [
	
	^components ifNil: [components := Set new]
]

{ #category : #'components - accessing' }
CMGroup >> components: anAgentSet [
	components := anAgentSet
]

{ #category : #'components - managing' }
CMGroup >> deleteComponent: anAgent [
	"Purpose: remove IMMEDIATELY a given item from the group components
Argument: anItem = <Agent>"

	self components remove: anAgent ifAbsent: [  ]
]

{ #category : #'components - managing' }
CMGroup >> deleteComponents: aCollection [
	"Purpose: remove IMMEDIATELY a collection of agents from the group components
Argument: aCollec = <Collection(Agent)>"

	| listeSet |
	listeSet := Set new.
	listeSet := aCollection.
	self components: self components - listeSet
]

{ #category : #'components - managing' }
CMGroup >> deleteSynchronouslyComponent: anAgent [
	"Purpose: the given item will be removed from the group components when 'updateComponents' will be send to the receiver. Meanwhile, it is stored in the buffer attribute 'removedComponents'
Argument: anItem = <Agent>"

	self removedComponents add: anAgent
]

{ #category : #'initialize - release' }
CMGroup >> initWith: anAgentsCollection [
	"Purpose: resets and fills with new components"
	
	self reset.
	self components: anAgentsCollection
]

{ #category : #'components - accessing' }
CMGroup >> newComponents [
	
	^newComponents ifNil: [newComponents := Set new]
]

{ #category : #'components - accessing' }
CMGroup >> newComponents: anAgentSet [
	newComponents := anAgentSet
]

{ #category : #'components - accessing' }
CMGroup >> othersBut: x [
	
	| collection |
	collection := OrderedCollection new.
	self components do: [:other | other ~= x ifTrue: [collection add: other]].
	^collection
]

{ #category : #'components - accessing' }
CMGroup >> removedComponents [
	
	^removedComponents ifNil: [removedComponents := Set new]
]

{ #category : #'components - accessing' }
CMGroup >> removedComponents: anAgentSet [
	removedComponents := anAgentSet
]

{ #category : #'initialize - release' }
CMGroup >> reset [
	"Resets inherited and specific attributes"

	super reset.
	self components: Set new.
	self newComponents: Set new.
	self removedComponents: Set new
]

{ #category : #accessing }
CMGroup >> size [
	
	^self components size
]

{ #category : #control }
CMGroup >> stepDynPop [
	"Activate the biological life cycle of each agent of the group. 
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
CMGroup >> updateAgents [
	"Get rid of dead components"

	| theDeadAgents |
	theDeadAgents := self components select: [ :a | a dead ].
	theDeadAgents
		do: [ :a | 
			a patch notNil
				ifTrue: [ a leave ].
			self deleteComponent: a ]
]

{ #category : #'components - managing' }
CMGroup >> updateComponents [
	"Purpose: use the buffered collections 'newComponents' and 'removedComponents' to update the group components instantaneously"
	
	self components addAll: self newComponents.
	self newComponents: OrderedCollection new.
	self components: self components - self removedComponents.
	self removedComponents: OrderedCollection new
]

{ #category : #control }
CMGroup >> updateWith: aCollec [
	"Get rid of dead components and add new ones"

	self updateAgents.
	self addComponents: aCollec
]
