Class {
	#name : #VueObs,
	#superclass : #Object,
	#instVars : [
		'zone',
		'acces'
	],
	#category : 'Cormas-Core-Observer'
}

{ #category : #'affichage prive' }
VueObs >> displayOn: aGC [
	
	zone := self bounds.
	acces Cadre: self bounds.
	self model displayOn: aGC
]

{ #category : #initialize }
VueObs >> initialize [
	
	super initialize.
	zone := self bounds.
	acces := AgentObs new
]

{ #category : #update }
VueObs >> update: unS with: unO [
	"	unS == #Model ifTrue: [	self model displayOn: self graphicsContext]"
	
	
]
