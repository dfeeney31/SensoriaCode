%%%%%% Sensor 0: Tibia, 1: MTP 5, 2: M Malleolus, 3: Navicular, 4: MTP 1 %%
%%%%%% Sensor 5: Calcaneus, 6: lateral malleolus, 7: cuboid %%%%%%%%%%%%%%
%walk_dat = importfile('C:\Users\Daniel.Feeney\Desktop\SensoriaCode\SauconyPilot\df_x_in.CSsv');
cd 'C:\Users\Daniel.Feeney\Desktop\SensoriaCode\SauconyPilot\'
files = dir('*.csv');
longdata(1,3) = struct();
counter = 1;

for file = files'
    
    walk_dat = importfile(file.name);
    % Do some stuff
    clear pks_nav locs_nav pks_cub locs_cub pks_5mt locs_5mt pks_1mt locs_1mt pks_calc locs_calc

    [pks_nav, locs_nav] = findpeaks(walk_dat.CS3(10:end), 'MinPeakDistance',10, 'MinPeakHeight',6);
    [pks_cub, locs_cub] = findpeaks(walk_dat.CS1(10:end), 'MinPeakDistance',10, 'MinPeakHeight',6);
    [pks_5mt, locs_5mt] = findpeaks(walk_dat.CS1(10:end), 'MinPeakDistance',10, 'MinPeakHeight',6);
    [pks_1mt, locs_1mt] = findpeaks(walk_dat.CS4(10:end), 'MinPeakDistance',10, 'MinPeakHeight',2);
    [pks_calc, locs_calc] = findpeaks(walk_dat.CS5(10:end), 'MinPeakDistance',10, 'MinPeakheight',12);

    %%%%% Calculate the averages, etc. %%%
    longdata(1).avg_nav{counter} = mean(pks_nav);
    longdata(1).avg_cub{counter} = mean(pks_cub);
    longdata(1).avg_5mt{counter} = mean(pks_5mt); 
    longdata(1).avg_1mt{counter} = mean(pks_1mt); 
    
    longdata(1).cvHeel{counter} = (std(walk_dat.CS5(10:end)) / mean(walk_dat.CS5(10:end))) * 100;
    
    %%% Save TS data %%%
    
    longdata(1).calc{counter} = walk_dat.CS5
    longdata(1).mtp1{counter} = walk_dat.CS4
    longdata(1).mtp5{counter} = walk_dat.CS1
    longdata(1).nav{counter} = walk_dat.CS3
    longdata(1).cub{counter} = walk_dat.CS7

    counter = counter + 1;
end