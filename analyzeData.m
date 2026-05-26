%task 2
% Remove NaN measurements
acc = meas.acc(:, ~any(isnan(meas.acc),1));
gyr = meas.gyr(:, ~any(isnan(meas.gyr),1));
mag = meas.mag(:, ~any(isnan(meas.mag),1));

% Accelerometer analysis


% Mean and covariance
mean_acc = mean(acc,2)
Ra = cov(acc')

% Plot over time
figure;
plot(meas.t, meas.acc)
legend('ax','ay','az')
xlabel('Time [s]')
ylabel('Acceleration [m/s^2]')
title('Accelerometer measurements')

% Histogram
figure;

subplot(3,1,1)
histogram(acc(1,:),100)
title('Accelerometer X')

subplot(3,1,2)
histogram(acc(2,:),100)
title('Accelerometer Y')

subplot(3,1,3)
histogram(acc(3,:),100)
title('Accelerometer Z')

% Gyroscope analysis

% Mean and covariance
mean_gyr = mean(gyr,2)
Rw = cov(gyr')

% Plot over time
figure;
plot(meas.t, meas.gyr)
legend('gx','gy','gz')
xlabel('Time [s]')
ylabel('Angular velocity [rad/s]')
title('Gyroscope measurements')

% Histogram
figure;

subplot(3,1,1)
histogram(gyr(1,:),100)
title('Gyroscope X')

subplot(3,1,2)
histogram(gyr(2,:),100)
title('Gyroscope Y')

subplot(3,1,3)
histogram(gyr(3,:),100)
title('Gyroscope Z')

% Magnetometer analysis

% Mean and covariance
mean_mag = mean(mag,2)
Rm = cov(mag')

% Plot over time
figure;
plot(meas.t, meas.mag)
legend('mx','my','mz')
xlabel('Time [s]')
ylabel('Magnetic field')
title('Magnetometer measurements')

% Histogram
figure;

subplot(3,1,1)
histogram(mag(1,:),100)
title('Magnetometer X')

subplot(3,1,2)
histogram(mag(2,:),100)
title('Magnetometer Y')

subplot(3,1,3)
histogram(mag(3,:),100)
title('Magnetometer Z')