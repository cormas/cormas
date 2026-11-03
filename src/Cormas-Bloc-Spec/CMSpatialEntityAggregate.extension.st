Extension { #name : 'CMSpatialEntityAggregate' }

{ #category : '*Cormas-Bloc-Spec' }
CMSpatialEntityAggregate >> inspectionView: aBuilder [

	<inspectorPresentationOrder: 5 title: 'View'>
	^ (CMBlAggregateElement for: self) asPresenter
]
