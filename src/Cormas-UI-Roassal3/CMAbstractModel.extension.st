Extension { #name : 'CMAbstractModel' }

{ #category : '*Cormas-UI-Roassal3' }
CMAbstractModel >> openSpacePresenter [
	"A helper method that builds a spatial grid visualization and opens it as a Spec presenter. Can be used for quickly inspecting the model"
	
	(CMR3SpaceDiagramBuilder new
		cormasModel: self;
		asPresenter)
		open.
]
