Class {
	#name : 'CMDropListWithPlaceholderPresenterTest',
	#superclass : 'TestCase',
	#instVars : [
		'dropList'
	],
	#category : 'Cormas-UI-Tests-Core',
	#package : 'Cormas-UI-Tests',
	#tag : 'Core'
}

{ #category : 'running' }
CMDropListWithPlaceholderPresenterTest >> setUp [ 

	super setUp.
	dropList := CMDropListWithPlaceholderPresenter new.
]

{ #category : 'tests' }
CMDropListWithPlaceholderPresenterTest >> testChangingItemsPreservesPlaceholder [

	| classes methods |
	
	classes := self class package classes asOrderedCollection.
	methods := self class methods asOrderedCollection.

	dropList items: classes.
	dropList placeholder: 'some text' respondingTo: #name.

	dropList items: methods.
	
	self assert: dropList hasPlaceholder.
	self assert: dropList items size equals: methods size + 1.
	self assert: dropList items first name equals: '-- some text --'.
	
]

{ #category : 'tests' }
CMDropListWithPlaceholderPresenterTest >> testHasPlaceholder [

	dropList placeholder: 'some text' respondingTo: #someSelector.
	self assert: dropList hasPlaceholder
]

{ #category : 'tests' }
CMDropListWithPlaceholderPresenterTest >> testHasPlaceholderDefaultFalse [

	self deny: dropList hasPlaceholder
]

{ #category : 'tests' }
CMDropListWithPlaceholderPresenterTest >> testHasPlaceholderItem [

	dropList placeholder: 'some text' respondingTo: #someSelector.
	
	self assert: dropList items size equals: 1.
	self assert: dropList items first class name equals: dropList placeholderClassName.
]

{ #category : 'tests' }
CMDropListWithPlaceholderPresenterTest >> testHasPlaceholderRespondsToSelector [

	dropList placeholder: 'some text' respondingTo: #someSelector.
	self assert: dropList items first someSelector equals: '-- some text --'.
]

{ #category : 'tests' }
CMDropListWithPlaceholderPresenterTest >> testPlaceholderPreservesExistingItems [

	| classes |
	classes := self class package classes asOrderedCollection.

	dropList items: classes.
	dropList placeholder: 'some text' respondingTo: #name.
	
	self assert: dropList items size equals: classes size + 1.
	self assert: dropList items copyWithoutFirst equals: classes.
	
]

{ #category : 'tests' }
CMDropListWithPlaceholderPresenterTest >> testPlaceholderSelectedWhenItemsChange [

	| classes methods |
	
	classes := self class package classes asOrderedCollection.
	methods := self class methods asOrderedCollection.

	dropList items: classes.
	dropList placeholder: 'some text' respondingTo: #name.
	dropList selectItem: classes anyOne.
	
	dropList items: methods.
	
	self assert: dropList selectedItem name equals: '-- some text --'.
	
]
