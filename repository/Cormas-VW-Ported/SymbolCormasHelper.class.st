"
the helper class for symbols
"
Class {
	#name : #SymbolCormasHelper,
	#superclass : #StringCormasHelper,
	#category : 'Cormas-VW-Ported'
}

{ #category : #helping }
SymbolCormasHelper class >> colorFrom: aColorOrSymbol [
	"return a color value for the argument"
	
	^(ColorValue constantNames includes: aColorOrSymbol)
		ifTrue: [ColorValue perform: aColorOrSymbol]
		ifFalse: [ColorValue navy]
]

{ #category : #helping }
SymbolCormasHelper class >> isTypeSymbol [
	"test if the helped objet is a Symbol"
	
	^true
]

{ #category : #helping }
SymbolCormasHelper class >> nullValue [
	"return the nullValue for the type"
	
	^#?
]
