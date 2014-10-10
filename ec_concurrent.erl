-module(ec_concurrent).

-export([bf_seq/1]).

bf_seq(List) ->
    spawn(fun() -> print_forward(List) end),
    spawn(fun() -> print_backwards(List) end).

print_forward(List) ->
    print_list(List).

print_backwards(List) ->
    print_list(lists:reverse(List)).

print_list([Item]) ->
    io:format("~p", [Item]);
print_list([Head|Tail]) ->
    io:format("~p,", [Head]),
    print_list(Tail).
