function similarity = cosine_similarity(A, B)
  An = A / norm(A);
  Bn = B / norm(B);
  similarity = dot(An, Bn);
end
