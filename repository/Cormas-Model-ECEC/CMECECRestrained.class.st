Class {
	#name : #CMECECRestrained,
	#superclass : #CMECECForager,
	#category : #'Cormas-Model-ECEC'
}

{ #category : #'pov symbols' }
CMECECRestrained class >> VectorialPOV_Restrained [
	^ #(0.0 0.329996 1.0 0.0 0.0 0.0 1 0.7 #center #( -7.395 #@- 9.6963 24.99 #@- 13.537 16.32 #@ 24.8704 4.08 #@ 4.72222  -9.69 #@ 24.2407  -10.71 #@ 10.3889  -14.28 #@ 2.83333  -26.01 #@- 4.09259  -25.5 #@- 9.12963  -15.81 #@- 13.537  -13.26 #@- 26.1296  -13.26 #@- 14.1667  -7.395 #@- 9.6963))
]

{ #category : #accessing }
CMECECRestrained class >> catabolicRate [
	| tmp2 |
	tmp2 := catabolicRate.
	^ tmp2 ifNil: [ catabolicRate := 2 ] ifNotNil: [ tmp2 ]
]

{ #category : #accessing }
CMECECRestrained class >> fertilityThreshold [
	| tmp2 |
	tmp2 := fertilityThreshold.
	^ tmp2 ifNil: [ fertilityThreshold := 100 ] ifNotNil: [ tmp2 ]
]

{ #category : #accessing }
CMECECRestrained class >> harvestRate [
	| tmp2 |
	tmp2 := harvestRate.
	^ tmp2 ifNil: [ harvestRate := 0.5 ] ifNotNil: [ tmp2 ]
]

{ #category : #'default value' }
CMECECRestrained class >> harvestRate_default [
	^ 0.5
]

{ #category : #testing }
CMECECRestrained class >> isAbstract [
	^ false
]

{ #category : #accessing }
CMECECRestrained >> energy [
	| tmp2 |
	tmp2 := energy.
	^ tmp2 ifNil: [ energy := 50 ] ifNotNil: [ tmp2 ]
]

{ #category : #accessing }
CMECECRestrained >> energy: arg1 [
	energy := arg1
]

{ #category : #pov }
CMECECRestrained >> pov [
	^ Color blue
]

{ #category : #pov }
CMECECRestrained >> povEnergy [
	^ self
		povAttribute: #energy
		min: 0
		max: 180
		color: Color blue
]
