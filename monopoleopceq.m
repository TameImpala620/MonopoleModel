function [ amplitudez,phasez ] = monopoleopceq(eu)
%This function provides the equation for unknown sample dielectric function
%calculation
%   e1r, e2r are the reference sample dielectric function;
%   amplitudek and phasek is the measured relative amplitude and phase contrast;
%   x is the caliberated tip parameters x = [L, g1, g2];
%   h0 is smallest distance from the tip to the sample surface;
%   eu is the vector eu(1)= e1u, eu(2)= e2u which are the dielectric
%   function of unknown sample to be calculated.
%   amplitudez, phasez should be optimized to zero;

e1r= -4099;
e2r= 2363;
amplitudek= 0.056;
phasek= 0.83;
x= [650,0.225,-0.3333];
h0= 2*10^(-9);
e1u=eu(1);
e2u=eu(2);



[ amplituder,phaser ] = monopoleopc(x,h0,e1r,e2r);

[ amplitudeu,phaseu ] = monopoleopc(x,h0,e1u,e2u);

amplitudez=amplitudeu/amplituder-amplitudek;
phasez=phaseu-phaser-phasek;





end

