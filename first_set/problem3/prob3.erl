-module(prob3).
-export([get_prime_factor/1, get_prime_factor/2]).

get_prime_factor(X) ->
    if 
        X rem 2 == 0 ->
            get_prime_factor(X, X-1).
        true ->
            get_prime_factor(X, X-2)
    end.

get_prime_factor(Val, X) ->
    if 
        Val rem X == 0 ->
            X
    end.

    get_prime_factor(Val, X-2);
