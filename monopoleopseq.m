function [ scrz,sciz ] = monopoleopseq(eu)
%This function provides the equation for unknown sample dielectric function
%calculation
%   e1r, e2r are the reference sample dielectric function;
%   amplitudek and phasek is the measured relative amplitude and phase contrast;
%   x is the caliberated tip parameters x = [L, g1, g2];
%   h0 is smallest distance from the tip to the sample surface;
%   eu is the vector eu(1)= e1u, eu(2)= e2u which are the dielectric
%   function of unknown sample to be calculated.
%   amplitudez, phasez should be zero;

e1r= -4099;
e2r= 2363;
amplitudek= 0.056;
phasek= 0.83;
x= [750,0.21,-0.32];
h0= 2*10^(-9);
e1u=eu(1);
e2u=eu(2);
Factor1=10000;
Factor2=10000;



sck=amplitudek*exp(1i*phasek);
scrk=real(sck);
scik=imag(sck);

[ scrr,scir ] = monopoleops(x,h0,e1r,e2r);

[ scru,sciu ] = monopoleops(x,h0,e1u,e2u);

%amplitudez=amplitudeu/amplituder-amplitudek;
%phasez=phaseu-phaser-phasek;

scrz=(scrk-real((scru+1i*sciu)./(scrr+1i*scir)))*Factor1;
sciz=(scik-imag((scru+1i*sciu)./(scrr+1i*scir)))*Factor2;





end

