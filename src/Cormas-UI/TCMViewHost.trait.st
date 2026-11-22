"
I let a presenter show views, such as views of the space and charts, in closeable tabs of its notebook, move each of them to a window of its own and back, and close them.

## Responsibility:

- Add a tab for a view, and move a view between a tab and a window. Spec cannot move a presenter, so a moved view is a copy.
- Close one view or all of them, whether in a tab or in a window.
- Update the views that are shown, those in windows and the one in the selected tab, in the UI process.

## Collaborators:

- The views, `CMSpacePresenter` and `CMChartPresenter`, answer `copyFor:`, `registerIn:`, `openInWindow`, `isInWindow`, `detachedWindow`, `displayedTitle`, `updateDiagram` and `closeDiagram`.
- My users, `CMSimulationRunnerPresenter` and `CMEntityInspectorPresenter`, give me their `notebook`, their `pages`, their `charts` and their `hostedViews`, forget a closed view (`forget:`), and choose where a view moved back lands (`addTab:`).

## Public API and Key Messages

- `addPageFor:`, `moveToWindow:`, `moveToTabs:`, `closeView:`, `closeAllViews`
- `newChartView:of:` makes a chart that I manage.
- `updateShownViews`, `updateInInterface:`

```smalltalk
moved := inspector moveToWindow: inspector charts first.
inspector moveToTabs: moved
```
"
Trait {
	#name : 'TCMViewHost',
	#category : 'Cormas-UI-Simulation',
	#package : 'Cormas-UI',
	#tag : 'Simulation'
}

{ #category : 'views' }
TCMViewHost >> addPageFor: aView [
	"Show aView, a space view or a chart, in a closeable tab at the end of the notebook"

	| page |
	aView registerIn: self.
	page := SpNotebookPage
		        title: aView displayedTitle
		        provider: [ aView ].
	page beCloseable.
	self pages at: aView put: page.
	self notebook addPage: page
]

{ #category : 'requirements' }
TCMViewHost >> addTab: aView [
	"Show aView in a new tab of my notebook"

	self explicitRequirement
]

{ #category : 'requirements' }
TCMViewHost >> charts [
	"Answer the collection of my charts, in tabs or in windows of their own"

	^ self explicitRequirement
]

{ #category : 'views' }
TCMViewHost >> closeAllViews [

	self hostedViews do: [ :each | self closeView: each ]
]

{ #category : 'views' }
TCMViewHost >> closeView: aView [
	"Stop showing aView, a space view or a chart, whether it is in a tab or in a window. A tab may already have left the notebook, when its close button was pressed"

	(self hostedViews includes: aView) ifFalse: [ ^ self ].
	self forget: aView.
	self pages at: aView ifPresent: [ :page |
			self pages removeKey: aView.
			(self notebook pages includes: page) ifTrue: [
				self notebook removePage: page ] ].
	aView isInWindow ifTrue: [ aView detachedWindow close ].
	aView closeDiagram
]

{ #category : 'requirements' }
TCMViewHost >> forget: aView [
	"Remove aView from the views I manage"

	self explicitRequirement
]

{ #category : 'requirements' }
TCMViewHost >> hostedViews [
	"Answer a new collection of the views I manage, in tabs or in windows of their own"

	^ self explicitRequirement
]

{ #category : 'views' }
TCMViewHost >> moveToTabs: aView [
	"Show aView, a space view or a chart, in a new tab, with its choices and its title, and close its window. Answer the view in the tab"

	| back |
	back := aView copyFor: self.
	self closeView: aView.
	self addTab: back.
	^ back
]

{ #category : 'views' }
TCMViewHost >> moveToWindow: aView [
	"Show aView, a space view or a chart, in a window of its own, with its choices and its title. Answer the view in the window"

	| moved |
	moved := aView copyFor: self.
	self closeView: aView.
	moved registerIn: self.
	moved openInWindow.
	^ moved
]

{ #category : 'views' }
TCMViewHost >> newChartView: aSelector of: aModelOrAnEntity [
	"Answer a chart of the method aSelector of aModelOrAnEntity, that I manage"

	^ (self instantiate: CMChartPresenter)
		  host: self;
		  subject: aModelOrAnEntity chart: aSelector;
		  yourself
]

{ #category : 'requirements' }
TCMViewHost >> notebook [

	^ self explicitRequirement
]

{ #category : 'requirements' }
TCMViewHost >> pages [
	"Answer a dictionary from each view in a tab to the page of that tab"

	^ self explicitRequirement
]

{ #category : 'views' }
TCMViewHost >> updateInInterface: aBlock [
	"Run aBlock in the UI process, since Spec and Morphic widgets may only change there. From the simulation's process, wait until it is done, or until I am no longer displayed"

	| done |
	Processor activeProcess == UIManager default uiProcess ifTrue: [
		^ aBlock value ].
	done := Semaphore new.
	self application defer: [ [ aBlock value ] ensure: [ done signal ] ].
	[ done waitTimeoutMilliseconds: 200 ] whileTrue: [
		self isDisplayed ifFalse: [ ^ self ] ]
]

{ #category : 'views' }
TCMViewHost >> updateShownViews [
	"Update the views in windows of their own and the view in the selected tab. The views in the other tabs are not displayed, so they are not updated"

	self hostedViews do: [ :each |
		each isInWindow ifTrue: [ each updateDiagram ] ].
	self notebook selectedPage ifNil: [ ^ self ].
	self pages keysAndValuesDo: [ :view :page |
		self notebook selectedPage = page ifTrue: [ view updateDiagram ] ]
]
