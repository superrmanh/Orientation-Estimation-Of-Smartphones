function [x, P] = tu_qw(x, P, omega, T, Rw)
F = eye(4) + T/2 * Somega(omega);
G = T/2 * Sq(x(1:4));
x(1:4) = F * x(1:4);
P = F * P * F' + G * Rw * G';
[x, P] = mu_normalizeQ(x, P);
end