Class {
	#name : 'CMMockCow',
	#superclass : 'CMMockAnimal',
	#category : 'Cormas-Mocks',
	#package : 'Cormas-Mocks'
}

{ #category : 'aspects' }
CMMockCow >> aspectDefault: look [

	<aspect>
	look color: Color red
]

{ #category : 'pov' }
CMMockCow >> pov [

	<pov>
	^ super pov
		color: Color red;
		yourself
]
