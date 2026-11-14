Extension { #name : 'CMModel' }

{ #category : '*Cormas-Bloc-Spec' }
CMModel >> inspectionView: aBuilder [

	<inspectorPresentationOrder: 5 title: 'View'>
	^ (CMBlSpaceElement for: self) asPresenter
]

{ #category : '*Cormas-Bloc-Spec' }
CMModel >> openSpacePresenter [
	"A helper method that builds a spatial grid visualization and opens it as a Spec presenter. Can be used for quickly inspecting the model"

	<api>
	^ (CMBlSpaceElement for: self) asPresenter open
]

{ #category : '*Cormas-Bloc-Spec' }
CMModel >> openSpaceWith: aSelector [
	"Open a window that shows my space from the perspective that I define in my method aSelector, and answer the window"

	<api>
	| perspective |
	perspective := self perspectiveNamed: aSelector.
	^ (CMBlSpaceElement for: self observedBy: (CMObserver new
				    perspective: perspective;
				    yourself)) asPresenter open
		  title: 'Space — ' , perspective name;
		  yourself
]
