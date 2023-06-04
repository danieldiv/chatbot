imprimir_valores(Tipo) :-
    call(Tipo, Chave, Valor),
    write(Chave), write(" - "), writeln(Valor),
    fail.
imprimir_valores(_).

resposta(Opcao, Res, Predicado) :-
    call(Predicado, Opcao, Res).
resposta(_, "Desculpe, não entendi o que você disse.", _).

menu(Predicao, Opcao) :-
    nl, writeln('Selecione uma opção: '),
    imprimir_valores(Predicao),
    read(Opcao),
    resposta(Opcao, Descricao, Predicao),
    nl, writeln(Descricao).

menu_comercial :-
    menu(op_comercial, Opcao),
    (Opcao = 11 ->
        writeln('Carencia do plano');
        Opcao = 12 ->
            writeln('Publicidade');
            Opcao = 13 ->
                writeln('Inclusao dependente');
                Opcao = 14 ->
                    writeln('Exclusao dependente');
                    menu_comercial
    ).

menu_financeiro :-
    menu(op_financeiro, Opcao),
    (Opcao = 21 ->
        writeln('Segunda via boleto');
        Opcao = 22 ->
            writeln('Imposto de renda');
            Opcao = 23 ->
                writeln('Negociacao');
                Opcao = 24 ->
                    writeln('Utilizacao / mensalidade');
                    Opcao = 25 ->
                        writeln('Parcelamento');
                        menu_financeiro
    ).

menu_auto_guia :-
    menu(op_auto_guia, Opcao),
    (Opcao = 31 ->
        writeln('Autorizacao de guias');
        Opcao = 32 ->
            writeln('Download Guia autorizada');
            Opcao = 33 ->
                writeln('Consultar Status autorizacao');
                Opcao = 34 ->
                    writeln('Anexar documento');
                    Opcao = 35 ->
                        writeln('Autorizacao de Consultas');
                        Opcao = 36 ->
                            writeln('Revalidacao de Guias');
                            menu_auto_guia
    ).

menu_manifestacoes :-
    menu(op_manifestacoes, Opcao),
    (Opcao = 41 ->
        writeln('Elogio');
        Opcao = 42 ->
            writeln('Reclamacao');
            Opcao = 43 ->
                writeln('Sugestoes');
                menu_manifestacoes
    ).

menu_principal :-
    menu(op_principal, Opcao),
    (Opcao = 5 -> halt;
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