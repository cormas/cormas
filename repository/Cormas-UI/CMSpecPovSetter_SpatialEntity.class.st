Class {
	#name : #'CMSpecPovSetter_SpatialEntity',
	#superclass : #CMSpecPovSetter,
	#category : #'Cormas-UI-PoV'
}

{ #category : #changed }
CMSpecPovSetter_SpatialEntity >> colorChanged [
	
	| color w |
	color := super colorChanged.
	w := (self builder componentAt: #imageOS) widget.
	w bounds asFiller displayOn: (w graphicsContext paint: color)
]

{ #category : #'saving&removing pov symbols' }
CMSpecPovSetter_SpatialEntity >> removeClassMethodForSymbol: aSymbol [
	
	selectedClass class
		removeSelector: ('SpatialEntityPOV_' , aSymbol) asSymbol
]

{ #category : #'saving&removing pov symbols' }
CMSpecPovSetter_SpatialEntity >> saveSpatialEntityPOVcolor: color intoClass: aClass symbol: aSymbol [
	
	| selector |
	selector := 'SpatialEntityPOV_' , aSymbol.
	aClass class
		compile:
			(selector ,
					'\"Returns an array containing the settings of a Spatial entity pov symbol in the following order:\(color red) (color green) (color blue)"\^Array with: '
				, color red printString , ' with: ' , color green printString ,
					' with: ' , color blue printString) withCRs
		classified: 'pov symbols'
		notifying: nil
]
