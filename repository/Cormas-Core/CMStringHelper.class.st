"
helper class for sets

Public API and Key Messages

- message one   
- message two 
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.


    Implementation Points
"
Class {
	#name : #CMStringHelper,
	#superclass : #CMArrayHelper,
	#category : 'Cormas-Core-Helpers'
}

{ #category : #helping }
CMStringHelper class >> isTypeString [
	" test if the helped objet is a String or Symbol "
	
	^ true
]

{ #category : #helping }
CMStringHelper class >> nullValue [
	" return the nullValue for the type "
	
	^ String empty
]

{ #category : #helping }
CMStringHelper class >> stringForDefaultValue: aDefaultValue [
	" return a string that is used to save a default value depending on its type "
	
	^ aDefaultValue printString
]
