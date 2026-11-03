Extension { #name : 'CMCell' }

{ #category : '*Cormas-Bloc-Spec' }
CMCell >> inspectionView: aBuilder [

	<inspectorPresentationOrder: 5 title: 'View'>
	^ (CMBlCellElement for: self) asPresenter
]

{ #category : '*Cormas-Bloc-Spec' }
CMCell >> inspectionViewContext: aContext [
	"A cell can only be drawn as part of a grid, which gives it its shape"

	aContext active: self spaceModel isNotNil
]
