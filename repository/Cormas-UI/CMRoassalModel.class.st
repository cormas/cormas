Class {
	#name : #CMRoassalModel,
	#superclass : #RoassalModel,
	#category : #'Cormas-UI-Core'
}

{ #category : #specs }
CMRoassalModel class >> defaultSpec [
	<spec>
	
	^ #(CMMorphicRoassalAdapter
		adapt: #(model))
]
