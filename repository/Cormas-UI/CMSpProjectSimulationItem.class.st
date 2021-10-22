Class {
	#name : #CMSpProjectSimulationItem,
	#superclass : #CMSpProjectItem,
	#category : #'Cormas-UI-Spec2-ProjectBrowser'
}

{ #category : #accessing }
CMSpProjectSimulationItem class >> icon [

	^ self iconNamed: #simulation
]

{ #category : #accessing }
CMSpProjectSimulationItem class >> label [

	^ 'Simulation'
]
