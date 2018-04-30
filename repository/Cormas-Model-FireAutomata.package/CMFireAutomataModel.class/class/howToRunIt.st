description
howToRunIt
<script>
| txt |
txt := '1. Prepare the visualisation of the spatial grid\' withCRs asText allBold.

txt := txt, '1.1 Click on the first icon of the ' asText, ('Visualisation ' asText makeAllColor: Color red), 'area to open the standard spatial grid.\' withCRs asText.

txt := txt, '1.2 In the ' asText, ('Topology ' asText allItalic), 'menu, clicking on the ' asText, ('Grid size ' asText allItalic), 'item opens a window allowing you to choose the number of lines and columns. For example, choose 30 * 30.\' withCRs asText.

txt := txt, '1.3 Check the border condition: ' asText, ('Topology -> Grid boundaries -> closed' asText allItalic), '.\' withCRs asText.

txt := txt, '1.4 Right-click within the spatial grid window to select the ' asText, ('pov ' asText allItalic), 'view for ' asText, ('FireAutomata_Cell ' asText allItalic), '.\' withCRs asText.

txt := txt, '1.5 To display the legend of this viewpoint: ' asText, ('Tools -> Display legends.\\' withCRs asText allItalic).



txt := txt, ('2. Prepare the initial spatial grid\' withCRs asText allBold).

txt := txt, '2.1 Click on the ' asText, ('Initialize ' asText allItalic), 'button of the ' asText, ('Simulation ' asText makeAllColor: Color red),  'area.\' withCRs asText.

txt := txt, '2.2 Select the ' asText, ('init53 ' asText allItalic), 'and ' asText, ('stepSynchronously: ' asText allItalic), 'methods, then validate by clicking on ' asText, ('Apply and close.\' withCRs asText allItalic).

txt := txt, '2.3 From the spatial grid menu, use ' asText, ('Tools -> Click to... -> Change attribute... -> state' asText allItalic), ', enter ' asText, ('fire ' asText allItalic), 'and validate. The cursor takes a new shape. Click on a cell to change manually its state to fire, then switch back to the mouse select mode with ' asText, ('Tools -> Click to... -> Select ' asText allItalic), '.\\' withCRs asText. 


txt := txt, ('3. Run the model\' withCRs asText allBold).

txt := txt, '3.1 Enter 50 in the ' asText, ('Final time ' asText allItalic), 'input field of the ' asText,  ('Simulation ' asText makeAllColor: Color red),  'area.\' withCRs asText.

txt := txt, '3.2 Click on the ' asText, ('Run ' asText allItalic), 'button of the ' asText,  ('Simulation ' asText makeAllColor:Color red),  'area.\\' withCRs asText.



txt := txt, ('4. Have a look at the charts\' withCRs asText allBold).

txt := txt, '4.1 Click on the third icon of the ' asText, ('Visualisation ' asText makeAllColor: Color red), 'area to open the charts window.\\' withCRs asText.



txt := txt, ('5. Run alternative versions of the model\' withCRs asText allBold).

txt := txt, '5.1 Select the ' asText, ('init58 ' asText allItalic), 'and ' asText, ('stepSynchronously: ' asText allItalic), 'methods, then run the model again.\' withCRs asText.

txt := txt, '5.2 Select the ' asText, ('init53 ' asText allItalic), 'and ' asText, ('stepAsynchronously: ' asText allItalic), 'methods, then run the model again.\' withCRs asText.

txt inspect
"ComposedTextView open: txt asValue label: ('How to run ', self name, '     step-by-step instructions') icon: (Icon constantNamed: #workspace) extent: 620@550" 