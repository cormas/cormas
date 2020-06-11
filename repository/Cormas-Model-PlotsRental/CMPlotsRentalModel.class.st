"
This model demonstrates the principles of Cormas communicating agents.
Communicating agents have a mailbox and use a communicating channel to deliver messages in the mailboxes of the other agents belonging to their social network.

In this exercice, 10 farmer agents are randomly located on a 
10 x 10 spatial grid, each cell standing for a plot of land. Each farmer 
receives initially 10 plots, randomly chosen. He estimates the productivity 
of a plot according to its distance. The calculation on his potential income is based on this single criteria. Four ways of organizing the rentals of the plots have been implemented. 

The first scenario is a bidding process that relies on a centralized contract 
net protocol. An auctioneer offers all plots to all farmers. These farmers 
having sent back proposals, the auctioneer selects the best one for each 
plot and finalizes the rental contract with the sender of the best proposal. 
The result of this first version of the model is a perfect land regrouping process, 
in the sense that any plot is systematically rent to the closest farmer.

The three other scenarios are simulating a decentralized functionning: 
the exchanges of rental proposals do not go through the auctioneer anymore. 
It''s rather a kind of mutual agreement that the farmers are looking for. 
In a first case, all the farmers know each others. Each one proposes his 
plots to the others. Then each one selects the best proposal for each 
of his plots, and finalizes the rental contracts. The result is the same 
than for the first scenario: as the information is symetric, the optimal 
solution is reached.

The second distributed version (third scenario) introduces two groups of five 
farmers, randomly made. These 2 groups are shown on the window that enable 
the observation of the communication (right picture): group 1 with agents 
1;5;6;9;8 and group 2 with agents 7;3;4;10;2. Now that each agent only 
knows half of the whole population, a kind a social asymetric of information 
is introduced. This feature leads to a non-optimal solution, as can be 
seen on the left picture: famer 2 (deep blue) and farmer 1 (black) have 
not communicated, therefore their domain are overlapping.

A last scenario emphasizes this asymetric of information, by assuming 
an asynchronous way of communication between the members of each group: 
as soon as a farmer receives an interesting proposal, he immediatly finalizes 
the contract without waiting for any other proposal. In this version with 
social and temporal asymetric of information, the land regrouping process 
is even less optimized.
"
Class {
	#name : #CMPlotsRentalModel,
	#superclass : #CormasModel,
	#instVars : [
		'thePR_Farmers',
		'thePR_Cells',
		'thePR_Auctioneers'
	],
	#category : #'Cormas-Model-PlotsRental'
}

