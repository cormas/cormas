"
Icons made by Freepik from www.flaticon.com

Internal Representation and Key Implementation Points.

    Instance Variables
	tree:		<Object>


    Implementation Points
"
Class {
	#name : #CMSpProjectStructurePresenter,
	#superclass : #CMSpPresenter,
	#instVars : [
		'tree'
	],
	#category : #'Cormas-UI-Spec2-ProjectBrowser'
}

{ #category : #specs }
CMSpProjectStructurePresenter class >> defaultSpec [

	^ SpBoxLayout newVertical
		add: #tree;
		yourself
]

{ #category : #specs }
CMSpProjectStructurePresenter class >> open [ 
	<script>
	self new openWithSpec 
]

{ #category : #specs }
CMSpProjectStructurePresenter class >> openOnSample [

	<script>
	self basicNew 
		cormasModel: CMAbstractModel allSubInstances anyOne;
		initialize;
		openWithSpec 
]

{ #category : #initialization }
CMSpProjectStructurePresenter >> initializeWidgets [

	tree := self newTreeTable.
	tree addColumn:
			(SpCompositeTableColumn new
				title: self title;
				addColumn:
					(SpImageTableColumn new
						width: 20;
						evaluated: #icon;
						yourself);
				addColumn:
					(SpStringTableColumn new
						evaluated: #label;
						yourself);
				yourself);
	 
		roots: self projectStructureItems;
		children: [ : aClass | aClass subclasses ];
		expandRoots;		
		contextMenu: self projectContextMenu;
		activateOnDoubleClick;
		whenActivatedDo: [ :selection | selection selectedItem browse ];
		"whenSelectedItemChangedDo: [ :item | item ifNotNil: [ self elementChanged ] ];"
		"whenBuiltDo: [ self initializeShortcuts ];"
		beResizable.
]

{ #category : #initialization }
CMSpProjectStructurePresenter >> projectContextMenu [

	" (self rootCommandsGroup / 'Results tools') beRoot asMenuPresenter "
	^(SpMenuPresenter new
		addGroup: [ :group | group
			addItem: [ :item | item name: 'Explore';  action: [ self browseFolder ]]
		])
]

{ #category : #accessing }
CMSpProjectStructurePresenter >> projectManager [

	^ self cormasModel projectManager
]

{ #category : #accessing }
CMSpProjectStructurePresenter >> projectStructure [
	" Answer a <Collection> with the receiver's logical structure, intended to be browsed "
	
	^ { 
		'Model' .
		'Info' .
		'Library' .
		'Properties' .
		'Resources' .
		'Entities' .
		'Agents' .
		'UI' .
		'Scenarios' .
	 }
]

{ #category : #initialization }
CMSpProjectStructurePresenter >> projectStructureItems [

	^ {CMSpProjectItem} "subclasses collect: [ : projectItem | CMSpProjectItem on: projectItem ]"
]

{ #category : #accessing }
CMSpProjectStructurePresenter >> title [ 

	^ 'Project Browser'
]

{ #category : #accessing }
CMSpProjectStructurePresenter >> tree [

	^ tree
]

{ #category : #accessing }
CMSpProjectStructurePresenter >> tree: anObject [

	tree := anObject
]
