managing classes
allClassesInPackage
"Returns all classes of the package ie. we the correct tag"
"^ self package classes   doesn't work because doesn't take tags into account"

^(self package classTags detect: [ :each | each includesClass: self ]) classes.
	