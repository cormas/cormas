"
I check that looks start with defaults that always draw something sensible, return to them, and compute colors, sizes and thicknesses from values.
"
Class {
	#name : 'CMLookTest',
	#superclass : 'TestCase',
	#category : 'Cormas-Tests-Look',
	#package : 'Cormas-Tests',
	#tag : 'Look'
}

{ #category : 'tests - helpers' }
CMLookTest >> testARangeWhoseMinimumIsAboveItsMaximumRaisesAnError [

	self
		should: [
				CMCellLook new
					colorShadeOf: Color green
					forValue: 5
					from: 20
					to: 0 ]
		raise: Error
]

{ #category : 'tests - defaults' }
CMLookTest >> testAgentIsDrawnByDefault [

	| look |
	look := CMAgentLook new.
	self assert: look isVisible.
	self assert: look color alpha > 0.
	self assert: look size > 0.
	self assert: look shape equals: #circle
]

{ #category : 'tests - defaults' }
CMLookTest >> testAggregateShowsItsBorderButNotItsAreaByDefault [

	| look |
	look := CMAggregateLook new.
	self assert: look color alpha equals: 0.
	self assert: look borderColor alpha > 0.
	self assert: look borderThickness > 0
]

{ #category : 'tests - defaults' }
CMLookTest >> testBeInvisible [

	| look |
	look := CMAgentLook new.
	look beInvisible.
	self deny: look isVisible
]

{ #category : 'tests' }
CMLookTest >> testCellIsDrawnByDefault [

	| look |
	look := CMCellLook new.
	self assert: look isVisible.
	self assert: look color alpha > 0.
	self deny: look hasImage
]

{ #category : 'tests - helpers' }
CMLookTest >> testColorBetweenClampsValuesOutsideTheRange [

	| look |
	look := CMCellLook new.
	look
		colorBetween: Color blue
		and: Color red
		forValue: -10
		from: 0
		to: 40.
	self assert: look color equals: Color blue.
	look
		colorBetween: Color blue
		and: Color red
		forValue: 50
		from: 0
		to: 40.
	self assert: look color equals: Color red
]

{ #category : 'tests - helpers' }
CMLookTest >> testColorBetweenIsTheFirstColorAtTheMinimumAndTheSecondAtTheMaximum [

	| look |
	look := CMCellLook new.
	look
		colorBetween: Color blue
		and: Color red
		forValue: 0
		from: 0
		to: 40.
	self assert: look color equals: Color blue.
	look
		colorBetween: Color blue
		and: Color red
		forValue: 40
		from: 0
		to: 40.
	self assert: look color equals: Color red
]

{ #category : 'tests - helpers' }
CMLookTest >> testColorGroupedByGivesDifferentColorsToDifferentValues [

	| colors |
	colors := (1 to: 10) collect: [ :each |
			          CMCellLook new
				          colorGroupedBy: each;
				          color ].
	self assert: colors asSet size equals: 10
]

{ #category : 'tests - helpers' }
CMLookTest >> testColorGroupedByGivesTheSameColorToTheSameValue [

	| first second |
	first := CMCellLook new
		         colorGroupedBy: #alice;
		         color.
	second := CMAgentLook new
		          colorGroupedBy: #alice;
		          color.
	self assert: first equals: second
]

{ #category : 'tests - helpers' }
CMLookTest >> testColorShadeClampsValuesOutsideTheRange [

	| look |
	look := CMCellLook new.
	look
		colorShadeOf: Color green
		forValue: -5
		from: 0
		to: 20.
	self assert: look color equals: Color white.
	look
		colorShadeOf: Color green
		forValue: 25
		from: 0
		to: 20.
	self assert: look color equals: Color black
]

{ #category : 'tests - helpers' }
CMLookTest >> testColorShadeIsBlackAtTheMaximum [

	| look |
	look := CMCellLook new.
	look
		colorShadeOf: Color green
		forValue: 20
		from: 0
		to: 20.
	self assert: look color equals: Color black
]

{ #category : 'tests - helpers' }
CMLookTest >> testColorShadeIsLighterBelowTheMiddleAndDarkerAbove [

	| look light dark |
	look := CMCellLook new.
	look
		colorShadeOf: Color green
		forValue: 5
		from: 0
		to: 20.
	light := look color.
	look
		colorShadeOf: Color green
		forValue: 15
		from: 0
		to: 20.
	dark := look color.
	self assert: light brightness > dark brightness
]

{ #category : 'tests - helpers' }
CMLookTest >> testColorShadeIsWhiteAtTheMinimum [

	| look |
	look := CMCellLook new.
	look
		colorShadeOf: Color green
		forValue: 0
		from: 0
		to: 20.
	self assert: look color equals: Color white
]

{ #category : 'tests - helpers' }
CMLookTest >> testColorShadeOfAnEmptyRangeIsBlack [

	| look |
	look := CMCellLook new.
	look
		colorShadeOf: Color green
		forValue: 5
		from: 5
		to: 5.
	self assert: look color equals: Color black
]

{ #category : 'tests - helpers' }
CMLookTest >> testColorShadeQuicklyReachesTheColorThenDarkens [

	| look early middle |
	look := CMCellLook new.
	look
		colorShadeOf: Color green
		forValue: 2
		from: 0
		to: 20.
	early := look color.
	look
		colorShadeOf: Color green
		forValue: 10
		from: 0
		to: 20.
	middle := look color.
	self assert: early saturation > 0.6.
	self assert: early brightness > 0.85.
	self assert: (middle brightness closeTo: 0.5 precision: 0.01).
	self assert: (middle hue closeTo: Color green hue precision: 1)
]

{ #category : 'tests' }
CMLookTest >> testColorUnderAnImageIsTransparentUnlessSet [

	| look |
	look := CMAgentLook new.
	look image: 'farmer'.
	self assert: look color equals: Color transparent.
	look := CMCellLook new.
	look
		image: 'tree';
		color: Color green.
	self assert: look color equals: Color green.
	look := CMCellLook new.
	look
		color: Color gray;
		image: 'tree'.
	self assert: look color equals: Color gray
]

{ #category : 'tests' }
CMLookTest >> testImageReplacesThePreviousImage [

	| look |
	look := CMAgentLook new.
	look
		image: 'grass';
		image: 'farmer'.
	self assert: look image equals: (CMImage named: 'farmer')
]

{ #category : 'tests' }
CMLookTest >> testImageTakesANameOrAnImage [

	| look |
	look := CMCellLook new.
	look image: 'grass'.
	self assert: look image equals: (CMImage named: 'grass').
	look image: (CMImage named: 'grass') + 'tree'.
	self assert: look image equals: (CMImage named: 'grass') + 'tree'
]

{ #category : 'tests - defaults' }
CMLookTest >> testLinkIsDrawnByDefault [

	| look |
	look := CMLinkLook new.
	self assert: look color alpha > 0.
	self assert: look thickness > 0.
	self deny: look hasArrowhead
]

{ #category : 'tests - defaults' }
CMLookTest >> testNetworkDrawsNothingByDefault [

	self assert: CMNetworkLook new color alpha equals: 0
]

{ #category : 'tests' }
CMLookTest >> testResetForgetsTheImageAndTheColor [

	| look |
	look := CMCellLook new.
	look
		color: Color green;
		image: 'tree'.
	look reset.
	self deny: look hasImage.
	self assert: look color equals: CMCellLook new color.
	look image: 'tree'.
	self assert: look color equals: Color transparent
]

{ #category : 'tests - defaults' }
CMLookTest >> testResetOfALinkForgetsItsArrowhead [

	| look |
	look := CMLinkLook new.
	look
		hasArrowhead: true;
		thickness: 0.5.
	look reset.
	self deny: look hasArrowhead.
	self assert: look thickness equals: CMLinkLook new thickness
]

{ #category : 'tests' }
CMLookTest >> testResetReturnsToTheDefaults [

	| look default |
	look := CMAgentLook new.
	default := CMAgentLook new.
	look
		color: Color red;
		image: 'rocks';
		shape: #star;
		size: 0.9;
		borderColor: Color blue;
		borderThickness: 0.2;
		beInvisible.
	look reset.
	self assert: look color equals: default color.
	self deny: look hasImage.
	self assert: look shape equals: default shape.
	self assert: look size equals: default size.
	self assert: look borderColor equals: default borderColor.
	self assert: look borderThickness equals: default borderThickness.
	self assert: look isVisible
]

{ #category : 'tests - helpers' }
CMLookTest >> testSizeGrowsWithTheValueUpToAFullCell [

	| look small middle |
	look := CMAgentLook new.
	look sizeForValue: 0 from: 0 to: 100.
	small := look size.
	look sizeForValue: 50 from: 0 to: 100.
	middle := look size.
	look sizeForValue: 200 from: 0 to: 100.
	self assert: small > 0.
	self assert: small < middle.
	self assert: middle < look size.
	self assert: look size equals: 1
]

{ #category : 'tests - helpers' }
CMLookTest >> testThicknessGrowsWithTheValue [

	| look thin |
	look := CMLinkLook new.
	look thicknessForValue: -1 from: 0 to: 500.
	thin := look thickness.
	look thicknessForValue: 500 from: 0 to: 500.
	self assert: thin > 0.
	self assert: thin < look thickness
]
