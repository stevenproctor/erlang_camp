%%% @author Proctor

-module(ec_math).

-export([op/3]).

-spec op(add | sub, number(), number()) -> number().
op(add, Addend, Augend) ->
    Addend + Augend;
op(sub, Minuend, Subtrahend) ->
    Minuend - Subtrahend.
