function [ Amp, Pha ] = Relcontrast(e1r1,e2r1,e1r2,e2r2,p,h0 )
%This function provides the relative contrast of the known sample 1 relative to the known sample 2. 
%e1r1, e2r1 is the dielectric function of reference sample 1
%e1r2, e2r2 is the dielectric function of reference sample 2
%p is the vector p(1)=L, p(2)=g1, p(3)=g2;
%Amp, Pha are the relative amplitude and phase contrast of these two
%samples
%h0 is the distance from the tip to the sample surface;

[ amplitude1,phase1 ] = monopoleopc_singleline(p,h0,e1r1,e2r1);

[ amplitude2,phase2 ] = monopoleopc_singleline(p,h0,e1r2,e2r2);


Amp=amplitude1/amplitude2;

Pha=phase1-phase2;






end

