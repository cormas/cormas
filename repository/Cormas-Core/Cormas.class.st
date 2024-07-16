"
This class is the main class of CORMAS. It is instanciated from the VisualLauncher menu.
All the useful method for user are class method into utils's protocols, ex: Cormas random.
To run Cormas: 
		VW -> Tools -> Cormas -> Cormas english
or select the following instruction and 'Do it':
		CormasLauncher launchCormas

	instanceVariableNames: 'listEntiteRessource listEntiteSociete listAttribut nomModele nomEntite nomMethode aPartirDe lesEntitesType listMethode commeEntiteType classBuilder typeEntite lesAttributsTempo menuBar espaceModel vue compteur cycle dModelBuilder simulationCourante modeleCourant mode observationGOSIsOn classesOS nomGroupe classeGroupe ressources methodes modeRessource listeSelectA listeSelectB tailleSlider modeDisplay imageOS imageOSInVue lastSelection tailleHolder '



	classVariableNames: ''



	poolDictionaries: ''



	category: 'Plate forme'
"
Class {
	#name : 'Cormas',
	#superclass : 'Object',
	#instVars : [
		'cycle',
		'cormasModel',
		'process',
		'modelNameField',
		'exportPlaybackLog',
		'useExternalVisualization',
		'xmlModel',
		'useOnlyOneRB',
		'isChangesDelayed'
	],
	#classInstVars : [
		'simpleRand',
		'current',
		'runtimeMode',
		'randomGenerator',
		'separator'
	],
	#category : 'Cormas-Core-Legacy',
	#package : 'Cormas-Core',
	#tag : 'Legacy'
}

