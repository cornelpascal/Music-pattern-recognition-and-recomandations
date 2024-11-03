function mat = read_mat(path)
  data = csvread(path, 1, 1);
  mat = data;
end
