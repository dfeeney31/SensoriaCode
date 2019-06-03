%%%%%% Sensor 0: Tibia, 1: MTP 5, 2: M Malleolus, 3: Navicular, 4: MTP 1 %%
%%%%%% Sensor 5: Calcaneus, 6: lateral malleolus, 7: cuboid %%%%%%%%%%%%%%
clear
addpath('C:\Users\Daniel.Feeney\Desktop\SensoriaCode')  
rightCal = importfile('C:\Users\Daniel.Feeney\Dropbox (Boa)\SensoriaFolder\leftNoLoad.csv')

%walk_dat = importfile('C:\Users\Daniel.Feeney\Desktop\SensoriaCode\AdidasGolfDD\mattHammerSwing1.csv');
%swing2 = importfile('C:\Users\Daniel.Feeney\Desktop\SensoriaCode\AdidasGolfDD\mattHammerSwing2.csv');
%swing3 = importfile('C:\Users\Daniel.Feeney\Desktop\SensoriaCode\NBFiles\X.csv');

walk_dat = importfile('C:\Users\Daniel.Feeney\Desktop\SensoriaCode\reliability\rightWalkLow.csv');
walk_dat2 = importfile('C:\Users\Daniel.Feeney\Desktop\SensoriaCode\reliability\rightWalkMod.csv');
walk_dat3 = importfile('C:\Users\Daniel.Feeney\Desktop\SensoriaCode\reliability\rightWalkHigh.csv');

%%% convert values with function convRightVals
walkLow = convRightVals(walk_dat, rightCal);
walkMod = convRightVals(walk_dat2, rightCal);
walkHigh = convRightVals(walk_dat3, rightCal);

%%% Full sock %%%
figure(1)
plot(walkMod.CS0(10:end))
hold on
plot(walkMod.CS1(10:end))
plot(walkMod.CS2(10:end))
plot(walkMod.CS3(10:end))
plot(walkMod.CS4(10:end))
plot(walkMod.CS5(10:end))
plot(walkMod.CS6(10:end))
plot(walkMod.CS7(10:end))

legend('Tibia','5th Met', 'M Malleolus', 'Navicular','1st Met','Calcneus','L. Malleolus','Cuboid')

%%% Only foot sensors %%%
figure(2)
plot(walkMod.CS3(10:end))
title('Trial 1')
hold on
plot(walkMod.CS7(10:end))
plot(walkMod.CS1(10:end))
plot(walkMod.CS4(10:end))
plot(walkMod.CS5(10:end))
legend('Navicular','Cuboid', '5th Met', '1st Met','Calcaneus')

figure(3)
plot(walk_dat2.CS3(10:end))
title('Trial 2')
hold on
plot(walk_dat2.CS7(10:end))
plot(walk_dat2.CS1(10:end))
plot(walk_dat2.CS4(10:end))
plot(walk_dat2.CS5(10:end))
legend('Navicular','Cuboid', '5th Met', '1st Met','Calcaneus')

figure(4)
plot(walk_dat3.CS3(10:end))
title('Over Tight')
hold on
plot(walk_dat3.CS7(10:end))
plot(walk_dat3.CS1(10:end))
plot(walk_dat3.CS4(10:end))
plot(walk_dat3.CS5(10:end))
legend('Navicular','Cuboid', '5th Met', '1st Met','Calcaneus')

figure(5)
plot(walk_dat4.CS3(10:end))
title('Lace less')
hold on
plot(walk_dat4.CS7(10:end))
plot(walk_dat4.CS1(10:end) + 3)
plot(walk_dat4.CS4(10:end))
plot(walk_dat4.CS5(10:end) + 6)
ylim([0 30])
legend('Navicular','Cuboid', '5th Met', '1st Met','Calcaneus')

%%%%%%%%%%%%%%%%%%%%%
% If a sensor needs to be excluded
figure(4)
plot(walk_dat3.CS3(10:end))
title('BOA')
hold on
plot(walk_dat3.CS7(10:end))
plot(walk_dat3.CS4(10:end))
plot(walk_dat3.CS5(10:end) + 6)
ylim([0 30])
legend('Navicular','Cuboid', '1st Met','Calcaneus')

figure(5)
plot(walk_dat4.CS3(10:end))
title('Lace less')
hold on
plot(walk_dat4.CS7(10:end))
plot(walk_dat4.CS4(10:end))
plot(walk_dat4.CS5(10:end) + 6)
ylim([0 30])
legend('Navicular','Cuboid', '1st Met','Calcaneus')
%%%%%%%%%%%%%%%%%%%%%

[pks_nav, locs_nav] = findpeaks(walk_dat.CS3(10:end), 'MinPeakDistance',50);
[pks_cub, locs_cub] = findpeaks(walk_dat.CS1(10:end), 'MinPeakDistance',50);
[pks_5mt, locs_5mt] = findpeaks(walk_dat.CS1(10:end), 'MinPeakDistance',50);
[pks_1mt, locs_1mt] = findpeaks(walk_dat.CS4(10:end), 'MinPeakDistance',50);
[pks_calc, locs_calc] = findpeaks(walk_dat.CS5(10:end), 'MinPeakDistance',50);

avg_nav = mean(pks_nav); var_nav = std(pks_nav);
avg_cub = mean(pks_cub); var_cub = std(pks_cub);
avg_5mt = mean(pks_5mt); var_5mt = std(pks_5mt);
avg_1mt = mean(pks_1mt); var_1mt = std(pks_1mt);

cv_heel = (std(walk_dat.S5(10:end)) / mean(walk_dat.S5(10:end))) * 100;

output = [avg_nav, avg_cub, avg_5mt, avg_1mt, cv_heel];
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

%%%%%% Auto find strides. Still TODO %%%%%
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

