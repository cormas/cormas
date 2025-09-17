Class {
	#name : 'CMClyPackageCommand',
	#superclass : 'CmdCommand',
	#instVars : [
		'package'
	],
	#category : 'Cormas-Core-Calypso',
	#package : 'Cormas-Core',
	#tag : 'Calypso'
}

{ #category : 'testing' }
CMClyPackageCommand class >> canBeExecutedInContext: aContext [

	^ aContext lastSelectedPackage classes anySatisfy: [ :aClass |
		aClass isCormasModelClass ]
]

{ #category : 'execution' }
CMClyPackageCommand >> prepareFullExecutionInContext: aToolContext [

	super prepareFullExecutionInContext: aToolContext.
	package := aToolContext lastSelectedPackage
]
