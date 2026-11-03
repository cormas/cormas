"
I am the space presenter of Cormas with the Bloc view in place of the Roassal one, so that tests can check the switch before it happens.

## Responsibility:

- Create the Bloc view where `CMSpacePresenter` creates the Roassal one, and change nothing else.
- Give tests access to the embedded presenter.

## Collaborators: 

- `CMBlSpaceElement`: the view I show.

## Public API and Key Messages

- `diagram`

```
(CMSimulationApplication new
	cormasModel: aModel;
	newPresenter: CMBlTestSpacePresenter) open
```
"
Class {
	#name : 'CMBlTestSpacePresenter',
	#superclass : 'CMSpacePresenter',
	#category : 'Cormas-Bloc-Spec-Tests',
	#package : 'Cormas-Bloc-Spec-Tests'
}

{ #category : 'accessing' }
CMBlTestSpacePresenter >> diagram [

	^ diagram
]

{ #category : 'initialization' }
CMBlTestSpacePresenter >> initializeDiagram [

	spaceBuilder := CMBlSpaceElement for: self cormasModel.
	diagram := spaceBuilder asPresenter.
	diagram owner: self.
	self update
]
