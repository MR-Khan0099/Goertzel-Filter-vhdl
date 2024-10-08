% example code
clc
clear
close all


Fs = 4e6; %sampling freq 4MHz
N = 135; %no of samples


% Sine Waves with 150 kHz, 149 kHz, 151 kHz, 5 kHz, 200 kHz
%  Square Waves with 150 kHz, 16 kHz, 10 kHz, 200 kHz
%  Triangle wave with 150 kHz, 149 kHz, 151 kHz, 5 kHz, 200 kHz
%  For all of the above alter phase angles: 0°, 30°, 45°, 90°, 120°
% frequencies = 

%rectangular waves :Square Waves with 150 kHz, 16 kHz, 10 kHz, 200 kHz
rect_150K_wave = square(2*pi*150e3*(0:N-1)/Fs);
rect_16K_wave = square(2*pi*16e3*(0:N-1)/Fs);
rect_10K_wave = square(2*pi*10e3*(0:N-1)/Fs);
%rect_5K_wave = square(2*pi*5e3*(0:N-1)/Fs);
rect_200K_wave = square(2*pi*200e3*(0:N-1)/Fs);


%Triangle wave with 150 kHz, 149 kHz, 151 kHz, 5 kHz, 200 kHz
% rectangular waves
tri_150k_wave = sawtooth(2*pi*150e3*(0:N-1)/Fs);
tri_149k_wave = sawtooth(2*pi*149e3*(0:N-1)/Fs);
tri_151k_wave = sawtooth(2*pi*15e3*(0:N-1)/Fs);
tri_5k_wave = sawtooth(2*pi*5e3*(0:N-1)/Fs);
tri_200k_wave = sawtooth(2*pi*200e3*(0:N-1)/Fs);

% Sine Waves with 150 kHz, 149 kHz, 151 kHz, 5 kHz, 200 kHz
% sine waves
sin_150k_wave = sin(2*pi*150e3*(0:N-1)/Fs);
sin_149k_wave = sin(2*pi*149e3*(0:N-1)/Fs);
sin_151k_wave = sin(2*pi*151e3*(0:N-1)/Fs);
sin_5k_wave = sin(2*pi*5e3*(0:N-1)/Fs);
sin_200k_wave = sin(2*pi*200e3*(0:N-1)/Fs);


% lo = sin(2*pi*697*(0:N-1)/Fs);
mid = sin(2*pi*941*(0:N-1)/Fs);
hi = sin(2*pi*1209*(0:N-1)/Fs);
% data = rect_wave + mid + hi;

% offset of 12-bit
offset = 2^11;

rect_waves = rect_150K_wave + rect_16K_wave + rect_10K_wave + rect_200K_wave + offset;
sin_waves = sin_150k_wave + sin_149k_wave + sin_151k_wave + sin_5k_wave + sin_200k_wave + offset;
tri_waves = tri_150k_wave + tri_149k_wave + tri_151k_wave + tri_5k_wave + tri_200k_wave + offset;


% plot(mid)

f = [150e3];
freq_indices = round(f/Fs*N) + 1;   
dft_data = goertzel(sin_waves,freq_indices);

stem(f,abs(dft_data))

ax = gca;
ax.XTick = f;
xlabel('Frequency (Hz)')
ylabel('DFT Magnitude')

figure

plot(sin_waves);
title('all waves');

figure

plot(sin_150k_wave+offset);
title('sin 150k wave');