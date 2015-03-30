actions
defaultValuesForClass: aClass category: aSymbol
	
	| aList i cat |
	aList := List new.
	cat := aSymbol asString.
	cat
		at: 1
		put: cat first asUppercase.
	(aClass perform: ('methodsFor' , cat) asSymbol)
		do:
			[:m | 
			i := ClassManipulationMethod new.
			i
				targetClass: aClass;
				methodName: m;
				isInit: cat = 'Init';
				isControl: cat = 'Control';
				isTesting: cat = 'Testing'.
			aList add: i].
	^aList