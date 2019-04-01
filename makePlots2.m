function makePlots = makePlots2(data,len,sub)
% makePlot Builds a shaded error plot for each subject (1,2,3 for Dave,
% Joe, John, respectively). Len is the length of the slice you'd like. 
% Len = 125works well. 

locs = data.locs{1,1};
locs2 = data.locs{1,2};
locs3 = data.locs{1,3};
locs4 = data.locs{1,4};

calc_lace = zeros(length(data.locs{1,1}),(len*2)+1);
calc_lr = zeros(length(data.locs{1,2}),(len*2)+1);
calc_t = zeros(length(data.locs{1,3}),(len*2)+1);
calc_x = zeros(length(data.locs{1,4}),(len*2)+1);

mp1_lace = zeros(length(data.locs{1,1}),(len*2)+1);
mp1_lr = zeros(length(data.locs{1,2}),(len*2)+1);
mp1_t = zeros(length(data.locs{1,3}),(len*2)+1);
mp1_x = zeros(length(data.locs{1,4}),(len*2)+1);

mp5_lace = zeros(length(data.locs{1,1}),(len*2)+1);
mp5_lr = zeros(length(data.locs{1,2}),(len*2)+1);
mp5_t = zeros(length(data.locs{1,3}),(len*2)+1);
mp5_x = zeros(length(data.locs{1,4}),(len*2)+1);


for i = 2:(length(locs)-2)
   calc_lace(i,:) =  data.calc{1,sub}(floor(locs(i)-len):floor(locs(i)+len));
   calc_lr(i,:) =  data.calc{1,sub+1}(floor(locs2(i)-len):floor(locs2(i)+len));
   calc_t(i,:) =  data.calc{1,sub+2}(floor(locs3(i)-len):floor(locs3(i)+len));
   calc_x(i,:) =  data.calc{1,sub+3}(floor(locs4(i)-len):floor(locs4(i)+len));

   mp1_lace(i,:) =  data.mtp1{1,sub}(floor(locs(i)-len):floor(locs(i)+len));
   mp1_lr(i,:) =  data.mtp1{1,sub+1}(floor(locs2(i)-len):floor(locs2(i)+len));
   mp1_t(i,:) =  data.mtp1{1,sub+2}(floor(locs3(i)-len):floor(locs3(i)+len));
   mp1_x(i,:) =  data.mtp1{1,sub+3}(floor(locs4(i)-len):floor(locs4(i)+len));
   
   mp5_lace(i,:) =  data.mtp5{1,sub}(floor(locs(i)-len):floor(locs(i)+len));
   mp5_lr(i,:) = data.mtp5{1,sub+1}(floor(locs2(i)-len):floor(locs2(i)+len));
   mp5_t(i,:) =  data.mtp5{1,sub+2}(floor(locs3(i)-len):floor(locs3(i)+len));
   mp5_x(i,:) =  data.mtp5{1,sub+3}(floor(locs4(i)-len):floor(locs4(i)+len));
end

figure(1)
title('Calcaneous pressure')
shadedErrorBar(1:length(calc_lace), calc_lace, {@mean,@std}, 'lineprops','-r');
hold on
shadedErrorBar(1:length(calc_lr), calc_lr, {@mean,@std}, 'lineprops','-b');
shadedErrorBar(1:length(calc_t), calc_t, {@mean,@std}, 'lineprops','-g');
shadedErrorBar(1:length(calc_x), calc_x, {@mean,@std}, 'lineprops','-k');
xlabel('Time)','FontSize',14,'FontWeight','bold')
ylabel('Pressure (PSI)','FontSize',14,'FontWeight','bold')

figure(2)
title('Y force')
shadedErrorBar(1:length(mp1_lace), mp1_lace, {@mean,@std}, 'lineprops','-r');
hold on
shadedErrorBar(1:length(mp1_lr), mp1_lr, {@mean,@std}, 'lineprops','-b');
shadedErrorBar(1:length(mp1_t), mp1_t, {@mean,@std}, 'lineprops','-g');
shadedErrorBar(1:length(mp1_x), mp1_x, {@mean,@std}, 'lineprops','-k');
xlabel('Time (ms)','FontSize',14,'FontWeight','bold')
ylabel('Force (N)','FontSize',14,'FontWeight','bold')

figure(3)
title('X force')
shadedErrorBar(1:length(mp5_lace), mp5_lace, {@mean,@std}, 'lineprops','-r');
hold on
shadedErrorBar(1:length(mp5_lr), mp5_lr, {@mean,@std}, 'lineprops','-b');
shadedErrorBar(1:length(mp5_t), mp5_t, {@mean,@std}, 'lineprops','-g');
shadedErrorBar(1:length(mp5_x), mp5_x, {@mean,@std}, 'lineprops','-k');
xlabel('Time (ms)','FontSize',14,'FontWeight','bold')
ylabel('Force (N)','FontSize',14,'FontWeight','bold')

end

