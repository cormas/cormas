Class {
	#name : #CMSaveToCsvCommandTest,
	#superclass : #TestCase,
	#instVars : [
		'saveToCsvCommand',
		'owner'
	],
	#category : 'Cormas-UI-Tests'
}

{ #category : #tests }
CMSaveToCsvCommandTest >> setUp [
    super setUp.
    
    saveToCsvCommand := CMSaveToCsvCommand new.
    
    owner := TestOwner new.
    saveToCsvCommand owner: owner.

]

{ #category : #tests }
CMSaveToCsvCommandTest >> testSaveDataToFile [
	
	| testData fileReference |
	
		testData := {
		{'Oleksandr'. '26'}.
		{'Avinash'. '20'}.
		}.
	
	testData first class compile: 'keys ^ #(''Name'' ''Age'')'.
	testData second class compile: 'keys ^ #(''Name'' ''Age'')'.
	
	owner data: testData.
	
	fileReference := FileLocator temp / 'test.csv'.
	
	saveToCsvCommand saveDataToFile: fileReference.
	
	self assert: fileReference exists.
	fileReference delete.

]

{ #category : #tests }
CMSaveToCsvCommandTest >> testSaveEmptyDataToFile [
    | fileReference |
    owner data: #().
    
    fileReference := FileLocator temp / 'empty_test.csv'.
    
    saveToCsvCommand saveDataToFile: fileReference.
    
    self deny: fileReference exists.

]

{ #category : #tests }
CMSaveToCsvCommandTest >> testSaveNilDataToFile [
    | fileReference |
    owner data: nil.
    
    fileReference := FileLocator temp / 'nil_test.csv'.
    
    saveToCsvCommand saveDataToFile: fileReference.
    
    self deny: fileReference exists.

]
