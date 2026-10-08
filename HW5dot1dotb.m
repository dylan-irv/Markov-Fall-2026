a=1;
b=1;
q0=[1,0,0,0,0];

p=zeros(5,5);

for i=0:4
    r=i+1; %row/column corresponding to i

    if i+1<=4
        p(r,r+1)= (a*(4-i))/4;
    end
    if i-1>=0
        p(r, r-1)=(b*i)/4;
    end
    if i+1<=4 && i-1>=0
        p(r,r)=1-p(r,r+1)-p(r,r-1);
    elseif i+1<=4
        p(r,r)=1-p(r,r+1);
    elseif i-1>=0
        p(r,r)=1-p(r,r-1);
    else
        disp('Something messed up')
    end
end

qns = zeros(61, 5);

qns(1,:)=q0;

state2Entries = zeros(61, 1);

state4Entries = zeros(61, 1);

state2Entries(1)=q0(3); %matlab indexing meaning the 3rd entry is the 2nd state
state4Entries(1)=q0(5); %and the 5th entry is the 4th state

runningAverage=zeros(61, 1);

runningAverage(1)=state2Entries(1)/1;

for n=1:60
    qns(n+1,:)=qns(n,:)*p;
    state2Entries(n+1)=qns(n+1,3);
    state4Entries(n+1)=qns(n+1,5);

    runningAverage(n+1)=sum(state2Entries(1:n+1))/(n+1);
end

qns(51,:) %actually q50
qns(52,:) %actually q51

p^50

p^51

k = 0:60;

plot(k, state2Entries, '-', 'Color', 'r')
hold on
plot(k, state4Entries, '-', 'Color', 'b')
plot(k, runningAverage, '-', 'Color', 'black')
hold off
legend('2nd state', '4th state', 'running average of second states')
xlabel('n')
ylabel('Probability/value')