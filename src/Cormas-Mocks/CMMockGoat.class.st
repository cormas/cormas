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
	^ CMChart new
		  title: 'Energy distribution';
		  add: (CMHistogramSeries new
				   x: #energy ofAll: CMMockAnimal;
				   atShownStep;
				   yourself);
		  yourself
]
