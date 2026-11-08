"
I test the questions `CMWorkspaceChooser` asks to choose the workspace of the image, with `CMWorkspaceChooserMock` answering them on a memory file system.
"
Class {
	#name : 'CMWorkspaceChooserTest',
	#superclass : 'TestCase',
	#instVars : [
		'root',
		'chooser'
	],
	#category : 'Cormas-Workspace-Tests',
	#package : 'Cormas-Workspace-Tests'
}

{ #category : 'running' }
CMWorkspaceChooserTest >> setUp [

	super setUp.
	root := FileSystem memory root.
	chooser := CMWorkspaceChooserMock new defaultLocation:
		           root / 'Cormas'
]

{ #category : 'tests' }
CMWorkspaceChooserTest >> testCancellingChoosesNothing [

	chooser answers: #( nil ).
	self assert: chooser choose isNil.
	self deny: (root / 'Cormas') exists
]

{ #category : 'tests' }
CMWorkspaceChooserTest >> testCancellingTheFolderChoosesNothing [

	chooser answers: #( 2 nil ).
	self assert: chooser choose isNil
]

{ #category : 'tests' }
CMWorkspaceChooserTest >> testChoosesAnExistingWorkspace [

	CMWorkspace createAt: root / 'Research'.
	chooser answers: {
			2.
			(root / 'Research') }.
	self assert: chooser choose location equals: root / 'Research'.
	self deny: (root / 'Cormas') exists
]

{ #category : 'tests' }
CMWorkspaceChooserTest >> testChoosesAnotherExistingWorkspaceWhenTheDefaultExists [

	CMWorkspace createAt: root / 'Cormas'.
	CMWorkspace createAt: root / 'Research'.
	chooser answers: {
			2.
			(root / 'Research') }.
	self assert: chooser choose location equals: root / 'Research'
]

{ #category : 'tests' }
CMWorkspaceChooserTest >> testCreatesANewWorkspaceInAnotherFolder [

	CMWorkspace createAt: root / 'Cormas'.
	chooser answers: {
			3.
			(root / 'Teaching') }.
	self assert: chooser choose location equals: root / 'Teaching'.
	self assert: (CMWorkspace isWorkspace: root / 'Teaching')
]

{ #category : 'tests' }
CMWorkspaceChooserTest >> testCreatesANewWorkspaceInAnotherFolderWhenThereIsNone [

	chooser answers: {
			3.
			(root / 'Teaching') }.
	self assert: chooser choose location equals: root / 'Teaching'.
	self assert: (CMWorkspace isWorkspace: root / 'Teaching').
	self deny: (root / 'Cormas') exists
]

{ #category : 'tests' }
CMWorkspaceChooserTest >> testOffersToCreateTheDefaultWorkspaceWhenThereIsNone [

	| workspace |
	chooser answers: #( 1 ).
	workspace := chooser choose.
	self assert: workspace location equals: root / 'Cormas'.
	self assert: (CMWorkspace isWorkspace: root / 'Cormas').
	self
		assert: chooser questions first
		equals: #( 'Create /Cormas' 'Choose an existing workspace…'
			   'Create a new workspace…' )
]

{ #category : 'tests' }
CMWorkspaceChooserTest >> testOffersToUseTheDefaultWorkspaceWhenItExists [

	CMWorkspace createAt: root / 'Cormas'.
	chooser answers: #( 1 ).
	self assert: chooser choose location equals: root / 'Cormas'.
	self
		assert: chooser questions first
		equals: #( 'Use /Cormas' 'Choose an existing workspace…'
			   'Create a new workspace…' )
]

{ #category : 'tests' }
CMWorkspaceChooserTest >> testRefusedFolderIsExplainedAndTheQuestionAskedAgain [

	(root / 'Empty') ensureCreateDirectory.
	chooser answers: {
			2.
			(root / 'Empty').
			1 }.
	self assert: chooser choose location equals: root / 'Cormas'.
	self assert: chooser questions size equals: 2.
	self
		assert: chooser alerts asArray
		equals: #( '/Empty is not a workspace (it has no Models folder)' )
]
