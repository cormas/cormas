Class {
	#name : #CMClassAttributeValueAnalysisDistribution,
	#superclass : #CMClassAttributeValueAnalysis,
	#instVars : [
		'distributionList'
	],
	#category : #'Cormas-UI-Attributes'
}

{ #category : #accessing }
CMClassAttributeValueAnalysisDistribution >> convertStringAsList: aString [
	"ex: 'List (1 2 5)'  --> "
	
	| arrayOfSubstrings list nb newString |
	newString := aString copyReplaceAll: '(' with: ''.
	newString := newString copyReplaceAll: ')' with: ''.
	(newString includes: $;)
		ifTrue:
			[newString := newString copyReplaceAll: ' ' with: ''.
			arrayOfSubstrings := newString asArrayOfSubstringsSeparatedBy: $;]
		ifFalse: [arrayOfSubstrings := newString asArrayOfSubstrings].
	list := List new.
	arrayOfSubstrings
		do:
			[:st | 
			nb := Cormas stringAsObjectType: st.
			nb cormasHelper isTypeNumber ifTrue: [list add: nb]].
	^list
]

{ #category : #accessing }
CMClassAttributeValueAnalysisDistribution >> distributionList [
	
	^distributionList
]

{ #category : #accessing }
CMClassAttributeValueAnalysisDistribution >> distributionList: aList [
	
	distributionList := aList.
	self hasBeenModified: aList isNil not
]

{ #category : #accessing }
CMClassAttributeValueAnalysisDistribution >> distributionListAsString [
	
	self distributionList ifNil: [^''].
	^self distributionList asString
]

{ #category : #accessing }
CMClassAttributeValueAnalysisDistribution >> distributionListAsString: aString [
	
	aString isNil
		ifTrue:
			[^self cormas warn:
					'UndefinedObject. Please use quote for a string (ex: ''newString'') '].
	(aString = 'nil' or: [aString = '' or: [aString = ' ']])
		ifTrue: [^self distributionList: nil].
	^self distributionList: (self convertStringAsList: aString)
]

{ #category : #accessing }
CMClassAttributeValueAnalysisDistribution >> finalValue [
	
	^self distributionList last
]

{ #category : #accessing }
CMClassAttributeValueAnalysisDistribution >> initValue [
	
	^self distributionList first
]

{ #category : #testing }
CMClassAttributeValueAnalysisDistribution >> isAnalysisDone [
	"answer if currentValue is upper than the final value"
	
	self currentValue isNil ifTrue: [^false].
	^self currentValue = self distributionList last
]

{ #category : #controlling }
CMClassAttributeValueAnalysisDistribution >> nbOfSims [
	"return the number of simulations for the analysis of this attribute, WITHOUT multiplying by the repeat number for each parameters set.
"
	
	^self distributionList size
]

{ #category : #controlling }
CMClassAttributeValueAnalysisDistribution >> reset [
	
	super reset.
	distributionList := nil
]

{ #category : #controlling }
CMClassAttributeValueAnalysisDistribution >> setNextValue [
	"This method calculates the new value of a parameter."
	
	self currentValue ifNil: [^self currentValue: self distributionList first].
	self isAnalysisDone ifTrue: [^nil].
	self
		currentValue:
			(self distributionList
				at: (self distributionList indexOf: self currentValue) + 1)
]
