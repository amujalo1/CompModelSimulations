% Glavni skript
clc; clear; close all;

% Globalni parametri sistema
global k1 k2 k3 B1 B2 M1 M2 Ts;
% Parametri sistema
k1 = 300; k2 = 200; k3 = 100;
B1 = 15; B2 = 20;
M1 = 15; M2 = 40;
Ts = 0.01; % Korak vremenske simulacije

% Vremenski period simulacije
T = 20; % sekunde
tspan = 0:Ts:T;

% Po?etni uslovi [x1, v1, x2, v2]
y0 = [0 0 0 0]; 

% Simulacija sistema
[t, y] = SimulateSystem(@OdeFun, tspan, y0);

% Ra?unanje brzina i ubrzanja
v1 = y(:, 2); % Brzina M1
a1 = diff(v1) / Ts; % Ubrzanje M1
v2 = y(:, 4); % Brzina M2
a1 = [a1; a1(end)]; % Popunjavanje poslednjeg elementa ubrzanja

% Pronalazak maksimalne brzine M2
[max_v2, idx_max_v2] = max(abs(v2));
time_max_v2 = t(idx_max_v2);

% Prikaz rezultata
figure;
subplot(2, 1, 1);
plot(t, v1, 'b', 'LineWidth', 1.5); hold on;
plot(t, a1, 'r', 'LineWidth', 1.5);
legend('Brzina M1', 'Ubrzanje M1');
xlabel('Vrijeme [s]');
ylabel('Brzina / Ubrzanje');
grid on;

subplot(2, 1, 2);
plot(t, v2, 'k', 'LineWidth', 1.5); hold on;
plot(time_max_v2, -max_v2, 'ro', 'MarkerSize', 8, 'LineWidth', 2);
legend('Brzina M2', 'Maksimalna brzina M2');
xlabel('Vrijeme [s]');
ylabel('Brzina');
grid on;
