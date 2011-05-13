-module(prob6).
-export([square_lol/1]).

square_lol(Max)->
    List = lists:seq(1,Max),
    math:pow(lists:sum(List),2)  - lists:sum(lists:map(fun(X) -> X*X end, List)).
