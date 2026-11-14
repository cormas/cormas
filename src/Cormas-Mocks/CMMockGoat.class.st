Class {
	#name : 'CMMockGoat',
	#superclass : 'CMMockAnimal',
	#category : 'Cormas-Mocks',
	#package : 'Cormas-Mocks'
}

{ #category : 'aspects' }
CMMockGoat >> aspectDefault: look [

	<aspect>
	look color: Color blue
]

{ #category : 'aspects' }
CMMockGoat >> aspectHorns: look [

	<aspect>
	look shape: #triangle
]

{ #category : 'pov' }
CMMockGoat >> pov [

	<pov>
	^ super pov
		color: Color blue;
		yourself
]
