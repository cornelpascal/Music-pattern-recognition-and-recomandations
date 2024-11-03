function signal = apply_reverb(signal, impulse_response)
  mono = stereo_to_mono(impulse_response);
  convolution = fftconv(signal, mono);
  signal = convolution / max(abs(convolution));
endfunction

