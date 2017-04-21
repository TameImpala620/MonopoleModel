function [ Amp, Pha ] = Relcontrast_BB( e1r1,e2r1,e1r2,e2r2,p,h0,freq,Data )


%This function provides the normalized amplitude and phase of the known sample 1 relative to the known sample 2. 
%e1r1, e2r1 is the dielectric function of reference sample 1
%e1r2, e2r2 is the dielectric function of reference sample 2
%p is the vector p(1)=L, p(2)=g1, p(3)=g2;
%Amp, Pha are the relative amplitude and phase contrast of these two
%samples
%h0 is the distance from the tip to the sample surface;
%Data is the experimentally obtained scattering amplitude and phase. It
%should be a 3xN matrix where N is the length of the columns or number of
%data points.


[ amplitude1,phase1 ] = monopoleopc_BB(p,h0,e1r1,e2r1,freq);

[ amplitude2,phase2 ] = monopoleopc_BB(p,h0,e1r2,e2r2,freq);

Amp=amplitude1./amplitude2;

Pha=phase1-phase2;


figure
subplot(2,1,1)
plot(freq,Amp,Data(:,1),Data(:,2))
subplot(2,1,2)
plot(freq,Pha,Data(:,1),Data(:,3))



end

