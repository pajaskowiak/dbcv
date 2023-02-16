function [d_ucore G_edges_weights] = matrix_mutual_reachability_distance(MinPts, G_edges_weights,d)

No = size(G_edges_weights,1);

K_NN_Dist = G_edges_weights.^(-1*d);	
K_NN_Dist(K_NN_Dist == Inf) = 0;

%original
d_ucore         = sum(K_NN_Dist);

d_ucore         = d_ucore / (No - 1);    
d_ucore         = (1./d_ucore).^(1/(1*d));
d_ucore(d_ucore == Inf) = 0;
    
for i = 1:No
    for j=1:MinPts        
        G_edges_weights(i,j) = max([d_ucore(i)  d_ucore(j)  G_edges_weights(i,j)]);
        G_edges_weights(j,i) = G_edges_weights(i,j); 
    end
end

end

