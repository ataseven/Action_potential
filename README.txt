README file for the second step of EE 515 Term Project 
 by Yoldas Ataseven 115888
yoldas@eee.metu.edu
12.30.2002
----------------------------------------------------------------
This step of the project consists of four matlab (.m) files; 'giris.m','sim1.m','simone.m', and 'simtwo.m' 

   -> 	giris.m is the graphical user interface (GUI) used both for action potential generation and propagation. This is the only file whose name is to be entered from the command line. The GUI is composed of six input current colums, two sets of radio buttons (each having two options),simulation start button, exiting buton and 3 hidden input boxes which appear to get ri (intracellular axial resistance per unit length),ro (extracellular axial resistance per unit length) and a (axon radius) as inputs when the propagation option (radio button) is selected only. With the simulation start, the interface informs the user about the state of the process via a wait bar. After the computations, the output (generated response) is displayed on the same window. Action potential generation simulation opens a new window in addition to the main one to display essential currents better, while for propagation, the main window is used only. Zooming is possible for the static case (action potential generation).
      
	Action potential propagation simulation provides two additional buttons: The 'pause' button provides freezing the propagation at any time of the simulation. After is it pressed, any pressed key of the keyboard provides to continue simulation from when it is freezed on. The 'stop' button stops the simulation and prepares the GUI for another input. After pressing the 'stop' button, continuation of the simulation is not possible. 
      
   ->	Other files are isolated from the user, but to inform a little:
		
		* 'sim1.m' is an intermediate code segment which takes the inputs from the GUI and feeds them to simone and simtwo.  	
		
		* 'simone.m' computes the action potential for an isolated nerve segment (i. e, for a node with ri tends to infinity).This code is not different from the one submitted for the firt step of the project,except the parts related to the display.The GUI takes the inputs and display the outputs,then waits for a new input set for the next simulation.
		
		* 'simtwo.m' computes the propagation of the action potential (created at node 1) along a nerve segment. Node lentghs are taken as 0.1mm and 40 nodes are used for simulation. Simulation for a larger number of nodes is also possible but presents almost no additional information (except for the subtreshold stimlation cases) although it requires longer computational time. Node length of 0.1mm can be reduced to have better accuracy, but this time, step size in time must also be much smaller (it is inversely proportional to the square of the node lentgh) to have a sufficiently small mesh ratio. 

		 'simtwo.m' computes the membrane voltages of each node (using the values of the adjacent nodes at the previous instant) for every time instant. Therefore it performs two nested loops (outer one is for time) and iterates the node membrane voltages in time. After finding the voltages for every node at any instant of the simulation period, it displays the propagation using subsequent plots on the same axis while it displays the time for every plot. Since the length of the simulated part is relatiely small, the display is repeated until the user 'stops' the simulation. After the 'stopping' action, the GUI waits for a new simulation input.   


	->  The number of displayed instances in the simulation of the propagation part is reduced (sampled) to provide a sense of reality as much as possible. The time step used in the simulation is 0.05 miliseconds.Displaying 200000 figures per second is both impossible (with ordinary computers at least) and meaningless. The part of the stimulated axon is about 4 milimeters, and human eye cannot follow a propagating action potential over such a short part of the axon. (modelling a longer part of an axon either needs longer computation time or leads to less accurate simulations) Therefore real-time display is not aimed in this study. 