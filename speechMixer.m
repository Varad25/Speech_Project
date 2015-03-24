speech_name = input('Enter the speech filename with single quotes: ');
noise_name = input('Enter the noise filename with single quotes: ');


[speech,Fs] = wavread(speech_name);
noise = wavread(noise_name);

if length(speech) >  length(noise)
    speech = speech(1:length(noise));
else
    noise = noise(1:length(speech));
end

speech = speech/max(abs(speech));
noise = noise/max(abs(noise));

SNR = input('enter the desired SNR in dB: ');

ratio = 10^(SNR/20);

noise = noise/ratio;

mixed_signal = speech+noise;

output_name = input('enter the output filename in single quotes: ');

wavwrite(mixed_signal,Fs,output_name);
