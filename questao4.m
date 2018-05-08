%% Questão 4
% Criar modelos ARX e ARMAX dos conjuntos de dados 1 e 2 como entrada
%% Mínimos Quadrados Ordem
u1 = u_1';
y1 = y_1';
ordem_u = 4;
ordem_y = 4;
ordem_erro = 4;
soma_ordem = ordem_u + ordem_y + ordem_erro;

phi = zeros(500,soma_ordem);
phiARX = zeros(500,soma_ordem);
erro = zeros(500,1);

%% Dados 1 ARX
for linha = 1:500
    for coluna = 1:ordem_y
        if(linha - coluna) < 1
            phi(linha, coluna) = 0;
        else
            phi(linha, coluna) = y1(linha - coluna);
        end

    end
    
    for coluna = 1:ordem_u
        if(linha - coluna) < 1
            phi(linha, coluna + ordem_u) = 0;
        else
            phi(linha, coluna + ordem_u) = u1(linha - coluna);   
        end
    end
    
end

Y_real = y1';
phi_pseudoinversa = pinv(phi);
theta_estimado = phi_pseudoinversa*Y_real;
Y_estimado = phi*theta_estimado;

eqm = mean((Y_real - Y_estimado).^2);

%% Dados 1 ARMAX

for times = 1:30
    for linha = 1:500
        for coluna = 1:ordem_y
            if(linha - coluna) < 1
                phi(linha, coluna) = 0;
            else
                phi(linha, coluna) = y1(linha - coluna);
            end

        end
    
        for coluna = 1:ordem_u
            if(linha - coluna) < 1
                phi(linha, coluna + ordem_u) = 0;
            else
                phi(linha, coluna + ordem_u) = u1(linha - coluna);   
            end
        end
        
       for coluna = 1:ordem_u
            if(linha - coluna) < 1
                phi(linha, coluna + ordem_u + ordem_erro) = 0;
                
            else
                phi(linha, coluna + ordem_u + ordem_erro) = erro(linha - coluna);
                
            end
            
        end
        
        
    end
  
Y_real = y1';
phi_pseudoinversa = pinv(phi);
theta_estimado = phi_pseudoinversa*Y_real;

Y_estimado = phi*theta_estimado;



%erro
erro = Y_real - Y_estimado;
end
eqm = mean((Y_real - Y_estimado).^2);