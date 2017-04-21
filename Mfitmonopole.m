function [ X, Funv ] = Mfitmonopole( p0,p1,p2,weight, Goal,h0,amplituden,e1ap,e2ap,e1r1,e2r1,e1r2,e2r2,hcontr)
%This function provides the optimized value of monopole parameters L and g based on both approach curve and a known sample contrast.
%p0 is the initial guess of the L and g. p0(1)=L, p0(2)=g1, p0(3)=g2;
%p1, p2 are the lower and upper bound of the p vector which have the same
%components. 
%weight is a vector set the relative importance of the corresponding p
%components.
%Goal is the objective to achieve. Goal is a vector, Goal(1)= amplitude
%contrast of a known sample, Goal(2)=phase contrast of a known sample.
%Goal(3) is the tolerence of the least square fit of the approach curve
%which should be a very small value. 
%   h0 is the vector providing the spatial distance between the tip and sample
%   surface
%   amplituden is the vector providing the approach curve measured from the
%   experiment.
%   e1ap,e2ap is the dielectic function for approach curve calculation;
%   e1r1,e2r1,e1r2,e2r2 are the dielectric function for reference sample
%   relative contrast calculation
%   hcontr is the distance for the relative contrast calculation
%   all phase is in radians


%X is the parameters obtained from the multiobjective optimization. X(1)=L,
%X(2)=g1, X(3)=g2
%Funv is the obtained value while Funv(1)= relative amplitude contrast,
%Funv(2)= relative phase contrast, Funv(3)= tolerence of the approach curve
%fitting



options = optimoptions('fgoalattain','MaxFunEvals',3000,'Display','iter','GoalsExactAchieve',2);
%'PlotFcns',{@optimplotstepsize},
%options = optimoptions('fgoalattain','GoalsExactAchieve',2);
[X,Funv] = fgoalattain(@(p)Goalcal( h0, amplituden,p, e1ap,e2ap,e1r1,e2r1,e1r2,e2r2,hcontr),p0,Goal,weight,[],[],[],[],p1,p2,[],options);

[ amplitudef ] = monopoleopf( X, h0,e1ap,e2ap );

plot(h0,amplitudef,h0,amplituden)









end

