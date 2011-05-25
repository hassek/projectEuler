-module(problem1).
-export([multiple/1]).

multiple(Max) ->
    multiple(3,Max-1) + multiple(5,Max-1) - multiple(15,Max-1).

multiple(N,Max) ->
    P = Max div N,
    N*(P*(P+1))) div 2.
