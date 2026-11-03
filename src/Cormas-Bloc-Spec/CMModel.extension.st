Extension { #name : 'CMModel' }

{ #category : '*Cormas-Bloc-Spec' }
CMModel >> inspectionView: aBuilder [

	<inspectorPresentationOrder: 5 title: 'View'>
	^ (CMBlSpaceElement for: self) asPresenter
]