{ #category : 'utilities - value types' }
Cormas class >> arrayFrom: anElementOrArray [
	"return an array for the argument"
	
	^ anElementOrArray isArray
		ifTrue: [ anElementOrArray ]
		ifFalse: [ Array with: anElementOrArray ]
]

{ #category : 'utilities - value types' }
Cormas class >> arrayOrNilFrom: anElementOrArray [
	"return an array or a nil for the argument"
	
	^ Array with: anElementOrArray
]

{ #category : 'runtime mode accessing' }
Cormas class >> availableRuntimeModes [
	"return the actual supported runtime modes"

	^ Set with: #developer with: #modeler with: #modelUser
]

{ #category : 'utilities - mathematics' }
Cormas class >> average: aCollectionOfNumbers [
	"Purpose: Returns the average of set of numbers
	Argument: aCollectionOfNumbers = < OrderedCollection> or <Array>
	Example: Cormas averageOf: #( 1 2 3)  	=> 2.0 "

	^ aCollectionOfNumbers averageIfEmpty: [ ^0 ]
]

{ #category : 'collector' }
Cormas class >> collect: anEntity [
	"this add anEntity to cormasModel collection (theXXXs).
This works but this is not the best way to do !
We suggest to use 'newAndCollect: aCollector' to create and collect an entity"
	
	| cormasForModel instOfCormasModel |
	cormasForModel := Cormas allInstances
		select: [:corm | corm cormasModelClass = anEntity modelClass].
	cormasForModel size = 1
		ifTrue:
			[instOfCormasModel := cormasForModel first cormasModel.
			anEntity collector: instOfCormasModel collector.
			instOfCormasModel collector collect: anEntity.
			^anEntity]
		ifFalse:
			[self inform: 'Only ONE simulation is possible']
]

{ #category : 'utilities - value types' }
Cormas class >> colorFrom: aSymbolOrColorValue [
	"return a color value for the argument"
	
	^ Color colorFrom: aSymbolOrColorValue
]

{ #category : 'utilities - value types' }
Cormas class >> colorOrBlackFrom: aColorValueOrElse [
	"return either the argument if it is a colorValue or a black colorValue"
	
	^ Color black
]

{ #category : 'utilities - mathematics' }
Cormas class >> count: element into: aCollection [
	"Purpose: Return a value indicating the number of occurrence of 'element' from aCollection. 
Argument: aCollectionOfNumbers = < OrderedCollection> or <Array>
Examples: Cormas count: 3 into: #( 1 2 3 3 3 3 3) 	 => 5
			Cormas count: 'a' into: #( 1 2 3 3 3 3 3) 	 => 0"
	
	^(aCollection select: [:anElement | element = anElement]) size
]

{ #category : 'accessing' }
Cormas class >> current [
	"acces to the single current Cormas  (pattern singleton)
	Conveniently retrieve the already created instance
	"
	
	^current ifNil: [current := self allInstances first]
]

{ #category : 'accessing' }
Cormas class >> current: aCormas [
	"acces to the single current Cormas  (pattern singleton).
	Used by the initialize during cormas initialisation"
	
	current := aCormas
]

{ #category : 'distributed' }
Cormas class >> defaultClientPort [
	"return the default client  port used for distributed simulation "
	
	^4243
]

{ #category : 'distributed' }
Cormas class >> defaultServerPort [
	"return the default server port used for distributed simulation "
	
	^4242
]

{ #category : 'utilities - string' }
Cormas class >> dropBlanksFromString: aString [
	"Purpose: Returns a copy of aString without any space characters
Example: Cormas dropBlanksFromString: 'Hello World    ' => 'HelloWorld'"

	^ aString copyWithRegex: ' ' matchesReplacedWith: ''
]

{ #category : 'utilities - code management' }
Cormas class >> findSelector: selector in: aClass [

"Answer an Array with the class and method for this selector,
	or nil if the selector is not found.
	NicolasBecu 5/28/2015 19:38 -> copy from VW for Pharo integration"

	| meth |
	meth := aClass class compiledMethodAt: selector ifAbsent: [nil].
	meth == nil ifFalse: [^Array with: self with: meth].
	^aClass superclass == nil
		ifTrue: [nil]
		ifFalse: [Cormas findSelector: selector in: aClass superclass]
]

{ #category : 'utilities - mathematics' }
Cormas class >> giniIndexOf: aCollection [
	"Purpose: Returns the gini of a set of numbers
The Gini coefficient is a number between 0 and 1, where 0 corresponds with perfect equality (where everyone has the same income) and 1 corresponds with perfect inequality (where one person has all the income, and everyone else has zero income). The Gini index is the Gini coefficient expressed in percentage form, and is equal to the Gini coefficient multiplied by 100.
Argument: aCollectionOfNumbers
Negative value are not accepted.
Example: Cormas giniIndexOf: #( 4.5 88.7 456 12 64 89.1 44 781)
More: The Gini coefficient is a measure of inequality developed by the Italian statistician Corrado Gini and published in 1912.
It is a commonly used coefficient to measure income inequality in a society by institutions such as the World Bank and others.
While the Gini coefficient is mostly used to measure income inequality, it can also be used to measure other types of inequality.
For more details on the calculation and use of the Gini coefficient and index see http://en.wikipedia.org/wiki/Gini_coefficient"

	| sum mean size |
	sum := 0.
	size := aCollection size.
	aCollection
		do: [ :i | aCollection do: [ :j | sum := sum + (j - i) abs ] ].
	mean := aCollection sum / size.
	^ 100 * sum / (2 * mean * size * size)
]

{ #category : 'utilities - mathematics' }
Cormas class >> giniIndexOf: aCollec absoluteCorrection: aNumber [
	"Purpose: Returns the gini of a set of numbers, which can include negative values
See the 'giniIndexOf: method for more details on Gini index.
As the calculation of the Gini index requieres that individuals cannot have a negative value for the assessed attribute, the following method operates a translation of the attribute value in case the attribute you want to assess has negative value.
Enter in the absoluteCorrection argument an amount equals or higher to the minimum negative value that your attribute may take.
Beware that this translation affects the absolute value of the Gini index.
(e.g. the Gini index calculated with an ''absoluteCorrection'' value of 1000 will not be the same than one calculated with a  ''absoluteCorrection'' value of 5000).
Argument: aCollectionOfNumbers = < OrderedCollection> or <Array>
Negative value are accepted .
Example: Cormas giniIndexOf: #( 4.5 -88.7 456 -12 64 89.1 44 781) absoluteCorrection: 100  -> 50.8776"

	| tot sort cumAttributeShare previousValue value areaAcollec areaAbyreaBcollec tot2 index |
	tot := 0.
	aCollec do: [ :i | tot := tot + i + aNumber ].
	sort := SortedCollection
		withAll: aCollec
		sortBlock: [ :x :y | x < y ].
	cumAttributeShare := OrderedCollection new.
	previousValue := 0.
	sort
		do: [ :i | 
			value := (i + aNumber) / tot.
			cumAttributeShare add: value + previousValue.
			previousValue := cumAttributeShare last ].
	cumAttributeShare last rounded ~= 1
		ifTrue: [ self halt ].
	areaAcollec := OrderedCollection new.
	1 to: cumAttributeShare size do: [ :i | 
		i = 1
			ifTrue: [ areaAcollec add: (cumAttributeShare at: i) ]
			ifFalse: [ areaAcollec
					add: (cumAttributeShare at: i) + (cumAttributeShare at: i - 1) ] ].
	areaAbyreaBcollec := OrderedCollection new.
	areaAcollec
		do: [ :i | areaAbyreaBcollec add: i * (1 / areaAcollec size) ].
	tot2 := 0.
	areaAbyreaBcollec do: [ :i | tot2 := tot2 + i ].
	index := (1 - tot2) * 100.
	^ index
]

{ #category : 'printing - documentation' }
Cormas class >> headerOfMethod: sel class: aClass [
	
	| source parser header endOfHeader |
	source := aClass sourceCodeAt: sel.
	source isEmpty ifTrue: [^nil].
	(parser := self parserClass new) parseSelector: source.
	endOfHeader := parser endOfLastToken.
	[(source at: endOfHeader) isSeparator]
		whileTrue: [endOfHeader := endOfHeader - 1].	"back up over white space"
	header := source
		copyFrom: 1
		to: (endOfHeader min: source size).
	^header
]

{ #category : 'private_aleat' }
Cormas class >> initRandom [
	"seed := nil.
	Rand := nil"
	
	
]

{ #category : 'private_aleat' }
Cormas class >> initRandomSeed [
	"Release the randomSeed. 
For example, if the initilizations of the simulations were done with fixed random seed (identical initial state for each simulation), then with #initRandomSeed called after initilization, the  simulations may be different"

	randomGenerator := nil
]

{ #category : 'class initialization' }
Cormas class >> initialize [
	"Build the singleton when Cormas class is loaded"
	self current: Cormas new
]

{ #category : 'utilities - mathematics' }
Cormas class >> interquartileRange: aCollectionOfNumbers [
	"Purpose : Returns the interquartile range quartile of a collection of numbers 
The interquartile range is the difference between the upper and lower quartiles
Example: Cormas interquartileRange: #(21 -15 7 -20 22 -8 5 -1 7 15 8 4 -4 11 24 12 47 12 18 1)"
	
	aCollectionOfNumbers size = 0 ifTrue: [^0].
	^(self upperQuartile: aCollectionOfNumbers)
		- (self lowerQuartile: aCollectionOfNumbers)
]

{ #category : 'runtime mode accessing' }
Cormas class >> isDeveloperMode [
	^ self runtimeMode == #developer
]

{ #category : 'runtime mode accessing' }
Cormas class >> isModelUserMode [
	^ self runtimeMode == #modelUser
]

{ #category : 'runtime mode accessing' }
Cormas class >> isModelerMode [
	^ self runtimeMode == #modeler
]

{ #category : 'accessing' }
Cormas class >> kernelClassNames [
	
	| collec |
	collec := OrderedCollection new.
	self cmEnvironment allClassNames do: [ : s | collec add: (s findTokens: $.) last].
	^ collec
]

{ #category : 'utilities - mathematics' }
Cormas class >> linearRegression: data [
	"Purpose: Return an array containing a, b, and correlation coefficient, that are the parameters of the linear 	regression of a set of data, where y = a + bx.
Argument: data is supposed to be a List of Array ( x,y) : data = <Collection (Array 2)>
Example: Cormas linearRegression: #(#(1 2) #(5 2) #(5 4) #(10 9) #(1 1) #(2 2))   ->  #(0.2 0.783333 0.921746)"
	
	| sumX sumY sumX2 sumY2 n marginalMeanX marginalMeanY sumDiffX2 sumDiffXY diffX diffY diffXY covariance marginalVarianceX b a correlationCoefficient sumDiffY2 |
	sumX := 0.
	sumY := 0.
	sumX2 := 0.
	sumY2 := 0.
	n := data size.
	data
		do:
			[:couple | 
			sumX := sumX + couple first.
			sumY := sumY + (couple at: 2).
			sumX2 := sumX2 + couple first squared.
			sumY2 := sumY2 + (couple at: 2) squared].
	marginalMeanX := sumX / n.
	marginalMeanY := sumY / n.
	sumDiffX2 := 0.
	sumDiffY2 := 0.
	sumDiffXY := 0.
	data
		do:
			[:couple | 
			diffX := couple first - marginalMeanX.
			sumDiffX2 := sumDiffX2 + diffX squared.
			diffY := (couple at: 2) - marginalMeanY.
			sumDiffY2 := sumDiffY2 + diffY squared.
			diffXY := diffX * diffY.
			sumDiffXY := sumDiffXY + diffXY].
	covariance := sumDiffXY / n.
	marginalVarianceX := sumDiffX2 / n.
	b := covariance / marginalVarianceX.
	a := marginalMeanY - (b * marginalMeanX).
	correlationCoefficient := covariance
		/ ((sumDiffX2 / n) sqrt * (sumDiffY2 / n) sqrt).
	^Array
		with: a asFloat
		with: b asFloat
		with: correlationCoefficient asFloat
]

{ #category : 'printing - documentation' }
Cormas class >> listing: fileName [
	
	| bufferText stream |
	bufferText := Text new.
	bufferText := bufferText , 'Attributs\' withCRs.
	self instVarNames
		do: [:iv | bufferText := bufferText , iv asString , '    '].
	bufferText := bufferText , '\\\Methodes' withCRs.
	self organization categories
		do:
			[:c | 
			bufferText := bufferText , '\\' , c asString , '\' withCRs.
			(self organization listAtCategoryNamed: c)
				do: [:m | bufferText := bufferText , m asString , '    ']].
	stream := fileName asFilename writeStream.
	stream nextPutAll: bufferText withCRs.
	stream close
]

{ #category : 'utilities - mathematics' }
Cormas class >> logisticGrowth: x r: r K: K [
	"Purpose: Returns the next value of X(t+1), according to the discrete logistic equation :
	 X(t+1) = X(t) + dx /dt  "

	^ x + (self logisticIncrease: x r: r K: K)
]

{ #category : 'utilities - mathematics' }
Cormas class >> logisticGrowthContinuous: x r: r K: K [
	"Returns the next value of X(t+1), according to the continuous logistic equation :
	 f(x,t) = x(t) = K / [(K-Xo)/Xo . exp(- r.t) + 1]   "
	
	^K / ((K - x) / x * (2.71828 raisedTo: r negated) + 1)
]

{ #category : 'utilities - mathematics' }
Cormas class >> logisticIncrease: x r: r K: K [
	"Returns the increase of X (dx /dt), according to the discrete logistic equation :
	 dx / dt  = r . x . (K - X(t)) / K "
	
	^r * x * (K - x) / K
]

{ #category : 'utilities - string' }
Cormas class >> lowerCaseFirstChar: aString [
	"Purpose: Converts the first character of a string into lowercase
Example: Cormas lowerCaseFirstChar: 'Hello World' => 'hello World'  "
	
	^ aString uncapitalized 
]

{ #category : 'utilities - string' }
Cormas class >> lowerCaseString: aString [
	"Purpose: Converts all uppercase characters of a string into lowercase characters
Example: Cormas lowerCaseString: 'Hello World' 'hello world'   "

	^ aString asLowercase
]

{ #category : 'utilities - mathematics' }
Cormas class >> lowerQuartile: aCollectionOfNumbers [
	"Purpose : Returns the lower quartile of a numbers distribution. 
The lower quartile (or first quartile or Q1) is the value of the sorted series of numbers which splits the lowest 25% of data
For example, assume that we have obtained the following 20 observations:
   2, 4, 7, -20, 22, -1, 0, -1, 7, 15, 8, 4, -4, 11, 11, 12, 3, 12, 18, 1
In order to calculate the quartiles we first have to sort the observations:
   -20, -4, -1, -1, 0, 1, 2, 3, 4, 4, 7, 7, 8, 11, 11, 12, 12, 15, 18, 22
The position of the first quartile is x = round(0.25*(20+1)) = round(5.25) = 5, which means that Q1 is the 5th value of the sorted series, namely Q1 = 0.
Example: Cormas lowerQuartile: #(2 4 7 -20 22 -1 0 -1 7 15 8 4 -4 11 11 12 3 12 18 1)"

	| sortedColl |
	aCollectionOfNumbers size = 0
		ifTrue: [ ^ 0 ].
	sortedColl := aCollectionOfNumbers asSortedCollection: [ :a :b | a < b ].
	^ sortedColl at: (0.25 * (sortedColl size + 1)) rounded
]

{ #category : 'utilities - mathematics' }
Cormas class >> max: aCollectionOfNumbers [
	"Answer the maximum of a set of numbers. 
aCollectionOfNumbers = < OrderedCollection> or <Array>
ex:		Cormas max: #( 1 2 3) => 3"

	^ aCollectionOfNumbers max
]

{ #category : 'utilities - mathematics' }
Cormas class >> maxOf: aMagnitudeName amongObjects: aCollection [
	"Purpose: returns the highest value of a given function among a collection of objects understanding this function
Arguments: aName = <ByteSymbol>
			aCollection = <Collection(Object)>
Return value: <Magnitude>
Example: Cormas maxOf: #elevation amongObject: self theCells"
	
	| collec |
	collec := aCollection
		select: [:c | (c perform: aMagnitudeName) respondsTo: #>].
	^collec isEmpty
		ifFalse: [self max: (collec collect: [:c | c perform: aMagnitudeName])]
		ifTrue: [nil]
]

{ #category : 'utilities - mathematics' }
Cormas class >> median: aCollectionOfNumbers [
	"Answer the median of a numbers distribution. 
	The median is defined by :
		the element whose index is (N+1)/2, if N is odd	or
		the average of elements whose indexes are N/2 and 1+N/2, if N is even
aCollectionOfNumbers = < OrderedCollection> or <Array>
ex:		Cormas median: #( 1 2 3) 	=> 2
		Cormas median: #( 1 2 3 5) 	=> 2.5"
	
	| sortedColl |
	aCollectionOfNumbers size = 0 ifTrue: [^0].
	sortedColl := aCollectionOfNumbers asSortedCollection: [:a :b | a > b].
	sortedColl size odd
		ifTrue: [^sortedColl at: (sortedColl size + 1) / 2]
		ifFalse:
			[^((sortedColl at: sortedColl size / 2)
				+ (sortedColl at: sortedColl size / 2 + 1)) / 2]
]

{ #category : 'utilities - mathematics' }
Cormas class >> min: aCollectionOfNumbers [
	"Purpose: Answer the minimum of a set of numbers. 
	Argument: aCollectionOfNumbers = < OrderedCollection> or <Array>
	Example:	Cormas min: #( 1 2 3)	=> 1"

	^ aCollectionOfNumbers min
]

{ #category : 'utilities - mathematics' }
Cormas class >> minOf: aMagnitudeName amongObjects: aCollection [
	"Purpose: returns the lowest value of a given function among a collection of objects understanding this function
Arguments: aName = <ByteSymbol>
			aCollection = <Collection(Object)>
Return value: <Magnitude>
Example: Cormas minOf: #elevation amongObject: self theCells"

	| collec |
	collec := aCollection
		select: [ :c | (c perform: aMagnitudeName) respondsTo: #> ].
	^ collec isEmpty
		ifFalse: [ self min: (collec collect: [ :c | c perform: aMagnitudeName ]) ]
		ifTrue: [ nil ]
]

{ #category : 'accessing' }
Cormas class >> mix: aCollection [
	"Purpose: Returns a randomly mixed collection
Argument: aCollection is a collection to be mixed"

	^ aCollection asOrderedCollection shuffledBy: self randomGenerator
]

{ #category : 'utilities - mathematics' }
Cormas class >> mode: aCollectionOfNumbers [
	"Answer an array of the most frequent values of a set of numbers. 
aCollectionOfNumbers = < OrderedCollection> or <Array>
ex:		Cormas mode: #( 1 2 3 3 3 3 3) => #(3)
ex:		Cormas mode: #( 1 1 1 0 2 6 7 3 3 3) => #(1 3)"
	
	| bestFrequency winners count |
    bestFrequency := 0.
    winners := OrderedCollection new.
    aCollectionOfNumbers
        do:
            [:aNb |
            count := (aCollectionOfNumbers select: [:anElement | aNb = anElement]) size.
            bestFrequency = count ifTrue: [winners add: aNb].
            bestFrequency < count
                ifTrue:
                    [bestFrequency := count.
                    winners := OrderedCollection with: aNb]].
    ^winners asSet asArray
]

{ #category : 'utilities - mathematics' }
Cormas class >> nextCyclicElementOf: anArray currentElement: currentElement [
	"Purpose : return the next element of anArray. 
If currentElement is the last of anArray, then return the first element.
Arguments: anArray = <Array>
currentElement = <Object>.
Examples: 
	Cormas nextCyclicElementOf: #(1 2 3 4 5 6 7) currentElement: 3 => 4
	Cormas nextCyclicElementOf: #(1 2 3 4 5 6 7) currentElement: 7 => 1
	Cormas nextCyclicElementOf: #(monday tuesday wednesday thursday friday saturday sunday) currentElement: #sunday => #monday"
	
	| index |
	index := anArray indexOf: currentElement.
	index = anArray size
		ifTrue: [index := 1]
		ifFalse: [index := index + 1].
	^anArray at: index
]

{ #category : 'utilities - random' }
Cormas class >> nextInteger: anInteger [

	^ self randomIntegerFrom: 1 to: anInteger
]

{ #category : 'utilities - random' }
Cormas class >> normal: mu sigma: sigma [
	"Purpose: Return a random number from a normal distribution. polar method, Law et Kelton
Arguments: mu = mean; sigma = standard deviation."

	| w u1 u2 v1 v2 y x1 |
	w := 2.
	[ w > 1 ]
		whileTrue: [ u1 := Cormas random.
			u2 := Cormas random.
			v1 := 2 * u1 - 1.
			v2 := 2 * u2 - 1.
			w := v1 squared + v2 squared ].
	y := (-2 * w ln / w) sqrt.
	x1 := v1 * y.
	x1 := mu + (sigma * x1).
	^ x1
]

{ #category : 'utilities - mathematics' }
Cormas class >> number: aNumber onCycle: aCycleBase [
	"Purpose : return a new number from aNumber transformed in aCycleBase. 
If aNumber exceeds aCycleBase, return to 1
Arguments: aNumber = <Integer>
aCycleBase = <Integer>.
Examples: 
	Cormas number: 4 onCycle: 5 => 4
	Cormas number: 5 onCycle: 5 => 5
	Cormas number: 6 onCycle: 5 => 1
	Cormas number: 7 onCycle: 5 => 2"

	^ (aNumber - 1) \\ aCycleBase + 1
]

{ #category : 'utilities - string' }
Cormas class >> objectTypeAsString: anObject [
	"Purpose: convert anObject as a String.
Examples: 
	Cormas objectTypeAsString: 12.3 => '12.3'
	Cormas objectTypeAsString: true => 'true'
	Cormas objectTypeAsString: #truc => 'truc' 
	Cormas objectTypeAsString: 'world' 'world' => 'world'  "
	
	
	^anObject asString
]

{ #category : 'user interface' }
Cormas class >> openVisualInspectorOn: anObject [
	"display anObject on a VisualInspector"
	
	anObject psiVisualInspect
]

{ #category : 'accessing' }
Cormas class >> passiveEntitiesClassNames [
	| collec |
	collec := OrderedCollection new.
	collec
		add: 'Msg';
		add: 'PassiveObject'.
	self cmEnvironment allEntityClasses
		do: [ :aClass | 
			(aClass inheritsFrom: CMPassiveObject)
				ifTrue: [ collec add: aClass name asString ] ].	"should be allEntityClasses ??"
	^ collec
]

{ #category : 'utilities - string' }
Cormas class >> print: aString [
	"Purpose: A Java-like print method. Writes aString on the Transcript Withour carriage return.
Example: Cormas print: 'Hello World'   "
	
	(Cormas objectTypeAsString: aString) printOn: Transcript.
	Transcript flush
]

{ #category : 'utilities - string' }
Cormas class >> println: aString [
	"Purpose: A Java-like println method. Writes aString on the Transcript
Example: Cormas println: 'Hello World'   "
	
	(Cormas objectTypeAsString: aString) printOn: Transcript.
	Transcript
		flush;
		cr
]

{ #category : 'utilities - random' }
Cormas class >> random [
	^ self randomGenerator next
]

{ #category : 'utilities - random' }
Cormas class >> randomBoolean [
	^ #(true false) atRandom: self randomGenerator
]

{ #category : 'utilities - random' }
Cormas class >> randomColor [
"Purpose: Returns a random ColorValue
Example: Cormas randomColor"
	^Color registeredColorNames atRandom: self randomGenerator
]

{ #category : 'utilities - random' }
Cormas class >> randomFloatFrom: startNumber to: endNumber [
	"Purpose: Return a random float between 'startNumber' and 'endNumber' (excluding startNumber and endNumber): 
	startNumber < randomFloat < endNumber, ie. randomFloat in ]startNumber ; endNumber[.
Examples: Cormas randomFloatFrom: 0 to: 10.
		Cormas randomFloatFrom: -4.1 to: 2.5
		10 timesRepeat: [Cormas randomFloatFrom: 1.1 to: 2.9] => (2.19661 1.78905 1.19457 1.96943 1.6194 1.12104 1.94028 2.41498 2.19254 2.18504) "
	
	| extent result |
	extent := endNumber asFraction - startNumber asFraction.
	result := (Cormas random * extent + startNumber asFraction) asFloat.
	^result = endNumber
		ifTrue: [self randomFloatFrom: startNumber to: endNumber]
		ifFalse: [result]
]

{ #category : 'utilities - random' }
Cormas class >> randomFrom: startInteger to: endInteger [
	| extent |
	extent := endInteger - startInteger + 1.
	^endInteger min: (Cormas random * extent) truncated + startInteger
]

{ #category : 'accessing' }
Cormas class >> randomGenerator [
	^ randomGenerator ifNil: [ randomGenerator := PMFishmanMooreRandomGenerator new ]
]

{ #category : 'accessing' }
Cormas class >> randomGenerator: aRandFishmanMoore [
	randomGenerator := aRandFishmanMoore
]

{ #category : 'utilities - random' }
Cormas class >> randomIntegerFrom: startInteger to: endInteger [
	"Purpose: Return a random Integer between 'startInteger' and 'endInteger': 
	startInteger <= randInteger <= endInteger, ie. randInteger ‚Ç¨ [startInteger ; endInteger].
Examples: Cormas randomFrom: 0 to: 100.
Examples: Cormas randomFrom: -4 to: 10
		10 timesRepeat: [Cormas randomFrom: 0 to: 10] => 10 1 7 0 4 0 6 10 7 "
	
	^self randomFrom: startInteger to: endInteger
]

{ #category : 'utilities - random' }
Cormas class >> randomSeed: aValue [
	"Purpose: Set the initial value of the RandFishmanMoore suit. Without this method, the initial value is equal to Time millisecondClockValue.
Argument: aValue must be an integer greater than 1.
Example : 
	3 timesRepeat: 
			[Cormas randomSeed: 100.
			6 timesRepeat: 
					[Cormas random printString printOn: Transcript].
					Transcript flush; cr] "
	
	self seed: aValue
]

{ #category : 'actions' }
Cormas class >> rebuildMenu [
	"rebuild the main menu for all opened Cormas (usefull when adding item in the mainMenu)
	Cormas rebuildMenu
	"
	
	self allInstances do: [:each | each rebuildMenu]
]

{ #category : 'printing - documentation' }
Cormas class >> recordDictClass: aClass [
	
	| dict dictClass |
	dict := Dictionary new.
	aClass organization categories asSortedCollection
		do:
			[:cat | 
			(self recordProtocol: cat class: aClass)
				keysAndValuesDo: [:k :v | dict at: k put: v]].
	dictClass := Dictionary new.
	aClass class organization categories asSortedCollection
		do:
			[:cat | 
			(self
				recordProtocol: cat
				class: aClass class) keysAndValuesDo: [:k :v | dictClass at: k put: v]].
	^Array with: dict with: dictClass
]

{ #category : 'printing - documentation' }
Cormas class >> recordMethod: sel category: cat class: aClass [
	
	| source parser header endOfHeader thisComment |
	source := aClass sourceCodeAt: sel.
	source isEmpty ifTrue: [^self].
	(parser := self parserClass new) parseSelector: source.
	endOfHeader := parser endOfLastToken.
	[(source at: endOfHeader) isSeparator]
		whileTrue: [endOfHeader := endOfHeader - 1].	"back up over white space"
	header := source
		copyFrom: 1
		to: (endOfHeader min: source size).
	thisComment := parser
		parseMethodComment: source
		setPattern: [:none | none].
	thisComment isEmpty ifFalse: [thisComment := thisComment first].
	^Association
		key:
			(header string , '& [' , aClass name asString , ' >> ' , cat asString , ']')
				asSymbol
		value: thisComment
]

{ #category : 'util_files' }
Cormas class >> removeExtensionOf: aFilename [
	"convert and return the filename titi.ext as 'titi'"
	
	| aString index |
	aString := aFilename asString.
	index := aString
		indexOfSubCollection: aFilename extension
		startingAt: 1.
	index = 0 ifTrue: [^aFilename].
	^(aString
		copyReplaceFrom: index
		to: aString size
		with: '') asFilename
]

{ #category : 'utilities - string' }
Cormas class >> removeFirstCharacterOfString: aString [
	"Purpose: Remove the first character of aString. Answer a new String that is a copy of the argument, aString without the first character."

	^ aString copy allButFirst
]

{ #category : 'utilities - mathematics' }
Cormas class >> round: aNumber toNdigits: x [
	"Purpose: Returns a float value rounded with a specified number of decimals
Argument: aNumber to be rounded   ; x the number of decimals wanted
Example: Cormas round: 5.1675634  toNdigits: 2	=> 5.17
Cormas round: 4/3 toNdigits: 1	=> 1.3"
	
	aNumber isInteger ifTrue: [^aNumber].
	x = 0 ifTrue: [^aNumber rounded].
	^(aNumber * (10 raisedTo: x)) rounded / (10 raisedTo: x) asFloat
]

{ #category : 'runtime mode accessing' }
Cormas class >> runtimeMode [
	"return the actual runtime mode for this image (usefull for adapting menus).
	3 values are supported : #developer, #modeler, #modelUser.
	the default value is #developer and is changed by the CormasPackager.
	"

	^ runtimeMode ifNil: [ runtimeMode := #developer ]
]

{ #category : 'runtime mode accessing' }
Cormas class >> runtimeMode: aSymbol [
	"set the actual runtime mode for this image (usefull for adapting menus).
	this method is reserved for the CormasPackager"

	(self availableRuntimeModes includes: aSymbol)
		ifFalse: [ ^ self error: 'Unsupported RuntimeMode' , aSymbol printString ].
	runtimeMode := aSymbol
]

{ #category : 'utilities - files' }
Cormas class >> saveCollec: aCollec asLineOfFile: aFilename separator: aChar [
	"Purpose: Save a Collection of literals (characters, numbers, strings...) into a defined file. The elements of the collection are saved into a single line, each one separated by aChar. If the file already exists, the elements of the collection are saved after the last line of the file.
Arguments: aColllec is the collection to be savec ; aFilename is a filename object indicatng the name, the extension and the path of the file  ; aChar the character of the separator writen between each element
Example: Cormas saveCollec: #(abc '??' 67) asLineOfFile: ((Cormas modelPath: #ECEC) construct: 'test.csv')   separator: $;  "
	
	| stream |
	stream := aFilename appendStream.
	1
		to: aCollec size - 1
		do:
			[:i | stream nextPutAll: (aCollec at: i) printString , aChar asSymbol asString].
	stream nextPutAll: aCollec last printString.
	stream nextPutAll: '\' withCRs.
	stream close
]

{ #category : 'deprecated' }
Cormas class >> saveCollec: aCollec inCsvFile: aString [
	
	self
		saveElementsOfCollec: aCollec
		inFile: (self removeExtensionOf: aString) asString , '.csv'
]

{ #category : 'deprecated' }
Cormas class >> saveCollec: t1 inFile: t2 [
	"Deprecated. Should use CormasModel updateFile: t1 dataCollection: t2 separator: t3"
	
	| t3 |
	t3 := t2 asFilename appendStream.
	t1 do: [:t4 | t3 nextPutAll: t4 printString , ';'].
	t3 nextPutAll: '\' withCRs.
	t3 close.
	^self
]

{ #category : 'deprecated' }
Cormas class >> saveCollec: aCollec inTxtFile: aString [
	
	| file lastData i |
	file := aString asFilename appendStream.
	lastData := aCollec size.
	i := 1.
	aCollec
		do:
			[:a | 
			i = lastData
				ifFalse: [file nextPutAll: a asString , '\' withCRs]
				ifTrue: [file nextPutAll: a asString].
			i := i = 1].
	file close
]

{ #category : 'utilities - files' }
Cormas class >> saveElementsOfCollec: aCollec inFile: aFilename [
	"Purpose: Save a Collection of literals (characters, numbers, strings...) into a defined file. Each element of the collection is saved into a separate line of the file. If the file already exists, the elements of the collection are saved starting frm the end of the file.
Arguments: aColllec is the collection to be savec ; aFilename is a filename object indicatng the name, the extension and the path of the file
Example: Cormas saveElementsOfCollec: #(abc ?? 67) inFile: ((Cormas modelPath: #ECEC) construct: 'test.txt')     "
	
	| file lastData i |
	file := aFilename appendStream.
	lastData := aCollec size.
	i := 1.
	aCollec
		do:
			[:a | 
			i = lastData
				ifFalse: [file nextPutAll: a asString , '\' withCRs]
				ifTrue: [file nextPutAll: a asString].
			i := i = 1].
	file close
]

{ #category : 'accessing' }
Cormas class >> seed [
	^ self randomGenerator seed
]

{ #category : 'accessing' }
Cormas class >> seed: anInteger [
	self randomGenerator seed: anInteger
]

{ #category : 'utilities - collection' }
Cormas class >> selectEntitiesWithMaxOf: aMagnitudeName amongEntities: aCollection verifying: aCondition [
	"Purpose: selects the entities with the maximum value of a given magnitude and verifying a specified condition. 
Arguments: aMagnitudeName = <ByteSymbol>
			aCollection = <Collection(Entity)>
			aCondition = <BlockClosure>
Return value: <Collection(Entity)>
Example: Cormas selectEntitiesWithMaxOf: #water amongEntities self theCells verifying: [:c | c isPolluted not]"
	
	| selection |
	selection := aCollection
		select:
			[:c | ((c perform: aMagnitudeName) respondsTo: #>) and: [aCondition value: c]].
	selection := selection
		asSortedCollection:
			[:i :j | (i perform: aMagnitudeName) > (j perform: aMagnitudeName)].
	selection := selection
		select:
			[:c | (c perform: aMagnitudeName) = (selection first perform: aMagnitudeName)].
	^selection
]

{ #category : 'utilities - random' }
Cormas class >> selectRandomlyFrom: aCollection [

	aCollection ifEmpty: [ ^ nil ].
	^ aCollection atRandom: self
]

{ #category : 'utilities - random' }
Cormas class >> selectRandomlyFrom: aCollection constrainedBy: aBlock [
	"Purpose: Returns an item satisfying the condition aBlock at randomly position of the collection 'aCollection'. 
If the collection is empty, or no item satisfies the condition aBlock, its returns nil.
Example:  Cormas selectRandomlyFrom: (List withAll: #(1 2 3 4 5)) constrainedBy: [:i | i > 2].
Example:  Cormas selectRandomlyFrom: self thePersons constrainedBy: [:p | p  age <  42] "
	
	| x collec2 |
	collec2 := aCollection select: aBlock.
	collec2 isEmpty ifTrue: [^nil].
	x := self
		randomFrom: 1
		to: collec2 size.
	^collec2 asOrderedCollection at: x
]

{ #category : 'utilities - random' }
Cormas class >> selectRandomlyFrom: aCollection subCollectionSize: anInteger [
	"Purpose: Returns a subcollection randomly built from a collection (an item may be selected only once). If the collection is empty, or if the collection size is lower than the subcollection size, its returns aCollection randomly mixed..
Examples: Cormas selectRandomlyFrom: (Set withAll: #(1 2 3 4 5)) subCollectionSize: 3 => OrderedCollection (4 5 1)
			self ask: (Cormas selectRandomlyFrom: (self theCells select:[:c| c state = #tree]) subCollectionSize: 4) toDo: #burn"
	
	| randomCollection |
	anInteger < 1 ifTrue: [^OrderedCollection new].
	randomCollection := Cormas mix: aCollection.
	randomCollection size <= anInteger ifTrue: [^randomCollection].
	^randomCollection copyFrom: 1 to: anInteger
]

{ #category : 'util_files' }
Cormas class >> separator [
	
	separator ifNil: [separator := $;].
	^separator
]

{ #category : 'util_files' }
Cormas class >> separator: aSeparator [
	
	separator := aSeparator
]

{ #category : 'private_aleat' }
Cormas class >> simpleRandom [
	" Return a pseudo-random value according to the Random equation. No seed.
	It is also useful for non-entities, as display processes for example"

	^ (simpleRand ifNil: [ simpleRand := Random new ]) next
]

{ #category : 'private_aleat' }
Cormas class >> simpleRandomFrom: start to: end [
	"Return a random value between 'start' and 'end'.
	This method doesn't use the 'random' method of Cormas and so do not change the next value of RandFishmanMoore.
	It is also useful for non-entities, as display processes for example"
	
	| extent |
	extent := end - start + 1.
	^end min: (Cormas simpleRandom * extent) truncated + start
]

{ #category : 'utilities - mathematics' }
Cormas class >> sin: x min: min max: max phase: phase period: period [
	"return the sinus function of x, according to min value, max value, phase and period.
example: Environment updateTemperature: time 
	temperatureMin= -10 	temperatureMax = 20	period = 24
 	self temperature: self temperatureMin + Cormas sin: time min: -10 max: 20 phase: 0 period: 24"
	
	| delta omega |
	delta := max - min.
	omega := 2 * Float pi / period.
	^delta / 2 + (delta / 2 * (omega * (x + phase)) sin)
]

{ #category : 'accessing' }
Cormas class >> socialEntitiesClassNames [
	| collec |
	collec := OrderedCollection new.
	collec add: 'Agent'.
	self cmEnvironment allEntityClasses 
		do: [ :aClass | 
			(aClass inheritsFrom: CMAgent)
				ifTrue: [ collec add: aClass name asString ] ].	"should be allEntityClasses ??"
	^ collec
]

{ #category : 'utilities - collection' }
Cormas class >> sort: collec byDecreasing: att1 thenByDecreasing: att2 [
	"Purpose: Sort a collection of objects (entities) that have the same attributes att1 and att2, first according to an decreasing order of att1, then according to an decreasing value of att2.
Arguments: collec is the collection to be sorted. at1 and aat2 are the names (in symbol) of the attributes
Example: Cormas sort: (self theTrees) byDecreasing: #age thenByDecreasing: #height"
	
	| oc temp tutu |
	oc := OrderedCollection new.
	temp := (collec
		asSortedCollection: [:i :j | (i perform: att1) > (j perform: att1)])
		asOrderedCollection.
	[temp isEmpty]
		whileFalse:
			[tutu := temp select: [:i | (temp first perform: att1) = (i perform: att1)].
			oc
				addAllLast:
					(tutu asSortedCollection: [:i :j | (i perform: att2) > (j perform: att2)]).
			temp removeAll: tutu].
	^oc
]

{ #category : 'utilities - collection' }
Cormas class >> sort: collec byDecreasing: att1 thenByIncreasing: att2 [
	"Purpose: Sort a collection of objects (entities) that have the same attributes att1 and att2, first according to an Decreasing order of att1, then according to an increasing value of att2.
Arguments: collec is the collection to be sorted. at1 and aat2 are the names (in symbol) of the attributes
Example: Cormas sort: (self theTrees) byDecreasing: #age thenByIncreasing: #height"
	
	| oc temp tutu |
	oc := OrderedCollection new.
	temp := (collec
		asSortedCollection: [:i :j | (i perform: att1) > (j perform: att1)])
		asOrderedCollection.
	[temp isEmpty]
		whileFalse:
			[tutu := temp select: [:i | (temp first perform: att1) = (i perform: att1)].
			oc
				addAllLast:
					(tutu asSortedCollection: [:i :j | (i perform: att2) < (j perform: att2)]).
			temp removeAll: tutu].
	^oc
]

{ #category : 'utilities - collection' }
Cormas class >> sort: collec byIncreasing: att1 thenByDecreasing: att2 [
	"Purpose: Sort a collection of objects (entities) that have the same attributes att1 and att2, first according to an increasing order of att1, then according to an decreasing value of att2.
Arguments: collec is the collection to be sorted. at1 and aat2 are the names (in symbol) of the attributes
Example: Cormas sort: (self theTrees) byIncreasing: #age thenByDecreasing: #height"
	
	| oc temp tutu |
	oc := OrderedCollection new.
	temp := (collec
		asSortedCollection: [:i :j | (i perform: att1) < (j perform: att1)])
		asOrderedCollection.
	[temp isEmpty]
		whileFalse:
			[tutu := temp select: [:i | (temp first perform: att1) = (i perform: att1)].
			oc
				addAllLast:
					(tutu asSortedCollection: [:i :j | (i perform: att2) > (j perform: att2)]).
			temp removeAll: tutu].
	^oc
]

{ #category : 'utilities - collection' }
Cormas class >> sort: collec byIncreasing: att1 thenByIncreasing: att2 [
	"Purpose: Sort a collection of objects (entities) that have the same attributes att1 and att2, first according to an increasing order of att1, then according to an increasing value of att2.
Arguments: collec is the collection to be sorted. at1 and aat2 are the names (in symbol) of the attributes
Example: Cormas sort: (self theTrees) byIncreasing: #age thenByIncreasing: #height"
	
	| oc temp tutu |
	oc := OrderedCollection new.
	temp := (collec
		asSortedCollection: [:i :j | (i perform: att1) < (j perform: att1)])
		asOrderedCollection.
	[temp isEmpty]
		whileFalse:
			[tutu := temp select: [:i | (temp first perform: att1) = (i perform: att1)].
			oc
				addAllLast:
					(tutu asSortedCollection: [:i :j | (i perform: att2) < (j perform: att2)]).
			temp removeAll: tutu].
	^oc
]

{ #category : 'utilities - collection' }
Cormas class >> sortDecreasingly: aCollectionOfNumbers [
	"Purpose: sort the elements of a collection in an decreasing order
Argument: aCollectionOfNumbers = < OrderedCollection> or <Array>
Return value: a sorted collection
Example: Cormas sortDecreasingly: #( 2 1 3)	 => aSortedCollection (3 2 1)"

	^ aCollectionOfNumbers asSortedCollection: [ :a :b | a > b ]
]

{ #category : 'utilities - collection' }
Cormas class >> sortIncreasingly: aCollectionOfNumbers [
	"Purpose: sort the elements of a collection in an increasing order
Argument: aCollectionOfNumbers = < OrderedCollection> or <Array>
Return value: a sorted collection
Example: Cormas sortIncreasingly: #( 2 1 3)	 => aSortedCollection (1 2 3)"

	^ aCollectionOfNumbers asSortedCollection: [ :a :b | a < b ]
]

{ #category : 'accessing' }
Cormas class >> spatialEntitiesClassNames [
	| collec |
	collec := OrderedCollection new.
	self cmEnvironment allEntityClasses 
		do: [ :aClass | 
			(aClass inheritsFrom: CMSpatialEntity)
				ifTrue: [ collec add: aClass name asString ] ].	"should be allEntityClasses ??"
	^ collec
]

{ #category : 'utilities - files' }
Cormas class >> splitLine: stream sep: aSepChar [
	"Purpose: Used when loading an external file. Split a read stream according to a given separator character
	Example: Cormas splitLine: aStream sep: $,   "

	| wordsList line item |
	wordsList := OrderedCollection new.
	line := (stream upTo: Character cr) readStream.
	[ line atEnd ]
		whileFalse: [ item := line upTo: aSepChar.
			wordsList add: item ].
	line close.
	^ wordsList
]

{ #category : 'utilities - value types' }
Cormas class >> splitString: aString with: aChar [
	"Purpose: Splits a string according to a given separator character and returns a collection of the splited portions of the string
Examples: Cormas splitString: 'Hello world;Bonjour le monde;Bom dia Mundo;Buenos Dias Mundo' with: $; "
	
	| stream collec |
	stream := aString readStream.
	collec := OrderedCollection new.
	[stream atEnd] whileFalse: [collec add: (stream upTo: aChar)].
	stream close.
	^collec
]

{ #category : 'utilities - mathematics' }
Cormas class >> standardDeviation: aCollectionOfNumbers [
	"Purpose : Returns the standardDeviation of set of numbers. Measure of the dispersal of a series with regard to their average. Its value is obtained by calculating the square root of the variance (see ''variance:').
Argument: aCollectionOfNumbers = < OrderedCollection> or <Array>
Example:		Cormas standardDeviation: #( 1 2 3)	=> 0.816497"
	
	^(self variance: aCollectionOfNumbers) sqrt
]

{ #category : 'utilities - string' }
Cormas class >> stringAsObjectType: aString [
	"Pupose: convert aString into a Number, a Boolean, a Symbol, or a String depending of the content.
Examples: 
	Cormas stringAsType: '12.3' => 12.3   or '12,3' => 12.3
	Cormas stringAsType: 'true' => true
	Cormas stringAsType: '#truc' => #truc
	Cormas stringAsType: 'abc' => 'abc' "
	
	aString isEmpty ifTrue: [^nil].
	(aString allSatisfy: [:elem | elem isDigit or: [elem = $.]])
		ifTrue: [^aString asNumber].
	aString first = $#
		ifTrue: [^(self removeFirstCharacterOfString: aString) asSymbol].
	aString = 'true' ifTrue: [^true].
	aString = 'false' ifTrue: [^false].
	(aString allSatisfy: [:elem | elem isDigit or: [elem = $,]])
		ifTrue: [^(aString copyReplaceAll: ',' with: '.') asNumber].
	^aString
]

{ #category : 'utilities - mathematics' }
Cormas class >> sum: aCollectionOfNumbers [
	"Purpose: Answer the summation of a set of numbers. 
	Argument: aCollectionOfNumbers = < OrderedCollection> or <Array>
	Example: Cormas sum: #( 1 2 3)	=> 6"

	^ aCollectionOfNumbers sum
]

{ #category : 'utilities - string' }
Cormas class >> textAsList: aText [
	"Purpose: Returns a list of strings corresponding to each line of a given text.
Examples: Cormas textAsList: 'Hello world\Bonjour le monde\Bom dia Mundo\Buenos Dias Mundo' withCRs
Cormas textAsList:'Hello world
Bonjour le monde
		Bom dia Mundo
Buenos Dias Mundo' withCRs "
	
	| stream list |
	list := OrderedCollection new.
	stream := ReadStream on: aText asString.
	[stream atEnd] whileFalse: [list add: (stream upTo: Character cr)].
	stream close.
	^list
]

{ #category : 'utilities - mathematics' }
Cormas class >> transposeMatrix: aCollectionOfCollections [
	"Return a transposed collection Of Collections.
Ex:
| collA |
	collA := OrderedCollection new.
	7 timesRepeat:[
	collA add: ( OrderedCollection withAll: #( 1 2 3 4 5))].
	collA inspect.
	(Cormas transposeMatrix: collA) inspect    "
	
	| coll2 line2 max |
	"complete irregular lines to get a full matrix"
	max := 0.
	aCollectionOfCollections
		do: [:lineColl | lineColl size > max ifTrue: [max := lineColl size]].
	aCollectionOfCollections
		do: [:lineColl | [lineColl size < max] whileTrue: [lineColl add: nil]].	"transpose"
	coll2 := OrderedCollection new.
	1
		to: aCollectionOfCollections first size
		do:
			[:col | 
			line2 := OrderedCollection new.
			1
				to: aCollectionOfCollections size
				do:
					[:ligne | line2 add: ((aCollectionOfCollections at: ligne) at: col)].
			coll2 add: line2].
	^coll2
]

{ #category : 'deprecated' }
Cormas class >> updateFile: t1 dataCollection: t2 separator: t3 [
	"Deprecated. Should use CormasModel updateFile: t1 dataCollection: t2 separator: t3"
	
	| t4 t5 t6 t7 |
	t5 := t3 asSymbol asString.
	t4 := t1 appendStream.
	t6 := 1.
	t7 := t2 size - 1.
	[t6 <= t7]
		whileTrue:
			[t4 nextPutAll: (t2 at: t6) printString , t5.
			t6 := t6 + 1].
	t4 nextPutAll: t2 last printString.
	t4 nextPutAll: '\' withCRs.
	t4 close.
	^self
]

{ #category : 'utilities - string' }
Cormas class >> upperCaseFirstChar: aString [
	"Purpose: Converts the first character of of a string into uppercase
Example: Cormas upperCaseFirstChar: 'hello World'  => 'Hello World'  "
	
	^aString capitalized
]

{ #category : 'utilities - string' }
Cormas class >> upperCaseString: aString [
	"Purpose: Converts all lowercase characters of a string into uppercase characters
Example: Cormas upperCaseString: 'Hello World'   "
	
	| ws |
	ws := WriteStream on: (aString species new: aString size).
	1
		to: aString size
		do:
			[:i | 
			| c |
			c := aString at: i.
			ws
				nextPut:
					(c isLowercase
						ifFalse: [c]
						ifTrue: [c asUppercase])].
	^ws contents
]

{ #category : 'utilities - mathematics' }
Cormas class >> upperQuartile: aCollectionOfNumbers [
	"Purpose : Returns the upper quartile of a numbers distribution. 
The upper quartile (or third quartile or Q3) is the value of the sorted series of numbers which splits the highest 25% of data (or lowest 75%)
For example, assume that we have obtained the following 20 observations:
   2, 4, 7, -20, 22, -1, 0, -1, 7, 15, 8, 4, -4, 11, 11, 12, 3, 12, 18, 1
In order to calculate the quartiles we first have to sort the observations:
   -20, -4, -1, -1, 0, 1, 2, 3, 4, 4, 7, 7, 8, 11, 11, 12, 12, 15, 18, 22
The position of the third quartile is x = 0.75*(20+1) = 15.75 
Example: Cormas upperQuartile: #(2 4 7 -20 22 -1 0 -1 7 15 8 4 -4 11 11 12 3 12 18 1)"

	| sortedColl |
	aCollectionOfNumbers size = 0
		ifTrue: [ ^ 0 ].
	sortedColl := aCollectionOfNumbers asSortedCollection: [ :a :b | a < b ].
	^ sortedColl at: (0.75 * ((sortedColl size) + 1)) rounded 
]

{ #category : 'utilities - value types' }
Cormas class >> valueFrom: anObjectOrMenuItemOrValueHolder [
	"return either the value of the argument if it is a MenuItem or a ValueHolder or the argument itself "
	
	^ anObjectOrMenuItemOrValueHolder
]

{ #category : 'utilities - mathematics' }
Cormas class >> variance: aCollectionOfNumbers [
	"Purpose: Returns the variance of set of numbers. Measure of the dispersal of a series with regard to their average. The dispersal of a statistical distribution is obtained by dividing the sum of the squares of the distances in the average by the number N from elements. For instance the average of 1, 2 and 3 is 2 , but the variance is 0,667.
	[(1 - 2)2 + (2 - 2)2 + (3 - 2)2] √∑ 3 = 0,667
Argument: aCollectionOfNumbers = < OrderedCollection> or <Array>
Example: Cormas variance: #( 1 2 3)		=> 0.666667  "

	| moy |
	aCollectionOfNumbers size = 0
		ifTrue: [ ^ 0 ].
	moy := self average: aCollectionOfNumbers.
	^ ((aCollectionOfNumbers inject: 0 into: [ :subTotal :next | subTotal + (next - moy) squared ])
		/ aCollectionOfNumbers size) asFloat
]

{ #category : 'accessing' }
Cormas >> cormasModel [
	
	^cormasModel
]

{ #category : 'accessing' }
Cormas >> cormasModel: aCormasModel [
	"set the new simulation and give a reference to cormas"

	cormasModel := aCormasModel.
	aCormasModel ifNil: [ ^ nil ].
	aCormasModel cormas: self
]

{ #category : 'aspects' }
Cormas >> cycle [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^cycle isNil
		ifTrue: [cycle := 0 asValue]
		ifFalse: [cycle]
]

{ #category : 'accessing' }
Cormas >> exportPlaybackLog [
	
	^exportPlaybackLog ifNil: [exportPlaybackLog := false]
]

{ #category : 'accessing' }
Cormas >> exportPlaybackLog: anObject [
	
	exportPlaybackLog := anObject
]

{ #category : 'model entities' }
Cormas >> getSelectedEntityClassType: aType [
	"aType is either 'Spatial', 'Social' or 'Passive'"
	
	| aName selectionInList |
	selectionInList := self perform: ('list' , aType , 'Entities') asSymbol.
	aName := (Cormas dropBlanksFromString: selectionInList selection) asSymbol.
	^aName notNil
		ifTrue: [self cormasModelClass environment at: aName]
		ifFalse: [nil]
]

{ #category : 'util' }
Cormas >> inheritedMethodsFrom: aClass category: aCat [
	"Retourne la liste des methodes des superclasses de aClass 
	sauf celles de Object"
	"Inutile avec cormas2000"
	
	| aList tmp |
	aList := OrderedCollection new.
	aClass allSuperclasses
		do:
			[:uneClasse | 
			tmp := uneClasse organization listAtCategoryNamed: aCat.
			1
				to: tmp size
				do:
					[:i | 
					tmp
						at: i
						put: (tmp at: i) asString , ' (' , uneClasse name asString , ')'].
			aList addAll: tmp].
	^aList
]

{ #category : 'initialization' }
Cormas >> initialize [

	super initialize.
	self class current: self.
	"self menuHolder: self class mainMenu asValue.
	self defineObservation value: #openPovSetterGUI.
	self defineObservation onChangeSend: #defObservationChanged to: self.
	self listSocialEntities selectionIndexHolder onChangeSend:
			#listAgentsChanged to: self.
	self listSpatialEntities selectionIndexHolder onChangeSend:
			#listEntitesSpatialesChanged to: self.
	self listPassiveEntities selectionIndexHolder onChangeSend:
			#listEntitesPassivesChanged to: self."
	cycle ifNotNil: [ cycle := NewValueHolder value: 0 ]
]

{ #category : 'accessing' }
Cormas >> isChangesDelayed [
	
	^isChangesDelayed ifNil: [isChangesDelayed := false]
]

{ #category : 'accessing' }
Cormas >> isChangesDelayed: aBoolean [
	
	isChangesDelayed := aBoolean.

]

{ #category : 'changed' }
Cormas >> listMethodsChanged [
	"some methods has changed. Propagate the changed to the spaceModel for its spaceInterfaces.
	(added while removing spaceInterfaces"
	
	self spaceModel ifNotNil: [:sm | sm listMethodsChanged]
]

{ #category : 'simulation' }
Cormas >> logLeaveOf: anAgentLocation from: srcSpatialEntity [
	"Log the disparition of an agent from a spatial entity"
	
	self useExternalVisualization
		ifTrue:
			[xmlModel sendLeaveToExternalVisualizerOf: anAgentLocation from:
					srcSpatialEntity].
	self exportPlaybackLog
		ifTrue:
			[xmlModel writeLeaveToPlaybackLogOf: anAgentLocation from: srcSpatialEntity]
]

{ #category : 'simulation' }
Cormas >> logMovementOf: anAgentLocation from: srcSpatialEntity to: dstSpatialEntity [
	"Log the movement of an agent from a spatial entity to another entity"
	
	useExternalVisualization
		ifTrue:
			[xmlModel sendMoveToExternalVisualizerOf: anAgentLocation from:
					srcSpatialEntity to: dstSpatialEntity].
	exportPlaybackLog
		ifTrue:
			[xmlModel writeMoveToPlaybackLogOf: anAgentLocation from: srcSpatialEntity
				to: dstSpatialEntity]
]

{ #category : 'user messages' }
Cormas >> openedSpatialGridsForHabitus: aString [
	
	^self cormasModel openedSpatialGridsForHabitus: aString
]

{ #category : 'accessing' }
Cormas >> process [
	
	^process
]

{ #category : 'accessing' }
Cormas >> process: aProcess [
	process := aProcess
]

{ #category : 'simulation' }
Cormas >> replayRunForward [
	"Replay the stored simulation history forward using BOS file"

	^ self simulationManager replayRunForward
]

{ #category : 'simulation' }
Cormas >> replayStepForward [
	"Replay a step forward using BOS file"

	^ self simulationManager replayStepForward
]

{ #category : 'main menu' }
Cormas >> resetSimulation [
	
	self cycle value: 0.
	self stepCounter value: 0
]

{ #category : 'simulation' }
Cormas >> runBack [
	"Perform a run back to 0 using BOS file"

	^ self simulationManager runBack
]

{ #category : 'model scheduling' }
Cormas >> runButtonLabel: aString [
	"(self builder componentAt: #runButton) isNil ifFalse:[(self builder componentAt: #runButton) labelString: aString]."
	
	(self builder componentAt: #runButton) isNil
		ifFalse: [(self builder componentAt: #runButton) labelString: aString]
]

{ #category : 'model scheduling' }
Cormas >> runButtonPause [
	"(self builder componentAt: #runButton) isNil ifFalse:[(self builder componentAt: #runButton) labelString: aString]."
	
	(self builder componentAt: #runButton) isNil
		ifFalse: [(self builder componentAt: #runButton) label: Cormas pauseIcon]
]

{ #category : 'model scheduling' }
Cormas >> runButtonRun [
	"(self builder componentAt: #runButton) isNil ifFalse:[(self builder componentAt: #runButton) labelString: aString]."
	
	(self builder componentAt: #runButton) isNil
		ifFalse: [(self builder componentAt: #runButton) label: Cormas runIcon]
]

{ #category : 'interface actions' }
Cormas >> setStepMethod [
	"Open a #step methods chooser, in order for the user to change the #step operation that is called at each time step"
	
	^self simulationManager setStepMethod
]

{ #category : 'accessing' }
Cormas >> simulationManager [
	
	^self cormasModel simulationManager
]

{ #category : 'accessing' }
Cormas >> spaceModel [
	
	^self cormasModel ifNotNil: [:sim | sim spaceModel]
]

{ #category : 'simulation' }
Cormas >> stepBack [
	"Perform a step back using BOS file"

	^ self simulationManager stepBack
]

{ #category : 'model saving&loading POV' }
Cormas >> symbolNameOfSelector: selector [
	
	| stream |
	stream := selector readStream.
	stream upTo: $_.
	^stream upToEnd asSymbol
]

{ #category : 'accessing' }
Cormas >> useExternalVisualization [
	
	^useExternalVisualization ifNil: [useExternalVisualization := false]
]

{ #category : 'accessing' }
Cormas >> useExternalVisualization: anObject [
	
	useExternalVisualization := anObject
]

{ #category : 'user messages' }
Cormas >> warn: aString [
	self error: aString
]
