Class {
	#name : 'CMClyPackageCommand',
	#superclass : 'CmdCommand',
	#instVars : [
		'package'
	],
	#category : 'Cormas-Core-Helpers',
	#package : 'Cormas-Core',
	#tag : 'Helpers'
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
