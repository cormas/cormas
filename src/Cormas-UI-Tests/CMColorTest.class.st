Class {
	#name : 'CMColorTest',
	#superclass : 'TestCase',
	#category : 'Cormas-UI-Tests',
	#package : 'Cormas-UI-Tests'
}

{ #category : 'tests' }
CMColorTest >> testHexString [

	| color hex |
	
	hex := 'B90E0A'.
	color := CMColor fromHexString: hex.
	
	self assert: (color isKindOf: Color).
	self assert: color asHexString equals: hex
]

{ #category : 'tests' }
CMColorTest >> testRgbTriplet [

	| rgb color otherColor |
	
	rgb := #(0.73 0.05 0.04).
	color := CMColor fromRgbTriplet: rgb.
	
	otherColor := CMColor
		r: rgb first
		g: rgb second
		b: rgb third.
	
	self assert: (color isKindOf: Color).
	self assert: otherColor equals: color.
	self assert: color rgbTriplet equals: rgb
]

{ #category : 'tests' }
CMColorTest >> testUnderstandNamedColors [

	self assert: (CMColor red isKindOf: Color).
	self assert: (CMColor green isKindOf: Color).
	self assert: (CMColor blue isKindOf: Color).
	self assert: (CMColor cyan isKindOf: Color).
	self assert: (CMColor yellow isKindOf: Color).
	self assert: (CMColor pink isKindOf: Color).
	self assert: (CMColor purple isKindOf: Color).
	self assert: (CMColor orange isKindOf: Color).
	self assert: (CMColor brown isKindOf: Color).
	self assert: (CMColor gray isKindOf: Color).
	self assert: (CMColor white isKindOf: Color).
	self assert: (CMColor black isKindOf: Color)
]
