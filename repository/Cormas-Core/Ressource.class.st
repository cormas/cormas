Class {
	#name : #Ressource,
	#superclass : #Object,
	#instVars : [
		'symbol',
		'donnee',
		'proprietaire'
	],
	#category : 'Cormas-Core-Tools'
}

{ #category : #'instance-creation' }
Ressource class >> new [
	
	^super new initialize
]

{ #category : #acces }
Ressource >> donnee [
	
	^donnee
]

{ #category : #acces }
Ressource >> editFor: unObjet [
	"Specif : unObjet doit etre le proprietaire pour modifier l'Entree Sortie"
	
	
]

{ #category : #'initialize-release' }
Ressource >> initialize [
	
	^self
]

{ #category : #fichier }
Ressource >> pourChargement: unObjet [
	
	proprietaire := unObjet
]

{ #category : #fichier }
Ressource >> pourSauvegarde [
	
	proprietaire := nil
]

{ #category : #acces }
Ressource >> printOn: aStream [
	
	aStream nextPutAll: symbol
]

{ #category : #acces }
Ressource >> proprietaire: unObjet [
	
	proprietaire := unObjet
]

{ #category : #acces }
Ressource >> readFrom: unCommeMoi [
	
	symbol isNil ifTrue: [symbol := unCommeMoi symbol].
	donnee := unCommeMoi donnee
]

{ #category : #acces }
Ressource >> symbol [
	
	^symbol
]

{ #category : #acces }
Ressource >> symbol: unS [
	
	symbol := unS
]
