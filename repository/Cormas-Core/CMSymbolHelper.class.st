"
the helper class for symbols

Public API and Key Messages

- message one   
- message two 
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.


    Implementation Points
"
Class {
	#name : #CMSymbolHelper,
	#superclass : #CMStringHelper,
	#category : #'Cormas-Core-Helpers'
}

{ #category : #helping }
CMSymbolHelper class >> isTypeSymbol [
	"test if the helped objet is a Symbol"
	
	^true
]

{ #category : #helping }
CMSymbolHelper class >> nullValue [
	"return the nullValue for the type"
	
	^#?
]
