
Quantum noise is a big nuisance in practical quantum computing as it is responsible for providing innacurate results of the qubit state when measured.
There are many types of quantum noises such as state preparation noise, measurement noise, Pauli noise, coherent noise, incoherent noise etc. But for now we will study the last two noises.
The code file [noise.m](https://github.dev/prateek-rg15/-Quantum-noise-simulation-on-quantum-gates/blob/ce0dc9fddccb1debad18c8717c27c485c9cce5bc/noise.m) shows the effect of rotation error(coherent error) and bit flip error(incoherent error) on the pauli X gate with respect to circuit depth(no. of X gate in series). 


![image](https://github.com/prateek-rg15/-Quantum-noise-simulation-on-quantum-gates/blob/main/error.jpg)
Bit flip error probabilty p=0.02 and rotation error e=8 degrees
