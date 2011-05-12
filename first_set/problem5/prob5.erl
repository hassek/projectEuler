-module(prob5).
-export([divisible_by_all/1]).

get_primes({Max, Primes}) -> % me da los primos menores o iguales a Max
    


divisible_by_all(Max) ->
    divisible_by_all(Max, 1).

divisible_by_all(Max, Res) when Max == 1->
    Res;

divisible_by_all(Max, Res) ->
    divisible_by_all(Max-1, Res*Max).
