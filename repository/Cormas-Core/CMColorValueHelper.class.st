Class {
	#name : #CMColorValueHelper,
	#superclass : #CMObjectHelper,
	#category : 'Cormas-Core-Helpers'
}

{ #category : #helping }
CMColorValueHelper class >> colorFrom: aColorOrSymbol [
	"return a color value for the argument"
	
	^aColorOrSymbol
]

{ #category : #helping }
CMColorValueHelper class >> colorOrBlackFrom: aColorValueOrElse [
	"return either the argument if it is a colorValue or a black colorValue"
	
	^aColorValueOrElse
]

{ #category : #'testing type' }
CMColorValueHelper class >> isTypeColorValue [
	"test if the helped objet is a ColorValue"
	
	^true
]
