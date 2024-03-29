Class {
	#name : #CMClassAttributeValueAnalysisDistribution,
	#superclass : #CMClassAttributeValueAnalysis,
	#instVars : [
		'distributionList'
	],
	#category : #'Cormas-UI-Spec1-Attributes'
}

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
