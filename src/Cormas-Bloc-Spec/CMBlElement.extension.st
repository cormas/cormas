Extension { #name : 'CMBlElement' }

{ #category : '*Cormas-Bloc-Spec' }
CMBlElement >> asPresenter [
	"Answer a new presenter showing me, which can be opened or embedded in another presenter"

	^ self presenterShowing: self
]

{ #category : '*Cormas-Bloc-Spec' }
CMBlElement >> presenterShowing: anElement [

	| presenter |
	presenter := SpBlSpaceInMorphPresenter new.
	presenter space defer: [ presenter space root addChild: anElement ].
	^ presenter
]
