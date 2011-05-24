-module(prob10).
-export([sum_primes_less_than/1]).

sum_primes_less_than(X) ->
    get_sum_primes(lists:seq(3, X, 2), 2).

get_sum_primes([], SumPrimes) -> 
    SumPrimes;

get_sum_primes([Num|Candidates], SumPrimes) ->
    %io:format("~w ~w~n",[Num, SumPrimes]),
    get_nth_prime(lists:filter(fun(Y) -> Y rem Num /= 0 end,Candidates), SumPrimes+Num).
