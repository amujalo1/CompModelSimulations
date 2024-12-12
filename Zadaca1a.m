% Glavni program

% Parametri sistema
global M1 M2 k1 k2 k3 B1 B2 Ts;
M1 = 15; M2 = 40;   % mase [kg]
k1 = 300; k2 = 200; k3 = 100;   % krutosti opruga [N/m]
B1 = 15; B2 = 20;   % koeficijenti prigušenja [Ns/m]
Ts = 0.01;          % Vrijeme semplinga [s]

% Po?etni uslovi
x1_0 = 5; v1_0 = 0;  % Po?etni položaj i brzina M1
x2_0 = 0; v2_0 = 0;  % Po?etni položaj i brzina M2
y0 = [x1_0; v1_0; x2_0; v2_0]; % Po?etni uslovi

% Vremenski opseg simulacije
tspan = 0:Ts:20; % Od 0 do 20 sekundi sa korakom Ts

% Rješavanje diferencijalnih jedna?ina koriste?i vlastitu simulaciju
[t, y] = SimulateSystem(@OdeFun, tspan, y0);

% Ekstrakcija rezultata
x1 = y(:, 1);
x2 = y(:, 3);

% Crtanje rezultata
figure;
plot(t, x1, 'r', 'LineWidth', 1.5); hold on;
plot(t, x2, 'b', 'LineWidth', 1.5);
xlabel('Vrijeme [s]');
ylabel('Položaj [m]');
legend('x_1(t)', 'x_2(t)', 'Location', 'best');
title('Kretanje tijela M1 i M2');
grid on;
