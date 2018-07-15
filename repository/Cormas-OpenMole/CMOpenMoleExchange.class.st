"
OpenMole is a free and open-source platform. It explores, diagnoses your numerical model and optimizes its dynamics, taking advantage of distributed computing environments. The typical usages are model calibration, model exploration, machine learning, optimization, data processing. 
 You can embed cormas simulation models with openMole workflow. Cormas within openMole use docker. You in order to interact with cormas docker openMole will generate a JSON file with configuration profile. In exchange model results are asked in JSON file to.
 
"
Class {
	#name : #CMOpenMoleExchange,
	#superclass : #Object,
	#category : 'Cormas-OpenMole'
}

{ #category : #utilities }
CMOpenMoleExchange class >> lastValuesOfVariables: aDictionnary [
	"a Dictionnary is a dictionnary formatted by CORMAS with name of the class containing a dictionnary of keys"

	"representing values, containing collection"

	"This is a really bad conception and we need to replace all of this by DataFrame later :-)"

	| d r |
	d := Dictionary new.
	(aDictionnary at: self name) keysAndValuesDo: [ :k :v | d at: k put: v last ].
	r := Dictionary new.
	r at: self name asSymbol put: d.
	^ r
]

{ #category : #accesing }
CMOpenMoleExchange class >> loadJSONFile: theJSONFile [
	"OpenMole send a .json file. With this method you can read it. You pass in argument the name of JSON file"

	| wd myData |
	wd := FileSystem disk workingDirectory.
	myData := NeoJSONReader
		fromString: (wd / theJSONFile readStreamDo: [ :stream | stream contents ]).
	^ myData
]

{ #category : #accesing }
CMOpenMoleExchange class >> saveJSONFile: myDictionary [
	"OpenMole read  .json file. With this method you can write a JSONfile from a dictonary"

	| wd |
	wd := FileSystem disk workingDirectory.
	(wd / 'output.json') asFileReference
		writeStreamDo: [ :stream | 
			(NeoJSONWriter on: stream)
				prettyPrint: true;
				nextPut: myDictionary ]
]
