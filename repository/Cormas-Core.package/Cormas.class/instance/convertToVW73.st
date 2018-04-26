version
convertToVW73
	"Check if a package exists for the model and if all classes are packaged. If none, packaging the nameSpace"
	
	| aNameSpace pkg |
	aNameSpace := self cormasModelClass environment.
	pkg := Registry containingPackageForNameSpace: aNameSpace.
	(pkg isNil or: [pkg name = '(none)'])
		ifTrue:
			[Notice
				show:
					(UserMessage defaultString: ' Adapting the model to VW7.3 ' key:
							#adaptingToVW73)
				while: [self packagingNamespace: aNameSpace].
			self
				warn:
					(UserMessage defaultString:
							' The model has been adapted to VW7.3. \ A package and a parcel have been created '
						key: #packageAndParcelCreated) asString withCRs].
	self checkForUnpackagedClasses