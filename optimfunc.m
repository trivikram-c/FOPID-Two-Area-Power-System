function ITAE = optimfunc (Kg) %%%%%%%%%%% should be optimized. basically the function which accepts the itae

    assignin('base', 'Kg', Kg);
    %FOPID_param(Kg);
    sim('model.slx');
    ITAE = ans.cost(length(ans.cost));
end