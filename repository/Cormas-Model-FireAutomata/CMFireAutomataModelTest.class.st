Class {
	#name : #CMFireAutomataModelTest,
	#superclass : #CMTestObject,
	#category : #'Cormas-Model-FireAutomata-Tests'
}

{ #category : #'instance creation' }
CMFireAutomataModelTest >> newTestModel [ 

	^ (CMFireAutomataModel newWithActiveInit: #init58WithFire)
			initSimulation;
			yourself
]

{ #category : #tests }
CMFireAutomataModelTest >> testDominanceOfAModelIsLessThanOne [

	self model 
		createGridLines: 100
		columns: 100
		neighbourhood: 4
		closed: true.

	self assert: (self model dominance: #state) < 1.0
]

{ #category : #tests }
CMFireAutomataModelTest >> testModelOfFireAutomataCellReturnFireAutomata [
	self
		assert: CMFireAutomataCell modelClass
		identicalTo: CMFireAutomataModel
]

{ #category : #tests }
CMFireAutomataModelTest >> testNumberOfDifferentStateInAFireAutomataIsThree [

	self assert: (self model nbDistinctValuesOf: #state) equals: 3 "#empty, #tree, #fire"
]

{ #category : #tests }
CMFireAutomataModelTest >> testSizeOfCellsColumnOfFireAutomataModelIsTen [

	self assert: (self model selectCellsOfColumn: 1) size equals: 80
]

{ #category : #tests }
CMFireAutomataModelTest >> testWhenAfterRunningTheModel20TimesTheProbesResultHaveTheSameSize [

	| nbSteps result |

	nbSteps := 20.
	self model pickCell isSpatialEntity.
	result := OrderedCollection new.
	nbSteps timesRepeat: [ 
		self model runStep.
		result add: self model nbTrees ].
	self assert: result size equals: 20
]

{ #category : #tests }
CMFireAutomataModelTest >> testWhenYouPickACellOfAModelThisIsASpatialEntity [

	self assert: self model pickCell isSpatialEntity
]
