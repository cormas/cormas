Class {
	#name : 'CMModelGeneratorTest',
	#superclass : 'TestCase',
	#instVars : [
		'modelName',
		'prefix',
		'modelPackageName',
		'modelClassName',
		'testPackageName',
		'testClassName',
		'baselinePackageName',
		'baselineClassName',
		'generator'
	],
	#category : 'Cormas-CodeGeneration-Tests',
	#package : 'Cormas-CodeGeneration-Tests'
}

{ #category : 'as yet unclassified' }
CMModelGeneratorTest >> doesClassExist: aClassName [

	^ self class environment hasClassNamed: aClassName 
]

{ #category : 'as yet unclassified' }
CMModelGeneratorTest >> doesPackageExist: aPackageName [

	^ self packageOrganizer hasPackage: aPackageName 
]

{ #category : 'accessing' }
CMModelGeneratorTest >> expectedModelClass [

	^ self class environment classNamed: modelClassName
]

{ #category : 'accessing' }
CMModelGeneratorTest >> expectedTestClass [

	^ self class environment classNamed: testClassName
]

{ #category : 'as yet unclassified' }
CMModelGeneratorTest >> initializeGenerator [

	generator modelName: modelName.
	generator prefix: prefix.
	generator modelClassName: modelClassName
]

{ #category : 'running' }
CMModelGeneratorTest >> setUp [

	super setUp.
	generator := CMModelGenerator new.
	
	"We add 00 to decrease the chance that a package or class with this name already exists"
	modelName := 'Very Dummy 00'.
	prefix := 'Dum'.
	
	modelPackageName := 'VeryDummy00-Model'.
	modelClassName := 'DummyModel00'.
	
	testPackageName := 'VeryDummy00-Model-Tests'.
	testClassName := 'DummyModel00Test'.
	
	baselinePackageName := 'BaselineOfVeryDummy00'.
	baselineClassName := 'BaselineOfVeryDummy00'
]

{ #category : 'running' }
CMModelGeneratorTest >> tearDown [

	| env org |
	
	env := self class environment.
	org := self class packageOrganizer.

	env removeClassNamed: baselineClassName.
	env removeClassNamed: testClassName.
	env removeClassNamed: modelClassName.
	
	org removePackage: baselinePackageName.
	org removePackage: testPackageName.
	org removePackage: modelPackageName.
	
	super tearDown
]

{ #category : 'tests' }
CMModelGeneratorTest >> testBasenameFromEmptyModelName [

	self assert: generator basename equals: ''
]

{ #category : 'tests' }
CMModelGeneratorTest >> testBasenameFromModelClassName [

	generator modelName: 'RockPaperScissors'.
	self assert: generator basename equals: 'RockPaperScissors'
]

{ #category : 'tests' }
CMModelGeneratorTest >> testBasenameFromModelClassNameAsPrefix [

	generator modelName: 'RPS'.
	self assert: generator basename equals: 'RPS'
]

{ #category : 'tests' }
CMModelGeneratorTest >> testBasenameFromModelClassNameAsPrefixWithModel [

	generator modelName: 'RPSModel'.
	self assert: generator basename equals: 'RPS'
]

{ #category : 'tests' }
CMModelGeneratorTest >> testBasenameFromModelClassNameWithModel [

	generator modelName: 'RockPaperScissorsModel'.
	self assert: generator basename equals: 'RockPaperScissors'
]

{ #category : 'tests' }
CMModelGeneratorTest >> testBasenameFromModelName [

	generator modelName: 'Rock paper scissors'.
	self assert: generator basename equals: 'RockPaperScissors'
]

{ #category : 'tests' }
CMModelGeneratorTest >> testBasenameFromModelNameAndModelClassName [

	generator modelName: 'RockPaperScissors'.
	generator modelClassName: 'RSPModel'.
	
	self assert: generator basename equals: 'RockPaperScissors'
]

{ #category : 'tests' }
CMModelGeneratorTest >> testBasenameFromModelNameWithModel [

	generator modelName: 'Rock paper scissors model'.
	self assert: generator basename equals: 'RockPaperScissors'
]

{ #category : 'accessing' }
CMModelGeneratorTest >> testDefaultValues [

	self assert: generator modelName equals: ''.
	self assert: generator prefix equals: ''.
	self assert: generator modelClassName equals: ''.
	self assert: generator description equals: ''.
	self assert: generator shouldGenerateTestPackage.
	self assert: generator shouldGenerateBaseline.
]

{ #category : 'tests' }
CMModelGeneratorTest >> testGeneratePackagesAndClasses [

	self initializeGenerator.
	generator generatePackagesAndClasses.
	
	self assert: (self doesPackageExist: modelPackageName).
	self assert: (self doesPackageExist: testPackageName).
	self assert: (self doesPackageExist: baselinePackageName).
	
	self assert: (self doesClassExist: modelClassName).
	self assert: (self doesClassExist: testClassName).
	self assert: (self doesClassExist: baselineClassName).
]

{ #category : 'tests' }
CMModelGeneratorTest >> testGeneratePrefixMethod [

	self initializeGenerator.
	
	"We must generate package and class first"
	generator generatePackagesAndClasses.
	generator generatePrefixMethod.
	
	self assert: (self expectedModelClass respondsTo: #prefix)
	
]

{ #category : 'tests' }
CMModelGeneratorTest >> testInitializeAllEmpty [

	self assert: generator modelName equals: ''.
	self assert: generator prefix equals: ''.
	self assert: generator modelClassName equals: ''.
	self assert: generator testClassName equals: ''.
	self assert: generator baselineClassName equals: ''.
	self assert: generator modelPackageName equals: ''.
	self assert: generator testPackageName equals: ''.
	self assert: generator baselinePackageName equals: ''
]

{ #category : 'tests - initialize firefighters' }
CMModelGeneratorTest >> testInitializeFFWithModelClassName [

	generator modelClassName: 'FirefightersModel'.

	self assert: generator modelName equals: ''.
	self assert: generator prefix equals: 'Fir'.
	self assert: generator modelClassName equals: 'FirefightersModel'.
	self assert: generator testClassName equals: 'FirefightersModelTest'.
	self assert: generator baselineClassName equals: 'BaselineOfFirefighters'.
	self assert: generator modelPackageName equals: 'Firefighters-Model'.
	self assert: generator testPackageName equals: 'Firefighters-Model-Tests'.
	self assert: generator baselinePackageName equals: 'BaselineOfFirefighters'
]

{ #category : 'tests - initialize firefighters' }
CMModelGeneratorTest >> testInitializeFFWithModelName [

	generator modelName: 'Firefighters model'.

	self assert: generator modelName equals: 'Firefighters model'.
	self assert: generator prefix equals: 'Fir'.
	self assert: generator modelClassName equals: 'FirModel'.
	self assert: generator testClassName equals: 'FirModelTest'.
	self assert: generator baselineClassName equals: 'BaselineOfFirefighters'.
	self assert: generator modelPackageName equals: 'Firefighters-Model'.
	self assert: generator testPackageName equals: 'Firefighters-Model-Tests'.
	self assert: generator baselinePackageName equals: 'BaselineOfFirefighters'
]

{ #category : 'tests - initialize firefighters' }
CMModelGeneratorTest >> testInitializeFFWithModelNameAndModelClassName [

	generator modelName: 'Firefighters model'.
	generator modelClassName: 'FirefightersModel'.

	self assert: generator modelName equals: 'Firefighters model'.
	self assert: generator prefix equals: 'Fir'.
	self assert: generator modelClassName equals: 'FirefightersModel'.
	self assert: generator testClassName equals: 'FirefightersModelTest'.
	self assert: generator baselineClassName equals: 'BaselineOfFirefighters'.
	self assert: generator modelPackageName equals: 'Firefighters-Model'.
	self assert: generator testPackageName equals: 'Firefighters-Model-Tests'.
	self assert: generator baselinePackageName equals: 'BaselineOfFirefighters'
]

{ #category : 'tests - initialize firefighters' }
CMModelGeneratorTest >> testInitializeFFWithModelNameAndPrefix [

	generator modelName: 'Firefighters model'.
	generator prefix: 'FF'.

	self assert: generator modelName equals: 'Firefighters model'.
	self assert: generator prefix equals: 'FF'.
	self assert: generator modelClassName equals: 'FFModel'.
	self assert: generator testClassName equals: 'FFModelTest'.
	self assert: generator baselineClassName equals: 'BaselineOfFirefighters'.
	self assert: generator modelPackageName equals: 'Firefighters-Model'.
	self assert: generator testPackageName equals: 'Firefighters-Model-Tests'.
	self assert: generator baselinePackageName equals: 'BaselineOfFirefighters'
]

{ #category : 'tests - initialize firefighters' }
CMModelGeneratorTest >> testInitializeFFWithModelNameAndPrefixAndModelClassName [

	generator modelName: 'Firefighters model'.
	generator prefix: 'FF'.
	generator modelClassName: 'FirefightersModel'.

	self assert: generator modelName equals: 'Firefighters model'.
	self assert: generator prefix equals: 'FF'.
	self assert: generator modelClassName equals: 'FirefightersModel'.
	self assert: generator testClassName equals: 'FirefightersModelTest'.
	self assert: generator baselineClassName equals: 'BaselineOfFirefighters'.
	self assert: generator modelPackageName equals: 'Firefighters-Model'.
	self assert: generator testPackageName equals: 'Firefighters-Model-Tests'.
	self assert: generator baselinePackageName equals: 'BaselineOfFirefighters'
]

{ #category : 'tests - initialize firefighters' }
CMModelGeneratorTest >> testInitializeFFWithPrefix [

	generator prefix: 'FF'.

	self assert: generator modelName equals: ''.
	self assert: generator prefix equals: 'FF'.
	self assert: generator modelClassName equals: 'FFModel'.
	self assert: generator testClassName equals: 'FFModelTest'.
	self assert: generator baselineClassName equals: 'BaselineOfFFModel'.
	self assert: generator modelPackageName equals: 'FF-Model'.
	self assert: generator testPackageName equals: 'FF-Model-Tests'.
	self assert: generator baselinePackageName equals: 'BaselineOfFFModel'
]

{ #category : 'tests - initialize firefighters' }
CMModelGeneratorTest >> testInitializeFFWithPrefixAndModelClassName [

	generator prefix: 'FF'.
	generator modelClassName: 'FirefightersModel'.

	self assert: generator modelName equals: ''.
	self assert: generator prefix equals: 'FF'.
	self assert: generator modelClassName equals: 'FirefightersModel'.
	self assert: generator testClassName equals: 'FirefightersModelTest'.
	self assert: generator baselineClassName equals: 'BaselineOfFirefighters'.
	self assert: generator modelPackageName equals: 'Firefighters-Model'.
	self assert: generator testPackageName equals: 'Firefighters-Model-Tests'.
	self assert: generator baselinePackageName equals: 'BaselineOfFirefighters'
]

{ #category : 'tests - initialize rock paper scissors' }
CMModelGeneratorTest >> testInitializeRPSWithModelClassName [

	generator modelClassName: 'RPSModel'.

	self assert: generator modelName equals: ''.
	self assert: generator prefix equals: 'RPS'.
	self assert: generator modelClassName equals: 'RPSModel'.
	self assert: generator testClassName equals: 'RPSModelTest'.
	self assert: generator baselineClassName equals: 'BaselineOfRPSModel'.
	self assert: generator modelPackageName equals: 'RPS-Model'.
	self assert: generator testPackageName equals: 'RPS-Model-Tests'.
	self assert: generator baselinePackageName equals: 'BaselineOfRPSModel'
]

{ #category : 'tests - initialize rock paper scissors' }
CMModelGeneratorTest >> testInitializeRPSWithModelName [

	generator modelName: 'Rock paper scissors'.

	self assert: generator modelName equals: 'Rock paper scissors'.
	self assert: generator prefix equals: 'RPS'.
	self assert: generator modelClassName equals: 'RPSModel'.
	self assert: generator testClassName equals: 'RPSModelTest'.
	self assert: generator baselineClassName equals: 'BaselineOfRockPaperScissors'.
	self assert: generator modelPackageName equals: 'RockPaperScissors-Model'.
	self assert: generator testPackageName equals: 'RockPaperScissors-Model-Tests'.
	self assert: generator baselinePackageName equals: 'BaselineOfRockPaperScissors'
]

{ #category : 'tests - initialize rock paper scissors' }
CMModelGeneratorTest >> testInitializeRPSWithModelNameAndModelClassName [

	generator modelName: 'Rock paper scissors'.
	generator modelClassName: 'RPSModel'.

	self assert: generator modelName equals: 'Rock paper scissors'.
	self assert: generator prefix equals: 'RPS'.
	self assert: generator modelClassName equals: 'RPSModel'.
	self assert: generator testClassName equals: 'RPSModelTest'.
	self assert: generator baselineClassName equals: 'BaselineOfRockPaperScissors'.
	self assert: generator modelPackageName equals: 'RockPaperScissors-Model'.
	self assert: generator testPackageName equals: 'RockPaperScissors-Model-Tests'.
	self assert: generator baselinePackageName equals: 'BaselineOfRockPaperScissors'
]

{ #category : 'tests - initialize rock paper scissors' }
CMModelGeneratorTest >> testInitializeRPSWithModelNameAndPrefix [

	generator modelName: 'Rock paper scissors'.
	generator prefix: 'RPS'.

	self assert: generator modelName equals: 'Rock paper scissors'.
	self assert: generator prefix equals: 'RPS'.
	self assert: generator modelClassName equals: 'RPSModel'.
	self assert: generator testClassName equals: 'RPSModelTest'.
	self assert: generator baselineClassName equals: 'BaselineOfRockPaperScissors'.
	self assert: generator modelPackageName equals: 'RockPaperScissors-Model'.
	self assert: generator testPackageName equals: 'RockPaperScissors-Model-Tests'.
	self assert: generator baselinePackageName equals: 'BaselineOfRockPaperScissors'
]

{ #category : 'tests - initialize rock paper scissors' }
CMModelGeneratorTest >> testInitializeRPSWithModelNameAndPrefixAndModelClassName [

	generator modelName: 'Rock paper scissors'.
	generator prefix: 'RPS'.
	generator modelClassName: 'RPSModel'.

	self assert: generator modelName equals: 'Rock paper scissors'.
	self assert: generator prefix equals: 'RPS'.
	self assert: generator modelClassName equals: 'RPSModel'.
	self assert: generator testClassName equals: 'RPSModelTest'.
	self assert: generator baselineClassName equals: 'BaselineOfRockPaperScissors'.
	self assert: generator modelPackageName equals: 'RockPaperScissors-Model'.
	self assert: generator testPackageName equals: 'RockPaperScissors-Model-Tests'.
	self assert: generator baselinePackageName equals: 'BaselineOfRockPaperScissors'
]

{ #category : 'tests - initialize rock paper scissors' }
CMModelGeneratorTest >> testInitializeRPSWithPrefix [

	generator prefix: 'RPS'.

	self assert: generator modelName equals: ''.
	self assert: generator prefix equals: 'RPS'.
	self assert: generator modelClassName equals: 'RPSModel'.
	self assert: generator testClassName equals: 'RPSModelTest'.
	self assert: generator baselineClassName equals: 'BaselineOfRPSModel'.
	self assert: generator modelPackageName equals: 'RPS-Model'.
	self assert: generator testPackageName equals: 'RPS-Model-Tests'.
	self assert: generator baselinePackageName equals: 'BaselineOfRPSModel'
]

{ #category : 'tests - initialize rock paper scissors' }
CMModelGeneratorTest >> testInitializeRPSWithPrefixAndModelClassName [

	generator prefix: 'RPS'.
	generator modelClassName: 'RPSModel'.

	self assert: generator modelName equals: ''.
	self assert: generator prefix equals: 'RPS'.
	self assert: generator modelClassName equals: 'RPSModel'.
	self assert: generator testClassName equals: 'RPSModelTest'.
	self assert: generator baselineClassName equals: 'BaselineOfRPSModel'.
	self assert: generator modelPackageName equals: 'RPS-Model'.
	self assert: generator testPackageName equals: 'RPS-Model-Tests'.
	self assert: generator baselinePackageName equals: 'BaselineOfRPSModel'
]

{ #category : 'tests' }
CMModelGeneratorTest >> testModelClassName [

	self assert: generator modelClassName equals: ''.

	generator prefix: 'Boo'.
	self assert: generator modelClassName equals: 'BooModel'.
	
	generator modelClassName: 'MyModel'.
	self assert: generator modelClassName equals: 'MyModel'
]

{ #category : 'tests' }
CMModelGeneratorTest >> testModelClassNameEmptyError [

	self should: [ generator modelClassName: '' ] raise: Error.
]

{ #category : 'tests' }
CMModelGeneratorTest >> testModelClassNameFromPrefix [

	generator prefix: 'FB'.
	self assert: generator modelClassNameFromPrefix equals: 'FBModel'
]

{ #category : 'tests' }
CMModelGeneratorTest >> testModelClassNameHasNonAlphanumericsError [

	self should: [ generator modelClassName: 'foo_bar' ] raise: Error.
]

{ #category : 'tests' }
CMModelGeneratorTest >> testModelClassNameHasSpacesError [

	self should: [ generator modelClassName: 'foo bar' ] raise: Error.
]

{ #category : 'tests' }
CMModelGeneratorTest >> testModelClassNameStartsWithLowercaseError [

	self should: [ generator modelClassName: 'fooBar' ] raise: Error.
]

{ #category : 'tests' }
CMModelGeneratorTest >> testModelClassNameStartsWithNumberError [

	self should: [ generator modelClassName: '1FooBar' ] raise: Error.
]

{ #category : 'tests' }
CMModelGeneratorTest >> testModelName [

	generator modelName: 'FooBar'.
	self assert: generator modelName equals: 'FooBar'
]

{ #category : 'tests' }
CMModelGeneratorTest >> testModelPackageName [

	generator modelName: 'FooBar'.
	self assert: generator modelPackageName equals: 'FooBar-Model'
]

{ #category : 'tests' }
CMModelGeneratorTest >> testNameEmptyError [

	self should: [ generator name: '' ] raise: Error.
]

{ #category : 'tests' }
CMModelGeneratorTest >> testNameWithNumbers [

	generator modelName: 'FooBar42'.
	self assert: generator modelName equals: 'FooBar42'
]

{ #category : 'tests' }
CMModelGeneratorTest >> testPrefix [

	generator prefix: 'FB'.
	self assert: generator prefix equals: 'FB'
]

{ #category : 'tests' }
CMModelGeneratorTest >> testPrefixEmptyError [

	self should: [ generator prefix: '' ] raise: Error.
]

{ #category : 'tests' }
CMModelGeneratorTest >> testPrefixHasNonAlphanumericsError [

	self should: [ generator prefix: 'F_B' ] raise: Error.
]

{ #category : 'tests' }
CMModelGeneratorTest >> testPrefixHasSpacesError [

	self should: [ generator prefix: 'F B' ] raise: Error
]

{ #category : 'tests' }
CMModelGeneratorTest >> testPrefixStartsWithLowercaseError [

	self should: [ generator prefix: 'fB' ] raise: Error.
]

{ #category : 'tests' }
CMModelGeneratorTest >> testPrefixStartsWithNumberError [

	self should: [ generator prefix: '1FB' ] raise: Error.
]

{ #category : 'tests' }
CMModelGeneratorTest >> testPrefixWithNumbers [

	generator prefix: 'FB42'.
	self assert: generator prefix equals: 'FB42'
]

{ #category : 'tests' }
CMModelGeneratorTest >> testTestClassName [

	self assert: generator testClassName equals: ''.

	generator prefix: 'FB'.
	self assert: generator testClassName equals: 'FBModelTest'.
	
	generator modelClassName: 'MyModel'.
	self assert: generator testClassName equals: 'MyModelTest'
]

{ #category : 'tests' }
CMModelGeneratorTest >> testTestPackageName [

	generator modelName: 'FooBar'.
	self assert: generator testPackageName equals: 'FooBar-Model-Tests'
]
