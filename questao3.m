%%questao3
%Entrada alternativa
a = -1;
b = 1;
u = a + (b-a).*rand(100,1);
y(1:3) = 0;
ruido = 0.05*randn(100, 1);
rms_ruido = rms(ruido);
for k=4:length(u)
    y(k) = [y(k-1) y(k-2) y(k-3) u(k-1) u(k-2) u(k-3)] * [2.705, -2.448, 0.7408, 0.0523, -0.0855, 0.035]';
    y(k) = y(k) + ruido(k);
    
end
y_real = y';
yb(1:3) = 0;
for k=4:length(u)
    yb(k) = [yb(k-1) yb(k-2) u(k-1) u(k-2)] * [1.881, -0.9048, 0.01207, 0.01167]';
    yb(k) = yb(k) + ruido(k);
end
y_real_b = yb';

%% Gerar modelo a5
y(1:5) = 0;
for k=6:length(u)
    y(k) = [y(k-1) y(k-2) y(k-3) y(k-4) y(k-5) u(k-1) u(k-2) u(k-3) u(k-4) u(k-5)] * [1.1505,   -0.0564,   -0.0662,   -0.0683,   -0.0241,    0.0000,    0.0000,   -0.0864,   0.0875, -0.0036]';
    y(k) = y(k) + ruido(k);
end
ya_estmado_5 = y';
erro = y_real - ya_estmado_5;
eqma5 = mean((y_real - ya_estmado_5).^2)

% Coeficiente de correlação multipla 'beta'
SQE = eqma5;
SQR = mean((ya_estmado_5).^2);
SQT = mean((ya_estmado_5 + erro).^2);
beta5 = SQR/SQT
% ou beta = 1 - SQE/SQT' 

% Sinal/Ruido
rms_5 = rms(ya_estmado_5);
SNRa5 = (rms_5/rms_ruido)^2



%% Gerar modelo a4
y(1:4) = 0;
for k=5:length(u)
    y(k) = [y(k-1) y(k-2) y(k-3) y(k-4) u(k-1) u(k-2) u(k-3) u(k-4)] * [1.1494 -0.0508   -0.0652   -0.0964   -0.0000    0.0000   -0.0864    0.0841]';
    y(k) = y(k) + ruido(k);
end
ya_estmado_4 = y';
erro = y_real - ya_estmado_4;
eqma4 = mean((y_real - ya_estmado_4).^2)

% Coeficiente de correlação multipla 'beta'
SQE = eqma4;
SQR = mean((ya_estmado_4).^2);
SQT = mean((ya_estmado_4 + erro).^2);
beta4 = SQR/SQT
% ou beta = 1 - SQE/SQT' 

% Sinal/Ruido
rms_4 = rms(ya_estmado_4);
SNRa4 = (rms_4/rms_ruido)^2


%% Gerar modelo a3
y(1:3) = 0;
for k=4:length(u)
    y(k) = [y(k-1) y(k-2) y(k-3) u(k-1) u(k-2) u(k-3)] * [1.1652   -0.0460   -0.1791    0.0000   -0.0000   -0.0030]';
    y(k) = y(k) + ruido(k);
end
ya_estmado_3 = y';
erro = y_real - ya_estmado_3;
eqma3 = mean((y_real - ya_estmado_3).^2)

% Coeficiente de correlação multipla 'beta'
SQE = eqma3;
SQR = mean((ya_estmado_3).^2);
SQT = mean((ya_estmado_3 + erro).^2);
beta3 = SQR/SQT
% ou beta = 1 - SQE/SQT'

% Sinal/Ruido
rms_3 = rms(ya_estmado_3);
SNRa3 = (rms_3/rms_ruido)^2

%% Gerar modelo a2
y(1:2) = 0;
for k=3:length(u)
    y(k) = [y(k-1) y(k-2) u(k-1) u(k-2)] * [ 1.2116   -0.2626    0.0000   -0.0026]';
    y(k) = y(k) + ruido(k);
end
ya_estmado_2 = y';
erro = y_real - ya_estmado_2;
eqma2 = mean((y_real - ya_estmado_2).^2)

% Coeficiente de correlação multipla 'beta'
SQE = eqma2;
SQR = mean((ya_estmado_2).^2);
SQT = mean((ya_estmado_2 + erro).^2);
beta2 = SQR/SQT
% ou beta = 1 - SQE/SQT' 

% Sinal/Ruido
rms_2 = rms(ya_estmado_2);
SNRa2 = (rms_2/rms_ruido)^2

%% Gerar modelo a1
y(1) = 0;
for k=2:length(u)
    y(k) = [y(k-1) u(k-1)] * [0.9871    0.0011]';
    y(k) = y(k) + ruido(k);
end
ya_estmado_1 = y';
erro = y_real - ya_estmado_1;
eqma1 = mean((y_real - ya_estmado_1).^2)

