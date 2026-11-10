"
I am the right pane of the model list window. I show the model selected in one of its lists: its name, a line with its version, the Cormas it was made with and what Cormas has to say about it, its screenshot, its summary, and the buttons of the actions that apply to it.

## Responsibility:

- I show what the authors of a model say about it: its screenshot, or a quiet placeholder saying there is none, and the summary of its cormas.json. Never its README, which is made for GitHub.
- I show under the title one line joining the version of the model, the Cormas it was made with, and what Cormas has to say about it, such as that it is read-only, in red when work is at risk.
- I show the main actions as tall buttons with an icon across the whole width, and the other actions under them, those that fix a problem first, in rows of three that never crop them.

## Collaborators:

- `CMModelListEntry` gives me what to show about the model.
- `CMModelAction` gives me the actions that apply to it, in their order.
- `CMModelListPresenter` is my owner: it runs the actions and shows what they changed.

## Public API and Key Messages

- `show: anEntry` shows a model, and `show: nil` shows that none is selected.
- `entry` returns the model I show.

```smalltalk
(CMModelListPresenter on: CMWorkspace current) open
```

## Internal Representation

- `entry` is the `CMModelListEntry` I show, or nil.
- My layout is rebuilt for each entry, since the note and the buttons depend on its state.

### Implementation Points

- The screenshot scales with the window and keeps its aspect ratio.
"
Class {
	#name : 'CMModelPreviewPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'entry',
		'titleLabel',
		'screenshot',
		'summary'
	],
	#category : 'Cormas-UI',
	#package : 'Cormas-UI'
}

{ #category : 'screenshots' }
CMModelPreviewPresenter class >> placeholder [
	"Return the square shown when a model has no screenshot: a quiet frame in a translucent grey that shows in a light and a dark theme. The text saying so is a label over it, so that it stays sharp at any size"

	| form |
	form := Form extent: 400 @ 400 depth: 32.
	form fillColor: (Color gray alpha: 0.12).
	form getCanvas
		frameRectangle: form boundingBox
		width: 2
		color: (Color gray alpha: 0.4).
	^ form
]

{ #category : 'private' }
CMModelPreviewPresenter >> buttonFor: anAction [

	| shownEntry |
	shownEntry := entry.
	^ self newButton
		  label: anAction label;
		  action: [
			  self owner run: [ anAction runOn: shownEntry in: self owner ] ];
		  yourself
]

{ #category : 'layout' }
CMModelPreviewPresenter >> defaultLayout [

	^ SpBoxLayout newTopToBottom
		  vAlignCenter;
		  hAlignCenter;
		  add: (self newImage image: CMIcons cormasIcon) expand: false;
		  add: 'Select a model' expand: false;
		  yourself
]

{ #category : 'accessing' }
CMModelPreviewPresenter >> entry [

	^ entry
]

{ #category : 'layout' }
CMModelPreviewPresenter >> entryLayout [
	"The screenshot takes the height left by the other parts, scaled to fit it"

	| column secondary |
	column := SpBoxLayout newTopToBottom
		          spacing: 6;
		          add: titleLabel expand: false;
		          yourself.
	entry infoLine ifNotEmpty: [ :line |
		column add: (self infoLabel: line) expand: false ].
	column
		add: self screenshotLayout;
		add: summary height: 110.
	column add: self mainButtonsLayout height: 48.
	secondary := (CMModelAction fixesFor: entry)
	             , (CMModelAction secondaryFor: entry).
	column
		add: (self gridOf: secondary)
		height: (self heightOfGridOf: secondary).
	^ column
]

{ #category : 'layout' }
CMModelPreviewPresenter >> gridOf: actions [
	"Lay out the buttons of the actions in rows of three of the same width, so that none is cropped and a button keeps its place from one model to the next"

	| column |
	column := SpBoxLayout newTopToBottom
		          spacing: 6;
		          yourself.
	(actions asArray groupsOf: 3 atATimeCollect: [ :a :b :c |
			 {
				 a.
				 b.
				 c } ]) , (actions size \\ 3 = 0
		 ifTrue: [ #(  ) ]
		 ifFalse: [ { (actions asArray last: actions size \\ 3) } ]) do: [
			:rowActions |
			| row |
			row := SpBoxLayout newLeftToRight
				       spacing: 6;
				       beHomogeneous;
				       yourself.
			rowActions do: [ :each | row add: (self buttonFor: each) ].
			3 - rowActions size timesRepeat: [ row add: self newLabel ].
			column add: row height: 28 ].
	^ column
]

{ #category : 'layout' }
CMModelPreviewPresenter >> heightOfGridOf: actions [
	"Return the height of the grid of buttons of the actions, three to a row, which Spec does not compute by itself"

	^ actions size + 2 // 3 * 34
]

{ #category : 'layout' }
CMModelPreviewPresenter >> infoLabel: aString [
	"The line under the name: version, Cormas it was made with, and what Cormas says about the model, in red when code in the image is not saved"

	| label |
	label := self newLabel label: aString.
	(entry isAtRisk or: [ entry orphanPackageNames notEmpty ]) ifTrue: [
		label addStyle: 'headerError' ].
	^ label
]

{ #category : 'initialization' }
CMModelPreviewPresenter >> initializePresenters [

	titleLabel := self newLabel addStyle: 'title'.
	screenshot := self newImage autoScale: true.
	summary := self newText
		           beNotEditable;
		           beWrapWord;
		           yourself
]

{ #category : 'layout' }
CMModelPreviewPresenter >> mainButtonsLayout [
	"The main actions, as tall buttons with an icon that share the whole width"

	| row |
	row := SpBoxLayout newLeftToRight
		       spacing: 8;
		       beHomogeneous;
		       yourself.
	(CMModelAction mainFor: entry) do: [ :each |
			row add: ((self buttonFor: each)
					 icon: each icon;
					 yourself) ].
	^ row
]

{ #category : 'private' }
CMModelPreviewPresenter >> screenshotForm [
	"Return the screenshot of the model, or a placeholder when it has none or it cannot be read"

	^ entry screenshotFile
		  ifNil: [ self class placeholder ]
		  ifNotNil: [ :file |
				  [
					  file binaryReadStreamDo: [ :stream |
						  ImageReadWriter formFromStream: stream ] ]
					  on: Error
					  do: [ self class placeholder ] ]
]

{ #category : 'layout' }
CMModelPreviewPresenter >> screenshotLayout [
	"The screenshot, or the placeholder with a label saying there is none"

	entry screenshotFile ifNotNil: [ ^ screenshot ].
	^ SpOverlayLayout new
		  child: screenshot;
		  addOverlay: (self newLabel
				   label: 'No screenshot';
				   displayColor: [ :text | Color gray ];
				   yourself)
		  withConstraints: [ :constraints |
				  constraints
					  vAlignCenter;
					  hAlignCenter ];
		  yourself
]

{ #category : 'updating' }
CMModelPreviewPresenter >> show: anEntry [
	"Show the model of anEntry, or that no model is selected"

	entry := anEntry.
	entry ifNil: [ ^ self layout: self defaultLayout ].
	titleLabel label: entry title.
	screenshot image: self screenshotForm.
	summary text: (entry summary ifNil: [ '' ]).
	self layout: self entryLayout
]
