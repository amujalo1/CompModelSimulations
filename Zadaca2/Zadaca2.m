global R L C E
R = 1; % Ohm
L = 4; % Henry
C = 1/12; % Farad
E = 10; % Volt
Ts = 1e-4; % korak


[t, p] = ode23(@OdeFun, [0:Ts:15], [0; 0]);

% Rezultati
iL = p(:, 1); % Struja zavojnice
uC = p(:, 2); % Napon na kondenzatoru

% Iscrtavanje rezultata
figure;
subplot(2, 1, 1);
plot(t, iL);
title('Struja na zavojnici');
xlabel('Vrijeme [s]');
ylabel('Struja [A]');
grid on;

subplot(2, 1, 2);
plot(t, uC);
title('Napon na kondenzatoru');
xlabel('Vrijeme [s]');
ylabel('Napon [V]');
grid on;
