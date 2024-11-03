function recoms = recommendations(path, liked_theme, num_recoms, min_reviews, num_features)
    % Read the matrix from the .csv file
    mat = read_mat(path);
    
    % Preprocess the matrix by filtering based on minimum reviews
    reduced_mat = preprocess(mat, min_reviews);
    
    % Compute the reduced SVD of the matrix
    [U, S, V] = svds(reduced_mat, num_features);
    
    % Extract the column vector corresponding to the liked theme from V
    liked_theme_vector = V(liked_theme, :);
    
    % Calculate the cosine similarity of this vector with all vectors in V
    [m, n] = size(V);
    similarities = zeros(1, m);
    for i = 1:m
        similarities(i) = cosine_similarity(liked_theme_vector, V(i, :));
    end
    
    % Sort the similarities and get the indices of the top recommended themes
    [~, indices] = sort(similarities, 'descend');
    
    % Return the indices of the recommended themes, excluding the liked theme itself
    recoms = indices(indices ~= liked_theme)(1:num_recoms);
end
