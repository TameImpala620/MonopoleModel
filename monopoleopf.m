function [ amplitudef ] = monopoleopf( x, h0,e1r,e2r )
%This function calculates the approach curve on a known sample normalized to the highest value as 1.  
%   R is the radius of the AFM tip;
%   L is the effective length of the interaction part of the AFM tip which
%   is got from the fitting of the approach curve;
%   g is a complex number usually at about 0.7~0.8*Exp[i0.06]; It discribes
%   the response of the tip to the external stimuli.
%   A is the oscillation amplitude of the AFM tip;
%   S is the near field scattering amplitude contrast;
%   Phi is the near field scattering phase contrast;
%   e1f, e2f are the far field dielectric function of unknown sample;
%   e1r, e2r are the dielectric function of reference sample;
%   amplitudef is the normalized approach curve. 
%   h0 is the vector of distance while tn must be consistent with the
%   number of points picked up in h0

R=25*10^(-9); %unit meter
L=x(1);
g1=x(2);
g2=x(3);

g=g1+1i*g2;
A=70*10^(-9); %unit meter
ec=2.718; %natural constant
inc=pi/4;     %far field incident angle unit radian
v=237579.6;   %oscillation frequency of AFM tip unit Hz
ti=0*10^(-5);  %initial time point for time demodulation;
tf=2*10^(-5);   %final time point for time demodulation;
n=2;            %demodulation order
tn=10;         %the number of spatial points picked up in approach curve
%e1r=-4099.902;
%e2r=2363.47292;



F1=R^2*L*(2*L/R+log(R/(4*ec*L)))/log(4*L/(ec^2*R));

nrr=sqrt(0.5*sqrt(e1r^2+e2r^2)+0.5*e1r); %nrr is the real part of the far field refractive index of reference sample
kir=sqrt(0.5*sqrt(e1r^2+e2r^2)-0.5*e1r); %kir is the imaginary part of the far field refractive index of reference sample
rfr=((nrr+1i*kir)^2*cos(inc)-sqrt((nrr+1i*kir)^2-sin(inc)^2))/((nrr+1i*kir)^2*cos(inc)+sqrt((nrr+1i*kir)^2-sin(inc)^2)); %rfr is the reflection coefficient in far field of reference sample
betar=((e1r^2+e2r^2-1)+2*1i*e2r)/((e1r+1)^2+e2r^2);
amplitude=zeros(1,tn);

for l=1:1:tn
    
alphar=@(t)F1*(2+(betar*F2(t)./(log(4*L/R)-betar*F3(t)))).*exp(-1i*n*2*pi*v*t);
alpharn=integral(alphar,ti,tf,'RelTol',1e-12 );
SCR=(1+rfr)^2*alpharn;                               %SCR is the near field scattering of reference sample
    
amplitude(l)=abs(SCR);
%phase=angle(alpharn);   
%amplitude=abs(SCR);
%phase=angle(SCR);
end    

amplitudef=amplitude/amplitude(1);
    
    
    
    
    function f2=F2(t2)               %t2 is an inner variable as a vector
        f2=(g-(R+h0(l)+A*(1+cos(2*pi*v*t2)))/L).*log(4*L./(4*(h0(l)+A*(1+cos(2*pi*v*t2)))+3*R));
    end

    function f3=F3(t3)               %t3 is an inner variable as a vector
        f3=(g-(3*R+4*(h0(l)+A*(1+cos(2*pi*v*t3))))/(4*L)).*log(2*L./(2*(h0(l)+A*(1+cos(2*pi*v*t3)))+R));
    end











end

