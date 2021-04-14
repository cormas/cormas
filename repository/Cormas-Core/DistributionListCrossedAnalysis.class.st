"
DistributionListCrossedAnalysis allows to conduct Crossed sensitivity analysis by modifying parameters' values simultaneously.
Each studied parameter may be analysed by changing its initial value for each simulation run. Distribution List means that this parameter will change its value from a given List defined by user.
"
Class {
	#name : #DistributionListCrossedAnalysis,
	#superclass : #CrossedSensitivity,
	#category : #'Cormas-Core-Analysis'
}

{ #category : #help }
DistributionListCrossedAnalysis class >> asText [
	
	^'Distribution List Crossed Analysis' asText
]

{ #category : #save }
DistributionListCrossedAnalysis >> saveSettingsOnFile: aCSVfile [
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
	stream nextPutAll: 'Distribution'.
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
			stream nextPutAll: defAttrib distributionListAsString.
			stream nextPutAll: DataSaver_Asci separatorAsString.
			stream nextPutAll: '\' withCRs].
	stream close
]

{ #category : #save }
DistributionListCrossedAnalysis >> setCAVfrom: fileContent [
	
	| aCAV |
	self classAttribValue_List list
		do:
			[:cav | 
			cav distributionList: nil.
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
					aCAV distributionListAsString: (line at: 4)]]
]
