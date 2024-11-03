function x = oscillator(freq, fs, dur, A, D, S, R)
  t = 0:1/fs:dur-(1/fs);
  x = sin(2*pi*freq*t);
  attack_samples = floor(A * fs);
  decay_samples = floor(D * fs);
  release_samples = floor(R * fs);
  all_samples = floor(fs * (A + D + S + R));
  sustain_samples = all_samples - attack_samples - decay_samples - release_samples;
  attack_envelope = linspace(0, 1, attack_samples);
  decay_envelope = linspace(1, S, decay_samples);
  sustain_envelope = linspace(S, S, sustain_samples);
  release_envelope = linspace(S, 0, release_samples);
  fin_envelope = [attack_envelope decay_envelope sustain_envelope release_envelope];
  x(1:length(fin_envelope)) = x(1:length(fin_envelope)) .* fin_envelope;
  x(length(fin_envelope)+1:end) = 0;
  x = x';
endfunction

