"
MonteCarloCrossedAnalysis. Bon, √ßa me parait pas terrible un Monte Carlo crois√©... (?)
J'ai supprim√© du Menu de Cormas pour le moment

"
Class {
	#name : #MonteCarloCrossedAnalysis,
	#superclass : #CrossedSensitivity,
	#category : #'Cormas-Core-Analysis'
}

{ #category : #save }
MonteCarloCrossedAnalysis >> saveSettingsOnFile: aCSVfile [
	"Save the content of the 'Parameters windows' on aCSVfile.
exports the class name, the attributes names and the values into a CSV file"
	
	| stream |
	super saveSettingsOnFile: aCSVfile.
	stream := aCSVfile appendStream.
	stream nextPutAll: 'Class'.
	stream nextPutAll: DataSaver_Asci separatorAsString.
	stream nextPutAll: 'Attribute'.
	stream nextPutAll: DataSaver_Asci separatorAsString.
	stream nextPutAll: 'Default Value'.
	stream nextPutAll: DataSaver_Asci separatorAsString.
	stream nextPutAll: 'Min Value'.
	stream nextPutAll: DataSaver_Asci separatorAsString.
	stream nextPutAll: 'Max Value'.
	stream nextPutAll: DataSaver_Asci separatorAsString.
	stream nextPutAll: 'Random type'.
	stream nextPutAll: DataSaver_Asci separatorAsString.
	stream nextPutAll: 'Repetitions'.
	stream nextPutAll: DataSaver_Asci separatorAsString.
	stream nextPutAll: '\' withCRs.
	self classAttribValueAnalysis_List list
		do:
			[:defAttrib | 
			stream nextPutAll: defAttrib targetClass name.
			stream nextPutAll: DataSaver_Asci separatorAsString.
			stream nextPutAll: defAttrib targetAttribute asString.
			stream nextPutAll: DataSaver_Asci separatorAsString.
			stream nextPutAll: defAttrib currentValue printString.
			stream nextPutAll: DataSaver_Asci separatorAsString.
			stream nextPutAll: defAttrib initValue printString.
			stream nextPutAll: DataSaver_Asci separatorAsString.
			stream nextPutAll: defAttrib finalValue printString.
			stream nextPutAll: DataSaver_Asci separatorAsString.
			defAttrib randomType isNil
				ifTrue: [stream nextPutAll: 'random']
				ifFalse: [stream nextPutAll: defAttrib randomType asString].
			stream nextPutAll: DataSaver_Asci separatorAsString.
			stream nextPutAll: defAttrib repetitions printString.
			stream nextPutAll: DataSaver_Asci separatorAsString.
			stream nextPutAll: '\' withCRs].
	stream close
]

{ #category : #save }
MonteCarloCrossedAnalysis >> setCAVfrom: fileContent [
	
	| aCAV |
	self classAttribValue_List list
		do:
			[:cav | 
			cav initValue: nil.
			cav finalValue: nil.
			cav randomType: nil.
			cav repetitions: nil.
			cav hasBeenModified: false].
	fileContent
		do:
			[:line | 
			aCAV := self classAttribValue_List list
				detect:
					[:cav | 
					cav targetClass name asString = line first
						and: [cav targetAttribute asString = (line at: 2)]]
				ifNone: [nil].
			aCAV isNil
				ifFalse:
					[aCAV currentValueAsString: (line at: 3).
					aCAV initValue: (line at: 4).
					aCAV finalValue: (line at: 5).
					aCAV randomType: (line at: 6).
					aCAV repetitions: (line at: 7)]]
]
