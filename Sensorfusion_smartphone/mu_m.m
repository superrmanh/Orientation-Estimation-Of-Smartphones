function [x, P] = mu_m(x, P, mag, m0,Rm)

% Start By getting state and Quaternion
q = x(1:4);
% Create the following equation
y_measurement =  Qq(q)'*m0;

% Innovation 
v = mag- y_measurement;

% Compute the jacobian H
[Q0, Q1, Q2, Q3] = dQqdq(q);

H = zeros(3,4);
H(:,1) = Q0' * m0;
H(:,2) = Q1' * m0;
H(:,3) = Q2' * m0;
H(:,4) = Q3' * m0;

% Kalman Update
S = H*P*H' + Rm;
K = P*H' / S;
x = x+K*v;
P = P-K*S*K';

[x, P] = mu_normalizeQ(x, P);
end