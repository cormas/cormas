Extension { #name : #WindowPresenter }

{ #category : #'*Cormas-UI' }
WindowPresenter >> isCloseableByCormas [
	
	^ (self model respondsTo: #model) and: [ self model isMainCormasAppWindow not ]
]
