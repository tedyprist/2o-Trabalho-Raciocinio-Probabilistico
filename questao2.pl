%Tedy Prist de Souza Pereira - 22050676

% Probabilidades básicas
0.5::str(dry); 0.3::str(wet); 0.2::str(snow_covered).
0.2::flw.

0.95::b.
0.95::k.

% Dínamo deslizante (R) condicionado
0.9::r :- str(snow_covered), flw.
0.6::r :- str(snow_covered), \+flw.
0.7::r :- str(wet), flw.
0.3::r :- str(wet), \+flw.
0.4::r :- str(dry), flw.
0.05::r :- str(dry), \+flw.

% Voltagem (V) depende de R
0.9::v :- r.
0.2::v :- \+r.

% Luz ligada (Li) depende de V, B, K
0.99::li :- v, b, k.
0.9::li :- v, b, \+k.
0.9::li :- v, \+b, k.
0.7::li :- v, \+b, \+k.
0.2::li :- \+v, b, k.
0.1::li :- \+v, b, \+k.
0.1::li :- \+v, \+b, k.
0.01::li :- \+v, \+b, \+k.

% Consulta
query(v).
evidence(str(snow_covered)).
