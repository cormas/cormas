specs
defaultSpec
	<spec>
	^ SpecLayout composed
		newColumn: [ :c | 
			c
				newRow: [ :r | 
					r
						newColumn: [ :ec |  ] width: 80;
						add: #initializeLabel width: 80;
						add: #backwardLabel width: 100;
						newColumn: [ :ec |  ] width: 100;
						add: #forwardLabel width: 70;
						add: #closeButton width: 30 ]
					height: self toolbarHeight - 5;
				newRow: [ :r | 
					r
						newColumn: [ :col | 
							col
								add: #simulateLabel;
								add: #replayLabel ]
							width: 70;
						newColumn: [ :col | 
							col
								add: #initializeSimButton;
								add: #replayButton ]
							width: 70;
						newColumn: [ :col | 
							col
								newRow: [ :er | 
									er
										add: #backwardAllButton;
										add: #backwardStepButton ] ]
							width: 100;
						newColumn: [ :ec |  ] width: 10;
						newColumn: [ :col | 
							col
								add: #currentStepLabel;
								add: #currentStepInputText height: self inputTextHeight;
								newRow: [ :ec |  ] ]
							width: 70;
						newColumn: [ :ec |  ] width: 10;
						newColumn: [ :col | 
							col
								newRow: [ :er | 
									er
										add: #runStepByStepButton;
										add: #runButton ];
								newRow: [ :er | 
									er
										add: #replayStepForwardButton;
										add: #replayRunForwardButton ] ]
							width: 100;
						newColumn: [ :ec |  ] width: 10;
						newColumn: [ :col | 
							col
								add: #finalStepLabel;
								newRow: [ :er |  ] height: self inputTextHeight;
								add: #finalStepInputText height: self inputTextHeight;
								newRow: [ :er |  ] height: self inputTextHeight - 4;
								add: #changeButton height: self inputTextHeight - 4 ]
							width: 70 ] ]