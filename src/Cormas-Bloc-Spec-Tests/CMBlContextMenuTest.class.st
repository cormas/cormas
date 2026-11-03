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
CMBlContextMenuTest >> aggregateOf: someEntities [

	^ model createAggregate: CMMockAggregate from: someEntities
]

{ #category : 'private' }
CMBlContextMenuTest >> itemNamed: aString in: aMenu [

	^ (self itemsOf: aMenu) detect: [ :each | each name = aString ]
]

{ #category : 'private' }
CMBlContextMenuTest >> itemsOf: aMenu [

	^ aMenu menuGroups flatCollect: [ :each | each menuItems ]
]

{ #category : 'private' }
CMBlContextMenuTest >> menuOfCellAt1x1 [

	^ (CMBlSpaceElement for: model) contextMenuFor:
		  (model cellAt: 1 at: 1)
]

{ #category : 'private' }
CMBlContextMenuTest >> nameOfAggregate: anAggregate [

	^ 'CMMockAggregate ' , anAggregate id printString
]

{ #category : 'private' }
CMBlContextMenuTest >> namesIn: aMenu [

	^ (self itemsOf: aMenu) collect: [ :each | each name ]
]

{ #category : 'tests' }
CMBlContextMenuTest >> testAgentMenuDoesNotOfferAggregates [

	| cow aggregate names |
	self gridWithNeighbourhood: 4.
	cow := self newCowOn: (model cellAt: 1 at: 1).
	aggregate := self aggregateOf: { (model cellAt: 1 at: 1) }.

	names := self namesIn:
		         ((CMBlSpaceElement for: model) contextMenuFor: cow).

	self deny: (names includes: (self nameOfAggregate: aggregate))
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
CMBlContextMenuTest >> testAggregateSubmenuIsTheMenuOfTheAggregate [

	| aggregate submenu names |
	self gridWithNeighbourhood: 4.
	aggregate := self aggregateOf: { (model cellAt: 1 at: 1) }.

	submenu := (self
		            itemNamed: (self nameOfAggregate: aggregate)
		            in: self menuOfCellAt1x1) subMenu.
	names := self namesIn: submenu.

	self assert: submenu title equals: 'CMMockAggregate'.
	self assert: (names includesAll: { 'Inspect'. 'Browse' }).
	self deny: (names includes: 'Kill')
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
CMBlContextMenuTest >> testCellMenuDoesNotOfferOtherAggregates [

	| aggregate |
	self gridWithNeighbourhood: 4.
	aggregate := self aggregateOf: { (model cellAt: 2 at: 2) }.

	self deny: ((self namesIn: self menuOfCellAt1x1) includes:
			 (self nameOfAggregate: aggregate))
]

{ #category : 'tests' }
CMBlContextMenuTest >> testCellMenuIncludesHiddenAggregates [

	| aggregate |
	self gridWithNeighbourhood: 4.
	aggregate := (self aggregateOf: { (model cellAt: 1 at: 1) })
		             pov: CMPointOfView new;
		             yourself.

	self assert: ((self namesIn: self menuOfCellAt1x1) includes:
			 (self nameOfAggregate: aggregate))
]

{ #category : 'tests' }
CMBlContextMenuTest >> testCellMenuIncludesOuterLevelsOfNesting [

	| inner outer names |
	self gridWithNeighbourhood: 4.
	inner := self aggregateOf: { (model cellAt: 1 at: 1) }.
	outer := self aggregateOf: { inner }.

	names := self namesIn: self menuOfCellAt1x1.

	self assert: (names includes: (self nameOfAggregate: inner)).
	self assert: (names includes: (self nameOfAggregate: outer))
]

{ #category : 'tests' }
CMBlContextMenuTest >> testCellMenuListsTheHighestIdFirst [

	| first second names |
	self gridWithNeighbourhood: 4.
	first := self aggregateOf: { (model cellAt: 1 at: 1) }.
	second := self aggregateOf: { (model cellAt: 1 at: 1) }.

	names := self menuOfCellAt1x1 menuGroups last menuItems collect: [
		         :each | each name ].

	self assert: names asArray equals: {
			(self nameOfAggregate: second).
			(self nameOfAggregate: first) }
]

{ #category : 'tests' }
CMBlContextMenuTest >> testCellMenuOffersItsAggregatesInASeparateGroup [

	| aggregate group |
	self gridWithNeighbourhood: 4.
	aggregate := self aggregateOf: { (model cellAt: 1 at: 1) }.

	group := self menuOfCellAt1x1 menuGroups last.

	self
		assert: (group menuItems collect: [ :each | each name ]) asArray
		equals: { (self nameOfAggregate: aggregate) }
]

{ #category : 'tests' }
CMBlContextMenuTest >> testCellMenuWithoutAggregatesKeepsItsGroups [

	| before |
	self gridWithNeighbourhood: 4.
	before := self menuOfCellAt1x1 menuGroups size.
	self aggregateOf: { (model cellAt: 1 at: 1) }.

	self assert: self menuOfCellAt1x1 menuGroups size equals: before + 1
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
