function F = ForceF(t)
% ForceF Calculates the force function based on the provided plot
%   F = ForceF(t) returns the force value at a given time t.
%   The force function is defined piecewise based on the plot.

    F = zeros(size(t)); % Initialize the output F to have the same size as t
    
    for i = 1:length(t)
       time = t(i);
       
       time_mod = mod(time, 4); 

        if time_mod >= 0 && time_mod < 1
           F(i) = time_mod; 
        elseif time_mod >= 1 && time_mod < 2
           F(i) = -time_mod + 2;  
        elseif time_mod == 2
            F(i) = 2;
        elseif time_mod > 2 && time_mod <= 3
            F(i) = time_mod;
        elseif time_mod >= 3 && time_mod < 4
           F(i) = -time_mod+6;  
        elseif time_mod == 4
          F(i) = 0;
        end
        
    end
end