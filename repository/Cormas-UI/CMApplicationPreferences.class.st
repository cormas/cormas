"
These are global Cormas settings. For each specific project settings, see class CMProjectPreferences.

"
Class {
	#name : #CMApplicationPreferences,
	#superclass : #Object,
	#classVars : [
		'SettingBaseLocation',
		'SettingProjectNotifications',
		'SettingSpaceViewer',
		'SettingWaitLimit',
		'SettingWarnUsing'
	],
	#category : #'Cormas-UI-Settings'
}

{ #category : #settings }
CMApplicationPreferences class >> availableSettingSpaceViewer [
	
	^ { 
		CMSpaceView .
	 	CMSpaceAnimationRecorder 
		}.
]

{ #category : #settings }
CMApplicationPreferences class >> availableSettingWarnUsing [
	
	^ CMLoadException allSubclasses 
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
CMApplicationPreferences class >> cmSettingSpaceViewerOn: aBuilder [
	<cormasPreferences>
	
	(aBuilder pickOne: #settingSpaceViewer)
		label: 'Space Viewer';
		parent: #cmGeneralSetting;
		description: 'You can use multiple types of space viewers, for example, one viewer could just record agent positions in different files, or screenshot each step to produce an animation.';
		target: self;
		order: 6;
		domainValues: self availableSettingSpaceViewer;
		default: self defaultSettingSpaceViewer
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
CMApplicationPreferences class >> defaultSettingSpaceViewer [
	
	^ self availableSettingSpaceViewer first
]

{ #category : #settings }
CMApplicationPreferences class >> defaultSettingWarnUsing [
	
	^ CMLoadIgnoreException
]

{ #category : #'initialize - release' }
CMApplicationPreferences class >> release [
	" Clean receiver's class variables.
	self release "

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
CMApplicationPreferences class >> settingSpaceViewer [
	^ SettingSpaceViewer
		ifNil: [ SettingSpaceViewer := self defaultSettingSpaceViewer ]
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
