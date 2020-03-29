i = 50;
n = 100;
var0 = 10;
var1 = 10;
varv = 1;

H = [ones(i, 1), (1 : i).'];
a0 = var0 * randn(1, n);
a1 = var1 * randn(1, n);
a = [a0; a1];
v = varv * randn(i, n);
y = H * a + v;

A = [var0 0; 0 var1];
P = varv.^2 * A;
e0 = 1 : i;
e1 = 1 : i;
f0 = 1 : i;
f1 = 1 : i;
for j = 1 : i
    h = H(j, :);
    P = P - P * h.' * h * P / (1 + h * P * h.');
    Hj = H(1 : j, :);
    b = P * Hj.' * y(1 : j, :);
    e = mean((a - b).^2, 1);
    e0(j) = e(1);
    e1(j) = e(2);

    E = A - A * Hj.' * pinv(Hj * A * Hj.' + varv * eye(j)) * Hj * A;
    f0(j) = E(1, 1);
    f1(j) = E(2, 2);
end

hold on
plot(1 : i, e0);
plot(1 : i, e1);
% plot(1 : i, f0);
% plot(1 : i, f1);
legend('e0', 'e1', 'f0', 'f1');