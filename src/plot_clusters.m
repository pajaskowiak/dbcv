function plot_clusters(data,labels)

color = {'b','g','r','c','m','y'};
point = {'x','o','*','s','d','v','^','>','<','p','h'};

for i=1:size(data,1)
    if ((labels(i) == -1) || sum(labels == labels(i)) == 1 )
         plot(data(i,1),data(i,2),'k+','MarkerSize',6);
    else
        plot(data(i,1),data(i,2),strcat(color{mod(labels(i),length(color))+1},point{mod(labels(i),length(point))+1}),'MarkerSize',9);
    end
    hold on;
end

end
