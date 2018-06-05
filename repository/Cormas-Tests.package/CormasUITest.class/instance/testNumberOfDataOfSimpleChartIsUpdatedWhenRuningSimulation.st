test
testNumberOfDataOfSimpleChartIsUpdatedWhenRuningSimulation
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
		timesRepeat: [ aCMProjectManager currentProject cormasModel runStep.
			self assert: aSimpleChart maxX value equals: aCormasModel timeStep.
			self
				assert: aSimpleChart datasets first elements size - 1
				equals: aCormasModel timeStep ]
	"aSimpleChart close --> There are no such message for RTGrapher"