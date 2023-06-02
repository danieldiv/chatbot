:- use_module(library(system)).
:- use_module(library(process)).

pause(Seconds) :-
    sleep(Seconds).

finalizar :-
    shell('clear'),
    write('Finalizando...'), nl,
    pause(1),
    halt.

op_principal(comercial_1).
op_principal(financeiro_2).
op_principal(autorizacao_guias_3).
op_principal(manifestacoes_4).
op_principal(finalizar_6).

menu_principal :-
    findall(X, op_principal(X), Lista),
    exibir_lista(Lista).

exibir_lista([]). % caso base: lista vazia
exibir_lista([X|Resto]) :- % X é a cabeça da lista, Resto é a cauda
    writeln(X), % imprime o elemento X
    exibir_lista(Resto). % chama recursivamente para o restante da lista

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
    menu_principal, nl,
    write('Escolha uma opção: '),
    read(O),
    shell('clear'),
    (O = 1 ->
        write('Comercial');
        O = 2 ->
            write('Financeiro');
            O = 3 ->
                write('Autorização de Guias');
                O = 4 ->
                    write('Manifestações');
                    O = 6 ->
                        finalizar;
                        opcao_invalida).

opcao_invalida :-
    shell('clear'),
    writeln('Opção inválida!'), nl,
    cliente.

not_cliente :-
    write('deseja mais informações? (s/n): '), nl,
    read(I),
    informacoes(I).

informacoes(I) :-
    shell('clear'), % limpa a tela
    (I = 's' ->
        write('informacoes');
        finalizar
    ).

:- initialization(main).