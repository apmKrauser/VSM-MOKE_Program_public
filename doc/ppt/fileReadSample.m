
% vsmdat fie read example

cfg = Config.instance();
% Create MeasurementFile object and ask for file name
MF = MeasurementFile('exist');
% load file contents
% Header structure contains measurement parameters
% Loops is an array of MagnetizationCurve
[Loops, Header] = MF.loadMagnetizationCurve();
if isempty(Loops)
    % quit script if there is no data
    return;
end

% search for parameters in Header
% numvalue contains a numeric value if parameter is numeric or nan if not
[strvalue, ~] = MF.getHeaderValue(Header, 'comment');
[~, numvalue] = MF.getHeaderValue(Header, 'Lockin_Sensitivity');

display(strvalue);
display(numvalue);

LoopNr = 1; % number of loop
X1  = Loops(LoopNr).field;          % Measured field [Oe]
X2  = Loops(LoopNr).field_setpoint; % field setpoint [Oe
Y1  = Loops(LoopNr).signal;         % pickup signal [V]
Y2  = Loops(LoopNr).signal_quadr;   % quadrature of pickup signal [V]
D_f = Loops(LoopNr).field_stdev;    % standard deviation of field
D_s = Loops(LoopNr).signal_stdev;   % standard deviation of signal
T1  = Loops(LoopNr).temperature;    % temperature (TempController)
Y3  = Loops(LoopNr).customval;      % custom value (CustomController)
Y4  = Loops(LoopNr).customval_adc;  % custom channel of ADC-Card
M  = Loops(LoopNr).datapoints;      % all data as Matrix

% average Loops
%AvgLoop = MagnetizationCurve();
%AvgLoop.averageLoop(Loops);
    
% show all data as table
sprintf('field_setpoint\tmeas_field\tsignal\tsignal_quadr\ttemperat')
%sprintf('%f\t%f\t%f\t%f\t%f\n', M)
%display(M)

plot(X1,Y1)

% save Measurement in new File
%MF2 = MeasurementFile('new');
%MF2.saveMagnetizationCurve(Loops, 0)

%delete(MF)
%clear MF 
%delete(Loops)
%clear Loops

