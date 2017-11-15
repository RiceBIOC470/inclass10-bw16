%In this directory, you will find some example data, which is a 300x8
%array stored in a .mat file. Image these are measurements for 300 genes are 8 different time
%points
%GB comments:
1) 100
2) 100 You are not completely wrong, but your rational is misleading. Just because that one eigenvalue is “significantly” larger than the rest, doesn’t mean that 1 dimension is sufficient to best explain the data. I suggest looking up the criteria in choosing the dimensionality to best explain data. 
3) 70 Plots should consist of points within the space and not lines connecting data enteries. The line introduced in the image presents a false representation of the data. Also, the question asks to color code the clustering values. 
4) 100 Same issue as 3, but won’t take points off. 
overall: 93

%1. Use matlab to perform pca on this data, getting the transformation
%matrix, the transformed data, and the eigenvalues.

load('example_dat.mat');
[coeff, sc, eig] = pca(dat);

%%
%2. Look at the eigenvalues - how many dimensions are necessary to explain
%the data? 

%%Bingyan Wu: 1, only one is showing relatively high eigenvalues

%3. Using kmeans clustering to cluster the data into 3 clusters. 
% Make a plot of the first coordinate of the raw data vs the second color coded
% by which cluster it is in. Make the same plot but use the first two
% principle components instead. 

ids=kmeans(dat,3);
tt=[0.25 0.5 1 2 3 5 7 8]
for ii=1:3
    inds=ids==ii;
    subplot(1,3,ii);
    plot(tt,mean(dat(inds,:),1),'.-','LineWidth',3,'MarkerSize',18);
    title(['Cluster' int2str(ii), ' ngenes: ' int2str(sum(inds))]);
end

colors={'r','g','b','c','m','k','y'};
figure; hold on;
plot(sc(:,1), sc(:,2), 'r.', 'LineWidth',2,'MarkerSize',24);
plot(sc(end,1),sc(end,2),'k.','MarkerSize',24);
xlabel('PC1','FontSize',32);
ylabel('PC2','FontSize',32);

%4. Repeat part 3 but use 7 clusters. Which is a more appropriate number of
%clusters for the data?

ids=kmeans(dat,7);
tt=[0.25 0.5 1 2 3 5 7 8];
for ii=1:7
    inds=ids==ii;
    subplot(4,2,ii);
    plot(tt,mean(dat(inds,:),1),'.-','LineWidth',3,'MarkerSize',18);
    title(['Cluster' int2str(ii), ' ngenes: ' int2str(sum(inds))]);
end

%%Bingyan Wu: 3 clusters is more appropriate.
