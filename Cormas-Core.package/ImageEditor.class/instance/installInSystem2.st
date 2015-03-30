private
installInSystem2
	
	| class image s |
	storeMask value
		ifTrue: [image := self generateMask]
		ifFalse: [image := magnifiedBitView model].
	class := self observer class.
	s := WriteStream on: (String new: image bits size // 8).
	s
		nextPutAll: self targetSelector;
		cr.	"Put in a nice comment for re-opening the mask maker."
	s
		tab;
		nextPutAll: '"UIMaskEditor new openOnClass: self andSelector: #';
		nextPutAll: self targetSelector;
		nextPut: $";
		cr;
		crtab;
		nextPutAll: '<resource: #image>';
		crtab;
		nextPut: $^.
	useCachedImage value ifTrue: [s nextPutAll: 'CachedImage on: '].	"ifTrue: [s nextPutAll: 'EntityImage on: ']."
	s nextPutAll: image minimalStorageString.
	class
		compile: s contents
		classified: #resources.
	Transcript
		cr;
		show: class name , '>' , self targetSelector , ' defined'.
	class removeSelector: #markedAsSystemClass.
	UIFinderVW2
		installed:
			(Array
				with: class
				with: self targetSelector).
	self accept.
	self magnifiedBitView controller imageHasChanged: false.
	self modified: false