"
These are global Cormas settings. For each specific project settings, see class CMProjectPreferences.

"
Class {
	#name : #CMApplicationPreferences,
	#superclass : #Object,
	#classVars : [
		'SettingBaseLocation',
		'SettingChartViewer',
		'SettingFixedHorizontalTick',
		'SettingFixedVerticalTick',
		'SettingProjectNotifications',
		'SettingShowProbesTitle',
		'SettingSpaceViewer',
		'SettingWaitLimit',
		'SettingWarnUsing'
	],
	#category : #'Cormas-Core-Kernel'
}

{ #category : #settings }
CMApplicationPreferences class >> availableSettingChartViewer [
	" Answer a <Collection> with classes representing available Chart Viewers implementations "

	^ { 
		Smalltalk at: #CMR3ChartPresenter
	 	"Smalltalk at: #CMR2SimpleChart"
		}.
]

{ #category : #settings }
CMApplicationPreferences class >> availableSettingSpaceDiagram [
	" Answer a <Collection> with classes representing available Space Interfaces implementations "

	^ { 
		Smalltalk at: #CMR3SpaceDiagram .
	 	"Smalltalk at: #CMR2SpaceAnimationRecorder "
		}.
]

{ #category : #settings }
CMApplicationPreferences class >> availableSettingWarnUsing [
	
	^ CMLoadException allSubclasses 
]

{ #category : #settings }
CMApplicationPreferences class >> cmChartSettingOn: aBuilder [
	<cormasPreferences>
	
	(aBuilder group: #cmChartSetting)
		label: 'Probes Chart';
		description: 'Settings related with Probes Chart visualization';
		order: 1
]

{ #category : #settings }
CMApplicationPreferences class >> cmGeneralSettingOn: aBuilder [
	<cormasPreferences>
	
	(aBuilder group: #cmGeneralSetting)
		label: 'General';
		description: 'General application settings';
		order: 2
]

{ #category : #settings }
CMApplicationPreferences class >> cmLoadSettingOn: aBuilder [
	<cormasPreferences>
	
	(aBuilder group: #cmLoadSetting)
		label: 'Loading';
		description: 'Settings related to loading projects or models';
		order: 1
]

{ #category : #settings }
CMApplicationPreferences class >> cmSettingBaseLocationOn: aBuilder [
	<cormasPreferences>
	
	(aBuilder setting: #settingBaseLocation)
		label: 'Base location';
		parent: #cmGeneralSetting;
		type: #Directory;
		target: self;
		default: self defaultBaseLocation;	
		description: 'Base directory for storing CORMAS artifacts (projects, preferences, etc) in the host machine';
		order: 5
]

{ #category : #settings }
CMApplicationPreferences class >> cmSettingChartViewerOn: aBuilder [
	<cormasPreferences>
	
	(aBuilder pickOne: #settingChartViewer)
		label: 'Chart Viewer';
		parent: #cmGeneralSetting;
		description: 'You can use multiple types of chart viewers';
		target: self;
		order: 7;
		domainValues: self availableSettingChartViewer;
		default: self defaultSettingChartViewer
]

{ #category : #settings }
CMApplicationPreferences class >> cmSettingFixedHorizontalTickOn: aBuilder [
	<cormasPreferences>
	
	(aBuilder setting: #settingFixedHorizontalTick)
		label: 'Horizontal ticks are fixed';
		parent: #cmChartSetting;
		description: 'Whether the horizontal ticks are a fixed value in the Probes visualization chart';
		target: self;
		order: 2;
		default: false
]

{ #category : #settings }
CMApplicationPreferences class >> cmSettingFixedVerticalTickOn: aBuilder [
	<cormasPreferences>
	
	(aBuilder setting: #settingFixedVerticalTick)
		label: 'Vertical ticks are fixed';
		parent: #cmChartSetting;
		description: 'Whether the vertical ticks are a fixed value in the Probes visualization chart';
		target: self;
		order: 3;
		default: false
]

{ #category : #settings }
CMApplicationPreferences class >> cmSettingProjectNotificationsOn: aBuilder [
	<cormasPreferences>
	
	(aBuilder setting: #settingProjectNotifications)
		label: 'Open/Close Notifications';
		parent: #cmLoadSetting;
		description: 'If disabled, you will not receive UI notifications when a project is opened or closed.';
		target: self;
		order: 5;
		default: self defaultProjectNotifications
]

{ #category : #settings }
CMApplicationPreferences class >> cmSettingShowProbesTitleOn: aBuilder [
	<cormasPreferences>
	
	(aBuilder setting: #settingShowProbesTitle)
		label: 'Include a title for the Probes Chart';
		parent: #cmChartSetting;
		description: 'Whether to show a title label in the Probes visualization chart';
		target: self;
		order: 1;
		default: false
]

{ #category : #settings }
CMApplicationPreferences class >> cmSettingSpaceViewerOn: aBuilder [
	<cormasPreferences>
	
	(aBuilder pickOne: #settingSpaceViewer)
		label: 'Space Viewer';
		parent: #cmGeneralSetting;
		description: 'You can use multiple types of space viewers, for example, one viewer could just record agent positions in different files, or screenshot each step to produce an animation.';
		target: self;
		order: 6;
		domainValues: self availableSettingSpaceDiagram;
		default: self defaultSettingSpaceDiagram
]

{ #category : #settings }
CMApplicationPreferences class >> cmSettingWaitLimitOn: aBuilder [
	<cormasPreferences>
	
	(aBuilder range: #settingWaitLimit)
		label: 'Wait limit';
		parent: #cmLoadSetting;
		description: 'How much time we should wait to load a model or project';
		target: self;
		order: 4;
		range: (1 to: 10);
		default: 1
]

{ #category : #settings }
CMApplicationPreferences class >> cmSettingWarnUsingOn: aBuilder [
	<cormasPreferences>
	
	(aBuilder pickOne: #settingWarnUsing)
		label: 'Report load warning to';
		parent: #cmLoadSetting;
		description: 'Where to report warnings while loading a model or project';
		target: self;
		order: 3;
		domainValues: self availableSettingWarnUsing;
		default: self defaultSettingWarnUsing
]

{ #category : #defaults }
CMApplicationPreferences class >> defaultBaseLocation [

	^ (FileLocator home / 'CORMAS') asFileReference fullName
]

{ #category : #defaults }
CMApplicationPreferences class >> defaultProjectNotifications [

	^ false
]

{ #category : #defaults }
CMApplicationPreferences class >> defaultSettingChartViewer [
	
	^ Smalltalk at: #CMR3ChartPresenter
]

{ #category : #defaults }
CMApplicationPreferences class >> defaultSettingFixedHorizontalTick [

	^ false
]

{ #category : #defaults }
CMApplicationPreferences class >> defaultSettingFixedVerticalTick [

	^ true
]

{ #category : #defaults }
CMApplicationPreferences class >> defaultSettingSpaceDiagram [
	
	^ Smalltalk at: #CMR3SpaceDiagram
]

{ #category : #settings }
CMApplicationPreferences class >> defaultSettingWarnUsing [
	
	^ CMLoadIgnoreException
]

{ #category : #'initialize - release' }
CMApplicationPreferences class >> release [
	" Clean receiver's class variables "
	<script>

	(self class organization listAtCategoryNamed: #accessing)
		select: #isKeyword
		thenDo: [ : selector | self perform: selector with: nil ]
]

{ #category : #accessing }
CMApplicationPreferences class >> settingBaseLocation [
	" Answer the settingBaseLocation of this CMPreferences "

	^ SettingBaseLocation
		ifNil: [ SettingBaseLocation := self defaultBaseLocation ]
]

{ #category : #accessing }
CMApplicationPreferences class >> settingBaseLocation: anObject [
	" Sets the settingBaseLocation of this CMPreferences "

	SettingBaseLocation := anObject
]

{ #category : #accessing }
CMApplicationPreferences class >> settingChartViewer [
	" Answer a <Class> with the currently selected Chart Viewers implementation "

	^ SettingChartViewer
		ifNil: [ SettingChartViewer := self defaultSettingChartViewer ]
]

{ #category : #accessing }
CMApplicationPreferences class >> settingChartViewer: anObject [

	SettingChartViewer := anObject
]

{ #category : #accessing }
CMApplicationPreferences class >> settingFixedHorizontalTick [
	" Answer the settingFixedHorizontalTick of this CMApplicationPreferences "

	^ SettingFixedHorizontalTick
		ifNil: [ SettingFixedHorizontalTick := self defaultSettingFixedHorizontalTick ]
]

{ #category : #accessing }
CMApplicationPreferences class >> settingFixedHorizontalTick: anObject [
	" Sets the settingFixedHorizontalTick of this CMApplicationPreferences "

	SettingFixedHorizontalTick := anObject
]

{ #category : #accessing }
CMApplicationPreferences class >> settingFixedVerticalTick [
	" Answer the settingFixedVerticalTick of this CMApplicationPreferences "

	^ SettingFixedVerticalTick
		ifNil: [ SettingFixedVerticalTick := self defaultSettingFixedVerticalTick ]
]

{ #category : #accessing }
CMApplicationPreferences class >> settingFixedVerticalTick: anObject [
	" Sets the settingFixedVerticalTick of this CMApplicationPreferences "

	SettingFixedVerticalTick := anObject
]

{ #category : #accessing }
CMApplicationPreferences class >> settingProjectNotifications [
	" Answer the settingProjectNotifications of this CMApplicationPreferences "

	^ SettingProjectNotifications
		ifNil: [ SettingProjectNotifications := self defaultProjectNotifications ]
]

{ #category : #accessing }
CMApplicationPreferences class >> settingProjectNotifications: anObject [
	" Sets the settingProjectNotifications of this CMApplicationPreferences "

	SettingProjectNotifications := anObject
]

{ #category : #accessing }
CMApplicationPreferences class >> settingShowProbesTitle [
	" Answer the settingShowProbesTitle of this CMApplicationPreferences "

	^ SettingShowProbesTitle
		ifNil: [ SettingShowProbesTitle := false ]
]

{ #category : #accessing }
CMApplicationPreferences class >> settingShowProbesTitle: anObject [
	" Sets the settingShowProbesTitle of this CMApplicationPreferences "

	SettingShowProbesTitle := anObject
]

{ #category : #accessing }
CMApplicationPreferences class >> settingSpaceViewer [

	^ SettingSpaceViewer
		ifNil: [ SettingSpaceViewer := self defaultSettingSpaceDiagram ]
]

{ #category : #accessing }
CMApplicationPreferences class >> settingSpaceViewer: anObject [

	SettingSpaceViewer := anObject
]

{ #category : #accessing }
CMApplicationPreferences class >> settingWaitLimit [
	" Answer the settingWaitLimit of this CMPreferences "

	^ SettingWaitLimit
]

{ #category : #accessing }
CMApplicationPreferences class >> settingWaitLimit: anObject [
	" Sets the settingWaitLimit of this CMPreferences "

	SettingWaitLimit := anObject
]

{ #category : #accessing }
CMApplicationPreferences class >> settingWarnUsing [
	" Answer the settingWarnUsing of this CMPreferences "

	^ SettingWarnUsing
		ifNil: [ SettingWarnUsing := self defaultSettingWarnUsing ]
]

{ #category : #accessing }
CMApplicationPreferences class >> settingWarnUsing: anObject [
	" Sets the settingWarnUsing of this CMPreferences "

	SettingWarnUsing := anObject
]
