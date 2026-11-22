Class {
	#name : 'CMLineChartRoassalTest',
	#superclass : 'TestCase',
	#instVars : [
		'table',
		'chart'
	],
	#category : 'Cormas-UI-Tests',
	#package : 'Cormas-UI-Tests'
}

{ #category : 'running' }
CMLineChartRoassalTest >> setUp [

	super setUp.
	table := CMDataTable withColumns: #( #boars #urbanBoars #landCover ).
	table addStep: 0 values: #( 40 2 'forest' ).
	table addStep: 1 values: #( 38 3 'forest' ).
	table addStep: 2 values: #( 41 5 'urban' ).
	chart := CMLineChart new
		         line: #boars;
		         line: #urbanBoars;
		         yourself
]

{ #category : 'tests' }
CMLineChartRoassalTest >> testAChosenColorIsUsed [

	chart color: Color brown for: #urbanBoars.
	self
		assert: (chart roassalChartOn: table) plots second color
		equals: Color brown
]

{ #category : 'tests' }
CMLineChartRoassalTest >> testALineOfValuesThatAreNotNumbersRaisesAnError [

	chart := CMLineChart new
		         line: #landCover;
		         yourself.
	self
		should: [ chart roassalChartOn: table ]
		raise: Error
		withExceptionDo: [ :error |
			self assert: (error messageText includesSubstring: 'landCover') ]
]

{ #category : 'tests' }
CMLineChartRoassalTest >> testATableWithoutRowsCanBeDrawn [

	self
		shouldnt: [
		chart canvasOn: (CMDataTable withColumns: #( #boars #urbanBoars )) ]
		raise: Error
]

{ #category : 'tests' }
CMLineChartRoassalTest >> testEachLineIsDrawnFromItsColumnOverTheSteps [

	| plots |
	plots := (chart roassalChartOn: table) plots.
	self assert: plots size equals: 2.
	self assert: plots first xValues asArray equals: #( 0 1 2 ).
	self assert: plots first yValues asArray equals: #( 40 38 41 ).
	self assert: plots second yValues asArray equals: #( 2 3 5 )
]

{ #category : 'tests' }
CMLineChartRoassalTest >> testLinesWithoutAChosenColorGetDifferentColors [

	| plots |
	plots := (chart roassalChartOn: table) plots.
	self deny: plots first color equals: plots second color
]

{ #category : 'tests' }
CMLineChartRoassalTest >> testTheCanvasShowsTheLabelOfEachLine [

	| texts |
	chart label: 'Boars in towns' for: #urbanBoars.
	texts := ((chart canvasOn: table) allChildren select: [ :each |
		          each isKindOf: RSLabel ]) collect: [ :each | each text ].
	self assert: (texts includes: 'boars').
	self assert: (texts includes: 'Boars in towns')
]

{ #category : 'tests' }
CMLineChartRoassalTest >> testTheCanvasShowsTheTitles [

	| texts |
	chart
		title: 'Boars';
		yTitle: 'Number of boars'.
	texts := ((chart canvasOn: table) allChildren select: [ :each |
		          each isKindOf: RSLabel ]) collect: [ :each | each text ].
	self assert: (texts includes: 'Boars').
	self assert: (texts includes: 'Number of boars')
]
