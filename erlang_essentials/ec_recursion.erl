%%% @author Proctor

-module(ec_recursion).

-export([sum_seq/1,
         hr/1]).

-spec sum_seq(integer()) -> integer().
sum_seq(N) when N >= 0 ->
    sum_seq(N, 0).

sum_seq(0, Accum) ->
    Accum;
sum_seq(N, Accum) ->
    sum_seq(N - 1, Accum + N).

hr(N) ->
    hr(N, "").

hr(N, Accum) when N < 1 ->
    Accum;
hr(N, Accum) ->
    hr(N-1, "-" ++ Accum).
