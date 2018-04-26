model entities
createClassNamed: aName from: aSuperClass
	"aName <String> - aSuperClass <Object, Agent, Entity, etc >"
	
	| classBuilder class currentNameSpace pkg |
	classBuilder := ClassBuilder new.
	currentNameSpace := self cormasModelClass environment.	"#{aSuperClass}"
	pkg := Registry packageNamedOrCreate: currentNameSpace name asString.	"RB := Refactory.Browser.BrowserNavigator new.
RB 	handleError:
			[RB performRefactoring:
					(Refactory.Browser.AddClassRefactoring
						addClass: (CormasNS.Kernel unambiguousName , '.') , aName
						superclass: aSuperClass
						subclasses: (Array new: 0)).
			CormasNS.Kernel
				at: aName asSymbol
				ifAbsent: [nil]].   "	"CormasNS.Kernel
		defineClass: #Momo
		superclass: #{CormasNS.Models.ECEC.Forager}
		indexedType: #none
		private: false
		instanceVariableNames: ''
		classInstanceVariableNames: ''
		imports: ''
		category: ''.  "
	classBuilder
		addRecord: (ClassCreatorRecord forName: aName in: currentNameSpace).
	classBuilder
		environment: currentNameSpace;
		beFixed;
		superclass: aSuperClass;
		className: aName asSymbol;
		instVarString: '';
		category: self cormasModelClass category.
	BrowserNavigator new
		moveObjectsNamed: (List with: aSuperClass fullName , '.' , aName)
		toPackage: pkg.
	class := classBuilder reviseSystemSilently.
	self packagingNamespace: self cormasModelClass environment.
	^class