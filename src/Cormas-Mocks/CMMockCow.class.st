Class {
	#name : 'CMMockCow',
	#superclass : 'CMMockAnimal',
	#category : 'Cormas-Mocks',
	#package : 'Cormas-Mocks'
}

{ #category : 'aspects' }
CMMockCow >> aspectDefault: look [

	<aspect>
	super aspectDefault: look.
	look color: Color red
]
