function [velocity, position] = update_coordinates(individual_velocity, individual_position, T, individual_mass, b, a,k,space_limit)
    sizes = size(individual_velocity);
    position = zeros(sizes);
    velocity = zeros(sizes);
    population = sizes(1);
    num_param = sizes(2);
    for i = 1: population
        velocity(i,:) = (normalize(rand(1,sizes(2)))).*((3*k*T./individual_mass(i)).^0.5);
        %velocity(i,:)
        for j= 1: num_param
%             if (individual_velocity(i,j)>=0)
%                 velocity(i,j) = individual_velocity(i,j)+ ((3*k*T./individual_mass(i)).^0.5);
%             
%             else  
%                 velocity(i,j) = individual_velocity(i,j)- ((3*k*T./individual_mass(i)).^0.5);
%             end
            position(i,j) = increment_pos(individual_position(i,j), individual_velocity(i,j), space_limit(:,j)); %%%%%%%%% Changed -assuming no overflow yet, no directionality
            %position(i,j)
            position(i,j) = increment_pos(position(i,j), (b -mod(((a/(2*pi))*(2*pi*position(i,j))),1)), space_limit(:,j));
        end
    end
end     