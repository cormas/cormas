- utilities - binary storage
representBinaryOn: bos
	"Purpose: The basic approach is to create an instance method named representBinaryOn: in the class whose BOSS representation you want to customize. The method typically returns a MessageSend, which is created by sending a receiver:selector:arguments: message to that class. The receiver argument identifies the class that is to create an instance, typically the object's class. The selector argument is the name of the instance-creation method that is to be used when the data is read by BOSS. The arguments argument is a collection of data values, typically the values of the object's instance variables"
	
	| attributColl result attributes list |
	attributColl := OrderedCollection new.
	attributes := self class allInstVarNames.
	attributes
		do:
			[:att | 
			list := #('cardinal' 'line' 'column' 'boundaries' 'nbNeighbours' 'gridCellShape' 'absoluteBounds' 'autoResizeBounds')
				asList.
			(list includes: att)
				ifTrue:
					[result := self instVarAt: (attributes indexOf: att).
					attributColl
						add:
							(Association
								key: att asSymbol
								value: result)]].
	^MessageSend
		receiver: self class
		selector: #newBoss:
		arguments: (Array with: attributColl)