initialize-release
for: object name: att
	
	| item attValue nb classesSet |
	item := self new.
	item entity: object.
	item name: att.
	attValue := object perform: att asSymbol.
	attValue
		ifNil:
			[item initValue: attValue printString.
			^item].
	item isSymbol
		ifTrue:
			[item initValue: attValue printString.
			^item].
	item isString
		ifTrue:
			[item initValue: attValue.
			^item].	"check if it is an association to another model entity"
	item isAssociation
		ifTrue:
			[item initValue: 'a ' , attValue class name.
			^item].
	item isCollection
		ifTrue:
			[attValue size = 1
				ifTrue:
					[item initValue: '1 ' , (attValue asOrderedCollection at: 1) class name.
					^item].
			attValue size = 0
				ifTrue:
					[item initValue: 'isEmpty'.
					^item].
			nb := attValue size printString.
			classesSet := (attValue collect: [:e | e class]) asSet.
			classesSet size > 1
				ifTrue:
					[item initValue: nb , ' mixed items'.
					^item].
			item
				initValue:
					nb , ' ' , attValue asOrderedCollection first class name , 's'.
			^item].
	(item isNumber or: [item isBoolean])
		ifTrue:
			[item initValue: attValue printString.
			^item].	"In case it is none of the upper options, it must be an association to an object which is not a cormas entity"
	item initValue: 'a ' , attValue class name.
	^item