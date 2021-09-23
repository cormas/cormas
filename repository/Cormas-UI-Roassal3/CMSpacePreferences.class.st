Class {
	#name : #CMSpacePreferences,
	#superclass : #CMObject,
	#classVars : [
		'SpaceCellColorSetting',
		'SpaceCellSizeSetting',
		'SpaceElementTypeSetting',
		'SpaceLayoutSetting',
		'SpaceSituatedEntityTypeSetting'
	],
	#category : #'Cormas-UI-Roassal3-Settings'
}

{ #category : #settings }
CMSpacePreferences class >> availableSpaceCellColorSetting [
	
	^ { #red . #blue . #green }.
]

{ #category : #settings }
CMSpacePreferences class >> availableSpaceElementTypeSetting [
	
	^ { RSCircle . RSBox . RSPolygon }.
]

{ #category : #settings }
CMSpacePreferences class >> availableSpaceLayoutSetting [
	
	^ { RSGridLayout . RSVerticalGridLayout . RSRadialTreeLayout . RSCellLayout . RSFlowLayout . RSHorizontalFlowLayout . RSTreeLayout . RSClusterLayout }.
]

{ #category : #settings }
CMSpacePreferences class >> availableSpaceSituatedEntityTypeSetting [
	
	^ { RSEllipse . RSCircle . RSBox . RSBitmap . RSPieSlice }.
]

{ #category : #settings }
CMSpacePreferences class >> cmSpaceCellColorSettingOn: aBuilder [
	<cormasSpacePreferences>
	
	(aBuilder pickOne: #spaceCellColorSetting)
		label: 'General Space Settings';
		parent: #cMSpaceSetting;
		description: 'Base color of the cell in the space';
		target: self;
		order: 5;
		domainValues: self availableSpaceCellColorSetting;
		default: self defaultSpaceCellColorSetting
]

{ #category : #settings }
CMSpacePreferences class >> cmSpaceCellSizeSettingOn: aBuilder [
	<cormasSpacePreferences>
	
	(aBuilder range: #spaceCellSizeSetting)
		label: 'General Space Settings';
		parent: #cMSpaceSetting;
		description: 'Size of the cell in the space';
		target: self;
		order: 1;
		range: (1 to: 10);
		default: 1
]

{ #category : #settings }
CMSpacePreferences class >> cmSpaceElementTypeSettingOn: aBuilder [
	<cormasSpacePreferences>
	
	(aBuilder pickOne: #spaceElementTypeSetting)
		label: 'General Space Settings';
		parent: #cMSpaceSetting;
		description: 'Type of the shape of the space';
		target: self;
		order: 2;
		domainValues: self availableSpaceElementTypeSetting;
		default: self defaultSpaceElementTypeSetting
]

{ #category : #settings }
CMSpacePreferences class >> cmSpaceLayoutSettingOn: aBuilder [
	<cormasSpacePreferences>
	
	(aBuilder pickOne: #spaceLayoutSetting)
		label: 'General Space Settings';
		parent: #cMSpaceSetting;
		description: 'Layout of the space';
		target: self;
		order: 3;
		domainValues: self availableSpaceLayoutSetting;
		default: self defaultSpaceLayoutSetting
]

{ #category : #settings }
CMSpacePreferences class >> cmSpaceSituatedEntityTypeSettingOn: aBuilder [
	<cormasSpacePreferences>
	
	(aBuilder pickOne: #spaceSituatedEntityTypeSetting)
		label: 'General Space Settings';
		parent: #cMSpaceSetting;
		description: 'Shape of the situated entities of the space';
		target: self;
		order: 4;
		domainValues: self availableSpaceSituatedEntityTypeSetting;
		default: self defaultSpaceSituatedEntityTypeSetting
]

{ #category : #defaults }
CMSpacePreferences class >> defaultSpaceCellColorSetting [
	
	^ self availableSpaceCellColorSetting first
]

{ #category : #defaults }
CMSpacePreferences class >> defaultSpaceElementTypeSetting [
	
	^ self availableSpaceElementTypeSetting first
]

{ #category : #defaults }
CMSpacePreferences class >> defaultSpaceLayoutSetting [
	
	^ self availableSpaceLayoutSetting first
]

{ #category : #defaults }
CMSpacePreferences class >> defaultSpaceSituatedEntityTypeSetting [
	
	^ self availableSpaceSituatedEntityTypeSetting first
]

{ #category : #accessing }
CMSpacePreferences class >> spaceCellColorSetting [
	" Answer the spaceCellColorSetting of this CMSpacePreferences "

	^ SpaceCellColorSetting
]

{ #category : #accessing }
CMSpacePreferences class >> spaceCellColorSetting: anObject [
	" Sets the spaceCellColorSetting of this CMSpacePreferences "

	SpaceCellColorSetting := anObject
]

{ #category : #accessing }
CMSpacePreferences class >> spaceCellSizeSetting [
	" Answer the spaceCellSizeSetting of this CMSpacePreferences "

	^ SpaceCellSizeSetting
]

{ #category : #accessing }
CMSpacePreferences class >> spaceCellSizeSetting: anObject [
	" Sets the spaceCellSizeSetting of this CMSpacePreferences "

	SpaceCellSizeSetting := anObject
]

{ #category : #accessing }
CMSpacePreferences class >> spaceElementTypeSetting [
	" Answer the spaceElementTypeSetting of this CMSpacePreferences "

	^ SpaceElementTypeSetting
]

{ #category : #accessing }
CMSpacePreferences class >> spaceElementTypeSetting: anObject [
	" Sets the spaceElementTypeSetting of this CMSpacePreferences "

	SpaceElementTypeSetting := anObject
]

{ #category : #accessing }
CMSpacePreferences class >> spaceLayoutSetting [
	" Answer the spaceLayoutSetting of this CMSpacePreferences "

	^ SpaceLayoutSetting
]

{ #category : #accessing }
CMSpacePreferences class >> spaceLayoutSetting: anObject [
	" Sets the spaceLayoutSetting of this CMSpacePreferences "

	SpaceLayoutSetting := anObject
]

{ #category : #accessing }
CMSpacePreferences class >> spaceSituatedEntityTypeSetting [
	" Answer the spaceSituatedEntityTypeSetting of this CMSpacePreferences "

	^ SpaceSituatedEntityTypeSetting
]

{ #category : #accessing }
CMSpacePreferences class >> spaceSituatedEntityTypeSetting: anObject [
	" Sets the spaceSituatedEntityTypeSetting of this CMSpacePreferences "

	SpaceSituatedEntityTypeSetting := anObject
]
