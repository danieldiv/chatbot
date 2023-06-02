:- use_module(library(system)).
:- use_module(library(process)).

pause(Seconds) :-
    sleep(Seconds).

main :-
    write('Olá, sou MIDAS.'), nl,
    write('Já é cliente? (s/n): '),
    read(C),
    is_cliente(C).

is_cliente(X) :-
    shell('clear'),
    (X = 's' ->
        cliente;
        not_cliente
    ).

cliente :-
    write('cliente').

not_cliente :-
    write('deseja mais informações? (s/n): '), nl,
    read(I),
    informacoes(I).

informacoes(I) :-
    shell('clear'),
    (I = 's' ->
        write('informacoes');
        write('Finalizando...'), nl,
        pause(1),
        halt
    ).

:- initialization(main).