-module(prob2).
-export([fib_evensum/1]).

fib_evensum(Max) ->
    fib_evensum(1,1,0,2, Max).

fib_evensum(Val, PastVal, Third,Res, Max) when Val =< Max ->
    io:format("~w ~w ~w~n",[Val, PastVal, Third]),
    A = Res + Third, 
    fib_evensum(Third+Third+Val, Val+Third, Third+Val+Third+Val+Third,A, Max);

fib_evensum(_, _, _, Res,_) ->
    Res.

%fib_evensum(Val, PastVal,Res) when Val =< 4000000 -> %4 million
%    if 
%        Val rem 2 == 0 ->
%            fib_evensum(PastVal+Val,Val, Res+Val);
%        true ->
%            fib_evensum(PastVal+Val, Val, Res)
%    end;


