function [ Tol] = Tolapprocurv( h0, amplituden,p, e1r,e2r )
%This function gives the difference between the calculated approach curve
%and the experimental curve in the sense of the least square difference
%defined as Tol.
%   h0 is the vector providing the spatial distance between the tip and sample
%   surface
%   amplituden is the vector providing the approach curve measured from the
%   experiment. 
%   p is the vector p(1)=L, p(2)=g1, p(3)=g2;

[ amplitudef ] = monopoleopf( p, h0,e1r,e2r );
Tol = sum((amplitudef-amplituden).^2);





end

