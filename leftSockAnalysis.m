%%% Left sock analysis %%%

% NB AW below
walk_dat = importfile('C:\Users\Daniel.Feeney\Desktop\SensoriaCode\reliability\noTension.csv');
walk_dat2 = importfile('C:\Users\Daniel.Feeney\Desktop\SensoriaCode\reliability\medTension.csv');
walk_dat3 = importfile('C:\Users\Daniel.Feeney\Desktop\SensoriaCode\reliability\highTension.csv');

%%% Full sock %%%
figure(1)
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
