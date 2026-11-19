simulatedtime = zeros(1,1000);
% exprnd(mean) gives exponential time with parameter being the mean.
% Now, rate \lambda+n\mu means mean=\frac{1}{\lambda+n\mu}=1/(12+n*3)
n=0; %starting state, but vectors index at 1 so I adjust for this where needed
elapsed=0; %this is time elapsed (to be random), not a step size
upordown=0; %will be regenerated random variable for bernoulli thingy
highestindex=0; %so I don't have to plot 0 to 999
time=0; %time starts at zero
while time<500
    upordown=rand;
    elapsed=exprnd(1/(12+n*3));
    simulatedtime(n+1)=simulatedtime(n+1)+elapsed; %matlab vectors begin at 1
    time=time+elapsed;
    if upordown<(12/(12+n*3)) %moves up with this probability
        n=n+1;
    else
        n=n-1;
    end
    if n==1000
        disp('remember when you said this was too unlikely to happen and wouldnt matter if you care about accidentally filtering simulation results well somehow it did happen.')
    end
    if n>highestindex
        highestindex=n;
    end
end

probabilityresult = zeros(1,1000); % the exact poisson(4) probabilities
for i = 0:999
    probabilityresult(i+1)=exp(-4)*((4^i)/(factorial(i)));
end

fracsimulatedtime = (1/500)*simulatedtime;

plottingfracsimulatedtime = fracsimulatedtime(1:highestindex);
plottingprobabilityresult = probabilityresult(1:highestindex);

bar(0:highestindex-1, [plottingfracsimulatedtime(:), plottingprobabilityresult(:)], 'grouped');
xlabel('State n');
ylabel('Probability');
legend('fraction of simulated time', 'Poisson(4) probability/stationary');
grid on;

vectorofdifferences = abs( fracsimulatedtime-probabilityresult );
[maximumdifference, idx]=max(vectorofdifferences);
disp('The largest difference is at state ')
disp(idx-1) %because matlab vectors start at 1
disp(' and it is ')
disp(maximumdifference)


states = 0:999;
timeavgofX = sum(states .* fracsimulatedtime);
disp('The simulated time average of X_t is ')
disp(timeavgofX)
disp('and the probability-calculated long-run time average is 4 given by the mean of Poisson(4)')

