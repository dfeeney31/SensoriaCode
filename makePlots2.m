function makePlots = makePlots2(longdata,len)
% makePlot Builds an average plot for each subject 
locs = longdata.locs{1,1};
locs2 = longdata.locs{1,2};
locs3 = longdata.locs{1,3};
locs4 = longdata.locs{1,4};

calc_lr = zeros(length(longdata.locs{1,1}),(len*2)+1);
calc_lace = zeros(length(longdata.locs{1,2}),(len*2)+1);
calc_t = zeros(length(longdata.locs{1,3}),(len*2)+1);
calc_x = zeros(length(longdata.locs{1,4}),(len*2)+1);

mp1_lr = zeros(length(longdata.locs{1,1}),(len*2)+1);
mp1_lace = zeros(length(longdata.locs{1,2}),(len*2)+1);
mp1_t = zeros(length(longdata.locs{1,3}),(len*2)+1);
mp1_x = zeros(length(longdata.locs{1,4}),(len*2)+1);

mp5_lr = zeros(length(longdata.locs{1,1}),(len*2)+1);
mp5_lace = zeros(length(longdata.locs{1,2}),(len*2)+1);
mp5_t = zeros(length(longdata.locs{1,3}),(len*2)+1);
mp5_x = zeros(length(longdata.locs{1,4}),(len*2)+1);

cub_lr = zeros(length(longdata.locs{1,1}),(len*2)+1);
cub_lace = zeros(length(longdata.locs{1,2}),(len*2)+1);
cub_t = zeros(length(longdata.locs{1,3}),(len*2)+1);
cub_x = zeros(length(longdata.locs{1,4}),(len*2)+1);

nav_lr = zeros(length(longdata.locs{1,1}),(len*2)+1);
nav_lace = zeros(length(longdata.locs{1,2}),(len*2)+1);
nav_t = zeros(length(longdata.locs{1,3}),(len*2)+1);
nav_x = zeros(length(longdata.locs{1,4}),(len*2)+1);


for i = 2:(length(locs)-2)
   calc_lace(i,:) =  longdata.calc{1,1}(floor(locs(i)-len):floor(locs(i)+len));
   calc_lr(i,:) =  longdata.calc{1,2}(floor(locs2(i)-len):floor(locs2(i)+len));
   calc_t(i,:) =  longdata.calc{1,3}(floor(locs3(i)-len):floor(locs3(i)+len));
   calc_x(i,:) =  longdata.calc{1,4}(floor(locs4(i)-len):floor(locs4(i)+len));

   mp1_lace(i,:) =  longdata.mtp1{1,1}(floor(locs(i)-len):floor(locs(i)+len));
   mp1_lr(i,:) =  longdata.mtp1{1,2}(floor(locs2(i)-len):floor(locs2(i)+len));
   mp1_t(i,:) =  longdata.mtp1{1,3}(floor(locs3(i)-len):floor(locs3(i)+len));
   mp1_x(i,:) =  longdata.mtp1{1,4}(floor(locs4(i)-len):floor(locs4(i)+len));
   
   mp5_lace(i,:) =  longdata.mtp5{1,1}(floor(locs(i)-len):floor(locs(i)+len));
   mp5_lr(i,:) = longdata.mtp5{1,2}(floor(locs2(i)-len):floor(locs2(i)+len));
   mp5_t(i,:) =  longdata.mtp5{1,3}(floor(locs3(i)-len):floor(locs3(i)+len));
   mp5_x(i,:) =  longdata.mtp5{1,4}(floor(locs4(i)-len):floor(locs4(i)+len));
   
   cub_lace(i,:) =  longdata.cub{1,1}(floor(locs(i)-len):floor(locs(i)+len));
   cub_lr(i,:) = longdata.cub{1,2}(floor(locs2(i)-len):floor(locs2(i)+len));
   cub_t(i,:) =  longdata.cub{1,3}(floor(locs3(i)-len):floor(locs3(i)+len));
   cub_x(i,:) =  longdata.cub{1,4}(floor(locs4(i)-len):floor(locs4(i)+len));
   
   nav_lace(i,:) =  longdata.nav{1,1}(floor(locs(i)-len):floor(locs(i)+len));
   nav_lr(i,:) = longdata.nav{1,2}(floor(locs2(i)-len):floor(locs2(i)+len));
   nav_t(i,:) =  longdata.nav{1,3}(floor(locs3(i)-len):floor(locs3(i)+len));
   nav_x(i,:) =  longdata.nav{1,4}(floor(locs4(i)-len):floor(locs4(i)+len));
end

figure(1)
plot(mean(calc_lace,1), '-r');
title('Calcaneous pressure')
hold on
plot( mean(calc_lr,1), '-b');
plot(mean(calc_t,1), '-g');
plot( mean(calc_x,1), '-k');
xlabel('Time(1/50)s','FontSize',14,'FontWeight','bold')
ylabel('Pressure (PSI)','FontSize',14,'FontWeight','bold')
legend('LR','Lace','Tri','X')

figure(2)
plot(mean(mp1_lace,1),'-r');
title('1st Met Pressure')
hold on
plot( mean(mp1_lr,1), '-b');
plot(mean(mp1_t,1), '-g');
plot(mean(mp1_x,1), '-k');
xlabel('Time(1/50)s','FontSize',14,'FontWeight','bold')
ylabel('Force (N)','FontSize',14,'FontWeight','bold')
legend('LR','Lace','Tri','X')

figure(3)
plot(mean(mp5_lace,1), '-r');
title('5th Met pressure')
hold on
plot(mean(mp5_lr,1), '-b');
plot(mean(mp5_t,1), '-g');
plot(mean(mp5_x,1), '-k');
xlabel('Time(1/50)s','FontSize',14,'FontWeight','bold')
ylabel('Force (N)','FontSize',14,'FontWeight','bold')
legend('LR','Lace','Tri','X')

figure(4)
plot(mean(cub_lace,1), '-r');
title('Cuboid pressure')
hold on
plot(mean(cub_lr,1), '-b');
plot(mean(cub_t,1), '-g');
plot(mean(cub_x,1), '-k');
xlabel('Time(1/50)s','FontSize',14,'FontWeight','bold')
ylabel('Force (N)','FontSize',14,'FontWeight','bold')
legend('LR','Lace','Tri','X')

figure(5)
plot(mean(nav_lace,1), '-r');
title('Navicular pressure')
hold on
plot(mean(nav_lr,1), '-b');
plot(mean(nav_t,1), '-g');
plot(mean(nav_x,1), '-k');
xlabel('Time (1/50)s','FontSize',14,'FontWeight','bold')
ylabel('Force (N)','FontSize',14,'FontWeight','bold')
legend('LR','Lace','Tri','X')
end

