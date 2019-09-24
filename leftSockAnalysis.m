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
addpath('C:\Users\Daniel.Feeney\Desktop\SensoriaCode')  

% % Load some trials below

% %%%% program to adjust sensors to correct scale. %%%%
left_cal = importfile('C:\Users\Daniel.Feeney\Dropbox (Boa)\SensoriaFolder\Sept19 Testing\LeftCal.csv');
LaceSwitch = importfile('C:\Users\Daniel.Feeney\Dropbox (Boa)\SensoriaFolder\Sept19 Testing\LaceDown.csv');
conA = convLeftVals(LaceSwitch, left_cal);

LRSwitch = importfile('C:\Users\Daniel.Feeney\Dropbox (Boa)\SensoriaFolder\Sept19 Testing\LRDown.csv');
conB = convLeftVals(LRSwitch, left_cal);

OverlapSwitch = importfile('C:\Users\Daniel.Feeney\Dropbox (Boa)\SensoriaFolder\Sept19 Testing\OverlappingDown.csv');
conC = convLeftVals(OverlapSwitch, left_cal);

TriSwitch = importfile('C:\Users\Daniel.Feeney\Dropbox (Boa)\SensoriaFolder\Sept19 Testing\TriDown.csv');
conD = convLeftVals(TriSwitch, left_cal);

XSwitch = importfile('C:\Users\Daniel.Feeney\Dropbox (Boa)\SensoriaFolder\Sept19 Testing\XDown.csv');
conE = convLeftVals(XSwitch, left_cal);


%%% Full sock %%%
% figure(1)
% plot(conA.CS0(10:end))
% hold on
% plot(conA.CS1(10:end))
% plot(conA.CS2(10:end))
% plot(conA.CS3(10:end))
% plot(conA.CS4(10:end))
% plot(conA.CS5(10:end))
% plot(conA.CS6(10:end))
% plot(LaceSwitch.CS7(10:end))
% title('Laced Switchback Downhill')
% legend('Lateral 5th ray','5th MTP', '5th Distal Phalanx', '1st MTP','Navicular','Calcaneous','1st Distal Phalanx','Cuboid')
% 
% figure(2)
% plot(conB.CS0(10:end))
% hold on
% plot(conB.CS1(10:end))
% plot(conB.CS2(10:end))
% plot(conB.CS3(10:end))
% plot(conB.CS4(10:end))
% plot(conB.CS5(10:end))
% plot(conB.CS6(10:end))
% plot(LRSwitch.CS7(10:end))
% xlim([0 300])
% title('LR Downhill')
% legend('Lateral 5th ray','5th MTP', '5th Distal Phalanx', '1st MTP','Navicular','Calcaneous','1st Distal Phalanx','Cuboid')

% figure(3)
% plot(conC.CS0(10:end))
% hold on
% plot(conC.CS1(10:end))
% plot(conC.CS2(10:end))
% plot(conC.CS3(10:end))
% plot(conC.CS4(10:end))
% plot(conC.CS5(10:end))
% plot(conC.CS6(10:end))
% plot(OverlapSwitch.CS7(10:end))
% title('Overlapping Panels Downhill')
% legend('Lateral 5th ray','5th MTP', '5th Distal Phalanx', '1st MTP','Navicular','Calcaneous','1st Distal Phalanx','Cuboid')

%% Broken down by sensor location 
figure(4)
plot(conA.CS0(10:end))
title('Lateral 5th ray')
hold on
plot(conB.CS0(10:end))
plot(conC.CS0(10:end))
plot(conD.CS0(10:end))
plot(conE.CS0(10:end))
legend('Lace','LR','Overlapping','Tri','X')

figure(5)
plot(conA.CS1(10:end))
title('5th MTP')
hold on
plot(conB.CS1(10:end))
plot(conC.CS1(10:end))
plot(conD.CS1(10:end))
plot(conE.CS1(10:end))
legend('Lace','LR','Overlapping','Tri','X')

figure(6)
plot(conA.CS2(10:end))
title('Lateral 5th Ray')
hold on
plot(conB.CS2(10:end))
plot(conC.CS2(10:end))
plot(conD.CS2(10:end))
plot(conE.CS2(10:end))
legend('Lace','LR','Overlapping','Tri','X')

figure(7)
plot(conA.CS3(10:end))
title('1st MTP')
hold on
plot(conB.CS3(10:end))
plot(conC.CS3(10:end))
plot(conD.CS3(10:end))
plot(conE.CS3(10:end))
legend('Lace','LR','Overlapping','Tri','X')

figure(8)
plot(conA.CS4(10:end))
title('Navicular')
hold on
plot(conB.CS4(10:end))
plot(conC.CS4(10:end))
plot(conD.CS5(10:end))
plot(conE.CS5(10:end))
legend('Lace','LR','Overlapping','Tri','X')

figure(9)
plot(conA.CS5(10:end))
title('Calcaneous')
hold on
plot(conB.CS5(10:end))
plot(conC.CS5(10:end))
plot(conD.CS5(10:end))
plot(conE.CS5(10:end))
legend('Lace','LR','Overlapping','Tri','X')

figure(10)
plot(conA.CS6(10:end))
title('1st Distal Phalanx')
hold on
plot(conB.CS6(10:end))
plot(conC.CS6(10:end))
plot(conD.CS6(10:end))
plot(conE.CS6(10:end))
legend('Lace','LR','Overlapping','Tri','X')

figure(11)
plot(LaceSwitch.CS7(10:end))
title('Cuboid')
hold on
plot(LRSwitch.CS7(10:end))
plot(OverlapSwitch.CS7(10:end))
plot(TriSwitch.CS7(10:end))
plot(XSwitch.CS7(10:end))
legend('Lace','LR','Overlapping','Tri','X')