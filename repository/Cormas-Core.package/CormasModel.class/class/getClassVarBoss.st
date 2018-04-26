- binary storage
getClassVarBoss
	"Return an OrderedCollection with: (Association key: 'classVar name' value:  classVar value )."
	
	| attributColl result attributes |
	"store the RandFishmanMoore current value"
	randUi := Cormas Rand class Ui.
	attributColl := OrderedCollection new.
	attributes := self class allInstVarNames.
	attributes
		do:
			[:att | 
			(#('builder' 'uiSession' 'eventHandlers' 'superclass' 'methodDict' 'format' 'subclasses' 'instanceVariables' 'organization' 'name' 'classPool' 'environment' 'savedWindowInformation' 'cellClass' 'spatialClasses' 'socialClasses' 'passiveClasses' 'povColorsDict' 'visualStateIsOpen' 'charts' 'activityDiagrams' 'currentSimulation')
				includes: att)
				ifFalse:
					[result := self instVarAt: (attributes indexOf: att).
					attributColl
						add:
							(Association
								key: att asSymbol
								value: result)]].
	^attributColl