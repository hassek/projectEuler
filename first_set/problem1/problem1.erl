-module(problem1).
-export([multiple/1, multiple/2]).

multiple(S) ->
    multiple(S-1, 0).

multiple(X, Res) when X /= 0 ->
    case X of
        X when X rem 3 == 0 ->
            multiple(X-1, Res+X);
        X when X rem 5 == 0 ->
            multiple(X-1, Res+X);
        X ->
            multiple(X-1, Res)
        end;

multiple(0, Res) ->
    Res.
