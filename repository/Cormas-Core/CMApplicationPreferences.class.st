"
These are global Cormas settings. For each specific project settings, see class CMProjectPreferences.

"
Class {
	#name : #CMApplicationPreferences,
	#superclass : #Object,
	#classVars : [
		'SettingBaseLocation',
		'SettingFixedHorizontalTick',
		'SettingFixedVerticalTick',
		'SettingProjectNotifications',
		'SettingShowProbesTitle'
	],
	#category : #'Cormas-Core-Kernel'
}

{ #category : #defaults }
CMApplicationPreferences class >> defaultBaseLocation [

	^ (FileLocator home / 'CORMAS') asFileReference fullName
]

{ #category : #defaults }
CMApplicationPreferences class >> defaultProjectNotifications [

	^ false
]

{ #category : #defaults }
CMApplicationPreferences class >> defaultSettingFixedHorizontalTick [

	^ false
]

{ #category : #defaults }
CMApplicationPreferences class >> defaultSettingFixedVerticalTick [

	^ true
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
