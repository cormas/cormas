"
I check the context menu of the entities shown in a Bloc element.

## Responsibility:

- Check which items the menu of an agent and of a cell offers.
- Check that choosing an item acts on the entity and updates the view.

## Collaborators: 

- `CMBlElement`: builds the menu.
- `SpMenuPresenter`: the menu, whose items I run without opening it.
"
Class {
	#name : 'CMBlContextMenuTest',
	#superclass : 'CMBlTestCase',
	#category : 'Cormas-Bloc-Spec-Tests',
	#package : 'Cormas-Bloc-Spec-Tests'
}

{ #category : 'private' }
CMBlContextMenuTest >> itemNamed: aString in: aMenu [

	^ (self itemsOf: aMenu) detect: [ :each | each name = aString ]
]

{ #category : 'private' }
CMBlContextMenuTest >> itemsOf: aMenu [

	^ aMenu menuGroups flatCollect: [ :each | each menuItems ]
]

{ #category : 'private' }
CMBlContextMenuTest >> namesIn: aMenu [

	^ (self itemsOf: aMenu) collect: [ :each | each name ]
]

{ #category : 'tests' }
CMBlContextMenuTest >> testAgentMenuOffersKillAndItsActions [

	| cow names |
	self gridWithNeighbourhood: 4.
	cow := self newCowOn: (model cellAt: 2 at: 3).

	names := self namesIn:
		         ((CMBlSpaceElement for: model) contextMenuFor: cow).

	self assert: (names includesAll: { 'Inspect'. 'Browse'. 'Kill' }).
	self assert: (names includesAll:
			 (cow actionSelectors collect: [ :each | each asString ]))
]

{ #category : 'tests' }
CMBlContextMenuTest >> testCellMenuDoesNotOfferKill [

	| names |
	self gridWithNeighbourhood: 4.

	names := self namesIn:
		         ((CMBlSpaceElement for: model) contextMenuFor:
			          (model cellAt: 1 at: 1)).

	self assert: (names includesAll: { 'Inspect'. 'Browse' }).
	self deny: (names includes: 'Kill')
]

{ #category : 'tests' }
CMBlContextMenuTest >> testChoosingKillRemovesTheAgentFromTheView [

	| cow element item |
	self gridWithNeighbourhood: 4.
	cow := self newCowOn: (model cellAt: 2 at: 3).
	element := CMBlSpaceElement for: model.
	self assert: (self hexColorIn: element at: 80 @ 48) equals: 'FF0000'.

	item := self itemNamed: 'Kill' in: (element contextMenuFor: cow).
	item performMenuActionWith: nil.

	self assert: (self hexColorIn: element at: 80 @ 48) equals: '000000'
]

{ #category : 'tests' }
CMBlContextMenuTest >> testMenuIsTitledWithTheClassOfTheEntity [

	| cow |
	self gridWithNeighbourhood: 4.
	cow := self newCowOn: (model cellAt: 2 at: 3).

	self
		assert: ((CMBlSpaceElement for: model) contextMenuFor: cow) title
		equals: 'CMMockCow'
]
