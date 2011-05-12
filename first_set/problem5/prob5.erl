-module(prob5).
-export([get_primes/1]).

get_primes(Max) -> % me da los primos menores o iguales a Max
    get_min_common_div(Max, get_primes(Max, 3, [2]), []).


get_primes(Max, Num, Primes) when Max < Num -> 
    Primes;

get_primes(Max, Num, Primes) -> 
    Val = not lists:any(fun(X) -> Num rem X == 0 end, Primes),
    if 
        not Val ->
            get_primes(Max, Num+2, Primes);
        true ->
            get_primes(Max, Num+2, [Num|Primes])
    end.

get_min_common_div(_, [], Totals) ->
    %Totals;
    lists:foldl(fun(X,Y) -> X*Y end,1, Totals);

get_min_common_div(Max, [Prime|Primes], Totals) ->
    get_min_common_div(Max, Primes, [get_max_common_div(Max, Prime, 1)| Totals]).

get_max_common_div(Max, Base, Num) when Base * Num =< Max ->
    get_max_common_div(Max, Base, Base * Num);

get_max_common_div(_, _, Num) ->
    Num.



