Class {
	#name : #ReHab,
	#superclass : #CMAbstractModel,
	#instVars : [
		'nbFamilies',
		'theBirds',
		'thePlantHarvesters',
		'theFamilys',
		'theParkManagers',
		'birdNewborns',
		'theZones',
		'theBlinds',
		'theMaximizers',
		'theLoneRiders',
		'theStrategy_ParkManagers',
		'strategy_Family',
		'poaching',
		'restrained',
		'theCrusaders',
		'theManagers',
		'strategy_ParkManager',
		'theExplorers'
	],
	#category : #'Cormas-Model-ReHab'
}

{ #category : #'SI_config' }
ReHab class >> SIconfig_ReHab_Computer [
"Returns an string containing the settings of the Spatial Interface configuration named ReHab_Computer"
^'configName:*ReHab_Computer
observedEntitiesList:*#Bird,#PlantHarvester,#Reserve,#SpaceUnit,#Zone,
manipEntitiesList:*#Bird,#PlantHarvester,#Reserve,#SpaceUnit,#Zone,
createEntitiesList:*
manipMethods:*Reserve,flash
manipMethods:*PlantHarvester,goBackHome
manipMethods:*Zone
manipMethods:*Bird
manipMethods:*SpaceUnit
povMethods:*Reserve,delimitors
povMethods:*PlantHarvester,pov,povColor,povHarvest
povMethods:*Zone,delimitors
povMethods:*Bird,pov
povMethods:*SpaceUnit,povBiomass,povId
attributes:*Reserve
attributes:*PlantHarvester,harvest,label,myClan
attributes:*Zone,access,biomass,chickenOneLocation,chickenTwoLocation,nestingBirdLocation,noHarvestPeriod,topLeftLocation
attributes:*Bird,status
attributes:*SpaceUnit,biomass
infoMethods:*Reserve,info_ID
infoMethods:*PlantHarvester,info_harvest
infoMethods:*Zone,info_ID
infoMethods:*Bird
infoMethods:*SpaceUnit,info_ClassName,info_ID,info_zone
probeMethods:*Reserve
probeMethods:*PlantHarvester
probeMethods:*Zone
probeMethods:*Bird
probeMethods:*SpaceUnit
canBeMoved:*PlantHarvester,true
canBeMoved:*Bird,false
manipWholePop:*Reserve,false
manipWholePop:*PlantHarvester,false
manipWholePop:*Zone,false
manipWholePop:*Bird,false
manipWholePop:*SpaceUnit,false
canChangeValues:*Reserve,false
canChangeValues:*PlantHarvester,true
canChangeValues:*Zone,false
canChangeValues:*Bird,false
canChangeValues:*SpaceUnit,false
defaultPov:*Reserve,delimitors
defaultPov:*PlantHarvester,pov
defaultPov:*SpaceUnit,povBiomass
defaultInfo:*SpaceUnit,info_zone
delimiterSize:*ESE,pixel0
delimitors:*Reserve,3,ColorValue red
delimitors:*SpaceUnit,0,ColorValue black
doHideCells:*true
defaultTool:*toolInspect
siMenuFormat:*siMenuFull
isUndoRedoEnabled:*true
isManipulateForTabletEnabled:*false
isSingleDefaultPovShown:*true
isSingleDefaultInfoShown:*true
trackLengthValue:*All,nil
trackedAgents:*trackedAgents:,'
]

{ #category : #'SI_config' }
ReHab class >> SIconfig_ReHab_Gameboard [
"Returns an array containing the settings of the Spatial Interface configuration named ReHab_I"
^'configName:*ReHab_Gameboard
observedEntitiesList:*#Bird,#PlantHarvester,#Reserve,#SpaceUnit,#Zone,
manipEntitiesList:*#Bird,#PlantHarvester,#Reserve,#SpaceUnit,#Zone,
createEntitiesList:*
manipMethods:*SpaceUnit,protect,unprotect
manipMethods:*Zone
manipMethods:*Bird
manipMethods:*PlantHarvester,goBackHome
manipMethods:*Reserve,flash
povMethods:*SpaceUnit,povBiomass,povId
povMethods:*Zone,delimitors
povMethods:*Bird,pov
povMethods:*PlantHarvester,pov,povColor,povHarvest
povMethods:*Reserve,delimitors
attributes:*SpaceUnit,access,biomass
attributes:*Zone,access,biomass,chickenOneLocation,chickenTwoLocation,nestingBirdLocation,noHarvestPeriod,topLeftLocation
attributes:*Bird,status
attributes:*PlantHarvester,harvest,label,myClan
attributes:*Reserve
infoMethods:*SpaceUnit,info_ClassName,info_ID,info_zone
infoMethods:*Zone,info_ID
infoMethods:*Bird
infoMethods:*PlantHarvester,info_harvest
infoMethods:*Reserve,info_ID
probeMethods:*SpaceUnit
probeMethods:*Zone
probeMethods:*Bird
probeMethods:*PlantHarvester
probeMethods:*Reserve
canBeMoved:*PlantHarvester,true
canBeMoved:*Bird,false
manipWholePop:*SpaceUnit,false
manipWholePop:*Zone,false
manipWholePop:*Bird,false
manipWholePop:*PlantHarvester,false
manipWholePop:*Reserve,false
canChangeValues:*SpaceUnit,false
canChangeValues:*Zone,false
canChangeValues:*Bird,false
canChangeValues:*PlantHarvester,true
canChangeValues:*Reserve,false
defaultPov:*SpaceUnit,povBiomass
defaultPov:*PlantHarvester,povColor
defaultPov:*Reserve,delimitors
defaultInfo:*SpaceUnit,info_zone
delimiterSize:*ESE,pixel0
defaultTool:*toolInspect
siMenuFormat:*siMenuFull
isUndoRedoEnabled:*true
isManipulateForTabletEnabled:*false
isSingleDefaultPovShown:*true
isSingleDefaultInfoShown:*true
trackLengthValue:*All,nil
trackedAgents:*'
]

{ #category : #'SI_config' }
ReHab class >> SIconfig_ReHab_NP [
"Returns an string containing the settings of the Spatial Interface configuration named ReHab_NP"
^'configName:*ReHab_NP
observedEntitiesList:*#Bird,#PlantHarvester,#Reserve,#SpaceUnit,#Zone,
manipEntitiesList:*#Bird,#PlantHarvester,#Reserve,#SpaceUnit,#Zone,
createEntitiesList:*
manipMethods:*Reserve,flash
manipMethods:*PlantHarvester,goBackHome
manipMethods:*Zone
manipMethods:*SpaceUnit
manipMethods:*Bird
povMethods:*Reserve,delimitors
povMethods:*PlantHarvester,pov,povColor,povHarvest
povMethods:*Zone,delimitors
povMethods:*Bird,pov
povMethods:*SpaceUnit,povBiomass,povId
attributes:*Reserve
attributes:*PlantHarvester,harvest,label,myClan
attributes:*Zone,access,biomass,chickenOneLocation,chickenTwoLocation,nestingBirdLocation,noHarvestPeriod,topLeftLocation
attributes:*Bird,status
attributes:*SpaceUnit,biomass
infoMethods:*Reserve,info_ID
infoMethods:*PlantHarvester,info_harvest
infoMethods:*Zone,info_ID
infoMethods:*Bird
infoMethods:*SpaceUnit,info_ClassName,info_ID,info_zone
probeMethods:*Reserve
probeMethods:*PlantHarvester
probeMethods:*Zone
probeMethods:*Bird
probeMethods:*SpaceUnit
canBeMoved:*PlantHarvester,true
canBeMoved:*Bird,false
manipWholePop:*Reserve,false
manipWholePop:*PlantHarvester,false
manipWholePop:*Zone,false
manipWholePop:*SpaceUnit,false
manipWholePop:*Bird,false
canChangeValues:*Reserve,false
canChangeValues:*PlantHarvester,true
canChangeValues:*Zone,false
canChangeValues:*SpaceUnit,false
canChangeValues:*Bird,false
defaultPov:*Reserve,delimitors
defaultPov:*PlantHarvester,pov
defaultPov:*SpaceUnit,povBiomass
defaultPov:*Bird,pov
defaultInfo:*SpaceUnit,info_zone
delimiterSize:*ESE,pixel0
delimitors:*Reserve,3,ColorValue red
delimitors:*SpaceUnit,0,ColorValue black
doHideCells:*true
defaultTool:*toolInspect
siMenuFormat:*siMenuFull
isUndoRedoEnabled:*true
isManipulateForTabletEnabled:*false
isSingleDefaultPovShown:*true
isSingleDefaultInfoShown:*true
trackLengthValue:*All,nil
trackedAgents:*trackedAgents:,'
]

{ #category : #'SI_config' }
ReHab class >> SIconfig_ReHab_Replay [
"Returns an array containing the settings of the Spatial Interface configuration named ReHab_NP"
^'configName:*ReHab_Replay
observedEntitiesList:*#Bird,#PlantHarvester,#Reserve,#SpaceUnit,#Zone,
manipEntitiesList:*#Bird,#PlantHarvester,#Reserve,#SpaceUnit,#Zone,
createEntitiesList:*
manipMethods:*Bird
manipMethods:*Reserve,flash
manipMethods:*PlantHarvester,goBackHome
manipMethods:*Zone
manipMethods:*SpaceUnit,protect,unprotect
povMethods:*Bird,pov
povMethods:*Reserve,delimitors
povMethods:*PlantHarvester,pov,povColor,povHarvest
povMethods:*Zone,delimitors
povMethods:*SpaceUnit,povBiomass,povId
attributes:*Bird,status
attributes:*Reserve
attributes:*PlantHarvester,harvest,label,myClan
attributes:*Zone,access,biomass,chickenOneLocation,chickenTwoLocation,nestingBirdLocation,noHarvestPeriod,topLeftLocation
attributes:*SpaceUnit,access,biomass
infoMethods:*Bird
infoMethods:*Reserve,info_ID
infoMethods:*PlantHarvester,info_harvest
infoMethods:*Zone,info_ID
infoMethods:*SpaceUnit,info_ClassName,info_ID,info_zone
probeMethods:*Bird
probeMethods:*Reserve
probeMethods:*PlantHarvester
probeMethods:*Zone
probeMethods:*SpaceUnit
canBeMoved:*Bird,false
canBeMoved:*PlantHarvester,true
manipWholePop:*Bird,false
manipWholePop:*Reserve,false
manipWholePop:*PlantHarvester,false
manipWholePop:*Zone,false
manipWholePop:*SpaceUnit,false
canChangeValues:*Bird,false
canChangeValues:*Reserve,false
canChangeValues:*PlantHarvester,true
canChangeValues:*Zone,false
canChangeValues:*SpaceUnit,false
defaultPov:*Bird,pov
defaultPov:*Reserve,delimitors
defaultPov:*PlantHarvester,povHarvest
defaultPov:*SpaceUnit,povBiomass
defaultInfo:*SpaceUnit,info_zone
delimiterSize:*ESE,pixel0
defaultTool:*toolInspect
siMenuFormat:*siMenuFull
isUndoRedoEnabled:*true
isManipulateForTabletEnabled:*false
isSingleDefaultPovShown:*true
isSingleDefaultInfoShown:*true
trackLengthValue:*All,nil
trackedAgents:*'
]

{ #category : #description }
ReHab class >> authors [
^ 'Christophe Le Page & Anne Dray'
]

{ #category : #'- default value' }
ReHab class >> birdNewborns_default [
	"Return the default value of attribute #birdNewborns : 0.
	!! This method was automatically generated by Cormas !!"

	^0
]

{ #category : #sessions }
ReHab class >> checkExistingDataFor: aString inDirectory: aDirectory [
	^(aDirectory construct: aString , '.txt') exists
]

{ #category : #sessions }
ReHab class >> checkExistingReplayDataIn: aDirectory [

	^((self checkExistingDataFor: 'clans' inDirectory: aDirectory)
		and:
			[(self checkExistingDataFor: 'harvestersLocations' inDirectory: aDirectory)
				and:
					[self checkExistingDataFor: 'harvestersResults' inDirectory: aDirectory]])
		or: [(aDirectory construct: 'gameboardInputs.csv') exists]
]

{ #category : #description }
ReHab class >> comments [
^ 'This model is supporting a Role-Playing Game. A virtual ecosystem is the reproductive habitat of an endangered species of animal, and at the same time it provides a source of income for local people who are havesting the dominant plant. The spatial setting is set as 20 regular space units holding 0,1,2 or 3 units of plant biomass. A constant number of 20 plant harvesters are competing to harvest the plant while a national park is trying to monitor the reproduction of the endangered species. Most of the players (5 to 20) are clans made of 1 to 4 members per clan (the number of members is set to make a total of 20). 1 to 3 players are National Park Officers"
'
]

{ #category : #description }
ReHab class >> cormasCompatibleVersion [
^ #(2020 1 26 14 39 0)
]

{ #category : #description }
ReHab class >> creationDate [
^ '2008-05-16'
]

{ #category : #description }
ReHab class >> currentDeveloperName [
^ 'Christophe Le Page & Anne Dray'
]

{ #category : #sessions }
ReHab class >> dataPlayer: aString time: t separator: aChar [
	| stream i dataLine collec |
	stream := self inputStreamPlayer: aString.
	i := 0.
	[stream atEnd not and: [i < t]] whileTrue:
			[dataLine := stream upTo: Character cr.
			i := i + 1.
			i = t ifTrue: [collec := dataLine tokensBasedOn: aChar]].
	stream close.
	^collec
]

{ #category : #description }
ReHab class >> emails [
^ 'le_page@cirad.fr'
]

{ #category : #'- default value' }
ReHab class >> excelFile_default [
	"Return the default value of attribute #excelFile : nil.
	This method was automatically generated by Cormas.
	!! BECAREFUL, You should not modify this method as it can be generated again when changing the value (Sensitivity Analysis for ex) !!"

	^nil
]

{ #category : #'+ parameter unit' }
ReHab class >> excelFile_type [
	"Return the type of attribute #excelFile.
	This method was automatically generated by Cormas.
	!! BECAREFUL, You should not modify this method as it can be generated again when changing the value (Sensitivity Analysis for ex) !!"

	^UndefinedObject
]

{ #category : #'- default value' }
ReHab class >> excelInterface_default [
	"Return the default value of attribute #excelInterface : nil.
	This method was automatically generated by Cormas.
	!! BECAREFUL, You should not modify this method as it can be generated again when changing the value (Sensitivity Analysis for ex) !!"

	^nil
]

{ #category : #'+ parameter unit' }
ReHab class >> excelInterface_type [
	"Return the type of attribute #excelInterface.
	This method was automatically generated by Cormas.
	!! BECAREFUL, You should not modify this method as it can be generated again when changing the value (Sensitivity Analysis for ex) !!"

	^UndefinedObject
]

{ #category : #'- default value' }
ReHab class >> excelWorksheet_default [
	"Return the default value of attribute #excelWorksheet : nil.
	This method was automatically generated by Cormas.
	!! BECAREFUL, You should not modify this method as it can be generated again when changing the value (Sensitivity Analysis for ex) !!"

	^nil
]

{ #category : #'+ parameter unit' }
ReHab class >> excelWorksheet_type [
	"Return the type of attribute #excelWorksheet.
	This method was automatically generated by Cormas.
	!! BECAREFUL, You should not modify this method as it can be generated again when changing the value (Sensitivity Analysis for ex) !!"

	^UndefinedObject
]

{ #category : #sessions }
ReHab class >> filenameMap [
	^self gameSession construct: 'carte' , self year printString , '.env'
]

{ #category : #accessing }
ReHab class >> gameSession [
	"Getter accessor without default value "
	^gameSession
]

{ #category : #accessing }
ReHab class >> gameSession: anObject [
	gameSession := anObject
]

{ #category : #'- default value' }
ReHab class >> gameSession_default [
	"Return the default value of gameSession attribute"
	^nil
]

{ #category : #'- default value' }
ReHab class >> highlightedClan_default [
	"Return the default value of highlightedClan attribute"
	^0
]

{ #category : #description }
ReHab class >> howToRunIt [
| txt |
	txt := 'The documents needed to organize a gaming session are freely downloadable here: http://www.commod.org/modeles/rehab

You can play ReHab with a minimum of 6 participants up to about thirty (above that limit, it is better to split the group to play different sessions). With less than 10 participants, allocate just one of them to play the National Park manager; up to 20 (resp. more than 30) participants, allocate 2 (resp. 3) of them to interact in playing the National Park. All the other participants will play households made of harvesting members. The total number of individual harvesters (households'' members) HAS TO BE 20. The number of households can be set from 5 up to 20, with the corresponding distributions of individual members:
5 households   => 5*4 members
6 households   => 2*4 + 4*3 members
7 households   => 6*3 + 1*2 members
8 households   => 4*3 + 4*2 members
9 households   => 2*3 + 7*2 members
10 households => 10*2 members
11 households => 9*2 + 2*1 members
12 households => 8*2 + 4*1 members
13 households => 7*2 + 6*1 members
14 households => 6*2 + 8*1 members
15 households => 5*2 + 10*1 members
16 households => 4*2 + 12*1 members
17 households => 3*2 + 14*1 members
18 households => 2*2 + 16*1 members
19 households => 1*2 + 18*1 members
20 households => 20*1 members

You can group participants by households, to manage having all of them playing the game. A household made of i members (1 <= i <= 4) can be played by a group of n participants, with n possibly different from i. Use the right Excel decision sheet to distribute to each household according to its number of members.

To initialize a gaming session, clic on "Initialize", then select ("init_newGame" and "run_newGame:") and apply. Enter the name of your session. Enter the number of households. Two windows are poping up: a small one and a big one. Both represent the initial configuration of the environment. Switch your laptop display mode from "Duplicate" to "Extend" (Fn F8 or whatever it is encoded on your laptop). Move the bigger window to the public view and resize it so that it fits nicely within the available display box. Keep the smaller one on the private laptop screen. Participants playing the National Park have to be seated behind the laptop, so they can see the grid with the "bird" viewpoint activated. Other participants, playing the harvesting households, have to be dispersed around the room. They will be able to watch only the public neutral display. The operator in charge of entering players'' decisions and writting results is also seated behind the laptop.

Click on "execute one step" to move to the next round.

When 5 rounds have been played, to visualize the results of the scenario, select "Probes" from the "Visualization" main menu.

During the debriefing, it is often useful to replay a session. Clic on "Initialize", then select ("init_replay" and "run_replay:") and apply. Choose the name of the session you want to replay. If you decide to highlight one household, its members will be coloured, the darker the more biomass they have harvested.

' asText emphasizeAllWith: #(#bold #large).
	ComposedTextView open: txt asValue
		label: 'How to run ' , self name , '     step-by-step instructions'
		icon: (Icon constantNamed: #workspace)
		extent: 1000 @ 800
]

{ #category : #sessions }
ReHab class >> inputStreamPlayer: aString [
	^(self gameSession construct: aString , '.txt') readStream
]

{ #category : #'- default value' }
ReHab class >> interfaceSession_default [
	"Return the default value of interfaceSession attribute"
	^nil
]

{ #category : #'- default value' }
ReHab class >> interface_default [
	"Return the default value of interface attribute"
	^nil
]

{ #category : #description }
ReHab class >> lastUpdate [
^ 'lundi 13 juillet 2020'
]

{ #category : #'- default value' }
ReHab class >> nbClans_default [
	"Return the default value of nbClans attribute"
	^0
]

{ #category : #'- default value' }
ReHab class >> nbFamilies_default [
	"Return the default value of attribute #nbFamilies : 5.
	This method was automatically generated by Cormas.
	!! BECAREFUL, You should not modify this method as it can be generated again when changing the value (Sensitivity Analysis for ex) !!"

	^5
]

{ #category : #'+ parameter unit' }
ReHab class >> nbFamilies_type [
	"Return the type of attribute #nbFamilies.
	This method was automatically generated by Cormas.
	!! BECAREFUL, You should not modify this method as it can be generated again when changing the value (Sensitivity Analysis for ex) !!"

	^SmallInteger
]

{ #category : #'+ parameter unit' }
ReHab class >> nbFamilies_unit [
	"Return the unit of attribute #nbFamilies.
	This method was automatically generated by Cormas.
	!! BECAREFUL, You should not modify this method as it can be generated again when changing the value (Sensitivity Analysis for ex) !!"

	^ ''
]

{ #category : #sessions }
ReHab class >> outputStreamPlayer: aString [
	| filename |
	filename := self gameSession construct: aString , '.txt'.
	^filename exists
		ifTrue: [filename appendStream]
		ifFalse: [filename writeStream]
]

{ #category : #'- default value' }
ReHab class >> path_USB_Drive_default [
	"Return the default value of path_USB_Drive attribute"
	^nil
]

{ #category : #'- default value' }
ReHab class >> poaching_default [
	"Return the default value of attribute #poaching : 0.
	This method was automatically generated by Cormas.
	!! BECAREFUL, You should not modify this method as it can be generated again when changing the value (Sensitivity Analysis for ex) !!"

	^0
]

{ #category : #'+ parameter unit' }
ReHab class >> poaching_type [
	"Return the type of attribute #poaching.
	This method was automatically generated by Cormas.
	!! BECAREFUL, You should not modify this method as it can be generated again when changing the value (Sensitivity Analysis for ex) !!"

	^SmallInteger
]

{ #category : #'+ parameter unit' }
ReHab class >> poaching_unit [
	"Return the unit of attribute #poaching.
	This method was automatically generated by Cormas.
	!! BECAREFUL, You should not modify this method as it can be generated again when changing the value (Sensitivity Analysis for ex) !!"

	^ ''
]

{ #category : #accessing }
ReHab class >> replay [
	"Getter accessor without default value "
	^replay
]

{ #category : #accessing }
ReHab class >> replay: anObject [
	replay := anObject
]

{ #category : #'- default value' }
ReHab class >> replay_default [
	"Return the default value of replay attribute"
	^nil
]

{ #category : #'- default value' }
ReHab class >> restrained_default [
	"Return the default value of attribute #restrained : 0.
	This method was automatically generated by Cormas.
	!! BECAREFUL, You should not modify this method as it can be generated again when changing the value (Sensitivity Analysis for ex) !!"

	^0
]

{ #category : #'+ parameter unit' }
ReHab class >> restrained_type [
	"Return the type of attribute #restrained.
	This method was automatically generated by Cormas.
	!! BECAREFUL, You should not modify this method as it can be generated again when changing the value (Sensitivity Analysis for ex) !!"

	^SmallInteger
]

{ #category : #'+ parameter unit' }
ReHab class >> restrained_unit [
	"Return the unit of attribute #restrained.
	This method was automatically generated by Cormas.
	!! BECAREFUL, You should not modify this method as it can be generated again when changing the value (Sensitivity Analysis for ex) !!"

	^ ''
]

{ #category : #'- default value' }
ReHab class >> saveGame_default [
	"Return the default value of saveGame attribute"
	^nil
]

{ #category : #'- default value' }
ReHab class >> scenario_default [
	"Return the default value of attribute #scenario : 1.
	This method was automatically generated by Cormas.
	!! BECAREFUL, You should not modify this method as it can be generated again when changing the value (Sensitivity Analysis for ex) !!"

	^1
]

{ #category : #'+ parameter unit' }
ReHab class >> scenario_type [
	"Return the type of attribute #scenario.
	This method was automatically generated by Cormas.
	!! BECAREFUL, You should not modify this method as it can be generated again when changing the value (Sensitivity Analysis for ex) !!"

	^SmallInteger
]

{ #category : #'+ parameter unit' }
ReHab class >> scenario_unit [
	"Return the unit of attribute #scenario.
	This method was automatically generated by Cormas.
	!! BECAREFUL, You should not modify this method as it can be generated again when changing the value (Sensitivity Analysis for ex) !!"

	^ ''
]

{ #category : #sessions }
ReHab class >> sessionsPath [
	| modelPath path |
	modelPath := Cormas modelPath: self name.
	path := modelPath construct: 'data'.
	path asFilename exists ifFalse: [path asFilename makeDirectory].
	^path
]

{ #category : #'- default value' }
ReHab class >> strategy_Family_default [
	"Return the default value of attribute #strategy_Family : 1.
	This method was automatically generated by Cormas.
	!! BECAREFUL, You should not modify this method as it can be generated again when changing the value (Sensitivity Analysis for ex) !!"

	^1
]

{ #category : #'- default value' }
ReHab class >> strategy_ParkManager_default [
	"Return the default value of attribute #strategy_ParkManager : 1.
	This method was automatically generated by Cormas.
	!! BECAREFUL, You should not modify this method as it can be generated again when changing the value (Sensitivity Analysis for ex) !!"

	^1
]

{ #category : #'+ parameter unit' }
ReHab class >> strategy_ParkManager_type [
	"Return the type of attribute #strategy_ParkManager.
	This method was automatically generated by Cormas.
	!! BECAREFUL, You should not modify this method as it can be generated again when changing the value (Sensitivity Analysis for ex) !!"

	^SmallInteger
]

{ #category : #'+ parameter unit' }
ReHab class >> strategy_ParkManager_unit [
	"Return the unit of attribute #strategy_ParkManager.
	This method was automatically generated by Cormas.
	!! BECAREFUL, You should not modify this method as it can be generated again when changing the value (Sensitivity Analysis for ex) !!"

	^ ''
]

{ #category : #'- default value' }
ReHab class >> strategy_default [
	"Return the default value of attribute #strategy : 1.
	This method was automatically generated by Cormas.
	!! BECAREFUL, You should not modify this method as it can be generated again when changing the value (Sensitivity Analysis for ex) !!"

	^1
]

{ #category : #'+ parameter unit' }
ReHab class >> strategy_type [
	"Return the type of attribute #strategy.
	This method was automatically generated by Cormas.
	!! BECAREFUL, You should not modify this method as it can be generated again when changing the value (Sensitivity Analysis for ex) !!"

	^SmallInteger
]

{ #category : #'+ parameter unit' }
ReHab class >> strategy_unit [
	"Return the unit of attribute #strategy.
	This method was automatically generated by Cormas.
	!! BECAREFUL, You should not modify this method as it can be generated again when changing the value (Sensitivity Analysis for ex) !!"

	^ ''
]

{ #category : #sessions }
ReHab class >> testInfoPlayer: aString [
	^(self gameSession construct: aString , '.txt') exists
]

{ #category : #sessions }
ReHab class >> testSession [
	| list |
	list := self gameSession directoryContents.
	self halt.
	list isEmpty
		ifTrue: [self halt]
		ifFalse:
			["

testInfoPlayer: aString
	^(self gameSession construct: aString , '.txt') exists"

			]
]

{ #category : #sessions }
ReHab class >> timeStepsPlayed [
	| stream nbLines |
	stream := (self gameSession construct: 'harvestersLocations.txt')
				readStream.
	nbLines := 0.
	[stream atEnd] whileFalse:
			[(stream upTo: Character cr) isEmpty ifFalse: [nbLines := nbLines + 1]].
	stream close.
	^nbLines
]

{ #category : #description }
ReHab class >> version [
^ 'ReHab_Pharo.st'
]

{ #category : #description }
ReHab class >> versionComments [
^ '

 --------------------- ReHab_2016.pcl --------------------- Date: 2016.9.25

 *** Developer: Christophe Le Page & Anne Dray ***

 --------------------- ReHab_2016.pcl --------------------- Date: 2016.9.25

 *** Developer: Christophe Le Page & Anne Dray ***

 --------------------- ReHab_2016.pcl --------------------- Date: 2016.9.25

 *** Developer: Christophe Le Page & Anne Dray ***

 --------------------- ReHab_2016.pcl --------------------- Date: 2016.9.25

 *** Developer: Christophe Le Page & Anne Dray ***

 --------------------- ReHab_2016.pcl --------------------- Date: 2016.9.25

 *** Developer: Christophe Le Page & Anne Dray ***

 --------------------- ReHab_2016.pcl --------------------- Date: 2016.9.25

 *** Developer: Christophe Le Page & Anne Dray ***

 --------------------- ReHab_2017.pcl --------------------- Date: 2016.9.25

 *** Developer: Christophe Le Page & Anne Dray ***

 --------------------- ReHab_2017.pcl --------------------- Date: 2016.9.25
can now be played with only 3 or 4 families
 *** Developer: Christophe Le Page & Anne Dray ***

 --------------------- ReHab_2018.pcl --------------------- Date: 2017.11.15

 *** Developer: Christophe Le Page & Anne Dray ***

 --------------------- ReHab_2018.pcl --------------------- Date: 2017.11.15

 *** Developer: Christophe Le Page & Anne Dray ***

 --------------------- ReHab_2018.pcl --------------------- Date: 2017.11.15

 *** Developer: Christophe Le Page & Anne Dray ***

 --------------------- ReHab_2018.pcl --------------------- Date: 2017.11.15

 *** Developer: Christophe Le Page & Anne Dray ***

 --------------------- ReHab_2018.pcl --------------------- Date: 2017.11.15

 *** Developer: Christophe Le Page & Anne Dray ***

 --------------------- ReHab_2018.pcl --------------------- Date: 2017.11.15

 *** Developer: Christophe Le Page & Anne Dray ***

 --------------------- ReHab_2018.pcl --------------------- Date: 2017.11.15

 *** Developer: Christophe Le Page & Anne Dray ***

 --------------------- ReHab_2018.pcl --------------------- Date: 2017.11.15

 *** Developer: Christophe Le Page & Anne Dray ***

 --------------------- ReHab_2018.pcl --------------------- Date: 2017.11.15

 *** Developer: Christophe Le Page & Anne Dray ***

 --------------------- ReHab_2018.pcl --------------------- Date: 2017.11.15

 *** Developer: Christophe Le Page & Anne Dray ***

 --------------------- ReHab_2019.pcl --------------------- Date: 2017.11.15

 *** Developer: Christophe Le Page & Anne Dray ***

 --------------------- ReHab_2019.pcl --------------------- Date: 2017.11.15

 *** Developer: Christophe Le Page & Anne Dray ***

 --------------------- ReHab_2019.pcl --------------------- Date: 2017.11.15

 *** Developer: Christophe Le Page & Anne Dray ***

 --------------------- ReHab_2019.pcl --------------------- Date: 2017.11.15

 *** Developer: Christophe Le Page & Anne Dray ***

 --------------------- ReHab_2019.pcl --------------------- Date: 2017.11.15

 *** Developer: Christophe Le Page & Anne Dray ***

 --------------------- ReHab_2019.pcl --------------------- Date: 2017.11.15

 *** Developer: Christophe Le Page & Anne Dray ***

 --------------------- ReHab_2019.pcl --------------------- Date: 2017.11.15

 *** Developer: Christophe Le Page & Anne Dray ***

 --------------------- ReHab_2019.pcl --------------------- Date: 2017.11.15

 *** Developer: Christophe Le Page & Anne Dray ***

 --------------------- ReHab_2019.pcl --------------------- Date: 2017.11.15

 *** Developer: Christophe Le Page & Anne Dray ***

 --------------------- ReHab_2019.pcl --------------------- Date: 2017.11.15

 *** Developer: Christophe Le Page & Anne Dray ***

with module "Autonomous"

 *** Developer: Christophe Le Page & Anne Dray ***

 --------------------- ReHab_2019.pcl --------------------- Date: 2017.11.15

 *** Developer: Christophe Le Page & Anne Dray ***

 --------------------- ReHab_2019.pcl --------------------- Date: 2017.11.15

 *** Developer: Christophe Le Page & Anne Dray ***

 --------------------- ReHab_2019.pcl --------------------- Date: 2017.11.15

 *** Developer: Christophe Le Page & Anne Dray ***

 --------------------- ReHab_2019.pcl --------------------- Date: 2017.11.15

 *** Developer: Christophe Le Page & Anne Dray ***

 --------------------- ReHab_Pharo.pcl --------------------- Date: 2020.1.26

 *** Developer: Christophe Le Page & Anne Dray ***

 --------------------- ReHab_Pharo.st --------------------- Date: 2020.1.26

 *** Developer: Christophe Le Page & Anne Dray ***

 --------------------- ReHab_Pharo.pcl --------------------- Date: 2020.1.26

 *** Developer: Christophe Le Page & Anne Dray ***

 --------------------- ReHab_Pharo.pcl --------------------- Date: 2020.1.26

 *** Developer: Christophe Le Page & Anne Dray ***

 --------------------- ReHab_Pharo.pcl --------------------- Date: 2020.1.26

 *** Developer: Christophe Le Page & Anne Dray ***

 --------------------- ReHab_Pharo.pcl --------------------- Date: 2020.1.26

 *** Developer: Christophe Le Page & Anne Dray ***

 --------------------- ReHab_Pharo.pcl --------------------- Date: 2020.1.26

 *** Developer: Christophe Le Page & Anne Dray ***

 --------------------- ReHab_Pharo.pcl --------------------- Date: 2020.1.26

 *** Developer: Christophe Le Page & Anne Dray ***

 --------------------- ReHab_Pharo.pcl --------------------- Date: 2020.1.26

 *** Developer: Christophe Le Page & Anne Dray ***

 --------------------- ReHab_Pharo.pcl --------------------- Date: 2020.1.26

 *** Developer: Christophe Le Page & Anne Dray ***

 --------------------- ReHab_Pharo.pcl --------------------- Date: 2020.1.26

 *** Developer: Christophe Le Page & Anne Dray ***

 --------------------- ReHab_Pharo.pcl --------------------- Date: 2020.1.26

 *** Developer: Christophe Le Page & Anne Dray ***

 --------------------- ReHab_Pharo.st --------------------- Date: 2020.1.26

 *** Developer: Christophe Le Page & Anne Dray ***

 --------------------- ReHab_Pharo.st --------------------- Date: 2020.1.26

 *** Developer: Christophe Le Page & Anne Dray ***'
]

{ #category : #description }
ReHab class >> vwCompatibleVersion [
^ '7.6'
]

{ #category : #probes }
ReHab >> birdNewborns [
	"Getter accessor with default value = 0 "
<probe>
	^ birdNewborns ifNil: [ birdNewborns := 0 ]
]

{ #category : #accessing }
ReHab >> birdNewborns: x [
	birdNewborns := x
]

{ #category : #birds }
ReHab >> birdsMigrating [

	self theZones
		do:
			[:c |
			(c occupantsType: Bird)
				do:
					[:b |
					b
						leave;
						dead: true]]
]

{ #category : #birds }
ReHab >> birdsNesting [

	| newBird |
	self theBirds: IndexedSet new.
	self theZones
		do:
			[:z |
			z biomass >= Bird habitatSuitabilityThreshold
				ifTrue:
					[newBird := self newEntity: Bird.
					newBird status: #adult.
					newBird moveTo: z]]
]

{ #category : #'instance-creation' }
ReHab >> createFamiliesFromDistributionMembers [

	(Family membersDistribution at: self nbFamilies)
		do: [:nbMembers | self createFamilyWithNbMembers: nbMembers]
]

{ #category : #'instance-creation' }
ReHab >> createFamilyWithNbMembers: anInteger [
	| newClan newMember |
	newClan := self newEntity: Family.
	newClan zones: self theZones.
	1 to: anInteger
		do:
			[:index |
			newMember := self newEntity: PlantHarvester.
			newClan addComponent: newMember.
			newMember myClan: newClan.
			newMember label: 'H' , newClan id printString , 'M' , index printString]
]

{ #category : #probes }
ReHab >> harvest [
<probe>
	^ self theFamilys
		inject: 0
		into: [ :sum :aFamily | sum + aFamily harvest ]
]

{ #category : #init }
ReHab >> init [
	self createGridX: 5 Y: 4 neighbourhood: 8 closed: true.
	self setInitialBiomasses.
	self theZones do: [:aZone | aZone noHarvestPeriod: 0].
	self initAgents_Autonomous.
]

{ #category : #'instance-creation' }
ReHab >> initAgents_Autonomous [
	"self poaching: 0." "0 (default) or 1"
	"self restrained: 0.5." "float from 0 (default) to 1"
	"self nbFamilies: 10." "integer from 1 to 20 (5 by default)"
	"self strategy_Family: 4." "integer from 1 (default) to nb subclasses Strategy_Family (4 in this version)"
	"self strategy_ParkManager: 2." "integer from 1 (default) to nb subclasses Strategy_ParkManager (2 in this version)"

	self createFamiliesFromDistributionMembers.
	self theFamilys
		do:
			[:f |
			f zones: self theZones.
			f strategy: (self newEntity: (Strategy_Family allSubclasses at: self strategy_Family)).
			f strategy holder: f.
			f strategy poacher: self poaching.
			f strategy restrained: self restrained].
	self initAnimals.
	self initParkManager.
	self parkManager strategy: (self newEntity: (Strategy_ParkManager allSubclasses at: self strategy_ParkManager)).
	self parkManager strategy holder: self parkManager
]

{ #category : #'instance-creation' }
ReHab >> initAnimals [
	self birdNewborns: 0.
]

{ #category : #'instance-creation' }
ReHab >> initParkManager [
	self newEntity: ParkManager.
	self parkManager zones: self theZones
]

{ #category : #accessing }
ReHab >> nbFamilies [
	"Getter accessor with initial value = 5.
	This method was automatically generated by Cormas.
	!! BECAREFUL, You should not modify this method as it can be generated again when changing the value (Sensitivity Analysis for ex) !! "
	^nbFamilies ifNil:[nbFamilies := 5]
]

{ #category : #accessing }
ReHab >> nbFamilies: aSmallInteger [
	"Setter accessor of attribute nbFamilies	This method was automatically generated by Cormas.
	!! BECAREFUL, You should not modify this method as it can be generated again when changing the value (Sensitivity Analysis for ex) !!  "
	nbFamilies := aSmallInteger
]

{ #category : #accessing }
ReHab >> parkManager [
	^self theParkManagers first
]

{ #category : #accessing }
ReHab >> poaching [
	"Getter accessor with initial value = 0.
	This method was automatically generated by Cormas.
	!! BECAREFUL, You should not modify this method as it can be generated again when changing the value (Sensitivity Analysis for ex) !! "
	^poaching ifNil:[poaching := 0]
]

{ #category : #accessing }
ReHab >> poaching: aSmallInteger [
	"Setter accessor of attribute poaching	This method was automatically generated by Cormas.
	!! BECAREFUL, You should not modify this method as it can be generated again when changing the value (Sensitivity Analysis for ex) !!  "
	poaching := aSmallInteger
]

{ #category : #probes }
ReHab >> resourceBiomass [
<probe>
	^ self theZones inject: 0 into: [ :sum :aZone | sum + aZone biomass ]
]

{ #category : #accessing }
ReHab >> restrained [
	"Getter accessor with initial value = 0.
	This method was automatically generated by Cormas.
	!! BECAREFUL, You should not modify this method as it can be generated again when changing the value (Sensitivity Analysis for ex) !! "
	^restrained ifNil:[restrained := 0]
]

{ #category : #accessing }
ReHab >> restrained: aSmallInteger [
	"Setter accessor of attribute restrained	This method was automatically generated by Cormas.
	!! BECAREFUL, You should not modify this method as it can be generated again when changing the value (Sensitivity Analysis for ex) !!  "
	restrained := aSmallInteger
]

{ #category : #control }
ReHab >> run: t [
	| newBirds |
	self birdsNesting.
	t > 1 ifTrue: [self parkManager decideAccess].
	self theFamilys do: [:f | f decideHarvestersLocations; sendMembersHarvesting].
	self theZones do: [:aZone | aZone allocateHarvests].
	newBirds := Set new.
	self theBirds do: [:aBird | newBirds addAll: aBird reproduce].
	self theBirds addAll: newBirds.
	self birdNewborns: (self birdNewborns + newBirds size).
	self theZones do: [:aZone | aZone renewBiomass].
	self thePlantHarvesters do: [:ph | ph leave].
	self theFamilys do: [:h | h updateHarvest].
	self birdsMigrating.
	t > 1 ifTrue: [self theZones do: [:z | z access: true]]
]

{ #category : #'instance-creation' }
ReHab >> setInitialBiomasses [

	| initialPlantBiomasses |
	initialPlantBiomasses := #(1 1 2 1 1 2 0 2 3 2 1 3 1 2 1 1 3 1 0 2).
	self theZones
		with: initialPlantBiomasses
		do: [:z :i | z biomass: i]
]

{ #category : #accessing }
ReHab >> strategy_Family [
	"Getter accessor with initial value = 1.
	This method was automatically generated by Cormas.
	!! BECAREFUL, You should not modify this method as it can be generated again when changing the value (Sensitivity Analysis for ex) !! "
	^strategy_Family ifNil:[strategy_Family := 1]
]

{ #category : #accessing }
ReHab >> strategy_Family: aSmallInteger [
	"Setter accessor of attribute strategy	This method was automatically generated by Cormas.
	!! BECAREFUL, You should not modify this method as it can be generated again when changing the value (Sensitivity Analysis for ex) !!  "
	strategy_Family := aSmallInteger
]

{ #category : #accessing }
ReHab >> strategy_ParkManager [
	"Getter accessor with initial value = 1.
	This method was automatically generated by Cormas.
	!! BECAREFUL, You should not modify this method as it can be generated again when changing the value (Sensitivity Analysis for ex) !! "
	^strategy_ParkManager ifNil:[strategy_ParkManager := 1]
]

{ #category : #accessing }
ReHab >> strategy_ParkManager: aSmallInteger [
	"Setter accessor of attribute strategy_ParkManager	This method was automatically generated by Cormas.
	!! BECAREFUL, You should not modify this method as it can be generated again when changing the value (Sensitivity Analysis for ex) !!  "
	strategy_ParkManager := aSmallInteger
]

{ #category : #accessing }
ReHab >> theBirds [
^theBirds ifNil:[theBirds := IndexedSet new]
]

{ #category : #accessing }
ReHab >> theBirds: x [
theBirds := x
]

{ #category : #accessing }
ReHab >> theBlinds [
	"Returns a collection of all the instances of the sub classes collected by cormasModel.
	This method was automatically generated by Cormas.
	!! BECAREFUL, You should not modify this method as it can be generated again when changing the value (Sensitivity Analysis for ex) !!"


^theBlinds ifNil:[theBlinds := IndexedSet new]
]

{ #category : #accessing }
ReHab >> theBlinds: aNewCollection [
	"Set a new collection for theXXXs attribute.
	This method was automatically generated by Cormas.
	!! BECAREFUL, You should not modify this method as it can be generated again when changing the value (Sensitivity Analysis for ex) !!"

	theBlinds := aNewCollection
]

{ #category : #accessing }
ReHab >> theCrusaders [
	"Returns a collection of all the instances of the sub classes collected by cormasModel.
	This method was automatically generated by Cormas.
	!! BECAREFUL, You should not modify this method as it can be generated again when changing the value (Sensitivity Analysis for ex) !!"


^theCrusaders ifNil:[theCrusaders := IndexedSet new]
]

{ #category : #accessing }
ReHab >> theCrusaders: aNewCollection [
	"Set a new collection for theXXXs attribute.
	This method was automatically generated by Cormas.
	!! BECAREFUL, You should not modify this method as it can be generated again when changing the value (Sensitivity Analysis for ex) !!"

	theCrusaders := aNewCollection
]

{ #category : #accessing }
ReHab >> theExplorers [
	"Returns a collection of all the instances of the sub classes collected by cormasModel.
	This method was automatically generated by Cormas.
	!! BECAREFUL, You should not modify this method as it can be generated again when changing the value (Sensitivity Analysis for ex) !!"


^theExplorers ifNil:[theExplorers := IndexedSet new]
]

{ #category : #accessing }
ReHab >> theExplorers: aNewCollection [
	"Set a new collection for theXXXs attribute.
	This method was automatically generated by Cormas.
	!! BECAREFUL, You should not modify this method as it can be generated again when changing the value (Sensitivity Analysis for ex) !!"

	theExplorers := aNewCollection
]

{ #category : #accessing }
ReHab >> theFamilys [
^theFamilys ifNil:[theFamilys := IndexedSet new]
]

{ #category : #accessing }
ReHab >> theFamilys: x [
theFamilys := x
]

{ #category : #accessing }
ReHab >> theLoneRiders [
	"Returns a collection of all the instances of the sub classes collected by cormasModel.
	This method was automatically generated by Cormas.
	!! BECAREFUL, You should not modify this method as it can be generated again when changing the value (Sensitivity Analysis for ex) !!"


^theLoneRiders ifNil:[theLoneRiders := IndexedSet new]
]

{ #category : #accessing }
ReHab >> theLoneRiders: aNewCollection [
	"Set a new collection for theXXXs attribute.
	This method was automatically generated by Cormas.
	!! BECAREFUL, You should not modify this method as it can be generated again when changing the value (Sensitivity Analysis for ex) !!"

	theLoneRiders := aNewCollection
]

{ #category : #accessing }
ReHab >> theManagers [
	"Returns a collection of all the instances of the sub classes collected by cormasModel.
	This method was automatically generated by Cormas.
	!! BECAREFUL, You should not modify this method as it can be generated again when changing the value (Sensitivity Analysis for ex) !!"


^theManagers ifNil:[theManagers := IndexedSet new]
]

{ #category : #accessing }
ReHab >> theManagers: aNewCollection [
	"Set a new collection for theXXXs attribute.
	This method was automatically generated by Cormas.
	!! BECAREFUL, You should not modify this method as it can be generated again when changing the value (Sensitivity Analysis for ex) !!"

	theManagers := aNewCollection
]

{ #category : #accessing }
ReHab >> theMaximizers [
	"Returns a collection of all the instances of the sub classes collected by cormasModel.
	This method was automatically generated by Cormas.
	!! BECAREFUL, You should not modify this method as it can be generated again when changing the value (Sensitivity Analysis for ex) !!"


^theMaximizers ifNil:[theMaximizers := IndexedSet new]
]

{ #category : #accessing }
ReHab >> theMaximizers: aNewCollection [
	"Set a new collection for theXXXs attribute.
	This method was automatically generated by Cormas.
	!! BECAREFUL, You should not modify this method as it can be generated again when changing the value (Sensitivity Analysis for ex) !!"

	theMaximizers := aNewCollection
]

{ #category : #accessing }
ReHab >> theParkManagers [
^theParkManagers ifNil:[theParkManagers := IndexedSet new]
]

{ #category : #accessing }
ReHab >> theParkManagers: x [
theParkManagers := x
]

{ #category : #accessing }
ReHab >> thePlantHarvesters [
^thePlantHarvesters ifNil:[thePlantHarvesters := IndexedSet new]
]

{ #category : #accessing }
ReHab >> thePlantHarvesters: x [
thePlantHarvesters := x
]

{ #category : #accessing }
ReHab >> theReproducingAnimals [
	^self theBirds select: [:aBird | aBird patch notNil]
]

{ #category : #accessing }
ReHab >> theStrategy_Familys [
	"Returns a collection of all the instances of aClass (and sub classes) collected by cormasModel.
	This method was automatically generated by Cormas.
	!! BECAREFUL, You should not modify this method as it can be generated again when changing the value (Sensitivity Analysis for ex) !! "

   ^self allTheEntities: Strategy_Family
]

{ #category : #accessing }
ReHab >> theStrategy_ParkManagers [
	"Returns a collection of all the instances of the sub classes collected by cormasModel.
	This method was automatically generated by Cormas.
	!! BECAREFUL, You should not modify this method as it can be generated again when changing the value (Sensitivity Analysis for ex) !!"


^theStrategy_ParkManagers ifNil:[theStrategy_ParkManagers := IndexedSet new]
]

{ #category : #accessing }
ReHab >> theStrategy_ParkManagers: aNewCollection [
	"Set a new collection for theXXXs attribute.
	This method was automatically generated by Cormas.
	!! BECAREFUL, You should not modify this method as it can be generated again when changing the value (Sensitivity Analysis for ex) !!"

	theStrategy_ParkManagers := aNewCollection
]

{ #category : #accessing }
ReHab >> theStrategys [
	"Returns a collection of all the instances of aClass (and sub classes) collected by cormasModel.
	This method was automatically generated by Cormas.
	!! BECAREFUL, You should not modify this method as it can be generated again when changing the value (Sensitivity Analysis for ex) !! "

   ^self allTheEntities: Strategy
]

{ #category : #accessing }
ReHab >> theZones [
	"Returns a collection of all the instances of the sub classes collected by cormasModel.
	!! This method was automatically generated by Cormas !!"


^theZones ifNil:[theZones := IndexedSet new]
]

{ #category : #accessing }
ReHab >> theZones: aNewCollection [
	"Set a new collection for theXXXs attribute.
	!! This method was automatically generated by Cormas !!"

	theZones := aNewCollection
]
