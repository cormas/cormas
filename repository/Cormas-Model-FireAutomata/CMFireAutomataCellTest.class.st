Class {
	#name : #CMFireAutomataCellTest,
	#superclass : #TestCase,
	#category : #'Cormas-Model-FireAutomata-Tests'
}

{ #category : #tests }
CMFireAutomataCellTest >> testShortName [
	self assert: CMFireAutomataCell shortName equals: 'Cell'
]
