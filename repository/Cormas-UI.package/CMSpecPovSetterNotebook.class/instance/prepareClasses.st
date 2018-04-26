private
prepareClasses
	
	| modelClasses |
	modelClasses := OrderedCollection new.
	^ modelClasses 
		add: self cormasModelClass cellClass;
		addAll: self cormasModelClass compoundSpatialClasses;
		addAll: (self cormasModelClass socialClasses select: #isSituatedClass);
		addAll: (self cormasModelClass passiveObjectClasses select: #isSituatedClass);
		yourself
