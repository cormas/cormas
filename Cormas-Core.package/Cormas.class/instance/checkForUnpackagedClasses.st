model saving&loading
checkForUnpackagedClasses
	"Check if all classes are packaged. If none, packaging the nameSpace"
	
	| aNameSpace pkg outOfPackageClasses |
	aNameSpace := self cormasModelClass environment.
	pkg := Registry packageNamedOrCreate: aNameSpace name asString.	"look for un packaged classes"
	outOfPackageClasses := (aNameSpace allClasses
		select: [:cl | (pkg allDefinedClasses includes: cl) not]) asSet.	"look for un packaged selectors"
	outOfPackageClasses
		addAll:
			(aNameSpace allClasses
				select:
					[:cl | (cl selectors allSatisfy: [:selector | pkg methods includes: selector]) not]).
	outOfPackageClasses isEmpty
		ifFalse:
			[| string |
			string := ''.
			outOfPackageClasses
				do:
					[:cl | 
					pkg addEntiretyOfClass: cl.	"Adding classes. AddClass: is not enough !!!"
					string := string , '\    ' , cl name asString].
			self
				warn:
					'The following classes : <1s><n>have been added to the package: <2s>'
				with: string
				with: pkg name]