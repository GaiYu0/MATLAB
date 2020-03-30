% X_{i + 1} = F_i X_i + G_i U_i
% Y_i = H_i X_i + V_i

a1 = -0.1;
a2 = -0.09;
a3 = 0.648;
F = [a1 a2 a3; 1 0 0; 0 1 0];
G = [1; 0; 0];
H = G;
P =
gain(F, G, H, P, Q, R, S, n)
