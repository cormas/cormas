init
howToRunIt

| txt |
txt := '1. Prepare the visualisation of the spatial grid\' withCRs asText emphasizeAllWith: #(#bold #large).

txt := txt, '1.1 Click on the first icon of the ' asText, ('Visualisation ' asText emphasizeAllWith: #color -> ColorValue red), 'area to open the standard spatial grid.\' withCRs asText.

txt := txt, '1.2 In the ' asText, ('Topology ' asText emphasizeAllWith: #italic), 'menu, clicking on the ' asText, ('Grid size ' asText emphasizeAllWith: #italic), 'item opens a window allowing you to choose the number of lines and columns. For example, choose 30 * 30.\' withCRs asText.

txt := txt, '1.3 Check the border condition: ' asText, ('Topology -> Grid boundaries -> closed' asText emphasizeAllWith: #italic), '.\' withCRs asText.

txt := txt, '1.4 Right-click within the spatial grid window to select the ' asText, ('pov ' asText emphasizeAllWith: #italic), 'view for ' asText, ('FireAutomata_Cell ' asText emphasizeAllWith: #italic), '.\' withCRs asText.

txt := txt, '1.5 To display the legend of this viewpoint: ' asText, ('Tools -> Display legends.\\' withCRs asText emphasizeAllWith: #italic).



txt := txt, ('2. Prepare the initial spatial grid\' withCRs asText emphasizeAllWith: #(#bold #large)).

txt := txt, '2.1 Click on the ' asText, ('Initialize ' asText emphasizeAllWith: #italic), 'button of the ' asText, ('Simulation ' asText emphasizeAllWith: #color -> ColorValue red),  'area.\' withCRs asText.

txt := txt, '2.2 Select the ' asText, ('init53 ' asText emphasizeAllWith: #italic), 'and ' asText, ('stepSynchronously: ' asText emphasizeAllWith: #italic), 'methods, then validate by clicking on ' asText, ('Apply and close.\' asText emphasizeAllWith: #italic) withCRs asText.

txt := txt, '2.3 From the spatial grid menu, use ' asText, ('Tools -> Click to... -> Change attribute... -> state' asText emphasizeAllWith: #italic), ', enter ' asText, ('fire ' asText emphasizeAllWith: #italic), 'and validate. The cursor takes a new shape. Click on a cell to change manually its state to fire, then switch back to the mouse select mode with ' asText, ('Tools -> Click to... -> Select ' asText emphasizeAllWith: #italic), '.\\' withCRs asText. 



txt := txt, ('3. Run the model\' withCRs asText emphasizeAllWith: #(#bold #large)).

txt := txt, '3.1 Enter 50 in the ' asText, ('Final time ' asText emphasizeAllWith: #italic), 'input field of the ' asText,  ('Simulation ' asText emphasizeAllWith: #color -> ColorValue red),  'area.\' withCRs asText.

txt := txt, '3.2 Click on the ' asText, ('Run ' asText emphasizeAllWith: #italic), 'button of the ' asText,  ('Simulation ' asText emphasizeAllWith: #color -> ColorValue red),  'area.\\' withCRs asText.



txt := txt, ('4. Have a look at the charts\' withCRs asText emphasizeAllWith: #(#bold #large)).

txt := txt, '4.1 Click on the third icon of the ' asText, ('Visualisation ' asText emphasizeAllWith: #color -> ColorValue red), 'area to open the charts window.\\' withCRs asText.



txt := txt, ('5. Run alternative versions of the model\' withCRs asText emphasizeAllWith: #(#bold #large)).

txt := txt, '5.1 Select the ' asText, ('init58 ' asText emphasizeAllWith: #italic), 'and ' asText, ('stepSynchronously: ' asText emphasizeAllWith: #italic), 'methods, then run the model again.\' withCRs asText.

txt := txt, '5.2 Select the ' asText, ('init53 ' asText emphasizeAllWith: #italic), 'and ' asText, ('stepAsynchronously: ' asText emphasizeAllWith: #italic), 'methods, then run the model again.\' withCRs asText.

ComposedTextView open: txt asValue label: ('How to run ', self name, '     step-by-step instructions') icon: (Icon constantNamed: #workspace) extent: 620@550