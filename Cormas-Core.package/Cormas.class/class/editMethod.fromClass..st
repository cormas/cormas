util_files
editMethod: aSelector fromClass: aClass
	"open a RefactoryBrowser for aClass on aSelector. If aSelector is only defined in a superclass, then open this superclass"
	"self editMethod: #moveTo: fromClass: AgentLocation
self editMethod: #id fromClass: AgentLocation"
	
	| class_method |
	class_method := aClass findSelector: aSelector.
	class_method
		ifNil:
			[Dialog
				warn:
					('No method <1p> found in <2s>and super classes.<n>Will open a standard editor'
						expandMacrosWith: aSelector
						with: aClass name).
			^self editClass: aClass].
	(self editClass: class_method first) navigator setSelector: aSelector