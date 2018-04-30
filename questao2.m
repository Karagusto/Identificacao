%% Gerador da distribuição uniforme
a = -1;
b = 1;
u = a + (b-a).*rand(100,1); % n = 100
%% Para Ga 
y(1:3) = 0;
for k=4:length(u)
    y(k) = [y(k-1) y(k-2) y(k-3) u(k-1) u(k-2) u(k-3)] * [2.705, -2.448, 0.7408, 0.0523, -0.0855, 0.035]';
end

t = 0:0.1:length(u)*0.1 - 0.1;

%plot(t, y, 'r')
%legend('Yadist(k)')
%legend('Yastep(k)')

%% Para Gb
y(1:2) = 0;
for k=3:length(u)
    y(k) = 1.881 * y(k-1) - 0.9048 * y(k-2) + 0.01207 * u(k-1) + 0.01167 * u(k-2);
end

t = 0:0.1:length(u)*0.1 - 0.1;

%plot(t, y, 'r')
%legend('Ybdist(k)')
%legend('Ybstep(k)')

%% Mínimos Quadrados Ordem
ordem_u = 1;
ordem_y = 1;
soma_ordem = ordem_u + ordem_y;

phi = zeros(100,soma_ordem);
x = ones(100);
%% Mínimos Quadrados Implementação
%for n = 1:100
%    ruido = 0.05*randn(100, 1);
%y(1:3) = 0;
%for k=4:length(u)
%    y(k) = 1.881 * y(k-1) - 0.9048 * y(k-2) + 0.01207 * u(k-1) + 0.01167 * u(k-2);
    %y(k) = [y(k-1) y(k-2) y(k-3) u(k-1) u(k-2) u(k-3)] * [2.705, -2.448, 0.7408, 0.0523, -0.0855, 0.035]';
    %y(k) = y(k) + ruido(k);
%end
%y(k) = y(k) + ruido(k);
for linha = 1:100
    for coluna = 1:ordem_y
        if(linha - coluna) < 1
            phi(linha, coluna) = 0;
        else
            phi(linha, coluna) = y(linha - coluna);
        end

    end
    
    for coluna = 1:ordem_u
        if(linha - coluna) < 1
            phi(linha, coluna + ordem_u) = 0;
        else
            phi(linha, coluna + ordem_u) = x(linha - coluna);   
        end
    end
    
end

Y_real = y';
phi_pseudoinversa = pinv(phi);
theta_estimado = phi_pseudoinversa*Y_real;
Y_estimado = phi*theta_estimado;
Y_estimado_100_mean(n) = mean(Y_estimado);
Y_estimado_100_std(n) = std(Y_estimado);

%end

%mean100 = mean(Y_estimado_100_mean)
%std100 = std(Y_estimado_100_std)



%resíduo e média(resíduo)
erro_residual = Y_real - Y_estimado;
%EQM
eqm = mean((Y_real - Y_estimado)^2);
erro_residual_media = mean(erro_residual);

%% Plotar erro e Y_real com Y_estimado

disp('Theta:')
theta_estimado
disp('Error:')
erro_residual
erro_residual_media
plot(Y_real, 'b')
hold on
plot(Y_estimado, 'r')
legend('Y', 'Y estimado')

%% Mínimos Quadrados Ga com Ruídos interno
ruido = 0.05*randn(100, 1);
y(1:3) = 0;
for k=4:length(u)
    y(k) = [y(k-1) y(k-2) y(k-3) u(k-1) u(k-2) u(k-3)] * [2.705, -2.448, 0.7408, 0.0523, -0.0855, 0.035]';
    y(k) = y(k) + ruido(k);
end

ta = 0:0.1:length(u)*0.1 - 0.1;

plot(ta, y, 'b')
legend('Ya com Ruído interno')

%% Mínimos Quadrados Gb com Ruídos interno
ruido = 0.05*randn(100, 1);
yb(1:3) = 0;
for k=4:length(u)
    yb(k) = [yb(k-1) yb(k-2) u(k-1) u(k-2)] * [1.881, -0.9048, 0.01207, 0.01167]';
    yb(k) = yb(k) + ruido(k);
end

tb = 0:0.1:length(u)*0.1 - 0.1;

plot(tb, yb, 'b')
legend('Yb com Ruído interno')


%% Mínimos Quadrados Ga com Ruídos externo
ruido = 0.05*randn(100, 1);
y(1:3) = 0;
for k=4:length(u)
    y(k) = [y(k-1) y(k-2) y(k-3) u(k-1) u(k-2) u(k-3)] * [2.705, -2.448, 0.7408, 0.0523, -0.0855, 0.035]';
    
end
y(k) = y(k) + ruido(k);
ta = 0:0.1:length(u)*0.1 - 0.1;

plot(ta, y, 'b')
legend('Ya com Ruído externo')
%% Mínimos Quadrados Gb com Ruídos interno
ruido = 0.05*randn(100, 1);
yb(1:3) = 0;
for k=4:length(u)
    yb(k) = [yb(k-1) yb(k-2) u(k-1) u(k-2)] * [1.881, -0.9048, 0.01207, 0.01167]';
    
end
yb(k) = yb(k) + ruido(k);
tb = 0:0.1:length(u)*0.1 - 0.1;

plot(tb, yb, 'b')
legend('Yb com Ruído externo')

%%
ordem_u = 3;
ordem_y = 3;
soma_ordem = ordem_u + ordem_y;

phi = zeros(100,soma_ordem);
x = ones(100);
Y_estimado_100 = zeros(100);
for n = 1:100
    for linha = 1:100
        for coluna = 1:ordem_y
            if(linha - coluna) < 1
                phi(linha, coluna) = 0;
            else
                phi(linha, coluna) = y(linha - coluna);
            end

        end
    
        for coluna = 1:ordem_u
            if(linha - coluna) < 1
                phi(linha, coluna + ordem_u) = 0;
            else
                phi(linha, coluna + ordem_u) = x(linha - coluna);   
            end
        end
    
    end
Y_real = y';
phi_pseudoinversa = pinv(phi);
theta_estimado = phi_pseudoinversa*Y_real;
Y_estimado_100(n) = phi*theta_estimado;
end

Y_estimado_100_mean = mean(Y_estimado_100);
Y_estimado_100_std = std(Y_estimado_100);


    



