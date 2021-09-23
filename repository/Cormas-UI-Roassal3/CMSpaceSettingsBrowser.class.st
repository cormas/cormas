Class {
	#name : #CMSpaceSettingsBrowser,
	#superclass : #SettingBrowser,
	#category : #'Cormas-UI-Roassal3-Settings'
}

{ #category : #opening }
CMSpaceSettingsBrowser class >> open [
	" Open the receiver's window "
	<script>

	(CMSpaceSettingsBrowser forKeywords: #('cormasSpacePreferences')) open; expandAll.
]

{ #category : #private }
CMSpaceSettingsBrowser class >> pragmaKeywords [

	^ Array with: #cormasSpacePreferences
]

{ #category : #'user interface' }
CMSpaceSettingsBrowser >> buildWindowIn: aWindow [ 
	| statusView toolBar treeMorph toolBarY gap statusViewHeight |
	treeMorph := self treeMorphIn: aWindow.
	statusView := self statusViewIn: aWindow.
	statusViewHeight := 100.
	toolBar := self toolBarIn: aWindow.
	gap := 1.
	toolBarY := toolBar minExtent y + gap.
	aWindow 
		addMorph: toolBar
		fullFrame: ((0 @ 0 corner: 1 @ 0) asLayoutFrame 
						topOffset: gap;
						bottomOffset: toolBarY + gap).
	aWindow 
		addMorph: treeMorph
		fullFrame: ((0 @ 0 corner: 1 @ 0.99) asLayoutFrame 
				topOffset: toolBarY + gap + gap;
				bottomOffset: statusViewHeight negated).
	aWindow 
		addMorph: statusView
		fullFrame: ((0 @ 0.99 corner: 1 @ 1) asLayoutFrame 
				topOffset: statusViewHeight negated).
	^ aWindow
]

{ #category : #opening }
CMSpaceSettingsBrowser >> toolBarIn: aMorph [ 
	| toolBar |
	toolBar := aMorph newToolbar: {
	aMorph
		newButtonFor: self
		getState: nil
		action: #expandAll
		arguments: nil
		getEnabled: nil
		label: 'Expand all'
		help: 'Expand all tree nodes'.
	aMorph newToolSpacer.
	aMorph newToolSpacer.
	aMorph newLabel: 'Search for: ' translated.
	(SearchMorph
				on: self
				list: #searchedTextList
				selected: #searchedText
				changeSelected: #changeSearchedText:
				useIndex: false 
				addToList: #addToSearchedTextList:
				class: String
				getEnabled: nil) hResizing: #spaceFill; 
				ghostText: 'Hit return to accept'.
	aMorph
			newCheckboxFor: self
			getSelected: #regexpSearch
			setSelected: #regexpSearch:
			getEnabled: nil
			label: 'Regexp' 
			help: 'Filter according to a regular expression' translated.
	aMorph newToolSpacer}.
	^ toolBar
]

{ #category : #'user interface' }
CMSpaceSettingsBrowser >> updateList [
	self isRendered ifTrue: [
		self treeHolder updateList.
		self changed: #getDescription.
		super updateList].
]

{ #category : #'user interface' }
CMSpaceSettingsBrowser >> windowTitle [

	^ 'CORMAS - Space Settings' 
]
