-module(prob9).
-export([pythagorean_triplet_sum/1]).

square(X) ->
    floor(math:pow(X,0.5)).

floor(X) ->
    T = erlang:trunc(X),
    case (X - T) of
        Neg when Neg < 0 -> T - 1;
        Pos when Pos > 0 -> T;
        _ -> T
    end.

pythagorean_triplet_sum(X) ->
    if 
        X > 1 ->
            find_pythagorean_triplet_sum({0,0,square(X)+1},{},X);
        true ->
            io:format("Error, no se pueden trabajar con numeros menores a 1")
    end.


find_pythagorean_triplet_sum({0, 0, 0}, _, _) -> % math:pow(C,0.5) > math:pow(Sum, 0.5)
    io:format("No hay pythagorean triplet par este numero~n");

find_pythagorean_triplet_sum({0, 0, C}, _, Sum) ->
    SC = math:pow(C-1,2),
    find_pythagorean_triplet_sum({0, square(Sum - SC)+1 , C-1},{Sum -SC,SC},Sum);

find_pythagorean_triplet_sum({0, B, C},{ SB, SC}, Sum) ->
    find_pythagorean_triplet_sum({square(Sum - SB - SC) , B-1, C},{SB - math:pow(B-1,2), SB, SC},Sum);


find_pythagorean_triplet_sum({A, B, C},_, Sum) when (A + B + C) == Sum ->
    io:format("A->~w; B->~w; C->~w;~n",[A,B,C]),
    A*B*C;

find_pythagorean_triplet_sum({A,B,C},{SA,SB,SC},Sum) ->
    io:format("A->~w; B->~w; C->~w; SA->~w ;SB->~w; SC->~w; ~n",[A,B,C,SA,SB,SC]),
    find_pythagorean_triplet_sum({A-1,B,C},{SA,SB,SC},Sum).
    




    
    %if 
    %    A rem 2 == 0 -> %evaluo los pares
    %        B = (math:pow(A+1,2)-1)/2,
    %        io:format("Inpar: A->~w; B->~w; C->~w; SUM:~w ~n",[A+1,B,B+1,A+B+B+2]),
    %        find_pythagorean_triplet_sum({A+1,B, B+1},Sum);
    %    true -> %evaluo los inpares
    %        B = (math:pow((A+1)/2,2) -1),
    %        io:format("Par: A->~w; B->~w; C->~w;SUM:~w ~n",[A+1,B,B+2, A+B+B+3]),
    %        find_pythagorean_triplet_sum({A+1,B, B+2},Sum)
    %end.

