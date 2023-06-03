:- use_module(library(system)).
:- use_module(library(process)).

pause(Seconds) :-
    sleep(Seconds).

finalizar :-
    nl, nl, write('Finalizando...'), nl,
    pause(1),
    halt.

op_principal(1, comercial).
op_principal(2, financeiro).
op_principal(3, autorizacao_guias).
op_principal(4, manifestacoes).
op_principal(5, finalizar).

imprimir_principal :-
    op_principal(Chave, Valor),
    write(Chave) , write(" - ") , writeln(Valor),
    fail. 
imprimir_principal.

tipo_pessoa(f, fisica).
tipo_pessoa(j, juridica).

resposta(Opcao, Tipo) :-
    tipo_pessoa(Opcao, Tipo).

resposta(_, "Desculpe, não entendi o que você disse.").

check_pessoa(Tipo) :-
    write('Pessoa fisica ou juridica? (f/j): '),
    read(P),
    resposta(P, Tipo).

cliente :-
    check_pessoa(Tipo), nl,

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
        nl, imprimir_principal;
        writeln('não cliente')
    ).

main :-
    writeln('Olá, sou MIDAS.'), nl,
    write('Já é cliente? (s/n): '),
    read(C),
    is_cliente(C).

:- initialization(main).