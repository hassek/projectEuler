-module(prob8).
-export([greatest_product/2]).

greatest_product(X, Y) ->
    greatest_product({X,Y-1,0}).

greatest_product({[F|X], Y, Max}) ->
    Candidate = lists:foldr(fun(X,Y) -> (X-48) * Y end, 1, [F|string:sub_string(X,1,Y)]),
    %io:format("-- ~w -- ~n",[Candidate]),

    if 
        Max < Candidate ->
            greatest_product({X, Y, Candidate});
        true ->
            greatest_product({X, Y, Max})
    end;

greatest_product({[], _, Max}) ->
    Max.

