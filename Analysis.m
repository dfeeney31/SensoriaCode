%%%%%% Sensor 0: Tibia, 1: MTP 5, 2: M Malleolus, 3: Navicular, 4: MTP 1 %%
%%%%%% Sensor 5: Calcaneus, 6: lateral malleolus, 7: cuboid %%%%%%%%%%%%%%
walk_dat = importfile('test1.csv');

%%% Full sock %%%
figure(1)
plot(walk_dat.S0(10:end))
hold on
plot(walk_dat.S1(10:end))
plot(walk_dat.S2(10:end))
plot(walk_dat.S3(10:end))
plot(walk_dat.S4(10:end))
plot(walk_dat.S5(10:end))
plot(walk_dat.S6(10:end))
plot(walk_dat.S7(10:end))

legend('Tibia','5th Met', 'M Malleolus', 'Navicular','1st Met','Calcneus','L. Malleolus','Cuboid')

%%% Only foot sensors %%%
figure(2)
plot(walk_dat.S3(10:end))
hold on
plot(walk_dat.S7(10:end))
plot(walk_dat.S1(10:end))
plot(walk_dat.S4(10:end))
plot(walk_dat.S5(10:end))

legend('Navicular','Cuboid', '5th Met', '1st Met','Calcaneus')

[pks_nav, locs_nav] = findpeaks(walk_dat.S3(10:end), 'MinPeakDistance',50);
[pks_cub, locs_cub] = findpeaks(walk_dat.S1(10:end), 'MinPeakDistance',50);
[pks_5mt, locs_5mt] = findpeaks(walk_dat.S1(10:end), 'MinPeakDistance',50);
[pks_1mt, locs_1mt] = findpeaks(walk_dat.S4(10:end), 'MinPeakDistance',50);
[pks_calc, locs_calc] = findpeaks(walk_dat.S5(10:end), 'MinPeakDistance',50);

avg_nav = mean(pks_nav); var_nav = std(pks_nav);

cv_heel = (std(walk_dat.S5(10:end)) / mean(walk_dat.S5(10:end))) * 100;

%%% IMU data %%%
figure(3)
plot(walk_dat.Ax)
hold on
plot(walk_dat.Ay)
plot(walk_dat.Az)
legend('Ax','Ay','Az')

resultantAcc = sqrt(walk_dat.Ax.^2 + walk_dat.Ay.^2 + walk_dat.Az.^2);
figure(4)
plot(resultantAcc)

win_len = 10;
sd = zeros(1,120);
counter = 1;
for i = 1:20:(length(resultantAcc) - win_len)
    tmp_var = resultantAcc(i:i+win_len);
    sd(counter) = std(tmp_var);
    counter = counter + 1;
    
end
plot(sd)


% figure(4)
% plot(walk_dat.Gx)
% hold on
% plot(walk_dat.Gy)
% plot(walk_dat.Gz)
% legend('Gx','Gy','Gz')
% 
% figure(5)
% plot(walk_dat.Mx)
% hold on
% plot(walk_dat.My)
% plot(walk_dat.Mz)
% legend('Mx','My','Mz')

