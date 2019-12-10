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
uigetfile('*.csv')
%% 
clear
addpath('C:\Users\Daniel.Feeney\Desktop\SensoriaCode')  
left_cal = importfile('C:\Users\Daniel.Feeney\Dropbox (Boa)\Trail Run Internal Pilot\TreadmillSensoria\BF\BF_Cal.csv');
levelVal = 0; %Change to 1 for level running
%% Downhill
if levelVal ~= 1
    LaceSwitch = importfile('C:\Users\Daniel.Feeney\Dropbox (Boa)\Trail Run Internal Pilot\TreadmillSensoria\BF_DH_Lace.csv');
    conA = convLeftVals(LaceSwitch, left_cal);
    
    LRSwitch = importfile('C:\Users\Daniel.Feeney\Dropbox (Boa)\Trail Run Internal Pilot\TreadmillSensoria\BF_DH_LR.csv');
    conB = convLeftVals(LRSwitch, left_cal);
    
    OverlapSwitch = importfile('C:\Users\Daniel.Feeney\Dropbox (Boa)\Trail Run Internal Pilot\TreadmillSensoria\BF_DH_Panels.csv');
    conC = convLeftVals(OverlapSwitch, left_cal);
    
    TriSwitch = importfile('C:\Users\Daniel.Feeney\Dropbox (Boa)\Trail Run Internal Pilot\TreadmillSensoria\BF_DH_Tri.csv');
    conD = convLeftVals(TriSwitch, left_cal);
    
    XSwitch = importfile('C:\Users\Daniel.Feeney\Dropbox (Boa)\Trail Run Internal Pilot\TreadmillSensoria\BF_DH_Y.csv');
    conE = convLeftVals(XSwitch, left_cal);
    
    
    %% Level running
else
    LaceSwitch = importfile('C:\Users\Daniel.Feeney\Dropbox (Boa)\Trail Run Internal Pilot\TreadmillSensoria\BF_level_Lace.csv');
    conA = convLeftVals(LaceSwitch, left_cal);
    
    LRSwitch = importfile('C:\Users\Daniel.Feeney\Dropbox (Boa)\Trail Run Internal Pilot\TreadmillSensoria\BF_level_LR.csv');
    conB = convLeftVals(LRSwitch, left_cal);
    
    OverlapSwitch = importfile('C:\Users\Daniel.Feeney\Dropbox (Boa)\Trail Run Internal Pilot\TreadmillSensoria\BF_level_Panels.csv');
    conC = convLeftVals(OverlapSwitch, left_cal);
    
    TriSwitch = importfile('C:\Users\Daniel.Feeney\Dropbox (Boa)\Trail Run Internal Pilot\TreadmillSensoria\BF_level_Tri.csv');
    conD = convLeftVals(TriSwitch, left_cal);
    
    XSwitch = importfile('C:\Users\Daniel.Feeney\Dropbox (Boa)\Trail Run Internal Pilot\TreadmillSensoria\BF_level_Y.csv');
    conE = convLeftVals(XSwitch, left_cal);
end
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
title('5th distal phalanx')
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
plot(conD.CS4(10:end))
plot(conE.CS4(10:end))
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
plot(conA.CS7(10:end))
title('Cuboid')
hold on
plot(conB.CS7(10:end))
plot(conC.CS7(10:end))
plot(conD.CS7(10:end))
plot(conE.CS7(10:end))
legend('Lace','LR','Overlapping','Tri','X')

%% Accelerometer data to delimit steps
%LRacc = sqrt(LRSwitch.Ax.^2 + LRSwitch.Ay.^2 + LRSwitch.Az.^2);
%plot(LRacc)

