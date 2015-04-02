model saving&loading
packagingNamespace: aNameSpace
	
	| pkg nameCollection |
	pkg := Registry packageNamedOrCreate: aNameSpace name asString.
	nameCollection := OrderedCollection new.
	nameCollection add: aNameSpace fullName.
	aNameSpace do: [:aClass | nameCollection add: aClass fullName].
	BrowserNavigator new moveObjectsNamed: nameCollection toPackage: pkg.
	^pkg