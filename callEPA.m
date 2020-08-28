% 1 for leakage status; 0 for non-leakage
% find func to search 

function P = callEPA(R)
% R is the string of nodes with 0 and 1
start_toolkit;
tic;
% Add paths and load inp file
 % d=epanet('all.inp');
%   d=epanet('Net2.inp');
    d=epanet('Net3.inp');
  
n = length(R);

% d. getNodeIndex
% d.getNodeNameID

for i = 1:92  % 92 for net3, n for else
    if R(i) == 1
        % name = str2double(d.getNodeNameID(i)); % convert index to node name ID
        d.setNodeEmitterCoeff(i,3);
        % d.setNodeEmitterCoeff(i,3);
    end
end

% Set simulation duration
hours = 24;
d.setTimeSimulationDuration(hours*3600);

% Using ENepanet, create and read binary file
Results = d.getComputedTimeSeries; 
tocResults = toc;tic;

% Using the functions
Hydraulics = d.getComputedHydraulicTimeSeries;
tocHydraulics = toc;tic;

% Step by step hydraulic analysis
d.openHydraulicAnalysis;
d.initializeHydraulicAnalysis;
tstep=1;P=[];
while (tstep>0)
    t = d.runHydraulicAnalysis;
    P = [P; d.getNodePressure];
    tstep = d.nextHydraulicAnalysisStep;
end


d.closeHydraulicAnalysis

% Unload library
d.unload
end