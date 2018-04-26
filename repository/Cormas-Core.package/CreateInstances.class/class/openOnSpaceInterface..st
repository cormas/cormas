instance creation
openOnSpaceInterface: aSpaceInterface
	
	| aWin |
	aWin := super new.
	aWin linkedSpaceInterface: aSpaceInterface.
	(aWin openOn: aSpaceInterface cormasModel)
		ifNotNil:
			[aSpaceInterface createInstancesController: aWin.
			aWin initialTool: aSpaceInterface currentTool.
			aSpaceInterface activateToolNamed: 'CreateEntity Tool']
		ifNil: [Dialog warn: 'No entities can be created']