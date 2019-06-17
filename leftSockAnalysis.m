%%% Left sock analysis %%%

%% How to use:
% The importfile.m functions should import the csv files from Sensoria.
% Best practice is to have these uploaded to dropbox before closing the
% app. Record the order of trials in a lab notebook. convRightvals and
% convLeftVals are two functions that take a zero calibration recording
% (i.e. sock on foot, foot held in the air) to make sure the sensors can be
% zero'd on our backend. Important: this is a nonlinear zero'ing function
% that is described in those functions and cannot just be subtracted to the
% recorded values. 

%% 
clear
% Load some trials below
walk_dat = importfile('C:\Users\Daniel.Feeney\Desktop\SensoriaCode\reliability\leftWalkLow.csv');
walk_dat2 = importfile('C:\Users\Daniel.Feeney\Desktop\SensoriaCode\reliability\leftWalkMod.csv');
walk_dat3 = importfile('C:\Users\Daniel.Feeney\Desktop\SensoriaCode\reliability\leftWalkHigh.csv');

%%%% program to adjust sensors to correct scale. %%%%
left_cal = importfile('C:\Users\Daniel.Feeney\Dropbox (Boa)\SensoriaFolder\CalibrationTesting\leftNoLoad.csv');

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
