Class {
	#name : 'CMModelOpenerSimulateCommand',
	#superclass : 'CMModelOpenerCommand',
	#category : 'Cormas-UI-Commands',
	#package : 'Cormas-UI-Commands'
}

{ #category : 'accessing' }
CMModelOpenerSimulateCommand >> action [

	| presenter |
	presenter:=  CMSimulationPresenter
		forModelClass: owner selectedModelClass
		translator: translator.
			
	presenter open.
	presenter window centered.
	owner window close
]

{ #category : 'accessing' }
CMModelOpenerSimulateCommand >> icon [ 

	^ CMIcons runIcon
]

{ #category : 'accessing' }
CMModelOpenerSimulateCommand >> name [

	^ translator tOpenSimulation
]
