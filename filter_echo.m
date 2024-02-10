[echo_sound, Fs] = audioread('Echo_Pentatonix_12_daysof_christmas_cut.wav');

t = (0: length(echo_sound) -1) / Fs;

% Set the delay, By listening I have assumed/estimated the echo delay to be
% around .5 seconds  you may vary in 0.1 seconds ... 
delay_time = 0.5;
D = delay_time * Fs;

% estimate the  alpha value :: what fraction of the value of the signal are
% you hearing 
alpha = 0.85;

b= [1,zeros(1,D),alpha];

filtered_sound = filter(1,b,echo_sound);

D2 = round(0.5*Fs);


sound(echo_sound,Fs);
pause(25);

sound(filtered_sound,Fs);
pause(25);

% save to output file
audiowrite('filter_Pentatonix_12_daysof_christmas_cut.wav',filtered_sound,Fs);

