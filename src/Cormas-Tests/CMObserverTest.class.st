"
I check that an observer fills the look of each entity with the aspect its perspective chooses, so that two views can show the same entities from two points of view.
"
Class {
	#name : 'CMObserverTest',
	#superclass : 'TestCase',
	#instVars : [
		'observer'
	],
	#category : 'Cormas-Tests-Look',
	#package : 'Cormas-Tests',
	#tag : 'Look'
}

{ #category : 'running' }
CMObserverTest >> setUp [

	super setUp.
	observer := CMObserver new
]

{ #category : 'tests' }
CMObserverTest >> testAChoiceAppliesToSubclasses [

	| cow |
	cow := CMMockCow new
		       energy: 10;
		       yourself.
	observer perspective: (CMPerspective new
			 show: CMMockAnimal as: #aspectEnergy:;
			 yourself).
	self assert: (observer lookOf: cow) size equals: 1
]

{ #category : 'tests' }
CMObserverTest >> testAClassListsItsOwnAndInheritedAspects [

	self assert: (CMMockGoat aspectSelectors includesAll:
			 #( #aspectHorns: #aspectEnergy: #aspectDefault: #aspectId: ))
]

{ #category : 'tests' }
CMObserverTest >> testACopyOfAnObserverChoosesAspectsOnItsOwn [

	| copy cell |
	cell := CMMockCell new
		        state: #alive;
		        yourself.
	observer perspective show: CMMockCell as: #aspectState:.
	copy := observer copy.
	copy perspective hide: CMMockCell.
	self assert: (observer lookOf: cell) isVisible.
	self deny: (copy lookOf: cell) isVisible.
	self
		assert: (CMObserver new
				 perspective: observer perspective;
				 copy) perspective name
		equals: observer perspective name
]

{ #category : 'tests' }
CMObserverTest >> testACopyOfAnObserverResetsToTheSamePerspective [

	| copy |
	observer perspective:
		(CMMockModel new perspectiveNamed: #perspectiveHiddenCows).
	observer perspective show: CMMockCow.
	copy := observer copy.
	copy reset.
	self deny: (copy perspective isVisible: CMMockCow).
	self assert: (observer perspective isVisible: CMMockCow)
]

{ #category : 'tests' }
CMObserverTest >> testANetworkNeverChangesTheLookOfItsLinks [

	| road street |
	road := CMMockRoad new.
	road aspect: [ :look | look color: Color green ].
	street := CMMockNetwork new.
	street aspect: [ :look | look color: Color red ].
	street add: road.
	self assert: (observer lookOf: road) color equals: Color green.
	self assert: (observer lookOf: street) color equals: Color red
]

{ #category : 'tests' }
CMObserverTest >> testANewObserverShowsTheDefaultAspect [

	self
		assert: (observer lookOf: CMCell new) color
		equals: CMCellLook new color
]

{ #category : 'tests' }
CMObserverTest >> testAPerspectiveChoosesTheAspectOfAClass [

	| cell |
	cell := CMMockCell new
		        state: #alive;
		        yourself.
	observer perspective: (CMPerspective new
			 show: CMMockCell as: #aspectState:;
			 yourself).
	self assert: (observer lookOf: cell) color equals: Color white
]

{ #category : 'tests' }
CMObserverTest >> testAnAspectIsNamedAfterItsMethod [

	self
		assert: (CMEntity nameOfAspect: #aspectDefault:)
		equals: 'Default'.
	self
		assert: (CMEntity nameOfAspect: #aspectClassName:)
		equals: 'Class name'
]

{ #category : 'tests' }
CMObserverTest >> testAnObserverIsModifiedOnceItsPerspectiveChanges [

	observer perspective:
		(CMMockModel new perspectiveNamed: #perspectiveHiddenCows).
	self deny: observer isModified.
	observer perspective show: CMMockGoat as: #aspectHorns:.
	self assert: observer isModified
]

{ #category : 'tests' }
CMObserverTest >> testAspectClassNameGivesTheSameColorToEntitiesOfTheSameClass [

	observer perspective: (CMPerspective new
			 show: CMMockAnimal as: #aspectClassName:;
			 yourself).
	self
		assert: (observer lookOf: CMMockCow new) color
		equals: (observer lookOf: CMMockCow new) color.
	self
		deny: (observer lookOf: CMMockCow new) color
		equals: (observer lookOf: CMMockGoat new) color
]

{ #category : 'tests' }
CMObserverTest >> testAspectIdGivesDifferentColorsToDifferentEntities [

	| first second |
	first := CMMockCell new
		         id: 1;
		         yourself.
	second := CMMockCell new
		          id: 2;
		          yourself.
	observer perspective: (CMPerspective new
			 show: CMMockCell as: #aspectId:;
			 yourself).
	self
		deny: (observer lookOf: first) color
		equals: (observer lookOf: second) color
]

{ #category : 'tests' }
CMObserverTest >> testChoosingAnAspectThatTheClassDoesNotHaveRaisesAnErrorListingItsAspects [

	| error |
	error := [ CMPerspective new show: CMMockCell as: #aspectState ]
		         on: Error
		         do: [ :each | each ].
	self assert: (error messageText includesSubstring: 'CMMockCell').
	self assert: (error messageText includesSubstring: 'aspectState:')
]

{ #category : 'tests' }
CMObserverTest >> testEachKindOfEntityGetsItsOwnKindOfLook [

	self assert: (observer lookOf: CMMockCow new) shape equals: #circle.
	self
		deny: (observer lookOf: CMMockRoad new) color
		equals: Color transparent.
	self
		assert: (observer lookOf: CMMockNetwork new) color
		equals: Color transparent
]

{ #category : 'tests' }
CMObserverTest >> testForgettingTheChoiceForAClassFollowsItsSuperclass [

	observer perspective
		show: CMMockAnimal as: #aspectEnergy:;
		show: CMMockGoat as: #aspectHorns:;
		forget: CMMockGoat.
	self deny: (observer perspective hasChoiceFor: CMMockGoat).
	self
		assert: (observer perspective aspectFor: CMMockGoat)
		equals: #aspectEnergy:
]

{ #category : 'tests' }
CMObserverTest >> testHidingAClassHidesItsSubclasses [

	observer perspective hide: CMMockAnimal.
	self deny: (observer perspective isVisible: CMMockCow).
	self deny: (observer lookOf: CMMockCow new) isVisible
]

{ #category : 'tests' }
CMObserverTest >> testHidingAClassIsAModification [

	observer perspective hide: CMMockGoat.
	self assert: observer isModified
]

{ #category : 'tests' }
CMObserverTest >> testHidingAndShowingAClassKeepsItsAspect [

	observer perspective
		show: CMMockGoat as: #aspectHorns:;
		hide: CMMockGoat;
		show: CMMockGoat.
	self assert: (observer perspective isVisible: CMMockGoat).
	self
		assert: (observer perspective aspectFor: CMMockGoat)
		equals: #aspectHorns:
]

{ #category : 'tests' }
CMObserverTest >> testRedefiningTheDefaultAspectChangesTheDefault [

	self assert: (observer lookOf: CMMockCow new) color equals: Color red.
	self
		assert: (observer lookOf: (CMMockCell new
					  state: #dead;
					  yourself)) color
		equals: Color black
]

{ #category : 'tests' }
CMObserverTest >> testResettingAnObserverGoesBackToItsPerspective [

	observer perspective:
		(CMMockModel new perspectiveNamed: #perspectiveHiddenCows).
	observer perspective
		show: CMMockCow;
		show: CMMockGoat as: #aspectHorns:.
	observer reset.
	self deny: observer isModified.
	self deny: (observer perspective isVisible: CMMockCow).
	self
		assert: (observer perspective aspectFor: CMMockGoat)
		equals: #aspectDefault:.
	self assert: observer perspective name equals: 'Hidden cows'
]

{ #category : 'tests' }
CMObserverTest >> testShowingAClassWhoseSuperclassIsHiddenShowsOnlyThatClass [

	observer perspective
		show: CMMockAnimal as: #aspectEnergy:;
		hide: CMMockAnimal;
		show: CMMockCow.
	self assert: (observer perspective isVisible: CMMockCow).
	self
		assert: (observer perspective aspectFor: CMMockCow)
		equals: #aspectEnergy:.
	self deny: (observer perspective isVisible: CMMockGoat)
]

{ #category : 'tests' }
CMObserverTest >> testTheDefaultAspectOfADirectedLinkHasAnArrowhead [

	self assert: (observer lookOf: CMMockRoad new) hasArrowhead
]

{ #category : 'tests' }
CMObserverTest >> testTheLookFollowsTheEntityAtEachRefresh [

	| cell look |
	cell := CMMockCell new
		        state: #dead;
		        yourself.
	observer perspective: (CMPerspective new
			 show: CMMockCell as: #aspectGraves:;
			 yourself).
	self assert: (observer lookOf: cell) hasImage.
	cell state: #alive.
	look := observer lookOf: cell.
	self deny: look hasImage
]

{ #category : 'tests' }
CMObserverTest >> testTheMostSpecificChoiceWins [

	| cow goat |
	cow := CMMockCow new
		       energy: 10;
		       yourself.
	goat := CMMockGoat new
		        energy: 10;
		        yourself.
	observer perspective: (CMPerspective new
			 show: CMMockAnimal as: #aspectEnergy:;
			 show: CMMockGoat as: #aspectHorns:;
			 yourself).
	self assert: (observer lookOf: goat) shape equals: #triangle.
	self
		assert: (observer lookOf: goat) size
		equals: CMAgentLook new size.
	self assert: (observer lookOf: cow) size equals: 1
]

{ #category : 'tests' }
CMObserverTest >> testTwoObserversFillDifferentLooksForTheSameEntity [

	| cell other |
	cell := CMMockCell new
		        state: #alive;
		        yourself.
	observer perspective: (CMPerspective new
			 show: CMMockCell as: #aspectState:;
			 yourself).
	other := CMObserver new.
	other perspective: (CMPerspective new
			 hide: CMMockCell;
			 yourself).
	self assert: (observer lookOf: cell) isVisible.
	self deny: (other lookOf: cell) isVisible
]

{ #category : 'tests' }
CMObserverTest >> testUndoingAChangeLeavesAnObserverUnmodified [

	observer perspective
		show: CMMockGoat as: #aspectHorns:;
		forget: CMMockGoat.
	self deny: observer isModified
]
