function [x, y] = parse_data(filename)
    % file input format:
    % n
    % x0 x1 ... xn
    % y0 y1 ... yn

    % TODO 1: Open the file for reading
    fid = fopen(filename, 'r');
    n = fscanf(fid, '%d', 1);
    % TODO 2: Read n, x, y from the file
    x = fscanf(fid, '%d', n+1);
    y = fscanf(fid, '%d', n+1);
    % TODO 3: Close the file
    fclose(fid);
    x = x(:);
    y = y(:);
end