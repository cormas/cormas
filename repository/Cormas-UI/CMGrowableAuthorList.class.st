"
Please comment me using the following template inspired by Class Responsibility Collaborator (CRC) design:

CMGrowableAuthorList new openWithSpec.

Public API and Key Messages

- message one   
- message two 
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.


    Implementation Points
"
Class {
	#name : #CMGrowableAuthorList,
	#superclass : #SpcGrowableSearchList,
	#category : 'Cormas-UI-Core'
}

{ #category : #accessing }
CMGrowableAuthorList >> authors [
	" Answer a <Collection> of <String> with author names "

	| authWidgets authCollection |
	authWidgets := self widgets collect: #authorName.
	authCollection := (authWidgets collect: #pendingText) values.
	^ (authCollection joinUsing: Character cr) asString.
]

{ #category : #accessing }
CMGrowableAuthorList >> emails [
	" Answer a <Collection> of <String> with author's emails "

	| authWidgets authCollection |

	authWidgets := self widgets collect: #authorEmail.
	authCollection := (authWidgets collect: #pendingText) values.
	^ (authCollection joinUsing: Character cr) asString.
]

{ #category : #initialization }
CMGrowableAuthorList >> initializeWidgets [

	self instantiateModels: #(firstItem CMSpecCommentInterfaceAuthor).
	self collection add: #firstItem
]

{ #category : #private }
CMGrowableAuthorList >> listBoxClass [
	" Private -  See comment in #add "

	^ #CMSpecCommentInterfaceRemovableAuthor
]
