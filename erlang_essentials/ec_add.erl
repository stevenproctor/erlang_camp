%%% @author Proctor
%%% @doc contains add function

-module(ec_add).

-export([add/2]).

%% @doc adds two numbers together.
-spec add(number(), number()) -> number().
add(Addend, Augend) ->
    Addend + Augend.
