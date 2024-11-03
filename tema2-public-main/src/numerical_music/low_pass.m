function signal = low_pass(signal, fs, cutoff_freq)
  four_trans = fft(signal);
  freq = (0:numel(signal)-1) * fs / numel(signal);
  mask = zeros(numel(freq), 1);
  for i = [1:numel(freq)]
    if (freq(i) < cutoff_freq) mask(i) = 1;
    else mask(i) = 0; end
  end
  four_trans = four_trans .* mask;
  four_trans = ifft(four_trans);

  signal = four_trans / max(abs(four_trans));

endfunction

