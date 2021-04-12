Extension { #name : #ComposablePresenter }

{ #category : #'*Cormas-UI' }
ComposablePresenter >> isMainCormasAppWindow [

	^ (self respondsTo: #model) 
		ifTrue: [ self model isMainCormasAppWindow ]
		ifFalse: [ false ]
]
