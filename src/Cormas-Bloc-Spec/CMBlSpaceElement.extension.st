Extension { #name : 'CMBlSpaceElement' }

{ #category : '*Cormas-Bloc-Spec' }
CMBlSpaceElement >> asPresenter [
	"Answer a new presenter showing me with the controls to navigate"

	^ self presenterShowing: (CMBlSpaceViewport on: self)
]
