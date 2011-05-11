-module(prob3).
-export([main/1]).

main(Val) ->
    get_prime_factor({Val, 2}).

get_prime_factor({Val, X}) when Val rem X == 0 ->
    io:format("valor: ~w, mod: ~w~n", [Val, X]),
    get_prime_factor({Val div X, X});

get_prime_factor({Val, X}) when Val == 1 ->
    get_prime_factor({X});

get_prime_factor({Val, X}) ->
    if 
        X rem 2 == 0 ->
            get_prime_factor({Val, X+1});
        true ->
            io:format(" true -- valor: ~w, mod: ~w~n", [Val, X]),
            get_prime_factor({Val, X+2})
    end;

get_prime_factor({X}) ->
    X.
