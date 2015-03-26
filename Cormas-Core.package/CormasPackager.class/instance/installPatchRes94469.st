private
installPatchRes94469
	"install this needed patch. For simplicity, the patch is inlined here"
	
	'<?xml version="1.0"?>

<st-source>


<methods>
<class-id>RuntimePackager.RuntimeBuilderItems</class-id> <category>actions</category>

<body package="RuntimePackager" selector="patchKept">patchKept
	"Patch the list of deleted and kept classes and methods"
	self keepClass: VisualPart.
	self keepSelector: #localPointToGlobal: inClass: VisualPart</body>

<body package="RuntimePackager" selector="setDefaultValues">setDefaultValues
	"Set default values for classes and methods "

	| wasReset |
	wasReset := self canBeReset not.

	self resetUnreferencedItems.
	"Do packages first, so that specific items listed overrule them."
	self defaultPackagesDeleted do: [:each | self deleteAllInPundle: each].
	self defaultPackagesKept do: [:each | self keepAllInPundle: each].

	self defaultClassesDeleted do: [:each | self deleteClass: each].
	self defaultClassesKept do: [:each | self keepClass: each].
	self defaultGlobalsKept do: [:each | self keepGlobal: each].
	self defaultGlobalsDeleted do: [:each | self deleteGlobal: each].
	self defaultMethodsKept keysAndValuesDo: 
		[:eachClass :selectors | 
		selectors do: [:eachSelector |
			self keepSelector: eachSelector inClass: eachClass]].
	self defaultMethodsDeleted keysAndValuesDo: 
		[:eachClass :selectors | 
		selectors do: [:eachSelector |
			self deleteSelector: eachSelector inClass: eachClass]].
	self includeStartupCode.
	self patchKept.
	" ensure that kept classes are not deleted in their superclasses"
	self ensureValidHierarchy.

	" notify interested parties that things have changed."
	wasReset ifTrue: [ self changed. ].
	self refresh.</body>
</methods>

<methods>
<class-id>RuntimePackager.RuntimeManagerStripper class</class-id> <category>stripping</category>

<body package="RuntimePackager" selector="discardUnreferencedMethodsClassesAndGlobals:">discardUnreferencedMethodsClassesAndGlobals: notifier
	" discard unreferenced classes, methods and globals "
	
	| replacements specialCompilerClasses traceClassRemovals traceMethodRemovals traceCount |
	notifier log: ''Deleting unreferenced items''.
	RuntimeManager changed: #aboutToDeleteUnreferencedItems.	" discard unreferenced classes "
	notifier tickRate: DeletedClasses size // 50.	" check the TraceLevel "
	traceClassRemovals := false.
	traceMethodRemovals := false.
	self traceLevel &gt;= 2 ifTrue: [traceClassRemovals := true].
	self traceLevel &gt;= 4 ifTrue: [traceMethodRemovals := true].	"Special compiler classes are not removed removed from their name space to
	allow deleted behaviors to remain behind with just enough behavior."
	specialCompilerClasses := IdentitySet new.
	(StrippingOptions includes: #removeCompiler)
		ifTrue:
			[specialCompilerClasses add: (self hiddenReferenceTo: ''SmalltalkCompiler'').
			specialCompilerClasses add: (self hiddenReferenceTo: ''Compiler'').
			specialCompilerClasses add: (self hiddenReferenceTo: ''Scanner'').
			specialCompilerClasses add: (self hiddenReferenceTo: ''Parser'')].	"sort the deleted classes bottom up in the hierarchy"
	notifier log: ''  Deleting classes part 1''.	"Always, always keep method dictionaries"
	MethodDictionary withAllSubclasses
		do:
			[:cl | 
			DeletedClasses
				remove: cl
				ifAbsent: []].
	replacements := self prepareClassesForDeletionIn: notifier.	" remove classes from the System Dictionary and make them obsolete "
	notifier log: ''  Deleting classes part 2''.
	self purgeDependents: AllDeletedBehaviors.
	replacements
		do:
			[:repArray | 
			| cl |
			cl := repArray at: 1.	" For special compiler classes, leave alone until phase 2 "
			(specialCompilerClasses includes: cl)
				ifFalse:
					[" watch out for ghost classes "
					(cl format notNil
						and:
							[cl class format notNil and: [cl environment includesKey: cl name]])
						ifTrue:
							[traceClassRemovals
								ifTrue:
									[notifier
										cr;
										show: ''Removing '' , cl name].
							cl quietlyRemoveFromSystem]].
			notifier tick].	" replace each class with a naked behavior and replace old instances"
	notifier log: ''  Deleting classes part 3''.
	replacements
		do:
			[:x | 
			| cl meta replClass replMeta replInstBehavior |
			cl := x at: 1.
			meta := cl class.
			replInstBehavior := x at: 2.
			replClass := x at: 3.
			replMeta := x at: 4.	" dispose of old instances "
			cl
				allInstancesDo:
					[:obj | 
					| newObj |
					newObj := replInstBehavior new.
					newObj primBecome: obj].	" switch places between old and new classes "
			replClass become: cl.
			cl flushVMmethodCache.
			replMeta become: meta.
			meta flushVMmethodCache.
			notifier tick].
	replacements := nil.	" remove unreferenced methods "
	notifier log: ''  Deleting methods''.
	notifier tickRate: DeletedMethods size // 50.
	traceCount := 0.
	DeletedMethods
		keysAndValuesDo:
			[:behav :selectors | 
			" do not bother deleted classes (which still understand identity methods)"
			(AllDeletedBehaviors includes: behav)
				ifFalse:
					[selectors
						do:
							[:sel | 
							traceMethodRemovals
								ifTrue:
									[(traceCount := traceCount + 1) &gt; 20
										ifTrue:
											[notifier text value: String new.
											traceCount := 0].
									notifier
										cr;
										show: behav name , ''&gt;&gt;'' , sel].	" hard code keeping copyright methods "
							sel == #copyright ifFalse: [behav quietlyRemoveSelector: sel]].	" flush the method cache all at once "
					behav flushVMmethodCache].
			notifier tick].	" set unreferenced globals to nil "
	(StrippingOptions includes: #stripGlobals)
		ifTrue:
			[notifier log: ''  Removing unreferenced globals''.
			notifier tickRate: DeletedGlobals size // 50.
			traceCount := 0.
			self sortDeletedGlobals.
			DeletedGlobals
				do:
					[:ref | 
					| refBinding |
					refBinding := ref bindingOrNil.
					refBinding notNil
						ifTrue:
							[traceClassRemovals
								ifTrue:
									[(traceCount := traceCount + 1) &gt; 20
										ifTrue:
											[notifier text value: String new.
											traceCount := 0].
									notifier
										cr;
										show: ''Resetting '' , refBinding key].
							refBinding whileMutableDo: [refBinding setValue: nil].	"Remove the binding, notifying the change set so that it gets removed from the containing package.
				If the binding is for a shared variable on a class, its environment will be a class so coerce it to be
				a namespace.  This is a no-op for proper Namespaces."
							refBinding value isNameSpace
								ifTrue: [ref removeFromSystem: #(#changes)]
								ifFalse:
									[ref environment
										ifNotNil:
											[ref environment asNameSpace
												removeBinding: refBinding
												recordIn: #(#changes)
												ifAbsent: []]]]]].
	self purgeChangeSets.
	self removeExtraneousReferences</body>
</methods>

<do-it>ChangeSet current addPatch: ''Res94469''</do-it>

</st-source>
' readStream fileIn