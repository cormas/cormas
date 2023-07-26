"
These are global Cormas settings. For each specific project settings, see class CMProjectPreferences.

"
Class {
	#name : #CMApplicationPreferences,
	#superclass : #Object,
	#category : #'Cormas-Core-Kernel'
}

{ #category : #'initialize - release' }
CMApplicationPreferences class >> release [
	" Clean receiver's class variables "
	<script>

	(self class organization listAtCategoryNamed: #accessing)
		select: #isKeyword
		thenDo: [ : selector | self perform: selector with: nil ]
]
