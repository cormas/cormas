"
I am one list of the model list window, such as My models or Examples: a header with my title and my actions, the table of the models, and a message with a button in place of the table when it is empty.

## Responsibility:

- I show one row per model: a dot for its state, its name, its version and its state.
- I keep the actions that act on my whole list in my header, next to the models they act on.
- I show, in red under my header, why my last action failed, and a message that says what to do when I have no models.

## Collaborators:

- `CMModelListPresenter` creates two of me, fills me with entries and listens to my selection.
- `CMModelListEntry` gives each row its state, dot, name and version.

## Public API and Key Messages

- `title:`, `addAction:icon:help:do:` and `emptyLines:action:do:` configure me.
- `items:`, `items`, `selectItem:`, `selectedItem`, `unselectAll` and `whenSelectedItemChangedDo:` work as for a table.
- `showError:` shows a red line under the header, and an empty string hides it.

```smalltalk
(CMModelTablePresenter new)
	title: 'My models';
	addAction: 'New' icon: #smallNew help: 'Create a new model' do: [ ];
	emptyLines: #( 'You have no models yet.' ) action: 'New model' do: [ ];
	open
```

## Internal Representation

- `headerButtons` are the buttons of my header, shown right-aligned in the order they were added.
- `emptyLabels` and `emptyButton` replace `table` when it has no items.
- `errorLabel` is shown only while it has a text.
"
Class {
	#name : 'CMModelTablePresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'titleLabel',
		'headerButtons',
		'errorLabel',
		'table',
		'emptyLabels',
		'emptyButton'
	],
	#category : 'Cormas-UI',
	#package : 'Cormas-UI'
}

{ #category : 'configuring' }
CMModelTablePresenter >> addAction: aLabel icon: anIconName help: aHelp do: aBlock [
	"Add a button to my header, after the ones already there"

	headerButtons add: (self newButton
			 label: aLabel;
			 icon: (self iconNamed: anIconName);
			 help: aHelp;
			 action: aBlock;
			 yourself).
	self updateLayout
]

{ #category : 'private' }
CMModelTablePresenter >> colorOf: anEntry [

	^ anEntry isDimmed
		  ifTrue: [ Color gray ]
		  ifFalse: [ self theme textColor ]
]

{ #category : 'layout' }
CMModelTablePresenter >> defaultLayout [

	| header column |
	header := SpBoxLayout newLeftToRight
		          spacing: 4;
		          vAlignCenter;
		          add: titleLabel;
		          yourself.
	headerButtons do: [ :each | header add: each expand: false ].
	column := SpBoxLayout newTopToBottom
		          spacing: 4;
		          add: header expand: false;
		          yourself.
	errorLabel label ifNotEmpty: [ column add: errorLabel expand: false ].
	table items ifEmpty: [
			^ column
				  add: self emptyLayout;
				  yourself ].
	^ column
		  add: table;
		  yourself
]

{ #category : 'layout' }
CMModelTablePresenter >> emptyLayout [

	| box |
	box := SpBoxLayout newTopToBottom
		       spacing: 6;
		       vAlignCenter;
		       hAlignCenter;
		       yourself.
	emptyLabels do: [ :each | box add: each expand: false ].
	emptyButton ifNotNil: [ box add: emptyButton expand: false ].
	^ box
]

{ #category : 'configuring' }
CMModelTablePresenter >> emptyLines: someStrings action: aLabel do: aBlock [
	"Say what to do, with a button that does it, when I have no models"

	emptyLabels := someStrings collect: [ :each |
		               self newLabel label: each ].
	emptyButton := self newButton
		               label: aLabel;
		               addStyle: 'large';
		               action: aBlock;
		               yourself.
	self updateLayout
]

{ #category : 'initialization' }
CMModelTablePresenter >> initializePresenters [

	titleLabel := self newLabel addStyle: 'title'.
	headerButtons := OrderedCollection new.
	errorLabel := self newLabel addStyle: 'headerError'.
	emptyLabels := #(  ).
	emptyButton := nil.
	table := self newTable
		         addColumn:
			         ((SpImageTableColumn evaluated: [ :entry |
					           entry stateIcon ])
				          width: 24;
				          yourself);
		         addColumn: (SpStringTableColumn new
				          title: 'Model';
				          evaluated: [ :entry | entry title ];
				          displayColor: [ :entry | self colorOf: entry ];
				          yourself);
		         addColumn: (SpStringTableColumn new
				          title: 'Version';
				          evaluated: [ :entry | entry version ];
				          displayColor: [ :entry | self colorOf: entry ];
				          width: 110;
				          yourself);
		         addColumn: (SpStringTableColumn new
				          title: 'State';
				          evaluated: [ :entry | entry state ];
				          displayColor: [ :entry | self colorOf: entry ];
				          width: 100;
				          yourself);
		         yourself
]

{ #category : 'accessing' }
CMModelTablePresenter >> items [

	^ table items
]

{ #category : 'accessing' }
CMModelTablePresenter >> items: someEntries [

	| wasEmpty |
	wasEmpty := table items isEmpty.
	table items: someEntries.
	wasEmpty = someEntries isEmpty ifFalse: [ self updateLayout ]
]

{ #category : 'accessing' }
CMModelTablePresenter >> selectItem: anEntry [

	table selectItem: anEntry
]

{ #category : 'accessing' }
CMModelTablePresenter >> selectedItem [

	^ table selectedItem
]

{ #category : 'updating' }
CMModelTablePresenter >> showError: aString [
	"Show in red under my header why my last action failed, or nothing for an empty string"

	errorLabel label: aString.
	self updateLayout
]

{ #category : 'configuring' }
CMModelTablePresenter >> title: aString [

	titleLabel label: aString
]

{ #category : 'accessing' }
CMModelTablePresenter >> unselectAll [

	table unselectAll
]

{ #category : 'updating' }
CMModelTablePresenter >> updateLayout [

	self layout: self defaultLayout
]

{ #category : 'accessing' }
CMModelTablePresenter >> whenSelectedItemChangedDo: aBlock [

	table whenSelectedItemChangedDo: aBlock
]
