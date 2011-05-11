-module(prob4).
-export([palindrome/1]).

palindrome({X}) ->
    palindrome({X, 999, []}).

palindrome({X, Count, Res}) when length(Res) == 2 ->
    Res.

palindrome({X, Count, Res}) when Count =< 0 ->
    io:format("Naiden para ~w~n", X).

palindrome({X, Count, Res}) ->
    if 
        X rem Count == 0 ->
            Res = [Count | Res]
    end,
    palindrome({X, Count-1, Res});
