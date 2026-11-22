"
I am a chart that a modeler defines in a `<chart>` method, to show probes recorded during a simulation. I am the abstract superclass of the kinds of charts, such as `CMLineChart`.

## Responsibility:

- I know the title of the chart and of its axes.
- I know how each probe I show is named and colored: by default, a probe is named by its selector and takes a color of the chart's palette.
- I refuse a label or a color for a probe I do not show, so that a typing mistake does not go unnoticed.

## Collaborators:

- My subclasses say which probes they show (`shownSelectors`).
- Cormas-UI-Roassal3 draws my subclasses from the `CMDataTable` of a recorded object.

## Public API and Key Messages

- `title:`, `xTitle:`, `yTitle:`
- `label:for:` names a probe in the chart, and `color:for:` colors it.
- `labelFor:` and `colorFor:ifNone:` read them.

```smalltalk
CMLineChart new
	title: 'Boars';
	line: #boars;
	line: #urbanBoars;
	label: 'Boars in towns' for: #urbanBoars;
	color: Color gray for: #urbanBoars;
	yourself
```

## Internal Representation

- `title`, `xTitle`, `yTitle`: strings, or nil when the chart has none.
- `labels`: a `Dictionary` from probe selectors to strings.
- `colors`: a `Dictionary` from probe selectors to colors.

### Implementation Points

A chart names probes by their selectors and never refers to the model's state, so that the same chart can show a live simulation or saved data.
"
Class {
	#name : 'CMChart',
	#superclass : 'Object',
	#instVars : [
		'title',
		'xTitle',
		'yTitle',
		'labels',
		'colors'
	],
	#category : 'Cormas-Core-Charts',
	#package : 'Cormas-Core',
	#tag : 'Charts'
}

{ #category : 'private' }
CMChart >> checkShows: aSelector [

	(self shownSelectors includes: aSelector) ifFalse: [
			self error:
				('The chart does not show #{1}. It shows {2}' format: {
						 aSelector.
						 (', ' join:
							  (self shownSelectors collect: [ :each | '#' , each ])) }) ].
	(self shownSelectors occurrencesOf: aSelector) > 1 ifTrue: [
			self error:
				('The chart shows #{1} more than once, so it cannot tell which one is meant'
					 format: { aSelector }) ]
]

{ #category : 'presentation' }
CMChart >> color: aColor for: aSelector [
	"Draw the probe aSelector in aColor, instead of a color of the chart's palette"

	self checkShows: aSelector.
	colors at: aSelector put: aColor
]

{ #category : 'accessing' }
CMChart >> colorFor: aSelector ifNone: aBlock [

	^ colors at: aSelector ifAbsent: aBlock
]

{ #category : 'initialization' }
CMChart >> initialize [

	super initialize.
	labels := Dictionary new.
	colors := Dictionary new
]

{ #category : 'presentation' }
CMChart >> label: aString for: aSelector [
	"Name the probe aSelector with aString in the chart, instead of its selector"

	self checkShows: aSelector.
	labels at: aSelector put: aString
]

{ #category : 'accessing' }
CMChart >> labelFor: aSelector [
	"Return the text that names the probe aSelector in the chart: its label, or else its selector"

	^ labels at: aSelector ifAbsent: [ aSelector asString ]
]

{ #category : 'private' }
CMChart >> shownSelectors [
	"Return the selectors of the probes the chart shows"

	^ self subclassResponsibility
]

{ #category : 'accessing' }
CMChart >> title [

	^ title
]

{ #category : 'accessing' }
CMChart >> title: aString [

	title := aString
]

{ #category : 'accessing' }
CMChart >> xTitle [

	^ xTitle
]

{ #category : 'accessing' }
CMChart >> xTitle: aString [

	xTitle := aString
]

{ #category : 'accessing' }
CMChart >> yTitle [

	^ yTitle
]

{ #category : 'accessing' }
CMChart >> yTitle: aString [

	yTitle := aString
]
