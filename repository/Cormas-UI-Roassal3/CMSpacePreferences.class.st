Class {
	#name : #CMSpacePreferences,
	#superclass : #CMObject,
	#classVars : [
		'SpaceElementTypeSetting',
		'SpaceGapSetting',
		'SpaceSituatedEntityTypeSetting'
	],
	#category : #'Cormas-UI-Roassal3-Settings'
}

{ #category : #settings }
CMSpacePreferences class >> availableSpaceElementTypeSetting [
	
	^ #(
	Square
	Circle
	Arrow
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

{ #category : #defaults }
CMSpacePreferences class >> defaultSpaceSituatedEntityTypeSetting [
	
	^ self availableSpaceSituatedEntityTypeSetting first
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
		ifNil: [ SpaceSituatedEntityTypeSetting := self defaultSpaceSituatedEntityTypeSetting ]
]

{ #category : #accessing }
CMSpacePreferences class >> spaceSituatedEntityTypeSetting: anObject [
	" Sets the spaceSituatedEntityTypeSetting of this CMSpacePreferences "

	SpaceSituatedEntityTypeSetting := anObject.

]
