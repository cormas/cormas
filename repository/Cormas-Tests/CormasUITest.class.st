Class {
	#name : #CormasUITest,
	#superclass : #TestCase,
	#category : #'Cormas-Tests'
}

{ #category : #'create CMProjet' }
CormasUITest >> newProjectManagerWithInitializedUIOnModel: modelName [
	| pWindow aProject simWindow |
	pWindow := CMSpecProjectWindow new.
	aProject := pWindow projectManager.
	simWindow := pWindow simWindow simWindow.
	simWindow
		translator: (CMTranslator newForLanguage: #EN);
		initialize.
	aProject openImageProject: modelName.
		aProject updateNewProject: 'CM' , modelName asString , 'Model'.
	^ aProject
]

{ #category : #test }
CormasUITest >> testCanOpenModelFromImage [
	| p |
	p := CMProjectManager new.
	p openImageProject: #CMConwayModel.
	self assert: p currentProject cormasModel class name equals: #CMConwayModel
]

{ #category : #test }
CormasUITest >> testCurrentStepInputTextOfSimWindowIsResetAfterOpeningAModel [
	| aCMProjectManager simWindow |
	aCMProjectManager := self newProjectManagerWithInitializedUIOnModel: #CMConwayModel.
	simWindow := aCMProjectManager projectWindow simWindow simWindow.
	
	20 timesRepeat: [ aCMProjectManager currentProject cormasModel runStep ].
	
	aCMProjectManager openImageProject: #CMECECModel.
	aCMProjectManager updateNewProject: #CMECECModel.
	self assert: simWindow currentStepInputText text equals: 0.
]

{ #category : #test }
CormasUITest >> testCurrentStepInputTextOfSimWindowIsUpdatedWhenRuningSimulation [
	| aCMProjectManager simWindow |
	aCMProjectManager := self newProjectManagerWithInitializedUIOnModel: #CMConwayModel.
	simWindow := aCMProjectManager projectWindow simWindow simWindow.
	simWindow openWithSpec.
	20 timesRepeat: [ aCMProjectManager currentProject cormasModel runStep ].
	self
		assert: simWindow currentStepInputText text
		equals: aCMProjectManager currentProject cormasModel timeStep. simWindow delete
]

{ #category : #test }
CormasUITest >> testNumberOfDataOfSimpleChartIsUpdatedWhenRuningSimulation [
	| aCMProjectManager aCormasModel aSimpleChart probes |
	aCMProjectManager := self newProjectManagerWithInitializedUIOnModel: #CMConwayModel.
	aCormasModel := aCMProjectManager currentProject cormasModel.
	probes := OrderedCollection new.
	probes add: 'CMConwayModel>>alive'.
	probes add: 'CMConwayModel>>dead'.
	aCormasModel class setActiveProbes: probes.
	aCormasModel initSimulation.
	aSimpleChart := CMSimpleChart openOn: aCormasModel.
	5
		timesRepeat: [ "aSimpleChart close --> There are no such message for RTGrapher"
			aCMProjectManager currentProject cormasModel runStep.
			self assert: aSimpleChart maxX value equals: aCormasModel timeStep.
			self
				assert: aSimpleChart datasets first elements size - 1
				equals: aCormasModel timeStep ].
	aSimpleChart window delete
]
