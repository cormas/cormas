Class {
	#name : #CMSpacePreferences,
	#superclass : #CMObject,
	#classVars : [
		'SpaceCellColorSetting',
		'SpaceCellSizeSetting',
		'SpaceElementTypeSetting',
		'SpaceGapSetting',
		'SpaceSituatedEntityTypeSetting'
	],
	#category : #'Cormas-UI-Roassal3-Settings'
}

{ #category : #settings }
CMSpacePreferences class >> availableSpaceElementTypeSetting [
	
	^ #(Circle
	Arrow
	Square
	Pentagon
	Hexagon
	Plus
	Diamond
	Star)
]

{ #category : #settings }
CMSpacePreferences class >> availableSpaceSituatedEntityTypeSetting [
	
	^ { RSEllipse . RSCircle . RSBox . RSBitmap . RSPieSlice }.
]

{ #category : #settings }
CMSpacePreferences class >> cmSpaceCellColorSettingOn: aBuilder [
	<cormasSpacePreferences>
	
	(aBuilder group: #cmSpaceSetting)
		label: 'General Settings';
		description: 'Settings related with Space Interface visualization';
		order: 1
]

{ #category : #settings }
CMSpacePreferences class >> cmSpaceCellSizeSettingOn: aBuilder [
	<cormasSpacePreferences>
	
	(aBuilder range: #spaceCellSizeSetting)
		label: 'Cell size';
		parent: #cmSpaceSetting;
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
		label: 'Shape type';
		parent: #cmSpaceSetting;
		description: 'Type of the shape of the space';
		target: self;
		order: 2;
		domainValues: self availableSpaceElementTypeSetting;
		default: self availableSpaceElementTypeSetting first
]

{ #category : #settings }
CMSpacePreferences class >> cmSpaceGapSettingOn: aBuilder [
	<cormasSpacePreferences>
	
	(aBuilder range: #spaceGapSetting)
		label: 'Space gap';
		parent: #cmSpaceSetting;
		description: 'Gap of the space cells';
		target: self;
		order: 3;
		range: (0 to: 50);
		default: 0
]

{ #category : #settings }
CMSpacePreferences class >> cmSpaceSituatedEntityTypeSettingOn: aBuilder [
	<cormasSpacePreferences>
	
	(aBuilder pickOne: #spaceSituatedEntityTypeSetting)
		label: 'Shape type of situated entities';
		parent: #cmSpaceSetting;
		description: 'Shape of the situated entities of the space';
		target: self;
		order: 4;
		domainValues: self availableSpaceSituatedEntityTypeSetting;
		default: self defaultSpaceSituatedEntityTypeSetting
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
		ifNil: [ SpaceElementTypeSetting := self availableSpaceElementTypeSetting first ]
]

{ #category : #accessing }
CMSpacePreferences class >> spaceElementTypeSetting: anObject [
	" Sets the spaceElementTypeSetting of this CMSpacePreferences "

	SpaceElementTypeSetting := anObject
]

{ #category : #accessing }
CMSpacePreferences class >> spaceGapSetting [
	" Answer the spaceLayoutSetting of this CMSpacePreferences "

	^ SpaceGapSetting
		ifNil: [ SpaceGapSetting := 0 ]
]

{ #category : #accessing }
CMSpacePreferences class >> spaceGapSetting: anObject [
	" Sets the spaceLayoutSetting of this CMSpacePreferences "

	SpaceGapSetting := anObject.
"	CMR3SpacePresenter allInstancesDo: [ : sp | 
		sp 
			clearView;
			addViewForCells: sp model theESE;
			addViewForAgents: sp model allTheSituatedEntities.		
		sp canvas signalUpdate ]."
		
]

{ #category : #accessing }
CMSpacePreferences class >> spaceSituatedEntityTypeSetting [
	" Answer the spaceSituatedEntityTypeSetting of this CMSpacePreferences "

	^ SpaceSituatedEntityTypeSetting
]

{ #category : #accessing }
CMSpacePreferences class >> spaceSituatedEntityTypeSetting: anObject [
	" Sets the spaceSituatedEntityTypeSetting of this CMSpacePreferences "

	SpaceSituatedEntityTypeSetting := anObject.

]
