"
plop
"
Class {
	#name : #CormasOpenMoleTest,
	#superclass : #TestCase,
	#category : 'Cormas-Tests'
}

{ #category : #examples }
CormasOpenMoleTest class >> createInJSONFile [
	"Create a JSON file for example 8"

	| stream |
	stream := FileStream forceNewFileNamed: 'input.json'.
	stream nextPutAll: self inJSON.
	stream close
]

{ #category : #examples }
CormasOpenMoleTest class >> inJSON [
	"Use in example8"

	^ '{
    "numberOfFires": 3,
	"numberOfFiremen": 20,
	"percentageOfTrees": 0.65,
	"dimensionMin": 60, 
	"dimensionMax": 80
}
'
]

{ #category : #test }
CormasOpenMoleTest >> testLoadJSONFile [
	| conf verif |
	CormasOpenMoleTest createInJSONFile.	"create a json file"
	conf := CMOpenMoleExchange loadJSONFile: 'input.json'.
	verif := Dictionary
		newFrom:
			{('dimensionMax' -> 80).
			('dimensionMin' -> 60).
			('numberOfFiremen' -> 20).
			('numberOfFires' -> 3).
			('percentageOfTrees' -> 0.65)}.
	self assert: (conf at: #dimensionMax) == (verif at: #dimensionMax)
]

{ #category : #test }
CormasOpenMoleTest >> testlastDataOfModel [
	| dicoGlobals aModel d t|
	aModel := CMECECModel new.
	dicoGlobals := Dictionary new.
	dicoGlobals at: #probe1 put: #(10 20 58 96 48 76 57 68 19 1).
	dicoGlobals at: #probe2 put: #(0 20 58 96 48 76 57 68 19 22).
	aModel data at: (aModel class name) put: dicoGlobals.
	"use function"
	d := CMOpenMoleExchange lastDataOfModel: aModel.
	"create a dictionnay to complet"
	t := Dictionary new.
	t at: #probe1 put: 1.
	t at: #probe2 put: 22.
	self assert: d equals: t
]
