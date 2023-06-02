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

op_comercial(portabilidade_1).
op_comercial(carencia_planos_2).
op_comercial(inclusao_dependente_3).
op_comercial(exclusao_dependente_4).
op_comercial(outros_5).

op_financeiro(negociacao).
op_financeiro(imposto_renda).
op_financeiro(segunda_via_boleto).
op_financeiro(utilizacao_mensalidade).
op_financeiro(parcelamento).

op_autorizacao_guias(consultar_status_autorizacao).
op_autorizacao_guias(download_guia_autorizada).
op_autorizacao_guias(autorizacao_guias).
op_autorizacao_guias(anexar_documento).
op_autorizacao_guias(autorizacao_consultas).
op_autorizacao_guias(revalidacao_guias).

op_manifestacoes(m1).

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
    check_pessoa,
    nl, menu_principal, nl,

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

check_pessoa :-
    write('Pessoa fisica ou juridica? (f/j): '),
    read(P),
    (P = 'f' ->
        write('CPF: ');
        P = 'j' ->
            write('CNPJ: ');
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