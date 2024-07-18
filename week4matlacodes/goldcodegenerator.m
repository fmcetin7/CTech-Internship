function gold_code = goldcodegenerator()

% This function generates a 31-bit gold code

% Define the polynomial for the LFSRs (primitive polynomials for 5 stages)
polynomial1 = [5 2 0]; % Example polynomial: x^5 + x^2 + 1
polynomial2 = [5 3 2 0]; % Another example polynomial: x^5 + x^3 + x^2 + 1

% Create the m-sequences
n = 5; % Number of stages
mseq1 = comm.PNSequence('Polynomial', polynomial1, 'SamplesPerFrame', 31, 'InitialConditions', [1 0 1 0 0]);
mseq2 = comm.PNSequence('Polynomial', polynomial2, 'SamplesPerFrame', 31, 'InitialConditions', [1 0 0 0 1]);

% Generate the m-sequences
seq1 = (mseq1()).';
seq2 = (mseq2()).';

% Generate the Gold code by XORing the two m-sequences
gold_code = xor(seq1, seq2);

end
