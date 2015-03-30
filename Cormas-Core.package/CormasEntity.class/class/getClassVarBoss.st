- utilities - binary storage
getClassVarBoss
	"Return an OrderedCollection with: (Association key: 'classVar name' value:  classVar value )."
	
	| attributColl result attributes |
	attributColl := OrderedCollection new.
	attributes := self class allInstVarNames.
	attributes
		do:
			[:att | 
			(#('superclass' 'methodDict' 'format' 'subclasses' 'instanceVariables' 'organization' 'name' 'classPool' 'environment' 'CurrentId' 'colorsDict' 'image' 'activeProbes' 'povDict' 'activityDiagrams' 'bounds' 'modelClass')
				includes: att)
				ifFalse:
					[result := self instVarAt: (attributes indexOf: att).
					attributColl
						add:
							(Association
								key: att asSymbol
								value: result)]].
	^attributColl