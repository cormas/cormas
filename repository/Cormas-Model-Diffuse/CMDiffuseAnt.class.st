"
I'm an Ant in Diffuse model.
I diffuse hormons
"
Class {
	#name : #CMDiffuseAnt,
	#superclass : #CMAgentLocation,
	#classVars : [
		'CurrentId'
	],
	#category : #'Cormas-Model-Diffuse'
}

{ #category : #id }
CMDiffuseAnt class >> CurrentId [
	^ CurrentId isNil
		ifTrue: [ 0 ]
		ifFalse: [ CurrentId ]
]

{ #category : #id }
CMDiffuseAnt class >> CurrentId: arg1 [
	^ CurrentId := arg1
]

{ #category : #'pov symbols' }
CMDiffuseAnt class >> VectorialPOV_Ant [
	^ #(1.0 1.0 0.0 0.0 0.0 0.0 1 0.5 #center #(0 #@- 17 15 #@- 9 15 #@ 8 0 #@ 17  -15 #@ 9  -15 #@- 9 0 #@- 17))
]

{ #category : #'pov symbols' }
CMDiffuseAnt class >> VectorialPOV_ant [
	^ #(1.0 0.0 0.0 0.0 0.0 0.0 1 1 #center #( -1.74658 #@- 26.5929 10.1301 #@- 26.7143 23.4041 #@- 14.9357 5.93836 #@- 10.9286 24.1027 #@- 6.07143 8.73288 #@- 1.21429 23.4041 #@ 9.83571 1.74658 #@ 13.3571 21.3082 #@ 24.2857  -1.74658 #@ 22.95  -23.4041 #@ 24.2857  -6.63699 #@ 14.5714  -23.4041 #@ 8.5  -6.63699 #@- 1.21429  -24.8014 #@- 4.85714  -3.84247 #@- 12.1429  -26.8973 #@- 14.9357  -13.6233 #@- 26.7143  -1.74658 #@- 26.5929))
]

{ #category : #testing }
CMDiffuseAnt class >> isAbstract [
	^ false
]

{ #category : #init }
CMDiffuseAnt >> init [
	
]

{ #category : #init }
CMDiffuseAnt >> initId [
	self id: (self class CurrentId: self class CurrentId + 1)
]

{ #category : #control }
CMDiffuseAnt >> letHormon [
	self patch qty: 150
]

{ #category : #pov }
CMDiffuseAnt >> pov [
	^ #ant
]

{ #category : #control }
CMDiffuseAnt >> randomWalk [
	(self patch neighbourhood anySatisfy: [ :arg1 | arg1 qty > 60 ])
		ifTrue: [ self
				moveTo: (Cormas selectRandomlyFrom: (self patch layerOfRadius: 5)) ]
		ifFalse: [ super randomWalk ]
]

{ #category : #control }
CMDiffuseAnt >> step [
	self
		randomWalk;
		letHormon
]
