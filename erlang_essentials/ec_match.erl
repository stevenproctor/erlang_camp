%%% @author Proctor
%%% @doc the ec_match module checks to see if a is a

-module(ec_match).

-export([a_is_a/1]).

-spec a_is_a(a | any()) -> boolean().
a_is_a(a) ->
    true;
a_is_a(_) ->
    false.
