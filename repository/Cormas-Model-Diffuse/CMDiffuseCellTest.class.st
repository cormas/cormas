Class {
	#name : #CMDiffuseCellTest,
	#superclass : #TestCase,
	#category : #'Cormas-Model-Diffuse-Tests'
}

{ #category : #tests }
CMDiffuseCellTest >> testShortName [
	self assert: CMDiffuseCell shortName equals: 'Cell'
]
