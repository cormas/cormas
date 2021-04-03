Class {
	#name : #CMPreferences,
	#superclass : #Object,
	#classVars : [
		'SettingBaseLocation',
		'SettingWaitLimit',
		'SettingWarnUsing'
	],
	#category : #'Cormas-UI-Settings'
}

{ #category : #settings }
CMPreferences class >> availableSettingWarnUsing [
	
	^ CMLoadException allSubclasses 
]

{ #category : #settings }
CMPreferences class >> cmGeneralSettingOn: aBuilder [
	<cormasPreferences>
	
	(aBuilder group: #cmGeneralSetting)
		label: 'General';
		description: 'General application settings';
		order: 1
]

{ #category : #settings }
CMPreferences class >> cmLoadSettingOn: aBuilder [
	<cormasPreferences>
	
	(aBuilder group: #cmLoadSetting)
		label: 'Loading';
		description: 'Settings related to loading projects or models';
		order: 2
]

{ #category : #settings }
CMPreferences class >> cmSettingBaseLocationOn: aBuilder [
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
CMPreferences class >> cmSettingWaitLimitOn: aBuilder [
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
CMPreferences class >> cmSettingWarnUsingOn: aBuilder [
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
CMPreferences class >> defaultBaseLocation [

	^ (FileLocator home / 'CORMAS') asFileReference fullName
]

{ #category : #settings }
CMPreferences class >> defaultSettingWarnUsing [
	
	^ CMLoadIgnoreException
]

{ #category : #'initialize - release' }
CMPreferences class >> release [
	" Clean receiver's class variables.
	self release "

	(self class organization listAtCategoryNamed: #accessing)
		select: #isKeyword
		thenDo: [ : selector | self perform: selector with: nil ]
]

{ #category : #accessing }
CMPreferences class >> settingBaseLocation [
	" Answer the settingBaseLocation of this CMPreferences "

	^ SettingBaseLocation
]

{ #category : #accessing }
CMPreferences class >> settingBaseLocation: anObject [
	" Sets the settingBaseLocation of this CMPreferences "

	SettingBaseLocation := anObject
]

{ #category : #accessing }
CMPreferences class >> settingWaitLimit [
	" Answer the settingWaitLimit of this CMPreferences "

	^ SettingWaitLimit
]

{ #category : #accessing }
CMPreferences class >> settingWaitLimit: anObject [
	" Sets the settingWaitLimit of this CMPreferences "

	SettingWaitLimit := anObject
]

{ #category : #accessing }
CMPreferences class >> settingWarnUsing [
	" Answer the settingWarnUsing of this CMPreferences "

	^ SettingWarnUsing
]

{ #category : #accessing }
CMPreferences class >> settingWarnUsing: anObject [
	" Sets the settingWarnUsing of this CMPreferences "

	SettingWarnUsing := anObject
]
