Class {
	#name : 'CMSpatialEntityRecursiveNeighbourhoodTest',
	#superclass : 'CMTestObject',
	#instVars : [
		'centerCell',
		'cornerCell'
	],
	#category : 'Cormas-Tests-Space',
	#package : 'Cormas-Tests',
	#tag : 'Space'
}

{ #category : 'helpers' }
CMSpatialEntityRecursiveNeighbourhoodTest >> assertLayers: layers areValidRingsAround: origin [
	"Each layer must only contain cells at graph distance (index - 1) from origin, with no duplicates across layers."

	| visited |
	visited := IdentitySet new.
	layers withIndexDo: [ :layer :index |
		| distance |
		distance := index - 1.
		layer do: [ :cell |
			self deny: (visited includes: cell) description: 'Duplicate cell in recursive neighbourhood layers'.
			visited add: cell.
			self
				assert: (self graphDistanceFrom: origin to: cell)
				equals: distance ] ]
]

{ #category : 'helpers' }
CMSpatialEntityRecursiveNeighbourhoodTest >> graphDistanceFrom: origin to: destination [
	"Reference BFS graph distance using the same neighbourhood links as the model."

	| visited frontier next distance |
	origin = destination ifTrue: [ ^ 0 ].
	visited := IdentitySet with: origin.
	frontier := OrderedCollection with: origin.
	distance := 0.
	[ frontier isEmpty ] whileFalse: [
		next := OrderedCollection new.
		frontier do: [ :cell |
			cell neighbourhood do: [ :neighbour |
				(visited includes: neighbour) ifFalse: [
					visited add: neighbour.
					neighbour = destination ifTrue: [ ^ distance + 1 ].
					next add: neighbour ] ] ].
		distance := distance + 1.
		frontier := next ].
	self fail: 'Destination not reachable from origin'
]

{ #category : 'helpers' }
CMSpatialEntityRecursiveNeighbourhoodTest >> referenceCellsWithinRadius: radius from: origin [
	"All cells whose graph distance from origin is <= radius."

	| result layers |
	result := OrderedCollection new.
	layers := self referenceLayersTo: radius from: origin.
	layers do: [ :layer | result addAll: layer ].
	^ result
]

{ #category : 'helpers' }
CMSpatialEntityRecursiveNeighbourhoodTest >> referenceLayersTo: radius from: origin [
	| collResult visited current next |
	collResult := OrderedCollection new.
	collResult add: (Array with: origin).
	radius = 0 ifTrue: [ ^ collResult ].
	visited := IdentitySet with: origin.
	current := origin neighbourhood.
	current do: [ :each | visited add: each ].
	collResult add: current asArray.
	2 to: radius do: [ :each |
		next := OrderedCollection new.
		current do: [ :each |
			each neighbourhood do: [ :neighbour |
				(visited includes: neighbour) ifFalse: [
					visited add: neighbour.
					next add: neighbour ] ] ].
		collResult add: next asArray.
		current := next ].
	^ collResult
]

{ #category : 'initialization' }
CMSpatialEntityRecursiveNeighbourhoodTest >> setUp [

	super setUp.
	centerCell := model cellAt: 2 at: 2.
	cornerCell := model cellAt: 4 at: 1
]

{ #category : 'tests - allLayersTo' }
CMSpatialEntityRecursiveNeighbourhoodTest >> testAllLayersToHasRadiusPlusOneLayers [

	0 to: 3 do: [ :radius |
		self
			assert: (centerCell allLayersTo: radius) size
			equals: radius + 1 ]
]

{ #category : 'tests - allLayersTo' }
CMSpatialEntityRecursiveNeighbourhoodTest >> testAllLayersToLayersMatchReferenceBFS [

	0 to: 3 do: [ :radius |
		| expected actual |
		expected := self referenceLayersTo: radius from: centerCell.
		actual := centerCell allLayersTo: radius.
		self assert: actual size equals: expected size.
		actual withIndexDo: [ :layer :index |
			self
				assert: layer asSet
				equals: (expected at: index) asSet ] ]
]

{ #category : 'tests - allLayersTo' }
CMSpatialEntityRecursiveNeighbourhoodTest >> testAllLayersToOnCornerCellMatchesReferenceBFS [

	2 to: 3 do: [ :radius |
		| expected actual |
		expected := self referenceLayersTo: radius from: cornerCell.
		actual := cornerCell allLayersTo: radius.
		actual withIndexDo: [ :layer :index |
			self
				assert: layer asSet
				equals: (expected at: index) asSet ] ]
]

{ #category : 'tests - allLayersTo' }
CMSpatialEntityRecursiveNeighbourhoodTest >> testAllLayersToRingsAreValid [

	self
		assertLayers: (centerCell allLayersTo: 3)
		areValidRingsAround: centerCell.
	self
		assertLayers: (cornerCell allLayersTo: 3)
		areValidRingsAround: cornerCell
]

{ #category : 'tests - layer3FromLayer2' }
CMSpatialEntityRecursiveNeighbourhoodTest >> testLayer3FromLayer2MatchesNextAllLayersRing [

	| layers layer1 layer2 expectedNext actualNext |
	layers := centerCell allLayersTo: 2.
	layer1 := layers at: 1.
	layer2 := layers at: 2.
	expectedNext := layers at: 3.
	actualNext := (centerCell layer3FromLayer2: layer2 andLayer1: layer1) first.
	self assert: actualNext asSet equals: expectedNext asSet
]

{ #category : 'tests - layerOfRadius' }
CMSpatialEntityRecursiveNeighbourhoodTest >> testLayerOfRadiusIsLastRingOnly [

	1 to: 3 do: [ :radius |
		| layers |
		layers := centerCell allLayersTo: radius.
		self
			assert: (centerCell layerOfRadius: radius)
			equals: layers last ]
]

{ #category : 'tests - performance' }
CMSpatialEntityRecursiveNeighbourhoodTest >> testRecursiveNeighbourhoodLargeRadiusIsReasonablyFast [

	| duration |
	duration := [ centerCell recursiveNeighbourhood: 9 ] millisecondsToRun.
	self assert: duration < 5000
]

{ #category : 'tests - performance' }
CMSpatialEntityRecursiveNeighbourhoodTest >> testRecursiveNeighbourhoodScalesBetterThanQuadraticInRadius [

	| timeRadius2 timeRadius9 |
	timeRadius2 := [ centerCell recursiveNeighbourhood: 2 ] millisecondsToRun.
	timeRadius9 := [ centerCell recursiveNeighbourhood: 9 ] millisecondsToRun.
	self assert: timeRadius9 < ((timeRadius2 max: 1) * 200)
]

{ #category : 'tests - recursiveNeighbourhood' }
CMSpatialEntityRecursiveNeighbourhoodTest >> testRecursiveNeighbourhood0IsOnlySelf [

	self
		assert: (centerCell recursiveNeighbourhood: 0)
		equals: (OrderedCollection with: centerCell)
]

{ #category : 'tests - recursiveNeighbourhood' }
CMSpatialEntityRecursiveNeighbourhoodTest >> testRecursiveNeighbourhood1EqualsNeighbourhoodAndSelf [

	| neighbourhood |
	neighbourhood := centerCell recursiveNeighbourhood: 1.
	self assert: neighbourhood first equals: centerCell.
	self
		assert: neighbourhood asSet
		equals: centerCell neighbourhoodAndSelf asSet
]

{ #category : 'tests - recursiveNeighbourhood' }
CMSpatialEntityRecursiveNeighbourhoodTest >> testRecursiveNeighbourhood2OnCenterCoversFullGrid [

	self
		assert: (centerCell recursiveNeighbourhood: 2) asSet size
		equals: model cells size
]

{ #category : 'tests - recursiveNeighbourhood' }
CMSpatialEntityRecursiveNeighbourhoodTest >> testRecursiveNeighbourhoodHasNoDuplicates [

	| neighbourhood |
	neighbourhood := centerCell recursiveNeighbourhood: 3.
	self
		assert: neighbourhood size
		equals: neighbourhood asSet size
]

{ #category : 'tests - recursiveNeighbourhood' }
CMSpatialEntityRecursiveNeighbourhoodTest >> testRecursiveNeighbourhoodMatchesReferenceBFS [

	0 to: 3 do: [ :radius |
		self
			assert: (centerCell recursiveNeighbourhood: radius) asSet
			equals: (self referenceCellsWithinRadius: radius from: centerCell) asSet ]
]

{ #category : 'tests - recursiveNeighbourhood' }
CMSpatialEntityRecursiveNeighbourhoodTest >> testRecursiveNeighbourhoodOrderedFromCenterOutward [

	self
		assertLayers: (centerCell allLayersTo: 3)
		areValidRingsAround: centerCell
]

{ #category : 'tests - recursiveNeighbourhood' }
CMSpatialEntityRecursiveNeighbourhoodTest >> testRecursiveNeighbourhoodVerifyingFiltersResult [

	| filtered |
	filtered := centerCell
		recursiveNeighbourhood: 2
		verifying: [ :cell | cell isAliveCell ].
	self assert: (filtered allSatisfy: [ :cell | cell isAliveCell ])
]

{ #category : 'tests - randomWalk' }
CMSpatialEntityRecursiveNeighbourhoodTest >> testRandomWalkRadius0DoesNotMove [

	| agent cell |
	agent := (model @@ CMMockCow) anyOne.
	cell := agent cell.
	agent randomWalk: 0.
	self assert: agent cell equals: cell
]

{ #category : 'tests - randomWalk' }
CMSpatialEntityRecursiveNeighbourhoodTest >> testRandomWalkRadius1StaysInNeighbourhoodAndSelf [

	| agent |
	agent := (model @@ CMMockCow) anyOne.
	agent randomWalk: 1.
	self
		assert: ((agent cell neighbourhoodAndSelf asSet)
			includes: agent cell)
]

{ #category : 'tests - randomWalk' }
CMSpatialEntityRecursiveNeighbourhoodTest >> testRandomWalkWithRadiusMovesWithinNeighbourhood [

	| agent previousCell |
	agent := (model @@ CMMockCow) anyOne.
	previousCell := agent cell.
	agent randomWalk: 2.
	self
		assert: ((previousCell recursiveNeighbourhood: 2)
			includes: agent cell)
]
