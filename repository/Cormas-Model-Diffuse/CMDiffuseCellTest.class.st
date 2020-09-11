Class {
	#name : #CMDiffuseCellTest,
	#superclass : #TestCase,
	#category : #'Cormas-Model-Diffuse-Tests'
}

{ #category : #tests }
CMDiffuseCellTest >> testEntityName [
	self assert: CMDiffuseCell entityName equals: 'Cell'
]
