Extension { #name : #WindowPresenter }

{ #category : #'*Cormas-UI' }
WindowPresenter >> isCloseableByCormas [
	
	^ self model isMainCormasAppWindow not
]
