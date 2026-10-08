a=0.3;
b=0.1;
q0=[1,0,0,0,0];

p=zeros(5,5);

stoppingn=134+1;
%I did things out of order-ish by
% finding smallestn then going back
% and making stoppingn equal to it plus 1.

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

[Eigenvectors, Eigenvalues]=eig(p.');
%from what I can tell MatLab uses right eigenvectors. So, I'll use
%v^TA^t=(Av)^T identity to get the left eigenvector.
eigenValuesVector=diag(Eigenvalues);
indexStationary = find(abs(eigenValuesVector-1)<1e-10,1);
%diag puts the diagonal eigenvalue matrix into a vector,
% then find finds the index of the one closest to 1.

stationary=Eigenvectors(:,indexStationary).';
stationary=stationary/sum(stationary); %normalize
disp('Stationary is ')
stationary

modulos=abs(Eigenvectors);
modulosSort = sort(modulos, 'descend');
disp('2nd largest modulus is')
secondLargestmodulus=modulosSort(2)

qns = zeros(stoppingn+1, 5);

qns(1,:)=q0;

state2Entries = zeros(stoppingn+1, 1);

state4Entries = zeros(stoppingn+1, 1);

state2Entries(1)=q0(3); %matlab indexing meaning the 3rd entry is the 2nd state
state4Entries(1)=q0(5); %and the 5th entry is the 4th state

runningAverage=zeros(stoppingn+1, 1);

runningAverage(1)=state2Entries(1)/1;

notFoundYet=0; % I remember like 1 optimization from a comp sci class... this is it
smallestn = 0;
for n=1:stoppingn
    qns(n+1,:)=qns(n,:)*p;
    state2Entries(n+1)=qns(n+1,3);
    state4Entries(n+1)=qns(n+1,5);

    runningAverage(n+1)=sum(state2Entries(1:n+1))/(n+1);

    if notFoundYet==0
        if abs(qns(n+1, 1)-stationary(1))<10^(-6) && abs(qns(n+1, 2)-stationary(2))<10^(-6) && abs(qns(n+1, 3)-stationary(3))<10^(-6) && abs(qns(n+1, 4)-stationary(4))<10^(-6) && abs(qns(n+1, 5)-stationary(5))<10^(-6)
            smallestn=n;
            notFoundYet=1;
        end
    end
end

% qns(51,:) %actually q50
% qns(52,:) %actually q51
% 
% p^50
% 
% p^51

k = 0:stoppingn;

figure
plot(k, state2Entries, '-', 'Color', 'r')
hold on
plot(k, state4Entries, '-', 'Color', 'b')
plot(k, runningAverage, '-', 'Color', 'black')

yline(stationary(3), '--', 'Color', 'r')
yline(stationary(5), '--', 'Color', 'b')

hold off
legend('2nd state', '4th state', 'running average of second states', 'stationary distributions state 2', 'stationary distributions state 4')
xlabel('n')
ylabel('Probability/value')
disp("Smallest n is")
smallestn

p^50
p