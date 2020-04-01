function [best_fitness,best_individual] = GBMO()
    

    %Keywords for designer - Changed - Parameters changed while testing.
    %Revert for final
    parameter;%Step 1

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Paper defined parameters for a run
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Step 2,3
    pop= 100; 
    num_param=10;
    k= 1.38E-6; %Changed
    a= 0.5;
    b=0.2;
    T = (273+30);
    space_limit= [ 0 0 0 0 0 0 0 0 0 0 ; 20 20 20 2 2 20 20 20 2 2];
    max_epoch=30;
    convergence_limit = 1E-3;
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Should also include limits of
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%all dimensions

    %%%%%%%%%%Initialize
    best_fitness= 1E6;
    best_individual= zeros(1, 10);
    worst_fitness= 0; %Changed
    worst_individual= zeros(1, 10);%Changed
    %% 
    %%%%%%%%%%%%% Initialize particles x, v, m, r (randomly). Each particle has
    %%%%%%%%%%%%% the ith row in every matrix
    %%%%%%%%%%%%% Step 4

    individual_position = [20*rand(pop,1) , 20*rand(pop,1) , 20*rand(pop,1) , 2*rand(pop,1) , 2*rand(pop,1) ,20*rand(pop,1) , 20*rand(pop,1) , 20*rand(pop,1) , 2*rand(pop,1) , 2*rand(pop,1) ];
    individual_velocity = rand(pop, num_param);
    %individual_radius = rand(pop, 1);%%%%%%%%%%%%%%what to do with the radius
    individual_mass= rand(pop,1);

    individual_fitness = zeros(pop,1);
    %% 
    %%%%%%%%%%%%%%%%%%step 5, 6
    for i = 1:pop
        individual_fitness(i,1) = optimfunc(individual_position(i,:));
    end
    %%     
    for N =1:max_epoch
        [individual_velocity, individual_position]= update_coordinates(individual_velocity, individual_position, T, individual_mass, b, a,k,space_limit);%%%%% step 7, 10 (skipped 8,9)
        for j = 1:pop %%%%%step 11,12
            individual_fitness(j,1) = optimfunc(individual_position(j,:));
            if (individual_fitness(j,1) < best_fitness)
                best_fitness = individual_fitness(j,1);
                best_individual = individual_position(j,:);
            elseif ((individual_fitness(j,1) > worst_fitness)) %Changed
                worst_fitness = individual_fitness(j,1); %Changed
                worst_individual = individual_position(j,:); %Changed
            end
        end
%         [individual_mass , T] = update_space(T, individual_fitness);
%         %Changed
        [individual_mass , T] = update_space(T, individual_fitness, best_fitness, worst_fitness);
        T
        N
        best_fitness
        worst_fitness
        if (T<=convergence_limit)
            break;
        end
    end
end