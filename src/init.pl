:- use_module(library(system)).
:- use_module(library(process)).

:- consult('conhecimento.pl').
:- consult('informacoes.pl').
:- consult('interface.pl').

pause(Seconds) :- sleep(Seconds).

cliente :-
    check_pessoa(Tipo),
    (Tipo = fisica ->
        writeln('Informe o CPF: ');
        Tipo = juridica ->
            writeln('Informe o CNPJ: ');
            writeln(Tipo),
            cliente
    ).

not_cliente :-
    nl, writeln('O que deseja fazer?'),
    writeln('1 - Guia médico'),
    writeln('2 - Cadastro'),
    writeln('s - Sair'),
    writeln('v - Voltar'),
    read(Opcao),

    (Opcao = 1 ->
        informacoes;
        Opcao = 2 ->
            cadastro;
            Opcao = s ->
                finalizar;
                Opcao = v ->
                    main;
                    writeln('Desculpe, não entendi o que você disse.')
    ),
    not_cliente.

is_cliente(X) :-
    (X = 's' ->
        cliente,
        menu_principal;
        X = 'n' -> not_cliente;
        writeln('Desculpe, não entendi o que você disse.')
    ).

main :-
    writeln('Olá, sou MIDAS.'), nl,
    write('Já é cliente? (s/n): '),
    read(C),
    is_cliente(C).

:- initialization(main).