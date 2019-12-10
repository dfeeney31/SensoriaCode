%%%% 1500 V1 vs V2 testing %%%

clear
addpath('C:\Users\Daniel.Feeney\Desktop\SensoriaCode')  
%%%%% Instructions %%%%%
% Choose a subject below, and run code for them. Take the average peaks
% manually. This will move to automation once we have fully vetted the
% dynamic calibration (convLeftVals) works reliably. 

%% Calibration testing
left_cal = importfile('C:\Users\Daniel.Feeney\Dropbox (Boa)\SensoriaFolder\CalibrationTesting\KateCal.csv');

V1 = importfile('C:\Users\Daniel.Feeney\Dropbox (Boa)\SensoriaFolder\CalibrationTesting\KateTension.csv'); 
V1cal = convLeftVals(V1, left_cal);
V2 = importfile('C:\Users\Daniel.Feeney\Dropbox (Boa)\SensoriaFolder\CalibrationTesting\KateLoose.csv');
V2cal = convLeftVals(V2, left_cal);

%% Kate
left_cal = importfile('C:\Users\Daniel.Feeney\Dropbox (Boa)\SensoriaFolder\1500Testing\KateCal.csv');

V1 = importfile('C:\Users\Daniel.Feeney\Dropbox (Boa)\SensoriaFolder\1500Testing\KateOld.csv'); 
V1cal = convLeftVals(V1, left_cal);
V2 = importfile('C:\Users\Daniel.Feeney\Dropbox (Boa)\SensoriaFolder\1500Testing\KateNew.csv');
V2cal = convLeftVals(V2, left_cal2);

%% Dan
left_cal = importfile('C:\Users\Daniel.Feeney\Dropbox (Boa)\SensoriaFolder\1500Testing\DanCal.csv');

V1 = importfile('C:\Users\Daniel.Feeney\Dropbox (Boa)\SensoriaFolder\1500Testing\DanOld.csv'); 
V1cal = convLeftVals(V1, left_cal);
V2 = importfile('C:\Users\Daniel.Feeney\Dropbox (Boa)\SensoriaFolder\1500Testing\DanNew.csv');
V2cal = convLeftVals(V2, left_cal);

%% Clark
left_cal = importfile('C:\Users\Daniel.Feeney\Dropbox (Boa)\SensoriaFolder\1500Testing\ClarkCal.csv');

V1 = importfile('C:\Users\Daniel.Feeney\Dropbox (Boa)\SensoriaFolder\1500Testing\ClarkOld.csv');
V1cal = convLeftVals(V1, left_cal);
V2 = importfile('C:\Users\Daniel.Feeney\Dropbox (Boa)\SensoriaFolder\1500Testing\ClarkNew.csv');
V2cal = convLeftVals(V2, left_cal);

%% Variability in heel hold 
std(V1cal.CS5(50:end))
std(V2cal.CS5(50:end))


%% look at reliable sensors to delimit strides

% V1
[pks_5lat, locs_5late] = findpeaks(V1cal.CS0(10:end), 'MinPeakDistance',20);
[pks_5mtp, locs_cub] = findpeaks(V1cal.CS1(10:end), 'MinPeakDistance',20);
[pks_5toe, locs_5mt] = findpeaks(V1cal.CS2(10:end), 'MinPeakDistance',20);
[pks_1mtp, locs_1mt] = findpeaks(V1cal.CS3(10:end), 'MinPeakDistance',20);
[pks_nav, locs_nav] = findpeaks(V1cal.CS4(10:end), 'MinPeakDistance',20);
[pks_calc, locs_5mt] = findpeaks(V1cal.CS5(10:end), 'MinPeakDistance',20);
[pks_hallux, locs_1mt] = findpeaks(V1cal.CS6(10:end), 'MinPeakDistance',20);
[pks_cub, locs_calc] = findpeaks(V1cal.CS7(10:end), 'MinPeakDistance',20);

% V2
[pks_5lat2, locs_5late2] = findpeaks(V2cal.CS0(10:end), 'MinPeakDistance',20);
[pks_5mtp2, locs_cub2] = findpeaks(V2cal.CS1(10:end), 'MinPeakDistance',20);
[pks_5toe2, locs_5mt2] = findpeaks(V2cal.CS2(10:end), 'MinPeakDistance',20);
[pks_1mtp2, locs_1mt2] = findpeaks(V2cal.CS3(10:end), 'MinPeakDistance',20);
[pks_nav2, locs_nav2] = findpeaks(V2cal.CS4(10:end), 'MinPeakDistance',20);
[pks_calc2, locs_5mt2] = findpeaks(V2cal.CS5(10:end), 'MinPeakDistance',20);
[pks_hallux2, locs_1mt2] = findpeaks(V2cal.CS6(10:end), 'MinPeakDistance',20);
[pks_cub2, locs_calc2] = findpeaks(V2cal.CS7(10:end), 'MinPeakDistance',20);


