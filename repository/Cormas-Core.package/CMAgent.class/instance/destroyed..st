accessing
destroyed: aBoolean
"Set the dead variable to True or False and delete the figures"
	dead := aBoolean.
	(aBoolean and:[self isSituated]) ifTrue:[self leave].