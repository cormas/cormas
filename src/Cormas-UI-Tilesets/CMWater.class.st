Class {
	#name : 'CMWater',
	#superclass : 'CMTileset',
	#category : 'Cormas-UI-Tilesets',
	#package : 'Cormas-UI-Tilesets'
}

{ #category : 'animation' }
CMWater class >> flowing [

	<script: 'self flowing inspect'>
	^ { 
		self frame00 .
		self frame01 .
		self frame02 .
		self frame03
	}
]

{ #category : 'accessing - icons' }
CMWater class >> frame00 [
	"Private - Generated method"
	<script: 'self frame00 inspect'>
	^ self icons
		at: #frame00
		ifAbsentPut: [ self formFromBase64: self frame00Contents ]
]

{ #category : 'private - contents' }
CMWater class >> frame00Contents [
	"Private - Method generated with the content of the file File @ /Users/zaitsev/Downloads/tiles/water/00_Water_1.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAAHFJREFUOI1jnH3l8H8GEoEYz284m4VUzQwMDAyvvrASZwCyTciakAFeA3BpQgZMBFUQACzEOBMXEOP5zcBCqiZk8OoLKxW8QIwiZG/CbCbJAHzexPCCGM9vDBvxAQwXkBqoZCVlovMCrjRCdCDSJSkDAIlcJBD5Z1s/AAAAAElFTkSuQmCC'
]

{ #category : 'accessing - icons' }
CMWater class >> frame01 [
	"Private - Generated method"
	<script: 'self frame01 inspect'>
	^ self icons
		at: #frame01
		ifAbsentPut: [ self formFromBase64: self frame01Contents ]
]

{ #category : 'private - contents' }
CMWater class >> frame01Contents [
	"Private - Method generated with the content of the file File @ /Users/zaitsev/Downloads/tiles/water/01_Water_2.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAAHJJREFUOI2lUjkSgCAMXJ3YUfP/L/gB30JtbUehjcxEIiSBrfeELHs67vPa4EUMGQBAI2IAKDqypHBBja6Bpd2qMhQQr2lN/RiMPmLB/AQrsTXVbNCaKibEkEVaD6KB+xdc7Be8oWrwd868pWqgTZq+gwdk8yTz+odergAAAABJRU5ErkJggg=='
]

{ #category : 'accessing - icons' }
CMWater class >> frame02 [
	"Private - Generated method"
	<script: 'self frame02 inspect'>
	^ self icons
		at: #frame02
		ifAbsentPut: [ self formFromBase64: self frame02Contents ]
]

{ #category : 'private - contents' }
CMWater class >> frame02Contents [
	"Private - Method generated with the content of the file File @ /Users/zaitsev/Downloads/tiles/water/02_Water_3.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAAHBJREFUOI1j3Phg3/9XX1gZSAViPL8ZGBgYGFjI0czAwMAA08dCrE3ImpABQQMIuZCJkAGEAAuyE4mxEcMAcgMRBij3ArEKcXmVaANweRWrF8R4fmPYiAtgdQEpActErE3oAOZKgtGIKykTHYg0T8oAmf4pDpf12hIAAAAASUVORK5CYII='
]

{ #category : 'accessing - icons' }
CMWater class >> frame03 [
	"Private - Generated method"
	<script: 'self frame03 inspect'>
	^ self icons
		at: #frame03
		ifAbsentPut: [ self formFromBase64: self frame03Contents ]
]

{ #category : 'private - contents' }
CMWater class >> frame03Contents [
	"Private - Method generated with the content of the file File @ /Users/zaitsev/Downloads/tiles/water/03_Water_4.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAAHdJREFUOI2tUjsOgCAMfZKyMXN5j+MVPAUzG4NOmEZrP9E3QcL7lS7rvh0IopZxnSlKBoDWs1+Au3GiW0AicSRLwAJZETXUMkBREkfr+YcKnke85nQOCWg1xQq1jIfrG8QEkcEmr9MdM6X6jdqOzLs6RE+Vz3twAr5nKCtR/kBSAAAAAElFTkSuQmCC'
]
