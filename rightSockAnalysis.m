%%%%%% Sensor 0: Tibia, 1: MTP 5, 2: M Malleolus, 3: Navicular, 4: MTP 1 %%
%%%%%% Sensor 5: Calcaneus, 6: lateral malleolus, 7: cuboid %%%%%%%%%%%%%%
clear
addpath('C:\Users\Daniel.Feeney\Desktop\SensoriaCode')  
rightCal = importfile('C:\Users\Daniel.Feeney\Dropbox (Boa)\SensoriaFolder\rightNoLoad.csv')

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
plot(walkHigh.CS3(10:end))
title('Trial 1')
hold on
plot(walkHigh.CS7(10:end))
plot(walkHigh.CS1(10:end))
plot(walkHigh.CS4(10:end))
plot(walkHigh.CS5(10:end))
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

