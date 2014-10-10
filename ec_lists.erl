-module(ec_lists).

-export([print_each/1]).

-spec print_each(list()) -> ok.
print_each(List) ->
    print_each(List, 1).

print_each([], _) ->
    ok;
print_each([Head|Rest], Index) ->
    io:format("~p is ~p~n", [Index, Head]),
    print_each(Rest, Index + 1).
