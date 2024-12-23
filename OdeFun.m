function dydt = OdeFun(t, y)
    global M1 M2 k1 k2 k3 B1 B2;

    % Stanja sistema
    x1 = y(1); v1 = y(2);
    x2 = y(3); v2 = y(4);

    % Sila F(t)
    F = 100*ForceF(t);

    % Diferencijalne jedna?ine
    dx1dt = v1;
    dv1dt = (-k1*x1 - B1*v1 + k2*(x2 - x1)) / M1;
    dx2dt = v2;
    dv2dt = (-k2*(x2 - x1) - k3*x2 - B2*v2 + F) / M2;

    % Povratna vrijednost
    dydt = [dx1dt; dv1dt; dx2dt; dv2dt];
end
