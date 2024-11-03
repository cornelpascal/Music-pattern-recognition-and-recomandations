function reduced_mat = preprocess(mat, min_reviews)
  keep_rows = arrayfun(@(i) sum(mat(i, :) != 0) >= min_reviews, 1:size(mat,1));
  reduced_mat = mat(keep_rows, :);
end
