% numerical calculations used in the homework (to run them set numericalCalc=1):
numericalCalc=0;
if numericalCalc==1
% problem 1 part c:
    p = [[9/10 1/10 0]
    [0 3/4 1/4]
    [1/2 0 1/2]];
p^(50)

% problem 2 part d
p = [[1/2 1/2 0 0 0 0]
    [1/3 0 1/3 0 1/3 0]
    [0 0 1/4 3/4 0 0]
    [0 0 1 0 0 0]
    [0 0 0 0 0 1]
    [0 0 0 0 1 0]];
p^(20)
p^(21)
end

%SCRAPPED CODE, WON'T WORK AND NOT ACTUALLY USED:
%problem 4 part b (to run it set problemfourpartb=1):
problemfourpartb=0;
if problemfourpartb==1
sampleSum=0; %eventual sample or "run" sum of times
R=2*10^4; %number of simulations
T=10^4; %manual stopping time/cutoff for calculations
N=1; %1 lion
Lambs=zeros(R); %Location of lambs
Lions=zeros(R)*+10; %location of lions, d_0=10
for i = 0 : 1 : T
    U=rand(R); %for the lambs
    %then move the lambs
    U=rand(R); %for the lions
    %move the lions
    %check if any lambs have died, if so add that many times i to a
    %runnning counter of stopping times(?) or append data to something for
    %a histogram(?)

end

end