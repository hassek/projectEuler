-module(prob9).
-export([pythagorean_triplet_Sum/1, euclids_formula/2]).

square(X) ->
    math:pow(X,2).

pythagorean_triplet_Sum(X) ->
    if 
        X > 1 ->
            euclids_formula(2,1,{ 0,0 ,0 },X);% doesnt mantain order between A and B
        true ->
            io:format("Error, no se pueden trabajar con numeros menores a 1")
    end.

euclids_formula(_, _, {A,B,C}, Sum) when (A+B+C) /= 0 , Sum rem trunc(A + B + C) == 0 ->
    io:format("primitive pythagorean triplet found. A:~w B:~w C:~w~n",[A,B,C]), 
    N = primitive_found(A+B+C, 1, Sum),
    io:format("A:~w, B:~w, C:~w~n",[A*N,B*N,C*N]),
    trunc((A*N)*(B*N)*(C*N));

euclids_formula(M, N, _, Sum) when M+N > Sum ->
    io:format("No existe un pythagorean triplet para esta Suma.~n");

euclids_formula(_, N, {A,B,C}, Sum) when A + B + C > Sum ->
    %io:format("-->M:~w, N:~w~n",[M,N]),
    euclids_formula(N+2,N+1,{0,0,0},Sum); %reset with N + 1 now

euclids_formula(M, N, _, Sum) -> % M > N always
    %io:format("M:~w, N:~w~n",[M,N]),
    A = square(M) - square(N),
    B = 2*M*N,
    C = square(M) + square(N),
    euclids_formula(M+1,N,{A,B,C},Sum).

primitive_found(PrimitiveSum, N, Sum) when PrimitiveSum*N == Sum ->
    N;

primitive_found(PrimitiveSum, N, Sum) ->
    primitive_found(PrimitiveSum, N+1, Sum).

euclids_formula(M, N) -> % M > N always
    A = square(M) - square(N),
    B = 2*M*N,
    C = square(M) + square(N),
    io:format("A:~w, B:~w, C:~w~n",[A,B,C]).

