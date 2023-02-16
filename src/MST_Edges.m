function [Edg Degr] = MST_Edges(G, start,G_edges_weights)

% G_edges_weights; % All-to-all mutual reachability distances, declared as global in the main program

% intree (1 x G.no_vertices) = Is the vertex in the tree ?
% d (1 x G.no_vertices) = "Distance" vertex is from partial MST
% v = Current vertex to process
% next_v = Candidate next vertex
% weight = Edge weight
% dist = Best current "distance" from partial MST
% G.MST_parent (G.no_vertices x 1) = MST discovery hierarchy
% G.MST_edges (G.no_vertices x 3) = MST edges (a pair of vertices and the corresponding weight)
% G.MST_degrees (No x 1) = MST vertex degrees (a self-edge counts one additional degree !)

%'COMPUTING THE MST (PRIMs Algorithm on a Complete Graph using List Search)';

for i=1:G.no_vertices
	intree(i) = 0;
	d(i) = Inf;
	G.MST_parent(i) = i;
end

d(start) = 0;
v = start;
counter = 0;

while (counter < (G.no_vertices - 1))
	intree(v) = 1;
	dist = Inf;
	for w=1:G.no_vertices
		if ((w~=v) && (intree(w) == 0))
			weight = G_edges_weights(v,w);
			if (d(w) > weight)
				d(w) = weight;
				G.MST_parent(w) = v;
			end
			if (dist > d(w))
				dist = d(w);
				next_v = w;
			end
		end

	end
	counter = counter + 1;
	G.MST_edges(counter,:) = [G.MST_parent(next_v)  ;  next_v  ;  G_edges_weights(G.MST_parent(next_v) , next_v)];	% Includes Edge into the MST
	G.MST_degrees(G.MST_parent(next_v)) = G.MST_degrees(G.MST_parent(next_v)) + 1;			% Increments MST vertex degree
	G.MST_degrees(next_v) = G.MST_degrees(next_v) + 1;						% Increments MST vertex degree
	v  = next_v;										% Vertex included
end
Edg = G.MST_edges;
Degr = G.MST_degrees;

