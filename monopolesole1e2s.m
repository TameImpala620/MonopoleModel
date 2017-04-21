function [ e1u,e2u,fval ] = monopolesole1e2s( e0 )
%This function calculate the unknown sample dielectric function e1u, e2u
%from the relative amplitude and phase contrast of unknown sample to
%reference 
%   Detailed explanation goes here
%'Display','iter',
options = optimoptions('fsolve','TolFun',1e-15); % Option to display output
[x,fval] = fsolve(@monopoleopseq,e0,options); % Call solver
e1u=x(1);
e2u=x(2);



end

