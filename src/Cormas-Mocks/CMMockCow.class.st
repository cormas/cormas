Class {
	#name : 'CMMockCow',
	#superclass : 'CMMockAnimal',
	#category : 'Cormas-Mocks',
	#package : 'Cormas-Mocks'
}

{ #category : 'pov' }
CMMockCow >> pov [

	<pov>
	^ super pov
		color: Color red;
		yourself
]
