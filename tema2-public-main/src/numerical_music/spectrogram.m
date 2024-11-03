function [S f t] = spectrogram(signal, fs, window_size)
	windows = floor(length(signal) / window_size);

  for i = [1:windows]
    hanning_signal = hanning(window_size);
    curent_window = signal((i-1) * window_size + 1 : i * window_size);
    curent_window = curent_window .* hanning_signal;
    fourrier_trans = fft(curent_window, window_size * 2);
    fourrier_trans = fourrier_trans(1:window_size);
    S(:, i) = abs(fourrier_trans);
  end
  f = 0:fs/2/window_size:fs/2 - fs/2/window_size;
  f = f';
  t = 0:window_size/fs:windows*window_size/fs - window_size/fs;
  t = t';
endfunction

