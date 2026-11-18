Class {
	#name : 'CMImageTest',
	#superclass : 'TestCase',
	#category : 'Cormas-Tests-Look',
	#package : 'Cormas-Tests',
	#tag : 'Look'
}

{ #category : 'tests' }
CMImageTest >> testAnImageCoversTheCellUntilItIsGivenASize [

	| tree |
	tree := CMImage named: 'tree'.
	self assert: tree coversTheCell.
	tree size: 1.
	self deny: tree coversTheCell.
	self assert: tree size equals: 1
]

{ #category : 'tests' }
CMImageTest >> testAnImageIsCentredAndUntintedByDefault [

	| tree |
	tree := CMImage named: 'tree'.
	self assert: tree shift equals: 0 @ 0.
	self assert: tree tint alpha equals: 0
]

{ #category : 'tests' }
CMImageTest >> testCombinedImagesAreResizedAsAWhole [

	| combined |
	combined := (CMImage named: 'grass') + (CMImage named: 'tree') size:
		            0.5.
	self assert: combined size equals: 0.5.
	self assert: combined layers first coversTheCell
]

{ #category : 'tests' }
CMImageTest >> testImagesNamedAlikeAreEqual [

	self
		assert: (CMImage named: 'grass')
		equals: (CMImage named: 'grass').
	self
		assert: (CMImage named: 'grass') hash
		equals: (CMImage named: 'grass') hash.
	self
		deny: (CMImage named: 'grass')
		equals: (CMImage named: 'tall-grass')
]

{ #category : 'tests' }
CMImageTest >> testPlusLaysTheSecondImageOverTheFirst [

	| grass tree |
	grass := CMImage named: 'grass'.
	tree := (CMImage named: 'tree') size: 0.5.
	self assert: (grass + tree) layers equals: {
			grass.
			tree }.
	self
		assert: grass + tree
		equals:
		(CMImage named: 'grass') + ((CMImage named: 'tree') size: 0.5).
	self deny: grass + tree equals: tree + grass
]

{ #category : 'tests' }
CMImageTest >> testPlusTakesANameOrAnImage [

	self
		assert: (CMImage named: 'grass') + 'tree'
		equals: (CMImage named: 'grass') + (CMImage named: 'tree')
]

{ #category : 'tests' }
CMImageTest >> testSizeShiftAndTintMakeImagesDifferent [

	| grass |
	grass := CMImage named: 'grass'.
	self deny: ((CMImage named: 'grass') size: 0.5) equals: grass.
	self deny: ((CMImage named: 'grass') shift: 0.2 @ 0) equals: grass.
	self
		deny: ((CMImage named: 'grass') tint: (Color red alpha: 0.3))
		equals: grass.
	self
		assert: ((CMImage named: 'grass')
				 size: 0.5;
				 shift: 0.2 @ 0;
				 tint: Color red;
				 yourself)
		equals: ((CMImage named: 'grass')
				 tint: Color red;
				 size: 0.5;
				 shift: 0.2 @ 0;
				 yourself)
]
