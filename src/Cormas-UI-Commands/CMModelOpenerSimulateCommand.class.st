Class {
	#name : 'CMModelOpenerSimulateCommand',
	#superclass : 'CMModelOpenerCommand',
	#category : 'Cormas-UI-Commands',
	#package : 'Cormas-UI-Commands'
}

{ #category : 'accessing' }
CMModelOpenerSimulateCommand class >> order [

	^ 1
]

{ #category : 'action' }
CMModelOpenerSimulateCommand >> action [

	| presenter |
	presenter:=  CMSimulationPresenter
		forModelClass: owner cormasModelClass
		translator: translator.
			
	presenter open.
	presenter window centered
]

{ #category : 'accessing' }
CMModelOpenerSimulateCommand >> icon [ 

	^ CMIcons runIcon
]

{ #category : 'testing' }
CMModelOpenerSimulateCommand >> isBigButton [

	^ true
]

{ #category : 'accessing' }
CMModelOpenerSimulateCommand >> name [

	^ 'Simulate'
]
