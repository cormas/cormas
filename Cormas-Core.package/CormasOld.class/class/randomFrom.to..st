utilities - random
randomFrom: startInteger to: endInteger
	| extent |
	extent := endInteger - startInteger + 1.
	^endInteger min: (CormasOld random * extent) truncated + startInteger