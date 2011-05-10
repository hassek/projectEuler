-module(prob2).
-export([fib_evensum/0,fib_evensum/3]).

fib_evensum() ->
    fib_evensum(1,1,0).

fib_evensum(Val, PastVal,Res) when Val =< 4000000 -> %4 million
    if 
        Val rem 2 == 0 ->
            fib_evensum(PastVal+Val,Val, Res+Val);
        true ->
            fib_evensum(PastVal+Val, Val, Res)
    end;

fib_evensum(Val, PastVal, Res) ->
    Res.
