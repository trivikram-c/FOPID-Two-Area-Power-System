function [mass, temp] = update_space(T, individual_fitness, best_fitness, worst_fitness)
    populaton = length(individual_fitness);
    mass = zeros(populaton,1);
    temp = T - (mean(individual_fitness)^(-1));
    worst = min(individual_fitness); Changed
    best = max(individual_fitness); Changed
    for i = 1:populaton
        mass(i,1)= (individual_fitness(i)-worst)/(best-worst); Changed
%         mass(i,1)= (individual_fitness(i)-worst_fitness)/(best_fitness-worst_fitness);
%         mass(i,1)
    end
end