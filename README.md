# Antenna-Pattern-Analysis-
This project i've done under the guidance of Professor APN rao.

Introduction :
Antenna Pattern Analysis is necessary to design the radiation pattern of an antenna for a specific application. In this project I've developed a program in matlab which displays the 3d antenna radiation pattern, the corresponding universal pattern and the xy, yz, zx cross sections of the 3d pattern for a set of parameters, for a UNIFORM LINEAR ARRAY, such as the number of ISOTROPIC elements (n), the distance between the elements (d) and the successive excitation phase difference (delta) between them which are controlled by the user.

Working :

The user has the following options to control the pattern of the array :
1.increase number of antenna elements by 1 ,
2.decrease number of antenna elements by 1 ,
3.increase distance between antenna elements by 0.25 ,
4.decrease distance between antenna elements by 0.25 ,
5.increase the successive excitation phase difference by pi/4 radians ,
6.decrease the successive excitation phase difference by pi/4 radians ,
7.Enter your own number of elements(n), distance(d), successive excitaion phase difference(del) ,
0.Exit .

Except 0,1 and 2 options all other options display the changes happening to the antenna array pattern as the values are changed in the form of an ANIMATION. Functions have been implemented to carry out the above tasks.
The program computes and displays the pattern of a UNIFORM LINEAR ARRAY based on the formula pat=(1/N)*(sin((N*psi)/2)/sin(psi/2)) where psi=((beta*d)*cos(phi))+delta, beta=(2*pi)/lambda, delta= successive excitation phase difference, phi=spherical coordinate from 0 to 2*pi. theta=spherical coordinate from 0 to pi.

This formula has been implemented by shaping a sphere's radius according to the intensity of radiation in that particular direction.
Sphere representation in cartesian coordinates is as follows:
x=r*sin(theta)*cos(phi)
y=r*sin(theta)*sin(phi)
z=r*cos(theta)

replacing radius (r) with our function pat :
x=pat*sin(theta)*cos(phi)
y=pat*sin(theta)*sin(phi)
z=pat*cos(theta)
Using surf(x,y,z) in matlab the antenna pattern can be plotted.

The cross sections xy, yz, zx have been plotted using the function polarplot(theta,mag).
The universal pattern is a plot of psi vs 20*log10(pat).
