This class represents the model in XML form.

It has three functions:
- it will generate a skeleton modele.xml file from the information available in the model.
- it will parse modele.xml to know how to log playback information
- it will generate a structure to call a remote function of the visualizer to transmit the model.

The class is instantiated with a path to the modele.xml file (currently XML/modele.xml).
If the file exists, it is loaded. Any conflict with the model is reported to the user. If the file doesn't exist, a skeleton without the grammar is generated.

Then, you can call the buildXmlRpcModelRepresentation method to send the model to the external visualizer via xml-rpc.