Extension { #name : 'CMAgent' }

{ #category : '*Cormas-Bloc-Spec' }
CMAgent >> inspectionView: aBuilder [

	<inspectorPresentationOrder: 5 title: 'View'>
	^ (CMBlAgentElement for: self) asPresenter
]
