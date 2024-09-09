Class {
	#name : 'CMBoat',
	#superclass : 'Object',
	#classVars : [
		'icons'
	],
	#category : 'Cormas-UI-Tilesets',
	#package : 'Cormas-UI-Tilesets'
}

{ #category : 'animations' }
CMBoat class >> docked [

	<script: 'self docked inspect'>
	^ { 
		self frame00 .
		self frame01
	}
]

{ #category : 'animations' }
CMBoat class >> floating [

	<script: 'self floating inspect'>
	^ { 
		self frame03 .
		self frame04
	}
]

{ #category : 'accessing - icons' }
CMBoat class >> frame00 [
	"Private - Generated method"
	<script: 'self frame00 inspect'>
	^ self icons
		at: #frame00
		ifAbsentPut: [ Form fromBinaryStream: self frame00Contents base64Decoded asByteArray readStream ]
]

{ #category : 'private - contents' }
CMBoat class >> frame00Contents [
	"Private - Method generated with the content of the file File @ /Users/zaitsev/Downloads/Boats/00_Boats.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAADAAAAAgCAYAAABU1PscAAAAAXNSR0IArs4c6QAAAc5JREFUWEdjZBjigHGIu59h1AMDHYPwGDgyK+c/yDE2aVOGVKyAHTshKfa/lPgfcGA+e8nCUDBv8ZDxxPDwACwWQPRQCn2Qe+FJZVVl5P+hlnxQPACLhSEbAyPOA6CSi5p1ALkxD88DIAcRMgTZ0T7hutR0P8OWlZfB5hFyA7qlRHkA5nBkR9+6cIOqHlAz0ACbB/IIKZ6A1wO4NIEcD3M4NkfzCXKBLf70/htRHsKnHuQJqnoA5nhsDv/y4TvYwVKKwpAa/P5bojyASz2PACcD1TyAntZhHoA5Gtml1PIAyEwjB0PyYgC5JkbOSLAYOHfgPM7QHTQewObCIemBz1+e/+flkUQpnWCZGFtM0CIGkid1MSC7AV/mwttsBnlmbl4Zg4kFP9gMCXk5uFkwz1DLA6D0j60YRQ9QnPUAugRII0wM2RMwMWTPEFX8EFD04uEjhjMnPjKAQh8GiIkFgh0XZI9cXNZKDbfiNAPZA8Q4HmQQQQ8g2wbyDK08AXM8sQ6HuYskD4A0wWKEmh7Rj6oGu4dUx5MUA+iZCTlpUZquyHE4WTEAczQlFuLyLKHSBpc+kpMQpaGNq7QjN1AG3AOUBsioBygNQUr1D/kYAAAQfhIwAMXceAAAAABJRU5ErkJggg=='
]

{ #category : 'accessing - icons' }
CMBoat class >> frame01 [
	"Private - Generated method"
	<script: 'self frame01 inspect'>
	^ self icons
		at: #frame01
		ifAbsentPut: [ Form fromBinaryStream: self frame01Contents base64Decoded asByteArray readStream ]
]

{ #category : 'private - contents' }
CMBoat class >> frame01Contents [
	"Private - Method generated with the content of the file File @ /Users/zaitsev/Downloads/Boats/01_Boats.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAADAAAAAgCAYAAABU1PscAAAAAXNSR0IArs4c6QAAAdpJREFUWEdjZBjigHGIu59h1AMDHYPwGDgyK+c/yDE2aVOGVKyAHTshKfa/lPgfcGA+e8nCUDBv8ZDxxPDwACwWQPRQCn2Qe+FJZVVl5P+hlnxQPACLhSEbA6MeGKAKAaW4BBWnxCYhkFpquplYe9HthHuAGMcjO9onXJea7mfYsvIy2DxSPUKUB2AOR3b0rQs3qOoBNQMNsHkgj5DiCXhFhksTyPEwh2NzNJ8gF9jiT++/EeUhfOpBnqCqB2COx+bwLx++gx0spSgMaYLcf0uUB3Cp5xHgZKCaB9DTOswDMEcju5RaHgCZaeRgSF4MIDclkDMSLAbOHTiPM3Rp4YHkSV0MvDySRDUo8SoaKA+QnIlhwfv5y/P/yD4H8efmlTHAMjG2mKBFDJDtAeR0AnI8iA/ygIkFP1hKQl4OrgTmGWp5AJT+YcUoKAmBACww0QMW2Z14kxA2T8A0I3uGqOKHgKIXDx8xnDnxkQHd8YTMJiqjwDxycVkrIfMoktePqkYJeWIMI8oDyHkExqamZ2AOR042xDgepIYkD2DLI8RahE8dsUUmNjOI8gC+TEQND1BiBlEeAFkAyweUhBYhh5ITUER7gJDllMhTEjiDwgOUeH7UA5SEHjX0AgAqLwwwDcuWlQAAAABJRU5ErkJggg=='
]

{ #category : 'accessing - icons' }
CMBoat class >> frame03 [
	"Private - Generated method"
	<script: 'self frame03 inspect'>
	^ self icons
		at: #frame03
		ifAbsentPut: [ Form fromBinaryStream: self frame03Contents base64Decoded asByteArray readStream ]
]

{ #category : 'private - contents' }
CMBoat class >> frame03Contents [
	"Private - Method generated with the content of the file File @ /Users/zaitsev/Downloads/Boats/03_Boats.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAADAAAAAgCAYAAABU1PscAAAAAXNSR0IArs4c6QAAAY9JREFUWEdjZBjigHGIu59h1AMDHYOjMTAaAxSGwGgSojAAKdY+GgMUByGFBpAdAxOSYv9TaDeK9oJ5i8lyC0makB3tE65LTfczbFl5GWweqR4hygMwhyM7+taFG1T1gJqBBtg8kEdI8QRBD4AcD3M4NkfzCXKBLf70/htRHsKnHuQJqnoA5nhsDv/y4TvYwVKKwmD62f23RHkAl3oeAU4GmnsA5mhkl1LLAyAzjRwMaRMD5w6cxxm6ox5AChqqxMDnL8//8/JIwjM3cibGFhO0iIHkSV0MyG7Al7nwlkIgz8zNK2MwseAHmyEhLwc3C+YZankAFPrYilH0AEX3DE4PgDTCFCN7AiaG7Bmiih8Cil48fMRw5sRHBlDowwAxsUCwHkD2yMVlrdRwK04zkD1AjONBBhH0ALJtIM/QyhMwxxPrcJi7SPIASBMsRqjpEf2oarB7SHU8STGAnpmQkxal6Yoch5MVAzBHU2IhLs8SKm1w6SM5CVEa2uj6KQ2UAfcApQEy6gFKQ5BS/UM+BgBCD9IhNsdImwAAAABJRU5ErkJggg=='
]

{ #category : 'accessing - icons' }
CMBoat class >> frame04 [
	"Private - Generated method"
	<script: 'self frame04 inspect'>
	^ self icons
		at: #frame04
		ifAbsentPut: [ Form fromBinaryStream: self frame04Contents base64Decoded asByteArray readStream ]
]

{ #category : 'private - contents' }
CMBoat class >> frame04Contents [
	"Private - Method generated with the content of the file File @ /Users/zaitsev/Downloads/Boats/04_Boats.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAADAAAAAgCAYAAABU1PscAAAAAXNSR0IArs4c6QAAAZpJREFUWEdjZBjigHGIu59h1AMDHYOjMTAaAxSGwGgSojAAKdY+GgMUByGFBozcGJiQFPufwsBD0V4wbzFZgUmSJmRH+4TrUtP9DFtWXgabR6pHiPIAzOHIjr514QZVPaBmoAE2D+QRUjxB0AMgx8Mcjs3RfIJcYIs/vf9GlIfwqQd5gqoegDkem8O/fPgOdrCUojCYfnb/LVEewKWeR4CTgeYegDka2aXU8gDITCMHQ9rEwLkD53GGLi08kDypi4GXR5Jg8gY5Cq8iWBKitwfIzsSfvzz/j+xzEH9uXhkDLBNj8wgtYoBsDyCnE5DjQXyQB0ws+MFSEvJycCUwz1DLA6D0DytGQUkIBGCBiR6wyO7Em4SweQKmGdkzRBU/BBS9ePiI4cyJjwzojidkNlEZBeaRi8taCZlHkbx+VDVKyBNjGFEegBkE8wiIT03PwByOnGyIcTzBUgifIcieIdYyXOqILTKx6ScqBvBlIkodT6l+ojwAsgQW4pSEFiHHkhNQRHuAkOWUyFMSOIPCA5R4ftQDlIQeNfQCAGISyCHlhdj3AAAAAElFTkSuQmCC'
]

{ #category : 'accessing - icons' }
CMBoat class >> frame06 [
	"Private - Generated method"
	<script: 'self frame06 inspect'>
	^ self icons
		at: #frame06
		ifAbsentPut: [ Form fromBinaryStream: self frame06Contents base64Decoded asByteArray readStream ]
]

{ #category : 'private - contents' }
CMBoat class >> frame06Contents [
	"Private - Method generated with the content of the file File @ /Users/zaitsev/Downloads/Boats/06_Boats.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAADAAAAAgCAYAAABU1PscAAAAAXNSR0IArs4c6QAAAYZJREFUWEdjZBjigHGIu59h1AMDHYOjMTAaAxSGwGgSojAAKdY+GgMUByGFBozcGJiQFPufwsBD0V4wbzFZgUmSJmRH+4TrUtP9DFtWXgabR6pHiPIAzOHIjr514QZVPaBmoAE2D+QRUjxB0AMgx8Mcjs3RfIJcYIs/vf9GlIfwqQd5gqoegDkem8O/fPgOdrCUojCYfnb/LVEewKWeR4CTgeYegDka2aXU8gDITCMHQ9rEwLkD53GGLi098PnLc3hJx8sjiTW5480DsCREbw8kT+piwOVg9JDE6wFQCMzNK2OAZWJsHqFFDIA8AALInoDFBrrHiPKAiQU/2EAJeTl4AMA8Qy0PgNI/rBilWgyADITFAswTMB8ge4ao4oeAohcPHzGcOfGRAd3xhPIBwXoA5gkQfXFZKzXcitMMbB4gZCFRHoAZAgoNWnkC5nh0BxPKzCR5gFaxoR9VjZFpCYU8TJ5kDyDHBrGWEFJHKJTx6SfbA4QcRS/5UQ/QK6Rx2TMaAwMdAwAlj8khfFzs2gAAAABJRU5ErkJggg=='
]

{ #category : 'accessing - icons' }
CMBoat class >> frame07 [
	"Private - Generated method"
	<script: 'self frame07 inspect'>
	^ self icons
		at: #frame07
		ifAbsentPut: [ Form fromBinaryStream: self frame07Contents base64Decoded asByteArray readStream ]
]

{ #category : 'private - contents' }
CMBoat class >> frame07Contents [
	"Private - Method generated with the content of the file File @ /Users/zaitsev/Downloads/Boats/07_Boats.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAADAAAAAgCAYAAABU1PscAAAAAXNSR0IArs4c6QAAAY9JREFUWEdjZBjigHGIu59h1AMDHYOjMTAaAxSGwGgSojAAKdY+GgMUByGFBozcGJiQFPufwsBD0V4wbzFZgUmSJmRH+4TrUtP9DFtWXgabR6pHiPIAzOHIjr514QZVPaBmoAE2D+QRUjxB0AMgx8Mcjs3RfIJcYIs/vf9GlIfwqQd5gqoegDkem8O/fPgOdrCUojCYfnb/LVEewKWeR4CTgeYegDka2aXU8gDITCMHQ9rEwLkD53GGLi08kDypi4GXRxKevD9/eQ4u8ZDFYA7CmwdgSWigPYAvbeL1AMjnc/PKGGCZGJtHaBUDyI5Gjw1kPlEeMLHgB5snIS8HNxfmGWp5AJT+YcUoehIiOwZAGmGxAPMEzDBkzxBV/BBQ9OLhI4YzJz4ygBwPA8TkA4L1AMwTIPrislZquBWnGTAPYMusuDQR5QGYZlBs0MoT2BwPK31wlUAgcZI8QKvY0I+qBocRKSFPVDGKL70ghw6l6Yoch1PsAUodTS39JCchallMLXNGPUCtkCTXnCEfAwBr/s0hkD0ZLgAAAABJRU5ErkJggg=='
]

{ #category : 'accessing - icons' }
CMBoat class >> frame08 [
	"Private - Generated method"
	<script: 'self frame08 inspect'>
	^ self icons
		at: #frame08
		ifAbsentPut: [ Form fromBinaryStream: self frame08Contents base64Decoded asByteArray readStream ]
]

{ #category : 'private - contents' }
CMBoat class >> frame08Contents [
	"Private - Method generated with the content of the file File @ /Users/zaitsev/Downloads/Boats/08_Boats.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAADAAAAAgCAYAAABU1PscAAAAAXNSR0IArs4c6QAAAZdJREFUWEdjZBjigHGIu59h1AMDHYOjMTAaAxSGwGgSojAAKdY+GgMUByGFBozcGJiQFPufwsBD0V4wbzFZgUmSJmRH+4TrUtP9DFtWXgabR6pHiPIAzOHIjr514QZVPaBmoAE2D+QRUjxB0AMgx8Mcjs3RfIJcYIs/vf9GlIfwqQd5gqoegDkem8O/fPgOdrCUojCYfnb/LVEewKWeR4CTgeYegDka2aXU8gDITCMHQ9rEwLkD53GGLi08kDypC24fL48kPJl//vL8PzIfpAhvHoAloYHwALpDcYUgXg+AfDw3r4wBlomxeYRWMQDzAMgNMMdj8xRRHjCx4AebISEvBw8ImGeo5QFQ+ocVo6AkRJUYABkIiwWYJ2A+QPYMUcUPAUUvHj5iOHPiIwPM8bhCHj0fEKwHYJ4A0ReXtVLDrTjNQPYAsRYR5QGYYSDf08oTMMdjS++w2CA5D2ALBZhh1PSIflQ12Cpi0z2yu0iKAWSNyGmU2OjGpY4ch8PMItsDlDqaWvpHPUCtkCTXnNEYIDfkqKUPAArW0SHlhqtpAAAAAElFTkSuQmCC'
]

{ #category : 'accessing' }
CMBoat class >> icons [
	^ icons ifNil: [ icons := Dictionary new ]
]

{ #category : 'InspectorExtensions' }
CMBoat class >> inspectionIcons [
	<inspectorPresentationOrder: 0 title: 'icons'>
	<script: 'self inspect'>
	^ SpTablePresenter new
		  addColumn: (SpImageTableColumn title: 'Icon' evaluated: #value);
		  addColumn: (SpStringTableColumn title: 'Name' evaluated: #key);
		  items:
			  ((self class selectorsInCategory: 'accessing - icons') sorted
				   collect: [ :each | each -> (self perform: each) ]);
		  yourself
]

{ #category : 'accessing - reset' }
CMBoat class >> resetIcons [
	<script>
	^ icons := nil
]

{ #category : 'animations' }
CMBoat class >> swimming [

	<script: 'self swimming inspect'>
	^ { 
		self frame06 .
		self frame07 .
		self frame08
	}
]
