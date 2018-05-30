clc
clear all
close all
del=0;
n=1;
d=0.5;
n1=2;del1=0;d1=0.5;
temp=-1;
theta=0:(pi/20):(10*pi)/10;
phi=0:(pi/20):(20*pi)/10;
theta2dxy=pi/2; 
theta2dyz=0:pi/500:2*pi;
theta2dzx=0:pi/500:2*pi;
thetauniv=-10*pi:pi/500:10*pi;

[theta,phi]=meshgrid(theta,phi);
disp('Uniform Linear Antenna Array Analysis');
fprintf('initial number of elements n=1 \ninitial distance between them d=0.5 \ninitial successive excitation phase difference del=0\n\n');
while(1)
    temp=input('1.increase number of antenna elements by 1 \n2.decrease number of antenna elements by 1 \n3.increase distance between antenna elements by 0.25 \n4.decrease distance between antenna elements by 0.25 \n5.increase the successive excitation phase difference by pi/4 radians \n6.decrease the successive excitation phase difference by pi/4 radians \n7.Enter your own number of elements(n), distance(d), successive excitaion phase difference(del) \n0.Exit \nenter choice : ');
    if(temp==1)
        n1=n+1;
        displaycustom(n,del,d,theta,phi,theta2dxy,theta2dyz,theta2dzx,thetauniv,n1,del1,d1,1);
        n=n1;
    elseif(temp==3)
        d1=d+0.25;
        displaycustom(n,del,d,theta,phi,theta2dxy,theta2dyz,theta2dzx,thetauniv,n1,del1,d1,2);
        d=d1;
    elseif(temp==5)
        del1=del+(pi/4);
        displaycustom(n,del,d,theta,phi,theta2dxy,theta2dyz,theta2dzx,thetauniv,n1,del1,d1,3);
        del=del1;
    elseif(temp==2)
        if(n>2)
        n1=n-1;
        displaycustom(n,del,d,theta,phi,theta2dxy,theta2dyz,theta2dzx,thetauniv,n1,del1,d1,4);
        n=n1;
        end
    elseif(temp==4)
        if(d>0.25)
        d1=d-0.25;
        displaycustom(n,del,d,theta,phi,theta2dxy,theta2dyz,theta2dzx,thetauniv,n1,del1,d1,5);
        d=d1;
        end
    elseif(temp==6)
        del1=del-(pi/4);
        displaycustom(n,del,d,theta,phi,theta2dxy,theta2dyz,theta2dzx,thetauniv,n1,del1,d1,6);
        del=del1;
    elseif(temp==7)
        n=input('enter n value : ');
        d=input('enter d value : ');
        del=input('enter del value : ');
        displaycustomwithoutanim(n,del,d,theta,phi,theta2dxy,theta2dyz,theta2dzx,thetauniv);
    elseif(temp==0)
        break;
    else
        disp('Enter valid Input');
    end
end