% Coeficiente de correlação multipla 'beta'
SQE = eqma1;
SQR = mean((ya_estmado_1).^2);
SQT = mean((ya_estmado_1 + erro).^2);
beta1 = SQR/SQT
% ou beta = 1 - SQE/SQT'

% Sinal/Ruido
rms_1 = rms(ya_estmado_1);
SNRa1 = (rms_1/rms_ruido)^2

%% Gerar modelo b5
yb(1:5) = 0;
for k=6:length(u)
    yb(k) = [yb(k-1) yb(k-2) yb(k-3) yb(k-4) yb(k-5) u(k-1) u(k-2) u(k-3) u(k-4) u(k-5)] * [2.6029   -2.7472    1.6903   -0.6709    0.1095    0.0000    0.0171   -0.0290    0.0211   -0.0085]';
    yb(k) = yb(k) + ruido(k);
end
yb_estmado_5 = yb';
erro = y_real_b - yb_estmado_5;
eqmb5 = mean((y_real_b - yb_estmado_5).^2)

% Coeficiente de correlação multipla 'beta'
SQE = eqmb5;
SQR = mean((yb_estmado_5).^2);
SQT = mean((yb_estmado_5 + erro).^2);
betab5 = SQR/SQT
% ou beta = 1 - SQE/SQT'

% Sinal/Ruido
rmsb_5 = rms(yb_estmado_5);
SNRb5 = (rmsb_5/rms_ruido)^2

%% Gerar modelo b4
yb(1:4) = 0;
for k=5:length(u)
    yb(k) = [yb(k-1) yb(k-2) yb(k-3) yb(k-4) u(k-1) u(k-2) u(k-3) u(k-4)] * [2.5497   -2.5572    1.3652   -0.3750   -0.0000    0.0171   -0.0281    0.0120]';
    yb(k) = yb(k) + ruido(k);
end
yb_estmado_4 = yb';
erro = y_real_b - yb_estmado_4;
eqmb4 = mean((y_real_b - yb_estmado_4).^2)

% Coeficiente de correlação multipla 'beta'
SQE = eqmb4;
SQR = mean((yb_estmado_4).^2);
SQT = mean((yb_estmado_4 + erro).^2);
betab4 = SQR/SQT
% ou beta = 1 - SQE/SQT'

% Sinal/Ruido
rmsb_4 = rms(yb_estmado_4);
SNRb4 = (rmsb_4/rms_ruido)^2

%% Gerar modelo b3
yb(1:3) = 0;
for k=4:length(u)
    yb(k) = [yb(k-1) yb(k-2) yb(k-3) u(k-1) u(k-2) u(k-3)] * [2.3567   -1.8327    0.4633   -0.0000    0.0171   -0.0166]';
    yb(k) = yb(k) + ruido(k);
end
yb_estmado_3 = yb';
erro = y_real_b - yb_estmado_3;
eqmb3 = mean((y_real_b - yb_estmado_3).^2)

% Coeficiente de correlação multipla 'beta'
SQE = eqmb3;
SQR = mean((yb_estmado_3).^2);
SQT = mean((yb_estmado_3 + erro).^2);
betab3 = SQR/SQT
% ou beta = 1 - SQE/SQT'

% Sinal/Ruido
rmsb_3 = rms(yb_estmado_3);
SNRb3 = (rmsb_3/rms_ruido)^2

%% Gerar modelo b2
yb(1:2) = 0;
for k=3:length(u)
    yb(k) = [yb(k-1) yb(k-2) u(k-1) u(k-2)] * [1.9191   -0.9434   -0.0000    0.0015]';
    yb(k) = yb(k) + ruido(k);
end
yb_estmado_2 = yb';
eqmb2 = mean((y_real_b - yb_estmado_2).^2)
erro = y_real_b - yb_estmado_2;

% Coeficiente de correlação multipla 'beta'
SQE = eqmb2;
SQR = mean((yb_estmado_2).^2);
SQT = mean((yb_estmado_2 + erro).^2);
betab2 = SQR/SQT
% ou beta = 1 - SQE/SQT'

% Sinal/Ruido
rmsb_2 = rms(yb_estmado_2);
SNRb2 = (rmsb_2/rms_ruido)^2

%% Gerar modelo b1
yb(1) = 0;
for k=2:length(u)
    yb(k) = [yb(k-1) u(k-1)] * [0.9871    0.0011]';
    yb(k) = yb(k) + ruido(k);
end
yb_estmado_1 = yb';
erro = y_real_b - yb_estmado_1;
eqmb1 = mean((y_real_b - yb_estmado_1).^2)

% Coeficiente de correlação multipla 'beta'
SQE = eqmb1;
SQR = mean((yb_estmado_1).^2);
SQT = mean((yb_estmado_1 + erro).^2);
betab1 = SQR/SQT
% ou beta = 1 - SQE/SQT'

% Sinal/Ruido
rmsb_1 = rms(yb_estmado_1);
SNRb1 = (rmsb_1/rms_ruido)^2



