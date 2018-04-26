save-load
saveSIconfig: aConfig intoClass: modedelClass name: aName
	
	| selector aString |
	aString := 'configName:*' , aName ,
			'
observedEntitiesList:*'.
	aConfig observedEntitiesList list
		do: [:e | aString := aString , e name printString , ','].
	aString := aString ,
			'
manipEntitiesList:*'.
	aConfig manipEntitiesList list
		do: [:e | aString := aString , e name printString , ','].
	aString := aString ,
			'
createEntitiesList:*'.
	aConfig createEntitiesList list
		do: [:e | aString := aString , e name printString , ','].
	aConfig manipMethods keys
		do:
			[:aClass | 
			aString := aString ,
					'
manipMethods:*' , aClass name asString.
			(aConfig manipMethods at: aClass)
				do: [:aM | aString := aString , ',' , aM asString]].
	aConfig povMethods keys
		do:
			[:aClass | 
			aString := aString ,
					'
povMethods:*' , aClass name asString.
			(aConfig povMethods at: aClass)
				do: [:aM | aString := aString , ',' , aM asString]].
	aConfig attributes keys
		do:
			[:aClass | 
			aString := aString ,
					'
attributes:*' , aClass name asString.
			(aConfig attributes at: aClass)
				do: [:aM | aString := aString , ',' , aM asString]].
	aConfig infoMethods keys
		do:
			[:aClass | 
			aString := aString ,
					'
infoMethods:*' , aClass name asString.
			(aConfig infoMethods at: aClass)
				do: [:aM | aString := aString , ',' , aM asString]].
	aConfig probeMethods keys
		do:
			[:aClass | 
			aString := aString ,
					'
probeMethods:*' , aClass name asString.
			(aConfig probeMethods at: aClass)
				do: [:aM | aString := aString , ',' , aM asString]].
	aConfig canBeMoved keys
		do:
			[:aClass | 
			(aConfig canBeMovedFor: aClass)
				ifNotNil:
					[aString := aString ,
							'
canBeMoved:*' , aClass name asString , ','
						, (aConfig canBeMovedFor: aClass) asString]].
	aConfig manipWholePop keys
		do:
			[:aClass | 
			(aConfig manipWholePopFor: aClass)
				ifNotNil:
					[aString := aString ,
							'
manipWholePop:*' , aClass name asString , ','
						, (aConfig manipWholePopFor: aClass) asString]].
	aConfig canChangeValues keys
		do:
			[:aClass | 
			(aConfig canChangeValuesFor: aClass)
				ifNotNil:
					[aString := aString ,
							'
canChangeValues:*' , aClass name asString , ','
						, (aConfig canChangeValuesFor: aClass) asString]].
	aConfig defaultPov keys
		do:
			[:aClass | 
			(aConfig defaultPovFor: aClass)
				ifNotNil:
					[aString := aString ,
							'
defaultPov:*' , aClass name asString , ','
						, (aConfig defaultPovFor: aClass) asString]].
	aConfig defaultInfo keys
		do:
			[:aClass | 
			(aConfig defaultInfoFor: aClass)
				ifNotNil:
					[aString := aString ,
							'
defaultInfo:*' , aClass name asString , ','
						, (aConfig defaultInfoFor: aClass) asString]].
	aString := aString ,
			'
delimiterSize:*' , 'ESE,' , aConfig delimiterSize value asString ,
			'
defaultTool:*' , aConfig defaultTool value asString ,
			'
siMenuFormat:*' , aConfig siMenuFormat value asString ,
			'
isUndoRedoEnabled:*' , aConfig isUndoRedoEnabled asString ,
			'
isManipulateForTabletEnabled:*'
		, aConfig isManipulateForTabletEnabled asString ,
			'
isSingleDefaultPovShown:*' , aConfig isSingleDefaultPovShown asString ,
			'
isSingleDefaultInfoShown:*' , aConfig isSingleDefaultInfoShown asString ,
			'
trackLengthValue:*' , 'All,' , aConfig trackLengthValue asString ,
			'
trackedAgents:*'.
	aConfig trackedAgents do: [:e | aString := aString , e asString , ','].
	selector := 'SIconfig_' , aName.
	modedelClass class
		compile:
			(selector ,
					'\"Returns an array containing the settings of the Spatial Interface configuration named '
				, aName , '"\^''' , aString , '''\') withCRs
		classified: 'SI_config'
		notifying: nil