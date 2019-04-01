%%%%%% Sensor 0: Tibia, 1: MTP 5, 2: M Malleolus, 3: Navicular, 4: MTP 1 %%
%%%%%% Sensor 5: Calcaneus, 6: lateral malleolus, 7: cuboid %%%%%%%%%%%%%%
%walk_dat = importfile('C:\Users\Daniel.Feeney\Desktop\SensoriaCode\SauconyPilot\df_x_in.CSsv');
clear
cd 'C:\Users\Daniel.Feeney\Desktop\SensoriaCode\SauconyPilot\'
files = dir('*.csv');
longdata(1,1) = struct();
counter = 1;

for file = files'
    walk_dat = importfile(file.name);
    
    clear pks_nav locs_nav pks_cub locs_cub pks_5mt locs_5mt pks_1mt locs_1mt pks_calc locs_calc

    [pks_nav, locs_nav] = findpeaks(walk_dat.CS3(10:end), 'MinPeakDistance',10, 'MinPeakHeight',4.2);
    [pks_cub, locs_cub] = findpeaks(walk_dat.CS1(10:end), 'MinPeakDistance',10, 'MinPeakHeight',5.1);
    [pks_5mt, locs_5mt] = findpeaks(walk_dat.CS1(10:end), 'MinPeakDistance',10, 'MinPeakHeight',5.5);
    [pks_1mt, locs_1mt] = findpeaks(walk_dat.CS4(10:end), 'MinPeakDistance',10, 'MinPeakHeight',2);
    [pks_calc, locs_calc] = findpeaks(walk_dat.CS5(10:end), 'MinPeakDistance',10, 'MinPeakheight',12);
    
    % Outlier detection %
    pks_1mt = pks_1mt(pks_1mt > (0.4 * mean(pks_1mt)));
    pks_5mt = pks_5mt(pks_5mt > (0.4 * mean(pks_5mt)));
    pks_calc = pks_calc(pks_calc > (0.4 * mean(pks_calc)));
    pks_1mt = pks_1mt(pks_1mt > (0.4 * mean(pks_1mt)));
    
    %%%%% Calculate the averages, etc. %%%
    longdata(1).avg_nav{counter} = mean(pks_nav);
    longdata(1).avg_cub{counter} = mean(pks_cub);
    longdata(1).avg_5mt{counter} = mean(pks_5mt); 
    longdata(1).avg_1mt{counter} = mean(pks_1mt); 
    longdata(1).avg_heel{counter} = mean(pks_calc);
    
    longdata(1).cvHeel{counter} = (std(walk_dat.CS5(10:end)) / mean(walk_dat.CS5(10:end))) * 100;
    
    %%% Save TS data %%%
    longdata(1).locs{counter} = locs_calc;
    longdata(1).calc{counter} = walk_dat.CS5;
    longdata(1).mtp1{counter} = walk_dat.CS4;
    longdata(1).mtp5{counter} = walk_dat.CS1;
    longdata(1).nav{counter} = walk_dat.CS3;
    longdata(1).cub{counter} = walk_dat.CS7;

    counter = counter + 1;
end