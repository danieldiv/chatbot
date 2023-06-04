:- use_module(library(system)).
:- use_module(library(process)).

:- consult('conhecimento.pl').
:- consult('interface.pl').

pause(Seconds) :- sleep(Seconds).

cliente :-
    write('Pessoa fisica ou juridica? (f/j): '),
    read(P),
    resposta(P, Tipo, tipo_pessoa), nl,

    (Tipo = fisica ->
        writeln('Informe o CPF: ');
        Tipo = juridica ->
            writeln('Informe o CNPJ: ');
            writeln(Tipo),
            cliente
    ).

is_cliente(X) :-
    (X = 's' ->
        cliente,
        menu_principal;
        writeln('não cliente')
    ).

main :-
    writeln('Olá, sou MIDAS.'), nl,
    write('Já é cliente? (s/n): '),
    read(C),
    is_cliente(C).

:- initialization(main).