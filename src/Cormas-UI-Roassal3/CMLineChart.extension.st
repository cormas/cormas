Extension { #name : 'CMLineChart' }

{ #category : '*Cormas-UI-Roassal3' }
CMLineChart >> canvasOn: aDataTable [
	"Return a canvas with the chart of aDataTable and a legend naming each line. Before any row is recorded, the canvas has only the legend"

	| canvas legend |
	aDataTable size = 0
		ifTrue: [ canvas := RSCanvas new ]
		ifFalse: [
				| roassalChart |
				roassalChart := self roassalChartOn: aDataTable.
				roassalChart build.
				canvas := roassalChart canvas ].
	legend := RSLegend new.
	legend container: canvas.
	lines doWithIndex: [ :selector :index |
			legend
				text: (self labelFor: selector)
				withBoxColor: (self roassalColorFor: selector at: index) ].
	legend build.
	^ canvas
]

{ #category : '*Cormas-UI-Roassal3' }
CMLineChart >> numbersOf: aSelector in: aDataTable [

	| column |
	column := aDataTable column: aSelector.
	column first isNumber ifFalse: [
			self error:
				('A line shows numbers, but #{1} returned {2}' format: {
						 aSelector.
						 column first printString }) ].
	^ column asArray
]

{ #category : '*Cormas-UI-Roassal3' }
CMLineChart >> roassalChartOn: aDataTable [
	"Return a Roassal chart with a line for each probe, drawn from its column of aDataTable over the steps"

	| roassalChart |
	roassalChart := RSCompositeChart new.
	roassalChart extent: 800 @ 400.
	title ifNotNil: [ roassalChart title: title ].
	xTitle ifNotNil: [ roassalChart xlabel: xTitle ].
	yTitle ifNotNil: [ roassalChart ylabel: yTitle ].
	aDataTable size = 0 ifTrue: [ ^ roassalChart ].
	lines doWithIndex: [ :selector :index |
			roassalChart add: ((RSLinePlot new
					  x: aDataTable steps asArray
					  y: (self numbersOf: selector in: aDataTable))
					 color: (self roassalColorFor: selector at: index);
					 width: 2.5;
					 yourself) ].
	roassalChart
		addDecoration: RSHorizontalTick new;
		addDecoration: RSVerticalTick new.
	^ roassalChart
]

{ #category : '*Cormas-UI-Roassal3' }
CMLineChart >> roassalColorFor: aSelector at: anIndex [

	^ self
		  colorFor: aSelector
		  ifNone: [ NSScale category10 range atWrap: anIndex ]
]
