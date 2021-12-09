Class {
	#name : #CMSpProjectResourcesItem,
	#superclass : #CMSpProjectItem,
	#instVars : [
		'detail',
		'folder',
		'table'
	],
	#category : #'Cormas-UI-Spec2-ProjectBrowser'
}

{ #category : #specs }
CMSpProjectResourcesItem class >> defaultSpec [

	^ SpPanedLayout newVertical
		  positionOfSlider: 30 percent;
		  add: #table;
		  add: #detail;
		  yourself
]

{ #category : #accessing }
CMSpProjectResourcesItem class >> label [

	^ 'Resources'
]

{ #category : #accessing }
CMSpProjectResourcesItem class >> priority [
	^ 18
]

{ #category : #accessing }
CMSpProjectResourcesItem >> detail [

	^ detail ifNil: [ detail := (self instantiate: CMSpFileDetailPresenter) ]
]

{ #category : #accessing }
CMSpProjectResourcesItem >> folder [

	^ folder
]

{ #category : #initialization }
CMSpProjectResourcesItem >> folder: anObject [
	folder := anObject.
	detail showFile: nil.
   self table items: folder allElements
	
]

{ #category : #initialization }
CMSpProjectResourcesItem >> folderFileReference [

	^ 'cormas_project' asFileReference
]

{ #category : #initialization }
CMSpProjectResourcesItem >> initializeWidgets [

	self detail.
	self table	
		beMultipleSelection; 
		addColumn: (SpCompositeTableColumn new
				title: 'File Name';
				addColumn:
					(SpImageTableColumn new
						width: 20;
						evaluated: #icon;
						yourself);
				addColumn:
					(SpStringTableColumn new
						evaluated: [:each | ' ',each label];
						yourself);
				yourself);		
		addColumn: (SpStringTableColumn title: 'Size' evaluated: #size).
	self folder: (HRBFileSystemItemWrapper on: self folderFileReference)
]

{ #category : #initialization }
CMSpProjectResourcesItem >> pageClass [

	^ CMSpResourceFilePresenter
]

{ #category : #initialization }
CMSpProjectResourcesItem >> table [

	^ table ifNil: [ table := self newTable ]
]

{ #category : #initialization }
CMSpProjectResourcesItem >> whenItemsChangedDo: aBlock [
	
	table whenSelectionChangedDo: [ : sel | 
		| items |
		items := sel selectedItems.
		aBlock cull: items.
		detail showFile: (items ifEmpty: [ nil ] ifNotEmpty: [ items last ]) ] 
]
