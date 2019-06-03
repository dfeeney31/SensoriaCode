function convValues = convRightVals(data,calibData)
%convLeftVals Convert the Sensoria values to the correct scale using a manual
%zero calibration. A,B,C,D all come from Sensoria calibration report.
%Manual calibration requires the subject wear the sock but put their foot
%in the air to create a new 0.


% Hard code the baseline sensor data from Sensoria. 
calFactor = (2.20462262/1000)/0.196349148;            %Provided by Sensoria 

A0cal = 963507116.5; B0cal = 1.668798707; C0cal = -15075.32484; D0cal = 758;
A1cal = 1.60*10^6; B1cal = 0.258; C1cal = -2.84*10^5; D1cal = 829;
A2cal = 8.23*10^9; B2cal = 1.92; C2cal = -1.91*10^4; D2cal = 866;
A3cal = 8.94*10^12; B3cal = 3.18; C3cal = -1.07*10^4; D3cal = 635;
A4cal = 1.83*10^6; B4cal = 0.489322; C4cal = -66431.4994; D4cal = 873;
A5cal = 4.25*10^11; B5cal = 2.57; C5cal = -1.26*10^4; D5cal = 850;
A6cal = 2.04*10^8; B6cal = 1.31; C6cal = -3.28*10^4; D6cal = 776; 
A7cal = 4.91*10^9; B7cal = 2.04; C7cal = -7.09*10^3; D7cal = 732;


convValues.CS0 = (A0cal * ((data.S0(2:end) - (mean(calibData.S0) - D0cal)).^-B0cal) + C0cal) * calFactor;
convValues.CS1 = (A1cal * ((data.S1(2:end) - (mean(calibData.S1) - D1cal)).^-B1cal) + C1cal) * calFactor;
convValues.CS2 = (A2cal * ((data.S2(2:end) - (mean(calibData.S2) - D2cal)).^-B2cal) + C2cal) * calFactor;
convValues.CS3 = (A3cal * ((data.S3(2:end) - (mean(calibData.S3) - D3cal)).^-B3cal) + C3cal) * calFactor;
convValues.CS4 = (A4cal * ((data.S4(2:end) - (mean(calibData.S4) - D4cal)).^-B4cal) + C4cal) * calFactor;
convValues.CS5 = (A5cal * ((data.S5(2:end) - (mean(calibData.S5) - D5cal)).^-B5cal) + C5cal) * calFactor;
convValues.CS6 = (A6cal * ((data.S6(2:end) - (mean(calibData.S6) - D6cal)).^-B6cal) + C6cal) * calFactor;
convValues.CS7 = (A7cal * ((data.S7(2:end) - (mean(calibData.S7) - D7cal)).^-B7cal) + C7cal) * calFactor;



end

