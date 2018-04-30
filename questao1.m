Ga = tf([0.5 2 2],[1 3 4 2]);
Gb = tf([2.5],[1 1 2.5]);
%step(Ga)
%step(Gb)

%roots([1 3 4 2])
%roots([1 1 2.5])
%rlocus(Ga)
%rlocus(Gb)
Gza = c2d(Ga, 0.1);
Gzb = c2d(Gb, 0.1);

%% Para G1
u = ones(100, 1);

y(1:3) = 0;
for k=4:length(u)
    y(k) = [y(k-1) y(k-2) y(k-3) u(k-1) u(k-2) u(k-3)] * [2.705, -2.448, 0.7408, 0.0523, -0.0855, 0.035]';
end

t = 0:0.1:length(u)*0.1 - 0.1;

plot(t, y, 'r')
legend('Ya(k)')

hold on

step(Ga)

%% Para G2
u = ones(100, 1);
y = zeros(100, 1);

y(1:2) = 0;
for k=3:length(u)
    y(k) = 1.881 * y(k-1) - 0.9048 * y(k-2) + 0.01207 * u(k-1) + 0.01167 * u(k-2);
end

t = 0:0.1:length(u)*0.1 - 0.1;

plot(t, y, 'r')
legend('Yb(k)')

hold on

step(Gb)

%% Análise pelos pólos
                                  