"
helper class for colorValues
"
Class {
	#name : #ColorValueCormasHelper,
	#superclass : #ObjectCormasHelper,
	#category : 'Cormas-VW-Ported'
}

{ #category : #helping }
ColorValueCormasHelper class >> colorFrom: aColorOrSymbol [
	"return a color value for the argument"
	
	^aColorOrSymbol
]

{ #category : #helping }
ColorValueCormasHelper class >> colorOrBlackFrom: aColorValueOrElse [
	"return either the argument if it is a colorValue or a black colorValue"
	
	^aColorValueOrElse
]

{ #category : #'testing type' }
ColorValueCormasHelper class >> isTypeColorValue [
	"test if the helped objet is a ColorValue"
	
	^true
]
