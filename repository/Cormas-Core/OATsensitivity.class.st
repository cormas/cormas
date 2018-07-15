"
OATsensitivity allows to conduct OAT (""One-Factor-At-A-Time"") sensitivity analysis by modifying parameters' values. It means that the parameter sets are not crossed during analysis.

"
Class {
	#name : #OATsensitivity,
	#superclass : #SensitivitySetter,
	#category : 'Cormas-Core-Others'
}

{ #category : #accessing }
OATsensitivity >> defaultDirectoryName [
	
	^'SensitivityOAT_'
]

{ #category : #setParameters }
OATsensitivity >> getNextAnalysedAttribute [
	"Get the next analysed attribute from parametersToAnalyse"
	
	| i newCAV |
	self currentAnalysedAttribute isAnalysisDone
		ifTrue:
			[self setDefaultValue: self currentAnalysedAttribute.
			i := self parametersToAnalyse indexOf: self currentAnalysedAttribute.
			i = self parametersToAnalyse size ifTrue: [^nil].
			newCAV := self parametersToAnalyse at: i + 1.
			newCAV currentValue: nil.
			^newCAV].
	^self currentAnalysedAttribute
]

{ #category : #testing }
OATsensitivity >> isCrossedAnalysis [
	
	^false
]

{ #category : #help }
OATsensitivity >> mainHelpText [
	"
	text := 'Purpose for Monte Carlo OAT Analysis: \ \' withCRs asText emphasizeAllWith: #bold.
	 text := text , 'The ' asText.
	 text := text , ('OAT (''One-Factor-At-A-Time'') analysis ' asText emphasizeAllWith: #(#bold #italic #color -> ColorValue red)).
	 text := text , 'is usefull for the study of the signature of the model parameters.\' asText.
	 text := text , 'It allows to conduct One factor At a Time sensitivity analysis by modifying parameters'' values. It means that the parameter sets are not crossed during analysis. 
Each studied parameter may be analysed by changing its initial value for each simulation run.\\' asText."
	
	| text |
	text := super mainHelpText.
	text := text , 'The ' asText.
	text := text
		,
			('OAT (''One-Factor-At-A-Time'') analysis ' asText emphasizeAllWith:
					#(#bold #italic #color #-> #ColorValue #red)).
	text := text
		,
			'is usefull for the study of the signature of the model parameters.\'
				asText.
	text := text
		,
			'It allows to conduct One factor At a Time sensitivity analysis by modifying parameters'' values. It means that the parameter sets are not crossed during analysis. 
Each studied parameter may be analysed by changing its initial value for each simulation run.\\'
				asText.
	text := text
		, 'The OAT (One factor At a Time) analysis is usefull for ' asText.
	text := text
		,
			'the study of the signature of the model parameters.\-------------------------------------------------------------------------------------------\'
				withCRs asText.
	^text
]

{ #category : #setParameters }
OATsensitivity >> setNextAttributeValue [
	"Set the next value of the current analysed attribute. Then set all the attributes to their Initial values"
	
	self currentAnalysedAttribute: self getNextAnalysedAttribute.
	currentAnalysedAttribute ifNil: [^nil].
	self currentAnalysedAttribute setNextValue.
	self applyNewValues.	"refresh"
	self classAttribValueAnalysis_List list: self parametersToAnalyse
]