{ #category : #description }
CMPlotsRentalModel class >> howToRunIt [
	| txt |
	txt := '1. Prepare the visualisation of the spatial grid\' withCRs
			asText emphasizeAllWith: #(#bold #large).
	txt := txt , '1.1 Click on the first icon of the ' asText
		, ('Visualisation ' asText emphasizeAllWith: #color -> ColorValue red)		, 'area to open the standard spatial grid\' withCRs asText.
	txt := txt
		, '1.2 Right-click within the spatial grid window to access the ' asText
		, ('<operate> ' asText emphasizeAllWith: #italic)
		, 'menu\' withCRs asText.
	txt := txt , '1.3 ' asText
		, ('PR_Cell ' asText emphasizeAllWith: #italic)
		, ': select the ' asText
		, ('povFarmer ' asText emphasizeAllWith: #italic)
		, 'view\' withCRs asText.
	txt := txt , '1.4 ' asText
		, ('PR_Auctioneer ' asText emphasizeAllWith: #italic)
		, 'and ' asText , ('PR_Farmer ' asText emphasizeAllWith: #italic)
		, ': select the ' asText , ('pov ' asText emphasizeAllWith: #italic)
		, 'views\\' withCRs asText.
	txt := txt
		,
			('2. Prepare the visualisation of the communication between agents\'
				withCRs asText emphasizeAllWith: #(#bold #large)).
	txt := txt , '2.1 Click on the second icon of the ' asText
		, ('Visualisation ' asText emphasizeAllWith: #color -> ColorValue red)
		, 'area to open the communication visualization window\' withCRs asText.
	txt := txt , '2.2 In the ' asText
		, ('Model ' asText emphasizeAllWith: #color -> ColorValue red)
		, 'area,  ' asText
		, ('Define the observation ' asText emphasizeAllWith: #italic)
		, 'scrolling menu, choose the ' asText
		, ('Communication ' asText emphasizeAllWith: #italic)
		, 'option. Verify that ' asText
		, ('Erase links at each time step ' asText emphasizeAllWith: #italic)
		, 'is checked, then select the ' asText
		, ('finalisations ' asText emphasizeAllWith: #italic)
		,
			'method as the kind of message to be observed, and close the window\\'
				withCRs asText.
	txt := txt
		,
			('3. Build then run the contract net protocol scenario\' withCRs
				asText emphasizeAllWith: #(#bold #large)).
	txt := txt , '3.1 Click on the ' asText
		, ('Initialize ' asText emphasizeAllWith: #italic)
		, 'button of the ' asText
		, ('Simulation ' asText emphasizeAllWith: #color -> ColorValue red)
		, 'area\' withCRs asText.
	txt := txt , '3.2 Select ' asText
		, ('initCentralized ' asText emphasizeAllWith: #italic)
		, 'and ' asText
		, ('stepCentralized: ' asText emphasizeAllWith: #italic)
		, 'then validate by clicking on ' asText
		, ('Apply and close\' asText emphasizeAllWith: #italic) withCRs asText.
	txt := txt , '3.3 Click just once on the ' asText
		, ('Step ' asText emphasizeAllWith: #italic)
		, 'button of the ' asText
		, ('Simulation ' asText emphasizeAllWith: #color -> ColorValue red)
		, 'area\\' withCRs asText.
	txt := txt
		,
			('4. Build then run the mutual agreement scenario\' withCRs asText
				emphasizeAllWith: #(#bold #large)).
	txt := txt , '4.1 Click on the ' asText
		, ('Initialize ' asText emphasizeAllWith: #italic)
		, 'button\' withCRs asText.
	txt := txt , '4.2 Select ' asText
		, ('initDistributed ' asText emphasizeAllWith: #italic)
		, 'and ' asText
		, ('stepD1G: \' asText emphasizeAllWith: #italic) withCRs asText.
	txt := txt , '4.3 Click just once on the ' asText
		, ('Step ' asText emphasizeAllWith: #italic)
		, 'button\\' withCRs asText.
	txt := txt
		,
			('5. Build then run the third scenario: mutual agreement, two groups (social asymmetry)\'
				withCRs asText emphasizeAllWith: #(#bold #large)).
	txt := txt , '5.1 Click on the ' asText
		, ('Initialize ' asText emphasizeAllWith: #italic)
		, 'button\' withCRs asText.
	txt := txt , '5.2 Select ' asText
		, ('initDistributed ' asText emphasizeAllWith: #italic)
		, 'and ' asText
		, ('stepD2G: \' asText emphasizeAllWith: #italic) withCRs asText.
	txt := txt , '5.3 Click just once on the ' asText
		, ('Step ' asText emphasizeAllWith: #italic)
		, 'button\\' withCRs asText.
	txt := txt
		,
			('6. Build then run the last scenario: mutual agreement, two groups, asynchronous responses (social and temporal asymmetries)\'
				withCRs asText emphasizeAllWith: #(#bold #large)).
	txt := txt , '6.1 Click on the ' asText
		, ('Initialize ' asText emphasizeAllWith: #italic)
		, 'button\' withCRs asText.
	txt := txt , '6.2 Select ' asText
		, ('initDistributed ' asText emphasizeAllWith: #italic)
		, 'and ' asText
		, ('stepD2Ga: \' asText emphasizeAllWith: #italic) withCRs asText.
	txt := txt , '6.3 Click just once on the ' asText
		, ('Step ' asText emphasizeAllWith: #italic)
		, 'button\' withCRs asText.
	ComposedTextView
		open: txt asValue
		label: 'How to run ' , self name , '     step-by-step instructions'
		icon: (Icon constantNamed: #workspaceModel)
		extent: 650 @ 600
]

{ #category : #description }
CMPlotsRentalModel class >> howToRunItOld [
	^ '
1. In the Model zone, at the bottom-right, in the Define the observation scrolling menu, choose the Space item. A window opens for the definition of viewpoints.
1.1. In the situated entity list, at the top-left, select Cell_PlotsRental. If you click on the associated symbols in the list (at the top-right), you can visualize the colors corresponding to the different states of the Cell_PlotsRental: #notRent (grey) and #rent (green).
1.2. In the situated entity list, at the top-left, select Farmer_PlotsRental. If you click on the corresponding symbol, you can visualize the color (black) and the shape (triangular) corresponding to this agent. 
1.3. In the situated entity list, at the top-left, select Auctioneer_PlotsRental. If you click on the corresponding symbol, you can visualize the color (black) and the shape (round) corresponding to this agent.

2. In the Model zone, at the bottom-right, in the Define the observation scrolling menu, choose the Communication option. Select the Finalisations method and close the window. 

3. In the Visualization zone, open a spatial grid (1st icon) and a communication visualization window (2nd icon). 

4. In the Simulation zone, click on Initialize... 
4.1. Select the init and evolve: methods.
4.2. Validate and close the window (Apply and close button).

5. If you right-click on the spatial grid, you can choose for each entity of the model the observation method or viewpoint (cf. step 1). For the Cell_PlotsRental entity, choose pdv.

6. In the communication visualization window, open the Parameters window from the contextual menu. Change the value of the input field Movement to 2, and close this window.

7. In the Simulation zone, click on the Step button.

8. Second version of the parcels exchange model: with auctioneer. In the Simulation zone, click on the Initialize... button.
8.1. Select the initAuctioneer and evolveAuctioneer: methods.
8.2. Validate and close the window (Apply and close button).

9. In the Simulation zone, click on the Step button.'
]

{ #category : #acces }
CMPlotsRentalModel >> auctioneer [
	^ self thePR_Auctioneers first 
]

{ #category : #probes }
CMPlotsRentalModel >> cashTotal [
	"return the data (a number) to be plotted with the cashTotal chart"

	^ self thePR_Farmers inject: 0 into: [ :tot :f | tot + f cashboxN ]
]

{ #category : #procedures }
CMPlotsRentalModel >> create1Group [
	self thePR_Farmers
		do: [ :f | f acquaintances: (self otherAgentsButMe: f) ] 
]

{ #category : #procedures }
CMPlotsRentalModel >> create2Groups [
	| farmers groupSize group1 others |
	farmers := Cormas mix: self thePR_Farmers.
	groupSize := (farmers size / 2) asInteger.
	group1 := farmers copyFrom: 1 to: groupSize.
	farmers removeAll: group1.
	group1
		do: [ :f | 
			others := group1 copy. 
			others remove: f.
			f acquaintances: others ].
	farmers
		do: [ :f | 
			others := farmers copy.
			others remove: f.
			f acquaintances: others ]
]

{ #category : #init }
CMPlotsRentalModel >> init [
	"Init a 10x10 space, + 10 Farmers + 1 auctioneer"

	self initCells.
	self initAgentsAuctioneer.
	CMPRMessage isObserved: #finalisations 
]

{ #category : #procedures }
CMPlotsRentalModel >> initAgents [
	| aFarmer |
	"Create 10 farmer agents" 
	10 timesRepeat: [ self newEntity: CMPRFarmer ].	"Define each cell as a property of a farmer, randomly chosen"
	self thePR_Cells
		do: [ :aPlot | 
			aPlot status: #notRent.
			aFarmer := Cormas selectRandomlyFrom: self thePR_Farmers.
			aPlot farmer: aFarmer.
			aFarmer plotsOfLand add: aPlot ].
	self thePR_Farmers
		reverseDo: [ :f | 
			f plotsOfLand isEmpty
				ifTrue: [ f delete ] ].	"Locate each farmer on one of its owned cells"
	self thePR_Farmers
		do: [ :f | f moveTo: (Cormas selectRandomlyFrom: f plotsOfLand) ]
]

{ #category : #procedures }
CMPlotsRentalModel >> initAgentsAuctioneer [
	| auctioneer |
	self initAgents. 
	auctioneer := CMPRAuctioneer new init.
	auctioneer defineVisualState.
	self thePR_Auctioneers add: auctioneer
]

{ #category : #procedures }
CMPlotsRentalModel >> initCells [
	"10x10 cells"

	self
		createGridLines: 10
		columns: 10
		neighbourhood: 8
		closed: true
]

{ #category : #probes }
CMPlotsRentalModel >> nbRentals [
	"return the data (a number) to be plotted with the nbRentals chart"

	^ (self thePR_Cells select: [ :c | c status = #rent ]) size 
]

{ #category : #control }
CMPlotsRentalModel >> stepCentralized: t [
	"At each step, the auctioneer offers all the plots to each farmer. Then each farmer (randomly choosen) process Message to Auctionner. Thus, the Auctionner processes the plots. And finally, the farmers process the auctions and update their income"

	"the auctioneer offers all the plots to each farmer" 

	self thePR_Farmers
		do: [ :aP | self auctioneer offer: self thePR_Cells to: aP ].	"Each farmer (randomly choosen) answers the Auctionner"
	self thePR_Farmers shuffled
		do: [ :occ | occ processMessageFromAuctionner ].	"The Auctionner processes the plots"
	self auctioneer processAcceptMessages.	"And finally, the farmers process the auctions and update their income"
	self thePR_Farmers
		do: [ :a | 
			a
				processAuctions;
				calculateIncome ]
]

{ #category : #control }
CMPlotsRentalModel >> stepD1G: t [
	| collec |
	self thePR_Cells do: [ :a | a status: #notRent ].
	self create1Group.
	collec := Cormas mixt: self thePR_Farmers.
	collec do: [ :f | f initialCalls ]. 
	collec do: [ :f | f proposals ].
	collec do: [ :f | f finalAnswers ].
	collec
		do: [ :f | 
			f
				updateCashbox;
				resetMailBox ]
]

{ #category : #control }
CMPlotsRentalModel >> stepD2G: t [
	| collec |
	self thePR_Cells do: [ :a | a status: #notRent ].
	self create2Groups.
	collec := Cormas mixt: self thePR_Farmers.
	collec do: [ :f | f initialCalls ].
	collec do: [ :f | f proposals ]. 
	collec do: [ :f | f finalAnswers ].
	collec
		do: [ :f | 
			f
				updateCashbox;
				resetMailBox ]
]

{ #category : #accessing }
CMPlotsRentalModel >> thePR_Auctioneers [
	"Returns a collection of all the instances of the sub classes collected by cormasModel.
	This method was automatically generated by Cormas.
	!! BECAREFUL, You should not modify this method as it can be generated again when changing the value (Sensitivity Analysis for ex) !!"

	^ thePR_Auctioneers ifNil: [ thePR_Auctioneers := IndexedSet new ]
]

{ #category : #acces }
CMPlotsRentalModel >> thePR_Auctioneers: aVal [
	thePR_Auctioneers := aVal 
]

{ #category : #accessing }
CMPlotsRentalModel >> thePR_Cell [
	^ self thePR_Cells isEmpty
		ifTrue: [ nil ]
		ifFalse: [ self thePR_Cells first ] 
]

{ #category : #accessing }
CMPlotsRentalModel >> thePR_Cells [
	^ thePR_Cells ifNil: [ thePR_Cells := IndexedSet new ] 
]

{ #category : #acces }
CMPlotsRentalModel >> thePR_Cells: aVal [
	thePR_Cells := aVal 
]

{ #category : #accessing }
CMPlotsRentalModel >> thePR_Farmers [
	"Returns a collection of all the instances of the sub classes collected by cormasModel.
	This method was automatically generated by Cormas.
	!! BECAREFUL, You should not modify this method as it can be generated again when changing the value (Sensitivity Analysis for ex) !!"

	^ thePR_Farmers ifNil: [ thePR_Farmers := IndexedSet new ]
]

{ #category : #acces }
CMPlotsRentalModel >> thePR_Farmers: aVal [
	thePR_Farmers := aVal 
]
