# State-input_affine_differential_neural_network

This work presents the development of a DNN that approximates a class of nonlinear system with uncertain dynamics and perturbations. The system properties allow the formulation of a DNN with an additional nonlinear term related to the state. The feasibility of using the DNN is based on the approximation capabilities of ANNs, assuring that the approximation error is bounded. The dynamics of the DNN free parameters are the result of Lyapunov's second stability method that also proves convergence of the identification error in a neighborhood around the origin. The approximation results are compared with a classical DNN, aiming to identify the dynamics of the Stewart platform actuators.

## Intructions for executing the files

The MATLAB version of the file is 2021. However, the file is proved at MATLAB online.

* The main Simulink file is `sm_stewart_platform_Identifier_2021Version_desktop.slx`.
* To execute the main simulink file, use the file `AL_DNN_main_paper.m`
* To create figures showing the identification process, and error, use the file `figures_creation_paper.m`

## Additional files

* The file `Simulink_file.tiff` shows the diagram of the Simulink file 
* The files `activation_function.m` and `eig_vals_eval.m` are functions inside the Simulink file. They are not neccessesary for the exectution, just for a faster visualization
