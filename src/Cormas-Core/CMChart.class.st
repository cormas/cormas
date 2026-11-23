"
I am a chart that a modeler defines in a `<chart>` method, to show probes recorded during a simulation. I am the abstract superclass of the kinds of charts: `CMLineChart`, `CMAreaChart`, `CMBoxplot` and `CMHistogram`.

## Responsibility:

- I know which probes I show: probes of my subject (the model, or the entity whose chart I am), and probes of all instances of a class, in the order they were added. I refuse to show the same probe of the same objects twice.
- I know the title of the chart and of its axes, and how each probe I show is named and colored: by default, a probe is named by its selector and takes a color of the chart's palette.
- I refuse a label or a color for a probe I do not show, so that a typing mistake does not go unnoticed.

## Collaborators:

- My subclasses add the probes with the messages of their kind, such as `line:` or `boxes:ofAll:`.
- Cormas-UI-Roassal3 turns me into `CMChartSeries` from the `CMDataTable`s a `CMSimulation` recorded (`seriesOf:in:`), and draws them with axis lines, ticks and a legend whose entries hide and show their series (`canvasOf:hiding:`). Each subclass says how it gathers series of all instances and how it plots them.

## Public API and Key Messages

- `title:`, `xTitle:`, `yTitle:`
- `label:for:` names a probe in the chart, and `color:for:` colors it.
- `labelFor:`, `colorFor:ifNone:` and `shownSelectors` read them.
- `isSingleStep` says whether I show one step, rather than the change over time.

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
- `subjectProbes`: an `OrderedCollection` of probe selectors of my subject.
- `probesOfAll`: an `OrderedCollection` of associations from probe selectors to classes.

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
		'colors',
		'subjectProbes',
		'probesOfAll',
		'showsLegend'
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

{ #category : 'presentation' }
CMChart >> hideLegend [
	"Draw me without a legend, for example when the legend would only repeat the title"

	showsLegend := false
]

{ #category : 'initialization' }
CMChart >> initialize [

	super initialize.
	labels := Dictionary new.
	colors := Dictionary new.
	subjectProbes := OrderedCollection new.
	probesOfAll := OrderedCollection new.
	showsLegend := true
]

{ #category : 'accessing' }
CMChart >> isSingleStep [
	"Return whether I show the values of a single step, rather than their change over time"

	^ false
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
CMChart >> showProbe: aSelector [
	"Show the probe aSelector of my subject: the model, or the entity whose chart I am"

	(subjectProbes includes: aSelector) ifTrue: [
		self error: ('The chart already shows #{1}' format: { aSelector }) ].
	subjectProbes add: aSelector
]

{ #category : 'private' }
CMChart >> showProbe: aSelector ofAll: aClass [
	"Show the probe aSelector of each instance of aClass and of its subclasses"

	(probesOfAll includes: aSelector -> aClass) ifTrue: [
			self error: ('The chart already shows #{1} of all {2}' format: {
						 aSelector.
						 aClass name }) ].
	probesOfAll add: aSelector -> aClass
]

{ #category : 'accessing' }
CMChart >> shownSelectors [

	^ subjectProbes , (probesOfAll collect: [ :each | each key ])
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
