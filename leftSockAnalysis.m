%%% Left sock analysis %%%

% Load some trials below
walk_dat = importfile('C:\Users\Daniel.Feeney\Desktop\SensoriaCode\reliability\leftWalkLow.csv');
walk_dat2 = importfile('C:\Users\Daniel.Feeney\Desktop\SensoriaCode\reliability\leftWalkMod.csv');
walk_dat3 = importfile('C:\Users\Daniel.Feeney\Desktop\SensoriaCode\reliability\leftWalkHigh.csv');

%%%% program to adjust sensors to correct scale. %%%%
left_cal = importfile('C:\Users\Daniel.Feeney\Dropbox (Boa)\SensoriaFolder\leftNoLoad.csv')

% hard code the baseline sensor data from Sensoria. This is column D
calFactor = (2.20462262/1000)/0.196349148; %Provided by Sensoria 
A0cal = 1.63*10^8; B0cal = 1.37; C0cal = -2.68*10^4; D0cal = 571;
A1cal = 8.16*10^11; B1cal = 2.9; C1cal = -1.41*10^3; D1cal = 1050;
A2cal = 3.00*10^13; B2cal = 3.48; C2cal = -4.02*10^3; D2cal = 689;
A3cal = 2.72*10^12; B3cal = 3.14; C3cal = -3.49*10^3; D3cal = 680;
A4cal = 1.02*10^11; B4cal = 2.52; C4cal = -6.95*10^3; D4cal = 703;
A5cal = 8.13*10^8; B5cal = 1.77; C5cal = -9.73*10^3; D5cal = 594;
A6cal = 3.23*10^13; B6cal = 3.56; C6cal = -5.42*10^3; D6cal = 554; 
A7cal = 6.81*10^10; B7cal = 2.5; C7cal = -6.97*10^3; D7cal = 632;

%%% New equations are PSI = A (x-(xo - xcal))^-B + C, where x0 is our
%%% manual calibration, xcal is sensoria's cal. A,B,C come from the
%%% calibration files and are listed above. These are automatically updated
%%% in the convLeftVals.m, which needs to live in the same folder as this. 

dat = convLeftVals(walk_dat, left_cal)


%%% Full sock %%%
figure(1)
plot(dat.CS0(10:end))
hold on
plot(walk_dat.CS1(10:end))
plot(walk_dat.CS2(10:end))
plot(walk_dat.CS3(10:end))
plot(walk_dat.CS4(10:end))
plot(walk_dat.CS5(10:end))
plot(walk_dat.CS6(10:end))
plot(walk_dat.CS7(10:end))

legend('Lateral 5th ray','5th MTP', '5th Distal Phalanx', '1st MTP','Navicular','Calcaneous','1st Distal Phalanx','Cuboid')

figure(2)
plot(walk_dat2.CS0(10:end))
hold on
plot(walk_dat2.CS1(10:end))
plot(walk_dat2.CS2(10:end))
plot(walk_dat2.CS3(10:end))
plot(walk_dat2.CS4(10:end))
plot(walk_dat2.CS5(10:end))
plot(walk_dat2.CS6(10:end))
plot(walk_dat2.CS7(10:end))

legend('Lateral 5th ray','5th MTP', '5th Distal Phalanx', '1st MTP','Navicular','Calcaneous','1st Distal Phalanx','Cuboid')

figure(3)
plot(walk_dat3.CS0(10:end))
hold on
plot(walk_dat3.CS1(10:end))
plot(walk_dat3.CS2(10:end))
plot(walk_dat3.CS3(10:end))
plot(walk_dat3.CS4(10:end))
plot(walk_dat3.CS5(10:end))
plot(walk_dat3.CS6(10:end))
plot(walk_dat3.CS7(10:end))

legend('Lateral 5th ray','5th MTP', '5th Distal Phalanx', '1st MTP','Navicular','Calcaneous','1st Distal Phalanx','Cuboid')
