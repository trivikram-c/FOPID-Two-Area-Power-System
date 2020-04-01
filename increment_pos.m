function pos = increment_pos (position, increment,  limit)
    if (increment>1E2*(limit(2)-limit(1))) %%%%%%%%%% if increment >>>> the space length, we randomize the the position
        pos = limit(1)+ (limit(2)-limit(1))*rand;
    elseif ((position+increment)<limit(2))&&((position+increment)>limit(1))
        pos = position+increment;
    elseif (position+increment)>limit(2)
        pos = increment_pos(limit(2), -((position+increment)-limit(2)), limit);% normal recursive function for reflection
    else
        pos = increment_pos(limit(1), -((position+increment)-limit(1)), limit);% normal recursive function for reflection
    end
end