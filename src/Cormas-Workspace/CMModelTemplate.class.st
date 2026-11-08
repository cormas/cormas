"
I represent the starting point of a new model: from its human-friendly name, I make the names of its baseline, packages and classes, and I write a new model folder with its code.

## Responsibility:

- I derive every name of a new model from its name, such as `ForestFire`, `ForestFire-Model` and `FFModel` for 'Forest fire', and refuse a name or a prefix that gives no class name.
- I write the folder of a new model: `cormas.json`, `README.md`, `.gitignore`, `.project`, `src`, `data` and `output`.
- I write its code as Tonel files, without creating anything in the image: a model class, a cell class, a test class and a baseline.

## Collaborators:

- `CMWorkspace` asks me to write into a new folder of `Models`, then installs the model from it like any other.
- `TonelWriter` writes my class and method definitions as Iceberg would, so the files do not change at the first save.

## Public API and Key Messages

- `CMModelTemplate named: aString` creates a template; `prefix:` and `description:` adjust it.
- `basename`, `prefix`, `baselineName`, `modelPackageName`, `testPackageName`, `modelClassName`, `cellClassName` and `testClassName` tell the names of the new model.
- `writeTo: aFolder` writes the folder.

For example, to create a model in the workspace of the image:

```smalltalk
CMWorkspace current createModelFrom:
	((CMModelTemplate named: 'Forest fire')
		description: 'Trees grow and burn';
		yourself)
```

## Internal Representation

- `name` is the human-friendly name of the model, as the modeler typed it.
- `prefix` begins every class name: the capital letters of the basename when there are several, otherwise its first three letters, unless chosen.
- `description` is the paragraph written in `cormas.json` and in the README.

### Implementation Points

- The baseline always declares the model package and the test package.
"
Class {
	#name : 'CMModelTemplate',
	#superclass : 'Object',
	#instVars : [
		'name',
		'prefix',
		'description'
	],
	#category : 'Cormas-Workspace',
	#package : 'Cormas-Workspace'
}

