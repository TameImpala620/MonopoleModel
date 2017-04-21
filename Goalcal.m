function [ goalc ] = Goalcal( h0, amplituden,p, e1ap,e2ap,e1r1,e2r1,e1r2,e2r2,hcontr )
%This function calculates the result for comparation with the optimization goal 
%   goalc is a vector. goalc(1)= amplitude, goalc(2)=phase, goalc(3)=
%   approach curve tolerance
%   h0 is a vector for distance of spatial points applied to approach curve
%   calculation
%   amplituden is a vector for approach curve experimental value.
%   p is the optimization parameters p(1)=L, p(2)=g1, p(3)=g2;
%   e1ap,e2ap is the dielectic function for approach curve calculation;
%   e1r1,e2r1,e1r2,e2r2 are the dielectric function for reference sample
%   relative contrast calculation
%   hcontr is the distance for the relative contrast calculation

[ Tol] = Tolapprocurv( h0, amplituden,p, e1ap,e2ap );
[ Amp, Pha ] = Relcontrast( e1r1,e2r1,e1r2,e2r2,p,hcontr );

%goalc(1)=100*Amp;
goalc(1)=Amp;
goalc(2)=Pha;
goalc(3)=Tol;








end

