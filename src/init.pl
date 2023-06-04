:- use_module(library(system)).
:- use_module(library(process)).

pause(Seconds) :-
    sleep(Seconds).

concatenar_entrada(V1, V2, Resultado) :-
    atom_concat(V1, V2, Resultado).

finalizar :-
    nl, nl, write('Finalizando...'), nl,
    pause(1),
    halt.

op_principal(1, 'Comercial').
op_principal(2, 'Financeiro').
op_principal(3, 'Autorizacao guias').
op_principal(4, 'Manifestacoes').
op_principal(5, 'Finalizar').

op_comercial(11, 'Carencia do plano').
op_comercial(12, 'Publicidade').
op_comercial(13, 'Inclusao dependente').
op_comercial(14, 'Exclusao dependente').

op_financeiro(21, 'Segunda via boleto').
op_financeiro(22, 'Imposto de renda').
op_financeiro(23, 'Negociacao').
op_financeiro(24, 'Utilizacao / mensalidade').
op_financeiro(25, 'Parcelamento').

op_auto_guia(31, 'Autorizacao de guias').
op_auto_guia(32, 'Download Guia autorizada').
op_auto_guia(33, 'Consultar Status autorizacao').
op_auto_guia(34, 'Anexar documento').
op_auto_guia(35, 'Autorizacao de Consultas').
op_auto_guia(36, 'Revalidacao de Guias').

op_manifestacoes(41, 'Elogio').
op_manifestacoes(42, 'Reclamacao').
op_manifestacoes(43, 'Sugestoes').

imprimir_valores(Tipo) :-
    call(Tipo, Chave, Valor),
    write(Chave), write(" - "), writeln(Valor),
    fail.
imprimir_valores(_).

tipo_pessoa(f, fisica).
tipo_pessoa(j, juridica).

resposta(Opcao, Res, Predicado) :-
    call(Predicado, Opcao, Res).
resposta(_, "Desculpe, não entendi o que você disse.", _).

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

menu_comercial :-
    imprimir_valores(op_comercial).

menu_financeiro :-
    imprimir_valores(op_financeiro).

menu_auto_guia :-
    imprimir_valores(op_auto_guia).

menu_manifestacoes :-
    imprimir_valores(op_manifestacoes).

menu_principal :-
    nl, writeln('Selecione uma opção: '),
    imprimir_valores(op_principal),
    read(Opcao),
    (Opcao = 5 ->
        finalizar;
        resposta(Opcao, Descricao, op_principal),
        nl, writeln(Descricao),

        (Opcao = 1 ->
            menu_comercial;
            Opcao = 2 ->
                menu_financeiro;
                Opcao = 3 ->
                    menu_auto_guia;
                    Opcao = 4 ->
                        menu_manifestacoes;
                        menu_principal
        )
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