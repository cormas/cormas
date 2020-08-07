Class {
	#name : #CormasTest,
	#superclass : #TestCase,
	#category : #'Cormas-Tests'
}

{ #category : #tests }
CormasTest >> testAverage [
	| n |
	n := #(1 2 3 4 5 6 7 8 9 10).
	self assert: (Cormas average: n) equals:  5.5.
]

{ #category : #tests }
CormasTest >> testCormasIsASingleton [
	self assert: Cormas current identicalTo: Cormas current
]

{ #category : #tests }
CormasTest >> testCountInto [
	| n |
	n := #(1 2 3 4 5 6 7 8 8 8 8 8 ).
	self assert: (Cormas count: 8 into: n) equals: 5.
]

{ #category : #tests }
CormasTest >> testDropBlanksFromString [
	| n |
	n := 'I Love Smalltalk'.
	self assert: (Cormas dropBlanksFromString: n) equals: 'ILoveSmalltalk'.
]

{ #category : #tests }
CormasTest >> testGiniIndexOf [
"in R with ineq package c(10,20,58,96,48,76,57,68,19,10), return
[1] 0.3471861
Cormas giniIndexOf: #(10 20 58 96 48 76 57 68 19 10) => 34.71861
ok
"
	| n |
	n := #(10 20 58 96 48 76 57 68 19 10).
	self assert: (Cormas giniIndexOf: n) equals: 8020/231
]

{ #category : #tests }
CormasTest >> testInterquartileRange [
"in R with IQR(c(0,10,20,58,96,48,76,57,68,19,10), type = 1), return
[1] 58"
	| n |
	n := #(10 20 58 96 48 76 57 68 19 10).
	self assert: (Cormas interquartileRange: n) equals: 49.
]

{ #category : #tests }
CormasTest >> testLogisticGrowthRK [
	self assert: (Cormas logisticIncrease: 1.0 r: 2.0 K: 4.0) equals: 1.5.
	self assert: (Cormas logisticGrowth: 1.0 r: 2.0 K: 4.0) equals: 2.5
]

{ #category : #tests }
CormasTest >> testLowerCaseFirstChar [
	| n |
	n := 'I Love Smalltalk'.
	self assert: (Cormas lowerCaseFirstChar: n) equals: 'i Love Smalltalk'.
]

{ #category : #tests }
CormasTest >> testLowerCaseString [
	| n |
	n := 'I Love Smalltalk'.
	self assert: (Cormas lowerCaseString: n) equals: 'i love smalltalk'.
]

{ #category : #tests }
CormasTest >> testLowerQuartile [
"in R with quantile(c(10,20,58,96,48,76,57,68,19,10), type = 1), return
	0%  25%  50%  75% 100% 
  10   19   48   68   96
upper quartile, is the value that cuts off the first 75%
"	
	|n|
	n := #(10 20 58 96 48 76 57 68 19 10).
	self assert: (Cormas lowerQuartile: n) equals: 19
]

{ #category : #tests }
CormasTest >> testMax [
	| n |
	n := #(10 20 58 96 48 76 57 68 19 10).
	self assert: (Cormas max: n) equals: 96
]

{ #category : #tests }
CormasTest >> testMaximumOfNumbers [
	| aCollection |
	aCollection := #(3 1 5 4 2).
	self assert: (Cormas max: aCollection) equals: 5
]

{ #category : #tests }
CormasTest >> testMedian [
"in R with median(c(10,20,58,96,48,76,57,68,19,10)), return
[1] 52.5
"
	| n |
	n := #(10 20 58 96 48 76 57 68 19).
	self assert: (Cormas median: n) equals: 57.
]

{ #category : #tests }
CormasTest >> testMin [
	| n |
	n := #(10 20 58 96 48 76 57 68 19 10).
	self assert: (Cormas min: n) equals: 10. 
]

{ #category : #tests }
CormasTest >> testMinOfAmongObjects [
	self
		assert: (Cormas minOf: #abs amongObjects: #(-2 -1 0 1 2))
		equals: 0
]

{ #category : #tests }
CormasTest >> testMinimumOfNumbers [
	| aCollection |
	aCollection := #(3 1 5 4 2).
	self assert: (Cormas min: aCollection) equals: 1
]

{ #category : #tests }
CormasTest >> testMixt [
	| aCollection |
	aCollection := #(1 2 3 4 5).
	self assert: ((Cormas mix: aCollection) includes: 1)
]

{ #category : #tests }
CormasTest >> testMode [
"in R
getmode <- function(v) {
   uniqv <- unique(v)
   uniqv[which.max(tabulate(match(v, uniqv)))]
}
getmode(c(10,20,58,96,48,76,57,68,19,10))

"
	| n |
	n := #(10 20 58 96 48 76 57 68 19 10).
	self assert: (Cormas mode: n) equals: #(10).
]

{ #category : #tests }
CormasTest >> testNumberOnCycle [

self assert: (Cormas number: 65 onCycle:40) equals:25
]

{ #category : #tests }
CormasTest >> testObjectTypeAsString [
	
	self assert: (Cormas objectTypeAsString: 12) equals: '12'.
	self assert: (Cormas objectTypeAsString: true) equals: 'true'.
]

{ #category : #tests }
CormasTest >> testRandom [
	self assert: (Cormas random between: 0.0 and: 1.0)
]

{ #category : #tests }
CormasTest >> testRandomBooleanReturnABoolean [
	| aBoolean |
	aBoolean := Cormas randomBoolean.
	self assert: (aBoolean or: [ aBoolean not ])
]

{ #category : #tests }
CormasTest >> testRandomFloat [
	| n |
	n := Cormas randomFloatFrom: -4.1 to: 2.5.
	self assert: n >= -4.1.
	self assert: n < 2.5
]

{ #category : #tests }
CormasTest >> testRandomGenerator [
	self
		assert: (Cormas randomGenerator isKindOf: PMFishmanMooreRandomGenerator)
]

{ #category : #tests }
CormasTest >> testRandomReturnAValueBetweenZeroAndOne [
	1000 timesRepeat: [ self assert: Cormas random >= 0 ].
	1000 timesRepeat: [ self assert: Cormas random < 1 ]
]

{ #category : #tests }
CormasTest >> testRemoveFirstCharacterOfString [
	
	self assert: (Cormas removeFirstCharacterOfString: 'Hello word') equals: 'ello word'.
]

{ #category : #tests }
CormasTest >> testRoundToNdigits [
"In R round(4.8750654, digits = 2)
[1] 4.88
"
	self assert: (Cormas round: 4.8750654 toNdigits:  2) equals: 4.88. 
]

{ #category : #tests }
CormasTest >> testSeed [
	Cormas seed: 0.
	self assert: Cormas seed equals: 0.
	Cormas initRandomSeed
]

{ #category : #tests }
CormasTest >> testSelectRandomlyFrom [
	| aCollection |
	aCollection := #(1 2 3 4 5).
	self assert: (aCollection includes: (Cormas selectRandomlyFrom: aCollection))
]

{ #category : #tests }
CormasTest >> testSinMinMaxPhasePeriod [
	"Not nice but ... work :-) I need to fin the way in R to build a true test"
	self assert: (Cormas sin: 3 min: -10 max: 20 phase: 0 period: 24) closeTo: 25.606601717798213 
]

{ #category : #tests }
CormasTest >> testSortDecreasingly [
	| n myblock|
	n := Cormas sortDecreasingly: #(10 20 58 96 48 76 57 68 19 10).
	myblock := n sortBlock.
	self assert: n equals: ((SortedCollection withAll: #(96 76 68 58 57 48 20 19 10 10)) sortBlock: myblock ).
]

{ #category : #tests }
CormasTest >> testSortIncreasingly [
	| n myblock|
	n := Cormas sortIncreasingly: #(10 20 58 96 48 76 57 68 19 10).
	myblock := n sortBlock.
	self assert: n equals: ((SortedCollection withAll: #(10 10 19 20 48 57 58 68 76 96)) sortBlock: myblock).
]

{ #category : #tests }
CormasTest >> testStandardDeviation [

	| n |
	n := #(10 20 58 96 48 76 57 68 19 10).
	self assert: (Cormas standardDeviation: n) closeTo: 28.547504269200136.
]

{ #category : #tests }
CormasTest >> testSum [
	| aCollection |
	aCollection := #(3 1 5 4 2).
	self assert: (Cormas sum: aCollection) equals: 15
]

{ #category : #tests }
CormasTest >> testThereIsThreeRuntimeModes [
	self assert: Cormas availableRuntimeModes size equals: 3
]

{ #category : #tests }
CormasTest >> testUpperCaseFirstChar [
	
	self assert: (Cormas upperCaseFirstChar: 'hello world') equals: 'Hello world'.
]

{ #category : #tests }
CormasTest >> testUpperCaseString [
	
	self assert: (Cormas upperCaseString: 'Hello World') equals: 'HELLO WORLD'.
]

{ #category : #tests }
CormasTest >> testUpperQuartile [
"in R with quantile(c(10,20,58,96,48,76,57,68,19,10),type=1), return
  0%  25%  50%  75% 100% 
  10   19   48   68   96
upper quartile, is the value that cuts off the first 75%
"	
	|n|
	n := #(10 20 58 96 48 76 57 68 19 10).
	self assert: (Cormas upperQuartile: n) equals: 68.
]

{ #category : #tests }
CormasTest >> testVariance [

	| n |
	n := #(10 20 58 96 48 76 57 68 19 10).
	self assert: (Cormas variance: n) equals: 814.96.
]

{ #category : #tests }
CormasTest >> teststringAsObjectType [
	
	self assert: (Cormas stringAsObjectType: '12.3') equals: 12.3.
]
