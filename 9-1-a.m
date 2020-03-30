varv = 0.25;
a0 = 1 / sqrt(varv);
a1 = -0.1 / sqrt(varv);
a2 = -0.8 / sqrt(varv);
r = ator([a0 a1 a2], 1);
2 / (r(1) + r(2))

pm = @(a, b) [a + b, a - b];
pm(2 * (r(1) + r(2)), 2 * sqrt(r(1)^2 + r(2)^2 - r(1) * r(2))) ./ (3 * r(1) * r(2))
