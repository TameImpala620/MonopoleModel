function [ e1u,e2u,fval ] = monopolesole1e2( e0 )
%This function calculate the unknown sample dielectric function e1u, e2u
%from the relative amplitude and phase contrast of unknown sample to
%reference 
%   e0 is the initial guess of the e1 and e2 of the unknown sample
options = optimoptions('fsolve','Display','iter','TolFun',1e-15); % Option to display output
[x,fval] = fsolve(@monopoleopceq,e0,options); % Call solver
e1u=x(1);
e2u=x(2);



end

