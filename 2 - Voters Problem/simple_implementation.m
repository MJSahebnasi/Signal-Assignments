clc;
close all;

colors = 3;
n = 50;
k = 4;
iterations = 500;

% #Initialization
Grid = randi(colors, n);
imagesc(Grid)
title('initial state')
pbaspect([1 1 1])
set(gca,'XTick',[], 'YTick', [])

% #Main Process
for itr = 1:iterations
    % #(n*n/k) random numbers in range [1, n*n]:
    
    % #this one can generate repetitive numbers:
%     cells_to_change = randi(n*n, 1, n*n/k);

    % #so I use this one:
    cells_to_change = randperm(n*n, n*n/k);
    
    % #X,Y keep positions of randomly chosen cells:
    X = mod(cells_to_change-1, n)+1;
    Y = fix((cells_to_change-1)/n)+1;
    % #new values for the cells:
    new_values = zeros(1, length(X));
    
    for ind = 1:length(X)
        % #initializing the list of neighbor_values for each cell
        neighbor_values = [];
        for row = Y(ind)*(Y(ind)==1) + (Y(ind)-1)*(Y(ind)>1) : Y(ind)*(Y(ind)==n) + (Y(ind)+1)*(Y(ind)<n)
            for col = X(ind)*(X(ind)==1) + (X(ind)-1)*(X(ind)>1) : X(ind)*(X(ind)==n) + (X(ind)+1)*(X(ind)<n)
                if (row ~= Y(ind) || col ~= X(ind))
                    neighbor_values(end+1) = Grid(row, col);
                end
            end
        end
        
        new_values(ind) = neighbor_values(randi(length(neighbor_values)));
    end
    
    % #assigning new values:
    for ind = 1:length(X)
        Grid(Y(ind),X(ind)) = new_values(ind);
    end
    
    % #drawing the grid
    if itr ~= 1
        imagesc(Grid)
        title(sprintf('itr #%d', itr))
        pbaspect([1 1 1])
        set(gca,'XTick',[], 'YTick', [])
    end
    if (mod(itr,100) == 0 && itr < iterations) || itr == 1
        figure, imagesc(Grid)
        title(sprintf('itr #%d', itr))
        pbaspect([1 1 1])
        set(gca,'XTick',[], 'YTick', [])
    end
    pause(0.01)
end