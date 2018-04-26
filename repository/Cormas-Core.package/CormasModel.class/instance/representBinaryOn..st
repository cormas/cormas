- binary storage
representBinaryOn: bos
	"Purpose: The basic approach is to create an instance method named representBinaryOn: in the class whose BOSS representation you want to customize. The method typically returns a MessageSend, which is created by sending a receiver:selector:arguments: message to that class. The receiver argument identifies the class that is to create an instance, typically the object's class. The selector argument is the name of the instance-creation method that is to be used when the data is read by BOSS. The arguments argument is a collection of data values, typically the values of the object's instance variables"
	
	| attributColl result attributes |
	attributColl := OrderedCollection new.
	attributes := self class allInstVarNames.
	attributes
		do: [ : att | 
			"'List attributes que l'on garde =  channel activeInit activeControl  data  database allClassVarBOSS. + ceux du model"
			(#('dependents' 'builder' 'uiSession' 'eventHandlers' 'spaceModel' 'simManager' 'collector' 'defaultAttributesSetter' 'sensitivitySetter' 'delayedChanges' 'timeStepValue' 'cormas') includes: att)
				ifFalse: [
					result := self instVarAt: (attributes indexOf: att).	"
					On supprime les attributs n'√©tant pas de type literal ni collection ni Entity (ex: UiBuilder, ...)"
					(result isLiteral or: [ result isCollection or: [(result isKindOf: CMEntity) or: [ result isKindOf: CMChannel ] ] ])
						ifTrue: [ attributColl add: (Association key: att asSymbol value: result)]]].
	^ MessageSend
		receiver: self class
		selector: #newBoss:
		arguments: (Array with: attributColl)