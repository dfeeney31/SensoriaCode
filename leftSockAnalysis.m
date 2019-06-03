%%% Left sock analysis %%%
clear
% Load some trials below
walk_dat = importfile('C:\Users\Daniel.Feeney\Desktop\SensoriaCode\reliability\leftWalkLow.csv');
walk_dat2 = importfile('C:\Users\Daniel.Feeney\Desktop\SensoriaCode\reliability\leftWalkMod.csv');
walk_dat3 = importfile('C:\Users\Daniel.Feeney\Desktop\SensoriaCode\reliability\leftWalkHigh.csv');

%%%% program to adjust sensors to correct scale. %%%%
left_cal = importfile('C:\Users\Daniel.Feeney\Dropbox (Boa)\SensoriaFolder\leftNoLoad.csv');


%%% New equations are PSI = A (x-(xo - xcal))^-B + C, where x0 is our
%%% manual calibration, xcal is sensoria's cal. A,B,C come from the
%%% calibration files and are listed above. These are automatically updated
%%% in the convLeftVals.m, which needs to live in the same folder as this. 

walkLow = convLeftVals(walk_dat, left_cal);
walkMod = convLeftVals(walk_dat2, left_cal);
walkHigh = convLeftVals(walk_dat3, left_cal);

%%% Full sock %%%
figure(1)
plot(walkLow.CS0(10:end))
hold on
plot(walkLow.CS1(10:end))
plot(walkLow.CS2(10:end))
plot(walkLow.CS3(10:end))
plot(walkLow.CS4(10:end))
plot(walkLow.CS5(10:end))
plot(walkLow.CS6(10:end))
plot(walkLow.CS7(10:end))
title('Low')
legend('Lateral 5th ray','5th MTP', '5th Distal Phalanx', '1st MTP','Navicular','Calcaneous','1st Distal Phalanx','Cuboid')

figure(2)
plot(walkMod.CS0(10:end))
hold on
plot(walkMod.CS1(10:end))
plot(walkMod.CS2(10:end))
plot(walkMod.CS3(10:end))
plot(walkMod.CS4(10:end))
plot(walkMod.CS5(10:end))
plot(walkMod.CS6(10:end))
plot(walkMod.CS7(10:end))
title('Moderate')
legend('Lateral 5th ray','5th MTP', '5th Distal Phalanx', '1st MTP','Navicular','Calcaneous','1st Distal Phalanx','Cuboid')

figure(3)
plot(walkHigh.CS0(10:end))
hold on
plot(walkHigh.CS1(10:end))
plot(walkHigh.CS2(10:end))
plot(walkHigh.CS3(10:end))
plot(walkHigh.CS4(10:end))
plot(walkHigh.CS5(10:end))
plot(walkHigh.CS6(10:end))
plot(walkHigh.CS7(10:end))
title('High')
legend('Lateral 5th ray','5th MTP', '5th Distal Phalanx', '1st MTP','Navicular','Calcaneous','1st Distal Phalanx','Cuboid')
