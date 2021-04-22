"
plop
"
Class {
	#name : #CormasOpenMoleTest,
	#superclass : #TestCase,
	#category : #'Cormas-Tests-Model'
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
CormasOpenMoleTest >> testlastDataOfModel [
	| dicoGlobals model d t |
	model := CMAbstractModel new.
	dicoGlobals := Dictionary new.
	dicoGlobals at: #probe1 put: #(10 20 58 96 48 76 57 68 19 1).
	dicoGlobals at: #probe2 put: #(0 20 58 96 48 76 57 68 19 22).
	model data at: model class name put: dicoGlobals.
	"use function"
	d := CMOpenMoleExchange lastDataOfModel: model.
	"create a dictionnay to complet"
	t := Dictionary new.
	t at: #probe1 put: 1.
	t at: #probe2 put: 22.
	self assert: d equals: t
]
