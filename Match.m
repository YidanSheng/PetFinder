
clc; clear; close all

clc;
clear; 
close all;

%%%
% set names of query image and target image
sdog_folder = './SampleDogs/';
dbdogs_folder = './CroppedDogDB/';
origindogs_folder='./DogDataBase/';
rowDogs = {};

for r = 1:1:45
    rowDogs = [rowDogs ['dog', num2str(r)]];
end


d1=zeros(45,1);
d2=zeros(45,1);
d3=zeros(45,1);
d4=zeros(45,1);
d5=zeros(45,1);

% 
%maxCorrScores = zeros(5,4);

corrInfo = {};
% maxColorCorrScore = 0.0;
closestGreyImage = '';
% closestColorImage = '';
counter = 1;
counter2 = 2;

    for i = 1:1:5

        sdFileName = [ 'd',num2str(i),'.png'];
        SampleDog=[sdog_folder, sdFileName ] ;
        IsdbColor = imread(SampleDog);
        IcsdbGrayScale = rgb2gray(IsdbColor);
        currCorrScore = -1000;
        maxCorrScore = -1000;

            for j=1:1:45,

                dbFileName = [ 'dog', num2str(j),'.png'];
                DBDogs= [dbdogs_folder,dbFileName];
                IdbColor = imread(DBDogs);
                IqdbGrayScale = rgb2gray(IdbColor);

                    %%%
                    % compute the correlation match score
                    %%
                currCorrScore = myCorrelationMatch(IcsdbGrayScale, IqdbGrayScale);



                if (currCorrScore > maxCorrScore) 
                  maxCorrScore= currCorrScore;
                  closestGreyImage = j;

                end

                if i==1
                    d1(j,1)=currCorrScore;
                elseif i==2
                    d2(j,1)=currCorrScore;
                elseif i==3
                    d3(j,1)=currCorrScore;
                elseif i==4
                    d4(j,1)=currCorrScore;
                elseif i==5
                    d5(j,1)=currCorrScore;
                end

            end

        
    end


T=table(d1,d2,d3,d4,d5,...
    'RowNames',rowDogs) ;

%Pick the most three
mostThree=zeros(1,3);
%Sorted the correlation 
sorted_d1=sort(d1,'descend');
sorted_d2=sort(d2,'descend');
sorted_d3=sort(d3,'descend');
sorted_d4=sort(d4,'descend');
sorted_d5=sort(d5,'descend');
%Get the name of the image

x=1:1:45;

for b = 1:1:5
    
    figure(b);
    subplot(2,2,1)
    imshow([sdog_folder,'d',num2str(b),'.png']);
    title(['Sample: ',num2str(b)]);
    
    if b==1
    figure(b);
     for k=1:1:3
        for q=1:1:45
            if d1(q,1)==sorted_d1(k,1)
                subplot(2,2,k+1);
                imshow([origindogs_folder,'dog',num2str(q),'.png']);
                str = num2str(d1(q,1));
                str = str(1:5);
                title(['Dog: ',num2str(q),' Corr Score:', str]);
            end 
        end
%         subplot(2,3,5);
%         plot(x,d1)
     end
     
    elseif b==2
     for p=1:1:3
        for q=1:1:45
            if d2(q,1)==sorted_d2(p,1)
                subplot(2,2,p+1);
                imshow([origindogs_folder,'dog',num2str(q),'.png']);
                str = num2str(d2(q,1));
                str = str(1:5);
                title(['Dog: ',num2str(q),' Corr Score:', str])
            end 
        end
%         subplot(2,3,5);
%         plot(x,d2)
     end
     
    elseif b==3
     for l=1:1:3
        for q=1:1:45
            if d3(q,1)==sorted_d3(l,1)
                subplot(2,2,l+1);
                imshow([origindogs_folder,'dog',num2str(q),'.png']);
                str = num2str(d3(q,1));
                str = str(1:5);
                title(['Dog: ',num2str(q),' Corr Score:', str])
            end 
        end
%         subplot(2,3,5);
%         plot(x,d3)        
     end
    elseif b==4
     for m=1:1:3
        for q=1:1:45
            if d4(q,1)==sorted_d4(m,1)
                subplot(2,2,m+1);
                imshow([origindogs_folder,'dog',num2str(q),'.png']);
                str = num2str(d4(q,1));
                str = str(1:5);
                title(['Dog: ',num2str(q),' Corr Score:', str])                
            end 
        end
%         subplot(2,3,5);
%         plot(x,d4)
     end
     
    elseif b==5
     for n=1:1:3
        for q=1:1:45
            if d5(q,1)==sorted_d5(n,1)
                subplot(2,2,n+1);
                imshow([origindogs_folder,'dog',num2str(q),'.png']);
                str = num2str(d5(q,1));
                str = str(1:5);
                title(['Dog: ',num2str(q),' Corr Score:', str])
            end 
        end
%         subplot(2,3,5);
%         plot(x,d5)
     end
    end
end





