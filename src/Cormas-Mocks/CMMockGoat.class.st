Class {
	#name : 'CMMockGoat',
	#superclass : 'CMMockAnimal',
	#category : 'Cormas-Mocks',
	#package : 'Cormas-Mocks'
}

{ #category : 'aspects' }
CMMockGoat >> aspectDefault: look [

	<aspect>
	super aspectDefault: look.
	look color: Color blue
]

{ #category : 'aspects' }
CMMockGoat >> aspectHorns: look [

	<aspect>
	look shape: #triangle
]

{ #category : 'charts' }
CMMockGoat >> chartEnergyDistribution [
	"How is the energy spread among the animals?"

	<chart>
	^ CMHistogram new
		  title: 'Energy distribution';
		  bars: #energy ofAll: CMMockAnimal;
		  yourself
]
