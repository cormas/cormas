Class {
	#name : #CMFireAutomataCellTest,
	#superclass : #TestCase,
	#category : #'Cormas-Model-FireAutomata-Tests'
}

{ #category : #tests }
CMFireAutomataCellTest >> testEntityName [
	self assert: CMFireAutomataCell entityName equals: 'Cell'
]
