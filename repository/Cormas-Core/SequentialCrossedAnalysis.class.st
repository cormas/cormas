"
SequentialCrossedAnalysis allows to conduct Crossed sensitivity analysis by modifying parameters' values. The parameters' values are crossed during analysis. 
Each studied parameter may be analysed by changing its initial value for each simulation run. Sequential means that this parameter will change its value from an InitialValue to a FinalValue by Increment (or step).



"
Class {
	#name : #SequentialCrossedAnalysis,
	#superclass : #CrossedSensitivity,
	#category : #'Cormas-Core-Analysis'
}

{ #category : #help }
SequentialCrossedAnalysis class >> asText [
	
	^'Sequential Crossed Analysis' asText
]

{ #category : #help }
SequentialCrossedAnalysis >> mainHelpText [
	
	| text |
	text := super mainHelpText.
	text := text , '\Each parameter can be modified from a '.
	text := text
		,
			('Start value' asText emphasizeAllWith:
					#(#bold #italic #color #-> #ColorValue #red)).
	text := text , ' to a '.
	text := text
		,
			('Final value' asText emphasizeAllWith:
					#(#bold #italic #color #-> #ColorValue #red)).
	text := text , '. For each simulation, its value is increased by '.
	text := text
		,
			('Increment' asText emphasizeAllWith:
					#(#bold #italic #color #-> #ColorValue #red)).
	text := text ,
			'.\Thus, for 2 parameters, let''s say 
		X (initValue: 1 ; finalValue: 3 ; increment: 1) and 
		Y (initValue: 0 ; finalValue: 1 ; increment: 0.1), 
then 30 simulations (3 x 10) will be runned.'.
	text := text ,
			'.\Of course, for each set of parameters'' values, N simulations can be repeated.'.
	text := text ,
			'\The selected probes are stored as time series or/and the mean values (according to Record as:).\'.
	^text
]

{ #category : #save }
SequentialCrossedAnalysis >> saveSettingsOnFile: aCSVfile [
	"Save the content of the 'Parameters windows' on aCSVfile.
exports the class name, the attributes names and default values, and the list of values into a CSV file"
	
	| stream |
	super saveSettingsOnFile: aCSVfile.
	stream := aCSVfile appendStream.
	stream nextPutAll: 'Class'.
	stream nextPutAll: DataSaver_Asci separatorAsString.
	stream nextPutAll: 'Attribute'.
	stream nextPutAll: DataSaver_Asci separatorAsString.
	stream nextPutAll: 'Default Value'.
	stream nextPutAll: DataSaver_Asci separatorAsString.
	stream nextPutAll: 'Initial Value'.
	stream nextPutAll: DataSaver_Asci separatorAsString.
	stream nextPutAll: 'Final Value'.
	stream nextPutAll: DataSaver_Asci separatorAsString.
	stream nextPutAll: 'Increment Value'.
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
			stream nextPutAll: defAttrib step printString.
			stream nextPutAll: DataSaver_Asci separatorAsString.
			stream nextPutAll: '\' withCRs].
	stream close
]

{ #category : #save }
SequentialCrossedAnalysis >> setCAVfrom: fileContent [
	
	| aCAV |
	self classAttribValue_List list
		do:
			[:cav | 
			cav initValue: nil.
			cav finalValue: nil.
			cav step: nil.
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
					aCAV step: (line at: 6)]]
]
