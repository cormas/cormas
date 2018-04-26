managing classes
passiveClasses
	"return a collection of passive classes of the model"

	^ self
		allClassesInPackage
		remove: self;
		removeAll: self spatialClasses;
		removeAll: self socialClasses;
		yourself