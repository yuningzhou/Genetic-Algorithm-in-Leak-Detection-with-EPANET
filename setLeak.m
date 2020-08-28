function F = setLeak(i)
start_toolkit;
tic;
% Add paths and load inp file
%   d=epanet('Net2.inp');
   d=epanet('Net3.inp');
  
 n = d.getNodeCount;
 
 R = zeros(1,n);
 R(i) = 1;
 % R(j) = 1;
 F = callEPA(R);
end