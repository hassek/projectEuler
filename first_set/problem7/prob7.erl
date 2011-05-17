-module(prob7).
-export([nth_prime/1]).

log(X) ->
    math:log(X).

nth_prime(X) -> %show who's the Nth prime

    if 
        X < 13 ->
            Max = 37;
        true ->
            Max = round(X*((log(X) + log(log(X)) -1) + (1.8*log(log(X))/log(X))))
            % aproximate value of the Nth prime, this value will never be less than the Nth prime.
        end,

    get_nth_prime(Max, X).    

get_nth_prime(Max, X) ->
    get_nth_prime(lists:seq(3, Max, 2), [2], 1, X).

get_nth_prime(_, Primes, Count, X) when Count >= X -> 
    lists:last(Primes);

get_nth_prime([Num|Candidates], Primes, Count, X) ->
    Val = lists:any(fun(Y) -> Num rem Y == 0 end, Primes),

    if 
        not Val ->
            get_nth_prime(lists:filter(fun(Y) -> Y rem Num /= 0 end,Candidates), Primes ++ [Num], Count+1, X);
        true ->
            get_nth_prime(Candidates, Primes, Count, X)
    end.
