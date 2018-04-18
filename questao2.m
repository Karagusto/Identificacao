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

plot(t, y, 'r')
legend('Yadist(k)')

%% Para Gb
y(1:2) = 0;
for k=3:length(u)
    y(k) = 1.881 * y(k-1) - 0.9048 * y(k-2) + 0.01207 * u(k-1) + 0.01167 * u(k-2);
end

t = 0:0.1:length(u)*0.1 - 0.1;

plot(t, y, 'r')
legend('Ybist(k)')

%% Mínimos Quadrados Ordem
ordem_u = 5;
ordem_y = 5;
soma_ordem = ordem_u + ordem_y;

phi = zeros(100,soma_ordem);
u = ones(100);
%% Mínimos Quadrados Implementação
for linha = 1:100
    for coluna = 1:ordem_y
        if(linha - coluna) < 1
            phi(linha, coluna) = 0;
        else
            phi(linha, coluna) = y(linha - coluna); % errado aqui
        end

    end
    
    for coluna = 1:ordem_u
        if(linha - coluna) < 1
            phi(linha, coluna + ordem_u) = 0;
        else
            phi(linha, coluna + ordem_u) = u(linha);   
        end
    end
    
end





