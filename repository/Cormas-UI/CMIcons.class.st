Class {
	#name : 'CMIcons',
	#superclass : 'Object',
	#classInstVars : [
		'icons'
	],
	#category : 'Cormas-UI',
	#package : 'Cormas-UI'
}

{ #category : 'icons' }
CMIcons class >> chartIcon [

	^ self icons
		at: #chartIcon
		ifAbsentPut: [
			(Form fromBinaryStream: self chartIconContents base64Decoded asByteArray readStream)
				 scaledToSize: 20@20 ]
]

{ #category : 'icons - base64' }
CMIcons class >> chartIconContents [
	
	^ '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'
]

{ #category : 'as yet unclassified' }
CMIcons class >> colorGreen [

	^ Color fromHexString: '00b44c'
]

{ #category : 'icons' }
CMIcons class >> csvIcon [

	^ self icons
		at: #csvIcon
		ifAbsentPut: [
			(Form fromBinaryStream: self csvIconContents base64Decoded asByteArray readStream)
				 scaledToSize: 20@20 ]
]

{ #category : 'icons - base64' }
CMIcons class >> csvIconContents [

	^ 'iVBORw0KGgoAAAANSUhEUgAAADAAAAAwCAYAAABXAvmHAAAACXBIWXMAAAsTAAALEwEAmpwYAAADWklEQVR4nO2X/U+SURTH+a1/oa1/pF9aW5Py99YP4qYrKG1mW+Wy1Mmsli/Zi2ZaaYrio5YrDcvXlFUCDzVfM3SJlKmgmMlTirwIp92jMHEUiD4XTM52xnPuuVzOh/s99+4RCKIWNX6NNWqBH2fzdi1A32wfPQiWB4AFq5EeBMsDAGebowfB8gRADYL1UwCjq/frweY9ABwNCL4BOL4h+JQQRwOCFgDHFwQNCXF8QtAG4DZB8AJA0wV7HiCh4jKE0wXbtT0NIK7KgFNVGZEH8KCHAaPFDM5VJxgXzVCjbvbJS5uL4ev8NLjBDS63Cz4YhuGsXIo5tX4AlmxWaPzY7p1f2sPg2IT5O/8Aea2PsLBluxU+z+hhxWEHYgVtFZg/LcsCi/U3jmkmBrEoYqrxfsxXq5owHpn54l2zZ5TFsY6R9/wDaA1D+GP5reUYlynr14rVD2CcoyjB2DA/hXFKbQ7GKw4bxpee5nnjk5VXcGzqpwnHbrVX8A8w+WMGf0wiy8T4QsNNeDWkBFnvC2/sdrvB5rTDnc4qv7omsiOW3VSE0vLMJz3DO8DiMocS+lfjESCPEZndaCn1ybd/eoc5ufol3O6oxOeBSR2dJg4GgHhRV7V3t0gjl3TXenMFbeU4zk4MgmKwG59lqrUdpCYhz3afY65BZe9zuNspw5hIguicfCY+SQdGo8D5Jsu8dw1ytBLJLCxZYMxkwPzFhlw6AJ4mzmq6h/H9brnPKVO7XrBylMU4uUaKMSl44zr9kzocX3W5YHpxlt49kPt67Rg1/1qA3vE+4NaPTCILkif/pN3pAMeqE97o1N5CdUa9zzpEMh5rHX5L9yIjeiYnCSmSHIFlyrpNd8VjlIzHxue+QdqzfJ85BNRj5G6hChCspzLXIak6e8vfE4okfp06QKgujAJssHC8hQl3cgf+SwBmmy/1gfLCKMD/LiF2twMwO9gDKYXSvxYcyGNEkodhB5CP1EF8elooAOrY2NR9ESGhrjElHE8+v5XiTUcSkg6ELCE+vFHTArEJSYGLjxM7jsVLDgVVPE0A1qiFMoU8IMBRkeRM0MXTBmCNWrhaXLi9pg03gGpKA5LMrNCbNhLs8InE/cI48XRITRspFhMvORgjEtu23LSRZKRhAzXtH8TEVoEYhfoOAAAAAElFTkSuQmCC'
]

{ #category : 'icons' }
CMIcons class >> excelIcon [

	^ self icons
		at: #excelIcon
		ifAbsentPut: [
			(Form fromBinaryStream: self excelIconContents base64Decoded asByteArray readStream) 
				scaledToSize: 20@20 ]
]

{ #category : 'icons - base64' }
CMIcons class >> excelIconContents [

	^ 'iVBORw0KGgoAAAANSUhEUgAAADAAAAAwCAYAAABXAvmHAAAACXBIWXMAAAsTAAALEwEAmpwYAAACcklEQVR4nGNgGAWjYBSMgmEJDOsNpfRqDX11aw0bdGsNN+vWGj5jGIzAvt6eRb9GX1uvxiBOt8Zwol6t0W69WsM3erVG/9HxQLuVQb3Uilev2thGt9YoDeRY3RrDI3o1ht+xOXbAPaBboSsIdmyNUb5ujdEi3Rqjq3o1Rn+JdeyAe0CPAofiwj7rA8jC3uv9jwxpD/isDyA99kY9UDsaA/8HXRJCBjCH4QOjHtBDCr3Obd0ooVO+qgpF3q7d6f+XH1/g8j07+gZXDBjWm/6/9eI23PC7r+7+N6gzgcsvPb4cLnfn5Z3/Rg1mg68YTZmfjhJCuUsKwOIevT7/f/7+CRb79+/f/+R5aYO3Hth7bT/cA5ceXwaLbbmwFS62+cKWwZ2Jvfp8//+AhjYIlKws///3318w+9P3T/8dO10Gtwf0ao3+zzowB27Jx28f4ez2LZ1Doxg1b7b+//LjSxTLrj+78d+gHpGpB20e0Ks1+m/VaofhgWfvn/03a7IaGh5YfXot3OGvP7+Bs2funz34k1Di3BRwUQkC3399/5+3tBBuIago9Z0QOHg9YNJo8f/uq3twC+YcnAcWP3r7GFzs2J0Tg9cDMw/MRil9bNscwOKhUyPgRSkIlK6sGHx5IGhy6P9ff37hbOvsvLwLJV+AMvqg8YBBncn/8w8vwB0IKoFMmyxRHTch4P+fv3/gahYfWzr4kpAehXjUAwMdA4OmItMb9UDAaAwMqSTkvd7/MMOIG9zFNbyuW2tkDJsLGNTD6+RMcOjVGnWAZmMG7QQHCYBRq95QRbfOOFS31rBNr8Zom16N4XNSDBgFo2AUjAKGIQEAkqNB3aFhJ4wAAAAASUVORK5CYII='
]

{ #category : 'accessing' }
CMIcons class >> icons [

	^ icons ifNil: [ icons := Dictionary new ]
]

{ #category : 'class initialization' }
CMIcons class >> initialize [

	icons := Dictionary new
]

{ #category : 'examples' }
CMIcons class >> inspectIcons [

	<example>
	SpTablePresenter new
		addColumn: (SpImageTableColumn title: 'Icon' evaluated: #value);
		addColumn: (SpStringTableColumn title: 'Name' evaluated: #key);
		items:
			((self class selectorsInProtocol: 'icons') sorted
				 collect: [ :each | each -> (self perform: each) ]);
		whenSelectedItemChangedDo: [ :assoc | assoc value inspect ];
		open
]

{ #category : 'icons' }
CMIcons class >> runIcon [

	| form |
	icons at: #runIcon ifPresent: [ :icon | ^ icon ].
	
	form := Form extent: 16 @ 16 depth: 32.
	form getCanvas
		fillColor: Color transparent;
		drawPolygon: { 
				(4 @ 2).
				(12 @ 8).
				(4 @ 14) }
		color: self colorGreen
		borderWidth: 0
		borderColor: Color darkGray.
	
	^ icons at: #runIcon put: form
]

{ #category : 'icons' }
CMIcons class >> stepIcon [

	| form |
	icons at: #stepIcon ifPresent: [ :icon | ^ icon ].
	
	form := Form extent: 16 @ 16 depth: 32.
	form getCanvas
		fillColor: Color transparent;
		drawPolygon: { 
				(1 @ 2).
				(9 @ 8).
				(1 @ 14) }
		color: self colorGreen
		borderWidth: 0
		borderColor: self colorGreen;
		fillRectangle: (11 @ 3 corner: 14 @ 14) color: self colorGreen.
	
	^ icons at: #stepIcon put: form
]
