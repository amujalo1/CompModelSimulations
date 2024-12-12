function [t, y] = SimulateSystem(odefun, tspan, y0)
    % Numeri?ka simulacija sistema koriste?i Eulerovu metodu
    global Ts;
    N = length(tspan);   % Broj vremenskih koraka
    y = zeros(N, length(y0)); % Memorija za rezultate
    t = tspan';          % Vremenski niz (kolona)
    
    % Po?etni uslovi
    y(1, :) = y0';
    
    % Iterativno rješavanje diferencijalnih jedna?ina
    for i = 1:N-1
        dydt = odefun(t(i), y(i, :)'); % Izra?un derivacije
        y(i+1, :) = y(i, :) + Ts * dydt'; % Euler korak
    end
end
