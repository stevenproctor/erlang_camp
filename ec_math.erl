%%% @author Proctor

-module(ec_math).

-export([op/3]).

-spec op(add | sub, number(), number()) -> number().
op(add, Addend, Augend) ->
    Addend + Augend;
op(sub, Minuend, Subtrahend) ->
    subtract(Minuend, Subtrahend).

subtract(Minuend, Subtrahend) when Minuend >= Subtrahend ->
    Minuend - Subtrahend;
subtract(_, _) ->
    error.
