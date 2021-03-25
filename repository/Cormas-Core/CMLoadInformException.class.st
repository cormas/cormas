Class {
	#name : #CMLoadInformException,
	#superclass : #CMLoadException,
	#category : #'Cormas-Core-Exceptions'
}

{ #category : #accessing }
CMLoadInformException >> defaultAction [

	self informMessage: self messageText
]
