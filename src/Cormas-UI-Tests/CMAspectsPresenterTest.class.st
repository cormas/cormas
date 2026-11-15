"
I test `CMAspectsPresenter` and `CMAspectRowPresenter`: the panel of a view where a user hides classes of entities and chooses their aspects and the perspective.
"
Class {
	#name : 'CMAspectsPresenterTest',
	#superclass : 'TestCase',
	#instVars : [
		'observer',
		'application',
		'panel',
		'changes'
	],
	#category : 'Cormas-UI-Tests',
	#package : 'Cormas-UI-Tests'
}

{ #category : 'running' }
CMAspectsPresenterTest >> openPanel [

	panel := CMAspectsPresenter
		         newApplication: application
		         model: observer.
	panel whenChangedDo: [ changes := changes + 1 ]
]

{ #category : 'running' }
CMAspectsPresenterTest >> rowOf: aClass [

	^ panel rows detect: [ :each | each entityClass = aClass ]
]

{ #category : 'running' }
CMAspectsPresenterTest >> setUp [

	super setUp.
	observer := CMObserver new.
	application := CMSimulationApplication new.
	application cormasModel: CMMockModel new.
	changes := 0
]

{ #category : 'tests' }
CMAspectsPresenterTest >> testAClassWithAChoiceOfItsOwnGetsARow [

	observer perspective show: CMMockCity as: #aspectId:.
	self openPanel.
	self
		assert:
			((panel rows collect: [ :each | each entityClass ])
				 copyFrom: 4
				 to: 5) asArray
		equals: {
				CMMockNetwork.
				CMMockCity }
]

{ #category : 'tests' }
CMAspectsPresenterTest >> testAHiddenClassGetsARow [

	observer perspective hide: CMMockCity.
	self openPanel.
	self
		assert:
			((panel rows collect: [ :each | each entityClass ])
				 copyFrom: 4
				 to: 5) asArray
		equals: {
				CMMockNetwork.
				CMMockCity }
]

{ #category : 'tests' }
CMAspectsPresenterTest >> testARowOffersTheAspectsOfItsClass [

	self openPanel.
	self
		assert: (self rowOf: CMMockAnimal) aspectDropList items asArray
		equals:
		#( #aspectClassName: #aspectDefault: #aspectEnergy: #aspectId: )
]

{ #category : 'tests' }
CMAspectsPresenterTest >> testASubclassRowShowsTheAspectItInherits [

	| dropList |
	observer perspective show: CMMockAnimal as: #aspectEnergy:.
	self openPanel.
	dropList := (self rowOf: CMMockGoat) aspectDropList.
	self
		assert: (dropList display value: dropList selectedItem)
		equals: 'Energy (as CMMockAnimal)'
]

{ #category : 'tests' }
CMAspectsPresenterTest >> testCheckingTheEyeShowsTheClassAgain [

	observer perspective hide: CMMockCow.
	self openPanel.
	(self rowOf: CMMockCow) visibilityCheckBox state: true.
	self assert: (observer perspective isVisible: CMMockCow)
]

{ #category : 'tests' }
CMAspectsPresenterTest >> testChoosingAnAspectInARowShowsTheClassWithIt [

	self openPanel.
	(self rowOf: CMMockAnimal) aspectDropList selectItem: #aspectEnergy:.
	self
		assert: (observer perspective aspectFor: CMMockCow)
		equals: #aspectEnergy:.
	self assert: changes equals: 1
]

{ #category : 'tests' }
CMAspectsPresenterTest >> testChoosingTheSuperclassInARowForgetsTheChoiceOfTheSubclass [

	observer perspective show: CMMockGoat as: #aspectHorns:.
	self openPanel.
	(self rowOf: CMMockGoat) aspectDropList selectItem: CMMockAnimal.
	self deny: (observer perspective hasChoiceFor: CMMockGoat)
]

{ #category : 'tests' }
CMAspectsPresenterTest >> testHidingAndShowingAClassInARowKeepsItsAspect [

	| row |
	self openPanel.
	row := self rowOf: CMMockCell.
	row aspectDropList selectItem: #aspectState:.
	row visibilityCheckBox state: false.
	row visibilityCheckBox state: true.
	self
		assert: (observer perspective aspectFor: CMMockCell)
		equals: #aspectState:.
	self assert: row aspectDropList selectedItem equals: #aspectState:
]

{ #category : 'tests' }
CMAspectsPresenterTest >> testRowsAreInDrawingOrderWithSubclassesUnderTheirSuperclass [

	self openPanel.
	self
		assert: (panel rows collect: [ :each | each entityClass ]) asArray
		equals: {
				CMMockAnimal.
				CMMockCow.
				CMMockGoat.
				CMMockNetwork.
				CMMockFriendship.
				CMMockRoad.
				CMMockAggregate.
				CMMockCell }
]

{ #category : 'tests' }
CMAspectsPresenterTest >> testUncheckingTheEyeHidesTheClassAndItsSubclasses [

	self openPanel.
	(self rowOf: CMMockAnimal) visibilityCheckBox state: false.
	self deny: (observer perspective isVisible: CMMockAnimal).
	self deny: (self rowOf: CMMockCow) visibilityCheckBox state.
	self assert: changes equals: 1
]