%% Delimit strides to plot mean
len = 15;
for i = 2:10
    try
        calc_v1(i,:) = V1cal.CS5(floor(locs_calc(i)-len):floor(locs_calc(i)+len));
        calc_v2(i,:) = V2cal.CS5(floor(locs_calc2(i)-len):floor(locs_calc2(i)+len));
        
        nav_v1(i,:) = V1cal.CS4(floor(locs_nav(i)-len):floor(locs_nav(i)+len));
        nav_v2(i,:) = V2cal.CS4(floor(locs_nav2(i)-len):floor(locs_nav2(i)+len));
        
        mtp1_v1(i,:) = V1cal.CS3(floor(locs_nav(i)-len):floor(locs_nav(i)+len));
        mtp1_v2(i,:) = V2cal.CS3(floor(locs_nav2(i)-len):floor(locs_nav2(i)+len));
        
        mtp5_v1(i,:) = V1cal.CS1(floor(locs_nav(i)-len):floor(locs_nav(i)+len));
        mtp5_v2(i,:) = V2cal.CS1(floor(locs_nav2(i)-len):floor(locs_nav2(i)+len));
        
        toe5_v1(i,:) = V1cal.CS2(floor(locs_nav(i)-len):floor(locs_nav(i)+len));
        toe5_v2(i,:) = V2cal.CS2(floor(locs_nav2(i)-len):floor(locs_nav2(i)+len));
        
        toe1_v1(i,:) = V1cal.CS6(floor(locs_nav(i)-len):floor(locs_nav(i)+len));
        toe1_v2(i,:) = V2cal.CS6(floor(locs_nav2(i)-len):floor(locs_nav2(i)+len));
        
        
        except
        pass
    end
end

%% Plotting ensemble average data. 
plot(mean(calc_v1,1))
hold on
plot(mean(calc_v2,1))
xlabel('Time(1/33)s','FontSize',14,'FontWeight','bold')
ylabel('Pressure (PSI)','FontSize',14,'FontWeight','bold')
title('Heel Pressure')
legend('V1','V2')

plot(mean(nav_v1,1))
hold on
plot(mean(nav_v2,1))
xlabel('Time(1/33)s','FontSize',14,'FontWeight','bold')
ylabel('Pressure (PSI)','FontSize',14,'FontWeight','bold')
title('Navicular Pressure')
legend('V1','V2')

plot(mean(mtp1_v1,1))
hold on
plot(mean(mtp1_v2,1))
xlabel('Time(1/33)s','FontSize',14,'FontWeight','bold')
ylabel('Pressure (PSI)','FontSize',14,'FontWeight','bold')
title('MTP1 Pressure')
legend('V1','V2')

plot(mean(mtp5_v1,1))
hold on
plot(mean(mtp5_v2,1))
xlabel('Time(1/33)s','FontSize',14,'FontWeight','bold')
ylabel('Pressure (PSI)','FontSize',14,'FontWeight','bold')
title('MTP5 Pressure')
legend('V1','V2')

plot(mean(toe5_v1,1) + 20)
hold on
plot(mean(toe5_v2,1) + 20)
xlabel('Time(1/33)s','FontSize',14,'FontWeight','bold')
ylabel('Pressure (PSI)','FontSize',14,'FontWeight','bold')
title('5th Toe Pressure')
legend('V1','V2')


plot(mean(toe1_v1,1) + 20)
hold on
plot(mean(toe1_v2,1) + 20)
xlabel('Time(1/33)s','FontSize',14,'FontWeight','bold')
ylabel('Pressure (PSI)','FontSize',14,'FontWeight','bold')
title('1st Toe Pressure')
legend('V1','V2')

%
%% Plotting all time series data. 
figure(4)
plot(V1cal.CS0(10:end))
title('Lateral 5th ray')
hold on
plot(V2cal.CS0(10:end))
legend('V1','V2')
xlim([0 500])

figure(5)
plot(V1cal.CS1(10:end))
title('5th MTP')
hold on
plot(V2cal.CS1(10:end))
legend('V1','V2')
xlim([0 500])

figure(6)
plot(V1cal.CS2(10:end))
title('5th distal phalanx')
hold on
plot(V2cal.CS2(10:end))
legend('V1','V2')
xlim([0 500])

figure(7)
plot(V1cal.CS3(10:end))
title('1st MTP')
hold on
plot(V2cal.CS3(10:end))
legend('V1','V2')
xlim([0 500])

figure(8)
plot(V1cal.CS4(10:end))
title('Navicular')
hold on
plot(V2cal.CS4(10:end))
legend('V1','V2')
xlim([0 500])

figure(9)
plot(V1cal.CS5(10:end))
title('Calcaneous')
hold on
plot(V2cal.CS5(10:end))
legend('V1','V2')
xlim([0 500])

figure(10)
plot(V1cal.CS6(10:end))
title('1st Distal Phalanx')
hold on
plot(V2cal.CS6(10:end))
legend('V1','V2')
xlim([0 500])

figure(11)
plot(V1cal.CS7(10:end))
title('Cuboid')
hold on
plot(V2cal.CS7(10:end))
legend('V1','V2')
xlim([0 500])