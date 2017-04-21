function [ amplitude,phase ] = monopoleopc(x,h0,e1r,e2r)

%[ amplitude,phase,freq ] = monopoleopc(x,h0,e1r,e2r,freq,m)
%This function calculates the the near field scattering amplitude and phase
%according to monopole model.
%   R is the radius of the AFM tip;
%   L is the effective length of the interaction part of the AFM tip which
%   is got from the fitting of the approach curve;
%   g is a complex number usually at about 0.7~0.8*Exp[i0.06]; It discribes
%   the response of the tip to the external stimuli.
%   A is the oscillation amplitude of the AFM tip;
%   S is the near field scattering amplitude contrast;
%   Phi is the near field scattering phase contrast;

%   m is the dimension of the vector e1r,e2r,freq,amplitude,phase
%   e1r, e2r are the dielectric function of reference sample;
%   freq is the vector with the same dimension of e1r,e2r.
%   amplitude,phase are the vector with the same dimension as freq  


R=25*10^(-9); %unit meter
L=x(1);
g1=x(2);
g2=x(3);

g=g1+1i*g2;
A=60*10^(-9); %unit meter
ec=2.718; %natural constant
inc=pi/4;     %far field incident angle unit radian
v=237370;   %oscillation frequency of AFM tip unit Hz
ti=0*10^(-5);  %initial time point for time demodulation;
tf=4*10^(-5);   %final time point for time demodulation;
n=2;            %demodulation order
%tn=1;         %the number of spatial points picked up in approach curve
m=1;


F1=R^2*L*(2*L/R+log(R/(4*ec*L)))/log(4*L/(ec^2*R));
amplitude=zeros(m,1);
phase=zeros(m,1);


for i=1:m


nrr=sqrt(0.5*sqrt(e1r(i)^2+e2r(i)^2)+0.5*e1r(i)); %nrr is the real part of the far field refractive index of reference sample
kir=sqrt(0.5*sqrt(e1r(i)^2+e2r(i)^2)-0.5*e1r(i)); %kir is the imaginary part of the far field refractive index of reference sample
rfr=((nrr+1i*kir)^2*cos(inc)-sqrt((nrr+1i*kir)^2-sin(inc)^2))/((nrr+1i*kir)^2*cos(inc)+sqrt((nrr+1i*kir)^2-sin(inc)^2)); %rfr is the reflection coefficient in far field of reference sample
betar=((e1r(i)^2+e2r(i)^2-1)+2*1i*e2r(i))/((e1r(i)+1)^2+e2r(i)^2);



    
alphar=@(t)F1*(2+(betar*F2(t)./(log(4*L/R)-betar*F3(t)))).*exp(1i*n*2*pi*v*t);
alpharn=integral(alphar,ti,tf,'RelTol',1e-12 );
SCR=(1+rfr)^2*alpharn;                               %SCR is the near field scattering of reference sample
    
amplitude(i)=abs(SCR);
%phase=angle(alpharn);   
%amplitude=abs(SCR);
phase(i)=angle(SCR);
end    


    
    
    
    
    function f2=F2(t2)               %t2 is an inner variable as a vector
        f2=(g-(R+h0+A*(1+cos(2*pi*v*t2)))/L).*log(4*L./(4*(h0+A*(1+cos(2*pi*v*t2)))+3*R));
    end

    function f3=F3(t3)               %t3 is an inner variable as a vector
        f3=(g-(3*R+4*(h0+A*(1+cos(2*pi*v*t3))))/(4*L)).*log(2*L./(2*(h0+A*(1+cos(2*pi*v*t3)))+R));
    end











end

