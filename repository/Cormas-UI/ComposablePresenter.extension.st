Extension { #name : #ComposablePresenter }

{ #category : #'*Cormas-UI' }
ComposablePresenter >> isMainCormasAppWindow [

	self flag: #toReview.
	^ (self respondsTo: #model) 
		ifTrue: [ self model isMainCormasAppWindow ]
		ifFalse: [ false ]
]
