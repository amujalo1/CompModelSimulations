function F = ForceF(t)
    % Funkcija koja definiše periodi?nu silu F(t)
    % Primjer: sinusni signal sa amplitudom 10 i frekvencijom 0.5 Hz
    amplitude = 10;    % Amplituda sile [N]
    frequency = 0.5;   % Frekvencija sile [Hz]
    F = amplitude * sin(2 * pi * frequency * t);
end