{ #category : 'instance creation' }
CMModelTemplate class >> named: aString [
	"Return the template of a new model with this human-friendly name, such as 'Forest fire'. Raise a CMWorkspaceError when the name does not give a class name"

	^ self new setName: aString
]

{ #category : 'baselines' }
CMModelTemplate class >> sourceOfBaselineDeclaring: packageNames [
	"Return the source of the baseline method that Cormas writes: it declares the packages in order, each one requiring those before it"

	^ String streamContents: [ :stream |
		  stream
			  nextPutAll: 'baseline: spec'; cr;
			  tab; nextPutAll: '<baseline>'; cr;
			  tab; nextPutAll: 'spec for: #common do: ['; cr;
			  tab; tab; nextPutAll: 'spec'.
		  packageNames withIndexDo: [ :each :index |
			  index > 1 ifTrue: [ stream nextPut: $; ].
			  stream cr; tab; tab; tab; nextPutAll: 'package: '; print: each asString.
			  index > 1 ifTrue: [
				  stream nextPutAll: ' with: [ spec requires: #('.
				  (packageNames first: index - 1) do: [ :required |
					  stream space; print: required asString ].
				  stream nextPutAll: ' ) ]' ] ].
		  stream nextPutAll: ' ]' ]
]

{ #category : 'baselines' }
CMModelTemplate class >> sourceOfIsManagedByCormas [
	"Return the source of the method that marks a baseline written by Cormas"

	^ 'isManagedByCormas
	"Cormas wrote this baseline and keeps it up to date when packages of the model are added, renamed or removed. If you change the baseline yourself, Cormas asks whether you want to manage it yourself: this method then returns false, and Cormas never changes the baseline again"

	^ true' withLineEndings: String cr
]

{ #category : 'writing' }
CMModelTemplate class >> writeProjectFilesTo: aFolder [
	"Write the files that make a model folder a Pharo project as Iceberg writes them, and keep outputs out of git"

	aFolder / '.gitignore' writeStreamDo: [ :stream |
			stream
				nextPutAll: 'output/';
				lf ].
	aFolder / '.project' writeStreamDo: [ :stream |
			stream
				nextPutAll: '{';
				lf;
				tab;
				nextPutAll: '''srcDirectory'' : ''src''';
				lf;
				nextPutAll: '}' ].
	aFolder / 'src' / '.properties' writeStreamDo: [ :stream |
			stream
				nextPutAll: '{';
				lf;
				tab;
				nextPutAll: '#format : #tonel';
				lf;
				nextPutAll: '}' ]
]

{ #category : 'private' }
CMModelTemplate >> baselineDefinitions [

	^ {
		  (self
			   classNamed: 'BaselineOf' , self baselineName
			   superclass: 'BaselineOf'
			   package: 'BaselineOf' , self baselineName).
		  (self
			   method: (self class sourceOfBaselineDeclaring: {
						    self modelPackageName.
						    self testPackageName })
			   of: 'BaselineOf' , self baselineName
			   classSide: false
			   in: 'baselines').
		  (self
			   method: self class sourceOfIsManagedByCormas
			   of: 'BaselineOf' , self baselineName
			   classSide: false
			   in: 'baselines') }
]

{ #category : 'names' }
CMModelTemplate >> baselineName [

	^ self basename
]

{ #category : 'names' }
CMModelTemplate >> basename [
	"Return the name of the model in camel case, without Model at the end, such as ForestFire for 'Forest fire model'. The names of the baseline and packages are made from it"

	| camelCase |
	camelCase := name asCamelCase.
	(camelCase asLowercase endsWith: 'model') ifTrue: [
		camelCase := camelCase allButLast: 'model' size ].
	^ camelCase
]

{ #category : 'names' }
CMModelTemplate >> cellClassName [

	^ prefix , 'Cell'
]

{ #category : 'private' }
CMModelTemplate >> check: aString isAClassNameOf: aDescription [

	(aString notEmpty and: [
		 aString first isUppercase and: [ aString isAllAlphaNumerics ] ])
		ifFalse: [
				CMWorkspaceError signal:
					'Cormas cannot make class names from ' , aDescription , ' '
					, aString printString
					, ': use letters and digits, starting with a letter' ]
]

{ #category : 'private' }
CMModelTemplate >> classNamed: aClassName superclass: aSuperclassName package: aPackageName [

	^ (MCClassDefinition named: aClassName)
		  superclassName: aSuperclassName;
		  packageName: aPackageName;
		  tagName: nil;
		  instVarNames: #(  );
		  classVarNames: #(  );
		  poolDictionaryNames: #(  );
		  classInstVarNames: #(  );
		  type: #normal;
		  comment: '';
		  commentStamp: '';
		  traitComposition: '{}';
		  classTraitComposition: '{}';
		  yourself
]

{ #category : 'accessing' }
CMModelTemplate >> description [

	^ description
]

{ #category : 'accessing' }
CMModelTemplate >> description: aString [
	"Set the paragraph that describes the model in the catalog and in its README"

	description := aString
]

{ #category : 'private' }
CMModelTemplate >> method: aSource of: aClassName classSide: aBoolean in: aProtocol [

	^ MCMethodDefinition
		  className: aClassName
		  classIsMeta: aBoolean
		  selector: (RBParser parseMethod: aSource) selector
		  category: aProtocol
		  timeStamp: ''
		  source: aSource
]

{ #category : 'names' }
CMModelTemplate >> modelClassName [

	^ prefix , 'Model'
]

{ #category : 'private' }
CMModelTemplate >> modelDefinitions [
	"Return the definitions of the classes of a new model and of the methods that a modeler starts from"

	^ {
		  (self
			   classNamed: self modelClassName
			   superclass: 'CMModel'
			   package: self modelPackageName).
		  (self
			   classNamed: self cellClassName
			   superclass: 'CMCell'
			   package: self modelPackageName).
		  (self
			   method: 'modelName
	"A human-friendly name of the model"

	^ ' , name printString
			   of: self modelClassName
			   classSide: true
			   in: 'accessing').
		  (self
			   method: 'prefix
	"Every class name in the model package begins with this prefix"

	^ ' , prefix printString
			   of: self modelClassName
			   classSide: true
			   in: 'accessing').
		  (self
			   method: 'init

	<init>
	"Define the initial environment of a simulation. It is executed once, when the simulation is initialized"

	"A grid of 4 rows and 4 columns"
	self
		createGridNumberOfRows: 4
		numberOfColumns: 4
		neighbourhood: 8
		closed: false.

	"Agents placed at random on the grid"
	"self createN: 3 randomlyLocatedEntities: YourAgentClass"'
			   of: self modelClassName
			   classSide: false
			   in: 'initialization').
		  (self
			   method: 'step

	<control>
	"Executed at every step of the simulation"'
			   of: self modelClassName
			   classSide: false
			   in: 'control').
		  (self
			   method: 'initialize

	super initialize.
	"Executed right after the cell is created, before the simulation is initialized"'
			   of: self cellClassName
			   classSide: false
			   in: 'initialization') }
]

{ #category : 'names' }
CMModelTemplate >> modelPackageName [

	^ self basename , '-Model'
]

{ #category : 'accessing' }
CMModelTemplate >> name [

	^ name
]

{ #category : 'accessing' }
CMModelTemplate >> prefix [
	"Return the beginning of every class name of the model"

	^ prefix
]

{ #category : 'accessing' }
CMModelTemplate >> prefix: aString [
	"Choose the beginning of every class name of the model instead of the one made from its name"

	self check: aString isAClassNameOf: 'a prefix'.
	prefix := aString
]

{ #category : 'private' }
CMModelTemplate >> prefixFromBasename [
	"Return the capital letters of the basename when there are several, such as FF for ForestFire, or its first three letters, such as For for Forest"

	| capitals |
	capitals := self basename select: [ :each | each isUppercase ].
	capitals size > 1 ifTrue: [ ^ capitals ].
	^ self basename first: (3 min: self basename size)
]

{ #category : 'initialization' }
CMModelTemplate >> setName: aString [

	name := aString.
	description := ''.
	self check: self basename isAClassNameOf: 'the name of a model'.
	prefix := self prefixFromBasename
]

{ #category : 'names' }
CMModelTemplate >> testClassName [

	^ self modelClassName , 'Test'
]

{ #category : 'names' }
CMModelTemplate >> testPackageName [

	^ self basename , '-Tests'
]

{ #category : 'private' }
CMModelTemplate >> writeMetadataTo: aFolder [

	aFolder / 'cormas.json' writeStreamDo: [ :stream |
			STONJSON
				put: (OrderedDictionary new
						 at: 'baseline' put: self baselineName;
						 at: 'summary' put: description;
						 at: 'cormas' put: CMVersion current majorMinorString;
						 yourself)
				onStreamPretty: stream ].
	aFolder / 'README.md' writeStreamDo: [ :stream |
			stream
				nextPutAll: '# ';
				nextPutAll: name;
				lf;
				lf;
				nextPutAll: description;
				lf ].
	self class writeProjectFilesTo: aFolder
]

{ #category : 'private' }
CMModelTemplate >> writePackageNamed: aPackageName definitions: definitions to: aSourceFolder [

	TonelWriter new
		directoryReference: aSourceFolder;
		writeSnapshot: (MCSnapshot fromDefinitions:
					 { (MCOrganizationDefinition packageName: aPackageName) }
					 , definitions)
]

{ #category : 'writing' }
CMModelTemplate >> writeTo: aFolder [
	"Write a new model folder: cormas.json, README.md, the files that make it a Pharo project as Iceberg writes them, the folders for data and outputs, and the code of the model in src. Nothing is created in the image: the model is installed from the folder"

	| src |
	src := aFolder / 'src'.
	src ensureCreateDirectory.
	(aFolder / 'data') ensureCreateDirectory.
	(aFolder / 'output') ensureCreateDirectory.
	self writeMetadataTo: aFolder.
	self
		writePackageNamed: self modelPackageName
		definitions: self modelDefinitions
		to: src.
	self
		writePackageNamed: self testPackageName
		definitions: { (self
				 classNamed: self testClassName
				 superclass: 'TestCase'
				 package: self testPackageName) }
		to: src.
	self
		writePackageNamed: 'BaselineOf' , self baselineName
		definitions: self baselineDefinitions
		to: src
]
