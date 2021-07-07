clc;
close all;

colors = 3;
n = 50;
k = 4;
total_iterations = 310;
train_iterations = 300;

% #Initialization
Grid = randi(colors, n);
imagesc(Grid)
title('initial state')
pbaspect([1 1 1])
set(gca,'XTick',[], 'YTick', [])

% #Main Process
for itr = 1:train_iterations
   
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
    if (mod(itr,100) == 0 && itr < total_iterations) || itr == 1
        figure, imagesc(Grid)
        title(sprintf('itr #%d', itr))
        pbaspect([1 1 1])
        set(gca,'XTick',[], 'YTick', [])
    end
    pause(0.01)
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
x = zeros([n*n,2]);
y = zeros([n*n,1]);
cntr = 1;
for i=1:n
    for j=1:n
        x(cntr,1) = i;
        x(cntr,2) = j;
        y(cntr) = Grid(i,j);
        cntr = cntr+1;
    end
end
model = fitcecoc(x,y)
svm_grid = Grid;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for itr = train_iterations+1 : total_iterations
   
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
    if mod(itr,100) == 0
        figure, imagesc(Grid)
        title(sprintf('random: itr #%d', itr))
        pbaspect([1 1 1])
        set(gca,'XTick',[], 'YTick', [])
    end
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    p = [X;Y];
    p = transpose(p);
    new_values = predict(model, p);
    % #assigning new values:
    for ind = 1:length(X)
        svm_grid(Y(ind),X(ind)) = new_values(ind);
    end
    
    % #drawing the grid
%     if mod(itr,100) == 0
    figure, imagesc(svm_grid)
    title(sprintf('SVM: itr #%d', itr))
    pbaspect([1 1 1])
    set(gca,'XTick',[], 'YTick', [])
%     end    
end

