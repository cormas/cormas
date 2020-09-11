"
CMSpecCommentInterfaceRemovableAuthor new openWithSpec.

Public API and Key Messages

- message one   
- message two 
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.


    Implementation Points
"
Class {
	#name : #CMSpecCommentInterfaceRemovableAuthor,
	#superclass : #CMSpecCommentInterfaceAuthor,
	#category : 'Cormas-UI-Core'
}

{ #category : #specs }
CMSpecCommentInterfaceRemovableAuthor class >> defaultSpec [
	<spec>
	
	^ SpecLayout composed newRow: [ : r |
			r
				add: #authorName;
				add: #authorEmail;
				add: #ok width: 35;
				add: #removeButton width: 35 ]				
			height: 25;
		yourself
]

{ #category : #initialization }
CMSpecCommentInterfaceRemovableAuthor >> initializeBoxModels [
	" Private - See superimplementor's comment "

	self instantiateModels: #(
		authorName 			#TextInputFieldModel 
		authorEmail 			#TextInputFieldModel 
		ok 						#ButtonModel		
		removeButton 		#ButtonModel).
]

{ #category : #initialization }
CMSpecCommentInterfaceRemovableAuthor >> initializeRemoveButton [
	" Private - Set a remove button to remove the receiver from its owner "

	self removeButton
		label: '-';
		state: false;
		enabled: true;
		action: [ (self confirm: 'Are you sure you want to delete the selected author?')
				ifTrue: [ self owner remove: self ] ]
]

{ #category : #initialization }
CMSpecCommentInterfaceRemovableAuthor >> initializeWidgets [
	" Private - See superimplementor's comment "

	super initializeWidgets.
	self initializeRemoveButton.
	self focusOrder
		add: self authorName;
		add: self authorEmail;
		add: self ok;
		add: self removeButton
]
