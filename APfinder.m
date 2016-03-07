function APs=APfinder(data)

derivthresh=5;

APlength=50;
backtrack=5;


findAPs=diff(data);
APloc=find(findAPs>derivthresh);
dummy1=NaN(length(APloc)+1,1);
dummy2=NaN(length(APloc)+1,1);
dummy1(1:length(APloc))=APloc;
dummy2(2:length(APloc)+1)=APloc;
disconts=dummy1-dummy2;
APstarts=find(disconts>1);
APs=NaN(APlength+1+backtrack,length(APstarts)+1);
disp(strcat('APloc(1)=',num2str(APloc(1))));
disp(strcat('APloc(1)+APlength=',num2str(APloc(1)+APlength)));
disp(strcat('length APs(:,1)=',num2str(length(APs(:,1)))));
disp(strcat('length data=',num2str(length(data(APloc(1):(APloc(1)+APlength))))));

APs(:,1)=data(APloc(1)-backtrack:(APloc(1)+APlength));
for i=2:(length(APstarts))
    APs(:,i)=data(APloc(APstarts(i))-backtrack:(APloc(APstarts(i))+APlength));
    disp(strcat('i=',num2str(i)));
    
end





end