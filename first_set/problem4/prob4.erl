-module(prob4).
-export([palindrome/1]).
%Carajo este si me costo haha

palindrome(X) ->
    find_palindrome(X),
    ok.


find_palindrome(Pal) when Pal > 1 ->
    {X, Res, Length} = factor_palindrome(Pal),
    if 
        Length == 2 ->
            io:format("Para ~w los valoes son ~w~n", [X, Res]);
        true ->
            io:format("Intentando ~w~n", [Pal-1]),
            find_palindrome(Pal-1)
    end.

factor_palindrome(Pal) ->
    Val = integer_to_list(Pal),
    Val2 = lists:reverse(Val),
    if
        Val == Val2 ->
            Result = factor_palindrome(999,{Pal, [], 0});
        true ->
            Result = {false, [], 0}
    end,
    Result.

factor_palindrome(Count,{X, Res, Length}) ->
    %io:format("Viendo -> ~w~n",[Count]),
    if 
        Count == 1 ->
            {X, [], 0};
        Length == 2, X == 1 ->
            {X, Res, 2};
        X rem Count == 0 ->
            Res2 =  lists:append(Res ,[Count]),
            io:format("ADD ~w on Res to ~w palindrome~n", [Count, X]),
            factor_palindrome(Count-1,{X div Count, Res2, Length+1});
        true ->
            factor_palindrome(Count-1,{X, Res, Length})
    end.
