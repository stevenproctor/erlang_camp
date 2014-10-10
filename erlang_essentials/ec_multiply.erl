%%% @author Proctor
%%% @doc contains add function

-module(ec_multiply).

-export([mult/3]).

%% @doc multiplies three numbers together.
-spec mult(number(), number(), number()) -> number().
mult(Multiplicand, Multiplier, Multiplier2) ->
    Multiplicand * Multiplier * Multiplier2.

