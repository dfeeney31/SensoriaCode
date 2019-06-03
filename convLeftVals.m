function convValues = convLeftVals(data,calibData)
%UNTITLED Convert the Sensoria values to the correct scale using a manual
%zero calibration. 


% Hard code the baseline sensor data from Sensoria. 
calFactor = (2.20462262/1000)/0.196349148;            %Provided by Sensoria 

A0cal = 1.63*10^8; B0cal = 1.37; C0cal = -2.68*10^4; D0cal = 571;
A1cal = 8.16*10^11; B1cal = 2.9; C1cal = -1.41*10^3; D1cal = 1050;
A2cal = 3.00*10^13; B2cal = 3.48; C2cal = -4.02*10^3; D2cal = 689;
A3cal = 2.72*10^12; B3cal = 3.14; C3cal = -3.49*10^3; D3cal = 680;
A4cal = 1.02*10^11; B4cal = 2.52; C4cal = -6.95*10^3; D4cal = 703;
A5cal = 8.13*10^8; B5cal = 1.77; C5cal = -9.73*10^3; D5cal = 594;
A6cal = 3.23*10^13; B6cal = 3.56; C6cal = -5.42*10^3; D6cal = 554; 
A7cal = 6.81*10^10; B7cal = 2.5; C7cal = -6.97*10^3; D7cal = 632;


convValues.CS0 = (A0cal * ((data.S0(2:end) - (mean(calibData.S0) - D0cal)).^-B0cal) + C0cal) * calFactor;
convValues.CS1 = (A1cal * ((data.S1(2:end) - (mean(calibData.S1) - D1cal)).^-B1cal) + C1cal) * calFactor;
convValues.CS2 = (A2cal * ((data.S2(2:end) - (mean(calibData.S2) - D2cal)).^-B2cal) + C2cal) * calFactor;
convValues.CS3 = (A3cal * ((data.S3(2:end) - (mean(calibData.S3) - D3cal)).^-B3cal) + C3cal) * calFactor;
convValues.CS4 = (A4cal * ((data.S4(2:end) - (mean(calibData.S4) - D4cal)).^-B4cal) + C4cal) * calFactor;
convValues.CS5 = (A5cal * ((data.S5(2:end) - (mean(calibData.S5) - D5cal)).^-B5cal) + C5cal) * calFactor;
convValues.CS6 = (A6cal * ((data.S6(2:end) - (mean(calibData.S6) - D6cal)).^-B6cal) + C6cal) * calFactor;
convValues.CS7 = (A7cal * ((data.S7(2:end) - (mean(calibData.S7) - D7cal)).^-B7cal) + C7cal) * calFactor;


end

