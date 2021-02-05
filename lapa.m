close all;

nx = 100;
ny = 100;
V  = zeros(nx,ny);
nT = 1000;

% Boundary condition x axis
V(:,1) = 1;  
V(:,nx) = 1;

% Boundary condition y axis
V(1,:) = 0;
V(ny, :) = 0;

% Equation in a form it can be solved by iteration 
for i = 1:nT
    for j = 2:nx-1
        for k = 2:ny-1
            V(j,k) = (V(j+1, k) + V(j-1, k) + V(j, k+1) + V(j, k-1))/4;
        end
    end
    
    subplot(3,1,1)
    surf(V')

    % Electric field
    [Ex,Ey] = gradient(V);


    subplot(3,1,2)
    quiver(-Ey',-Ex',1)

    subplot(3,1,3)
    A = imboxfilt(V,3);
    surf(A)

    pause(0.05)
end


%      if mod(k,50) == 0
%             surf(V')
%             pause(0.05)
%      end
