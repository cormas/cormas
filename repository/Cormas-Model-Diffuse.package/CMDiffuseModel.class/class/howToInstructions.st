description
howToInstructions

	^ String streamContents: [ : stream |
		stream 
			nextPutAll: '1. Prepare the visualisation of the spatial grid\' withCRs asText;
			nextPutAll: '1.1 Click on the first icon of the ' asText;
			nextPutAll: ('Visualisation ' asText emphasized: TextEmphasis bold emphasisCode);
			nextPutAll: 'area to open the standard spatial grid.\' withCRs asText;
			nextPutAll: '1.2 In the ' asText;
			nextPutAll: ('Topology ' asText emphasizeAllWith: #italic);
			nextPutAll: 'menu, clicking on the ' asText;
			nextPutAll: ('Grid size ' asText emphasizeAllWith: #italic);
			nextPutAll: 'item opens a window allowing you to choose the number of lines and columns. For example, choose 30 * 30.\' withCRs asText;
			nextPutAll: '1.3 Check the border condition: ' asText;
			nextPutAll: ('Topology -> Grid boundaries -> closed' asText emphasizeAllWith: #italic);
			nextPutAll: '.\' withCRs asText;
			nextPutAll: '1.4 Right-click within the spatial grid window to select the ' asText;
			nextPutAll: ('pov ' asText emphasizeAllWith: #italic);
			nextPutAll: 'view for ' asText;
			nextPutAll: ('Cell ' asText emphasizeAllWith: #italic);
			nextPutAll: '.\' withCRs asText;
			nextPutAll: '1.5 To display the legend of this viewpoint: ' asText;
			nextPutAll: ('Tools -> Display legends.\\' withCRs asText emphasizeAllWith: #italic);
			nextPutAll:('2. Prepare the initial spatial grid\' withCRs asText emphasizeAllWith: #(#bold #large));
			nextPutAll: '2.1 Click on the ' asText , ('Initialize ' asText emphasizeAllWith: #italic);
			nextPutAll: 'button of the ' asText;
			nextPutAll: ('Simulation ' asText emphasizeAllWith: #color -> Color red);
			nextPutAll: 'area.\' withCRs asText;
			nextPutAll: '2.2 Select the ' asText;
			nextPutAll: ('init53 ' asText emphasizeAllWith: #italic);
			nextPutAll: 'and ' asText;
			nextPutAll: ('stepSynchronously: ' asText emphasizeAllWith: #italic);
			nextPutAll: 'methods, then validate by clicking on ' asText;
			nextPutAll: ('Apply and close.\' asText emphasizeAllWith: #italic) withCRs asText;
			nextPutAll: '2.3 From the spatial grid menu, use ' asText;
			nextPutAll: ('Tools -> Click to... -> Change attribute... -> state' asText emphasizeAllWith: #italic);
			nextPutAll: ', enter ' asText;
			nextPutAll: ('fire ' asText emphasizeAllWith: #italic);
			nextPutAll: 'and validate. The cursor takes a new shape. Click on a cell to change manually its state to fire, then switch back to the mouse select mode with '	asText;
			nextPutAll: ('Tools -> Click to... -> Select ' asText emphasizeAllWith: #italic);
			nextPutAll: '.\\' withCRs asText;
			nextPutAll: ('3. Run the model\' withCRs asText emphasizeAllWith: #(#bold #large));
			nextPutAll: '3.1 Enter 50 in the ' asText;
			nextPutAll: ('Final time ' asText emphasizeAllWith: #italic);
			nextPutAll: 'input field of the ' asText;
			nextPutAll: ('Simulation ' asText emphasizeAllWith: #color -> Color red);
			nextPutAll: 'area.\' withCRs asText;
			nextPutAll: '3.2 Click on the ' asText;
			nextPutAll: ('Run ' asText emphasizeAllWith: #italic);
			nextPutAll: 'button of the ' asText;
			nextPutAll: ('Simulation ' asText emphasizeAllWith: #color -> Color red) , 'area.\\' withCRs asText;
			nextPutAll: ('4. Have a look at the charts\' withCRs asText emphasizeAllWith: #(#bold #large));
			nextPutAll: '4.1 Click on the third icon of the ' asText;
			nextPutAll: ('Visualisation ' asText emphasizeAllWith: #color -> Color red);
			nextPutAll: 'area to open the charts window.\\' withCRs asText;
			nextPutAll: ('5. Run alternative versions of the model\' withCRs asText emphasizeAllWith: #(#bold #large));
			nextPutAll: '5.1 Select the ' asText;
			nextPutAll: ('init58 ' asText emphasizeAllWith: #italic);
			nextPutAll: 'and ' asText;
			nextPutAll: ('stepSynchronously: ' asText emphasizeAllWith: #italic);
			nextPutAll: 'methods, then run the model again.\' withCRs asText;
			nextPutAll: '5.2 Select the ' asText;
			nextPutAll: ('init53 ' asText emphasizeAllWith: #italic);
			nextPutAll: 'and ' asText;
			nextPutAll: ('stepAsynchronously: ' asText emphasizeAllWith: #italic);
			nextPutAll: 'methods, then run the model again.\' withCRs asText ]