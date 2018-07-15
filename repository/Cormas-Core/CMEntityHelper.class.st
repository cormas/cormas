"
helper class for entities

Public API and Key Messages

- message one   
- message two 
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.


    Implementation Points
"
Class {
	#name : #CMEntityHelper,
	#superclass : #CMObjectHelper,
	#category : 'Cormas-Core-Helpers'
}

{ #category : #'testing type' }
CMEntityHelper class >> isTypeEntity [
	"test if the helped object is an entity"
	
	^ true
]
