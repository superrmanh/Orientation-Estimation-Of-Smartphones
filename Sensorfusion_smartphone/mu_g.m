function [x, P] = mu_g(x, P, yacc, Ra, g0)

% Start By getting state and Quaternion
q = x(1:4);

% Create the following equation
y_measurement =  Qq(q)'*g0;

% Calculating Innovatoin
v = yacc-y_measurement;

% Compute the jacobian H
[Q0, Q1, Q2, Q3] = dQqdq(q);

H = zeros(3,4);
H(:,1) = Q0' * g0;
H(:,2) = Q1' * g0;
H(:,3) = Q2' * g0;
H(:,4) = Q3' * g0;

% Kalman Update
S = H*P*H' + Ra;
K = P*H' / S;
x = x+K*v;
P = P-K*S*K';

[x, P] = mu_normalizeQ(x, P);
end