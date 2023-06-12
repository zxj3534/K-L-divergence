# K-L-divergence
1. main.m at subfolder KL contains ten matrices representing ten different structures，and calculates the K-L divergence between the LLR distribution obtained by BP decoding and MAP decoding of variable nodes v1, v4, and v6 in matrix H1. H1 can be replaced by H2-H10, calculate respectively.

2. Flooding_B_llr.m at subfolder KL - BP decoder.

3. MAP_decoder.m at subfolder KL- MAP decoder.

4. simulatoin.m at subfolder KL- Uses BP decoder and MAP decoder to decode and output posterior LLR L1, L2, respectively.

5. Probability_distribution_KL.m at subfolder KL - Calculates the posteriori LLR distribution P and Q of variable node are obtained by BP decoder and MAP decoder respectively, and calculates the K-L divergence between these two distributions.

7. results.pdf contains the K-L divergences between the LLR distribution obtained by BP decoding and MAP decoding of variable nodes in ten different structures. These results variables nodes with shorter cycle lengths and higher cycle counts exhibit relatively poorer performance.

8. subfolder DFBPKL calculates the K-L divergence between the LLR distribution obtained by damping factor BP decoding and MAP decoding.

9. results.pdf also contains K-L divergence comparisons for BP decoding and damping factor BP decoding.
