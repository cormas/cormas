Class {
	#name : 'CMColor',
	#superclass : 'Color',
	#category : 'Cormas-UI',
	#package : 'Cormas-UI'
}

{ #category : 'as yet unclassified' }
CMColor class >> azure [
	<script: 'self azure inspect'>
	^ Color fromHexString: '0080FE'
]

{ #category : 'constants' }
CMColor class >> black [
	<script: 'self black inspect'>
	^ Color black
]

{ #category : 'accessing' }
CMColor class >> blue [
	<script: 'self blue inspect'>
	^ Color fromHexString: '1034A6'
]

{ #category : 'accessing - defaults' }
CMColor class >> brown [
	<script: 'self brown inspect'>
	^ Color fromHexString: '7E481C'
]

{ #category : 'utilities - colors' }
CMColor class >> colorNames [
	"Returns an array of color names: (#red #yellow #green...)"
	"Ex: (CMColor colorNames collect: [:s | CMColor perform: s]) inspect"

	| colorSpecs |
	
	colorSpecs :=
		Color defaultColors,
		Color defaultColors2,
		Color defaultColors3,
		Color defaultColors4.
	
	^ Array streamContents: [ :stream |
		  1 to: colorSpecs size by: 4 do: [ :i |
		  stream nextPut: (colorSpecs at: i) ] ]
]

{ #category : 'utilities - color' }
CMColor class >> colorOfNumber: aNumber [
	"Purpose: Returns a Color from the existing constant names provided by colorNames.
	Argument: aNumber = <Integer> is the index at which the color name is picked in the array.
	Example: CMColor colorOfNumber: 65  -> CMColor palePeach"

	^ self perform:
		(self colorNames at: (aNumber - 1) \\ self colorNames size + 1) asSymbol
]

{ #category : 'utilities - color' }
CMColor class >> colorValue: aValue min: minValue color: startColor max: maxValue color: stopColor [
	"Return a Color associated to aValue amongs a palette of colors.
aValue = <Number> ; minValue = <Integer> ; maxValue = <Integer> ; startColor = <Color or Symbol> ; stopColor = <Color  or Symbol>"

	| alpha rv gv bv value start_Color stop_Color |
	(aValue isNil or: [ aValue isNumber not ]) ifTrue: [ ^ self white ].
	value := aValue max: minValue.
	value := aValue min: maxValue.
	start_Color := self colorFrom: startColor.
	stop_Color := self colorFrom: stopColor.
	alpha := value - minValue / (maxValue - minValue).
	rv := (stop_Color red * alpha)
	      + (start_Color red * (1 - alpha)).
	gv := (stop_Color green * alpha)
	      + (start_Color green * (1 - alpha)).
	bv := (stop_Color blue * alpha)
	      + (start_Color blue * (1 - alpha)).
	^ self r: rv g: gv b: bv
]

{ #category : 'utilities - color' }
CMColor class >> colorValue: aValue min: minValue max: maxValue color: baseColor [

	"Return a Color for aValue, in the interval of minValue and maxValue. 
Works even if this value is less or up to minValue or maxValue
aValue = <Number> ; minValue = <Integer> ; maxValue = <Integer> ; baseColor = <ColorValue  or Symbol>"

	| index value color |
	(aValue isNil or: [ aValue isNumber not ]) ifTrue: [ 
		^ self white ].
	value := aValue.
	value := value max: minValue.
	value := value min: maxValue.
	index := maxValue = minValue
		         ifTrue: [ 0.8 ]
		         ifFalse: [ maxValue - value / (maxValue - minValue) ].
	color := self colorFrom: baseColor.
	^ self
		  h: color hue
		  s: color saturation * (1 - (index raisedTo: 10))
		  v: color brightness * index
]

{ #category : 'constants' }
CMColor class >> copper [
	<script: 'self copper inspect'>
	^ Color fromHexString: 'B87333'
]

{ #category : 'accessing - defaults' }
CMColor class >> gold [
	<script: 'self gold inspect'>
	^ Color fromHexString: 'E5B80B'
]

{ #category : 'constants' }
CMColor class >> green [
	<script: 'self green inspect'>
	^ Color fromHexString: '00b44c'
]

{ #category : 'as yet unclassified' }
CMColor class >> olympic [
	<script: 'self olympic inspect'>
	^ Color fromHexString: '008ECC'
]

{ #category : 'accessing - defaults' }
CMColor class >> orange [
	<script: 'self orange inspect'>
	^ Color fromHexString: 'FF7417'
]

{ #category : 'constants' }
CMColor class >> red [
	<script: 'self red inspect'>
	^ Color fromHexString: 'B90E0A'
]

{ #category : 'constants' }
CMColor class >> tangerine [
	<script: 'self tangerine inspect'>
	^ Color fromHexString: 'F28500'
]

{ #category : 'as yet unclassified' }
CMColor class >> tiffanyBlue [
	<script: 'self tiffanyBlue inspect'>
	^ Color fromHexString: '0ABAB5'
]

{ #category : 'see class side' }
CMColor >> seeClassSide [
]
