"
I show the Roassal view and the Bloc view of one model side by side and step them together, so that they can be compared by eye before the switch to Bloc.

## Responsibility:

- Build both views of a model.
- Step the model and update both views.
- Offer scripts for each grid type and for `ECECModel`.

## Collaborators: 

- `CMR3SpaceDiagramBuilder`: the Roassal view, shown on the left.
- `CMBlSpaceElement`: the Bloc view, shown on the right.

## Public API and Key Messages

- `on:`, inherited, to create me for a model
- `step`

```
CMBlViewComparison scriptSquares
```

### Implementation Points

I exist only for the migration, and go away with the Roassal view.
"
Class {
	#name : 'CMBlViewComparison',
	#superclass : 'SpPresenter',
	#instVars : [
		'model',
		'roassalBuilder',
		'roassalView',
		'blocElement',
		'blocView',
		'stepButton'
	],
	#category : 'Cormas-Bloc-Spec-Tests',
	#package : 'Cormas-Bloc-Spec-Tests'
}

{ #category : 'scripts' }
CMBlViewComparison class >> openMockModelWithNeighbourhood: aNeighbourhood [
	"Open the comparison on a small grid of random cells with a few cows"

	| model |
	model := CMMockModel new.
	model
		createGridNumberOfRows: 10
		numberOfColumns: 10
		neighbourhood: aNeighbourhood
		closed: true.
	model cells do: #initRandom.
	model create: 5 randomlyLocatedAloneEntitiesOfClass: CMMockCow.
	^ (self on: model) open
]

{ #category : 'scripts' }
CMBlViewComparison class >> scriptECEC [

	<script>
	| model |
	model := ECECModel new.
	(CMSimulation for: model)
		activeInitSelector: #homogeneousEnvironment;
		activeControlSelector: #step;
		initializeSimulation.
	^ (self on: model) open
]

{ #category : 'scripts' }
CMBlViewComparison class >> scriptFlatTopHexagons [

	<script>
	^ self openMockModelWithNeighbourhood: #flat6
]

{ #category : 'scripts' }
CMBlViewComparison class >> scriptPointyTopHexagons [

	<script>
	^ self openMockModelWithNeighbourhood: #pointy6
]

{ #category : 'scripts' }
CMBlViewComparison class >> scriptSquares [

	<script>
	^ self openMockModelWithNeighbourhood: 4
]

{ #category : 'scripts' }
CMBlViewComparison class >> scriptSquaresWithDiagonals [

	<script>
	^ self openMockModelWithNeighbourhood: 8
]

{ #category : 'scripts' }
CMBlViewComparison class >> scriptTriangles [

	<script>
	^ self openMockModelWithNeighbourhood: 3
]

{ #category : 'accessing' }
CMBlViewComparison >> blocView [

	^ blocView
]

{ #category : 'layout' }
CMBlViewComparison >> defaultLayout [

	^ SpBoxLayout newTopToBottom
		  add: stepButton expand: false;
		  add: (SpBoxLayout newLeftToRight
				   spacing: 5;
				   add: roassalView;
				   add: blocView;
				   yourself);
		  yourself
]

{ #category : 'initialization' }
CMBlViewComparison >> initializePresenters [

	roassalBuilder := CMR3SpaceDiagramBuilder for: model.
	roassalView := roassalBuilder asPresenter.
	blocElement := CMBlSpaceElement for: model.
	blocView := blocElement asPresenter.
	stepButton := self newButton
		              label: 'Step';
		              action: [ self step ];
		              yourself
]

{ #category : 'initialization' }
CMBlViewComparison >> setModelBeforeInitialization: aModel [

	model := aModel
]

{ #category : 'actions' }
CMBlViewComparison >> step [

	model step.
	roassalBuilder update.
	blocElement update
]
