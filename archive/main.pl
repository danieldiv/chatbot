ler_valores(X, Y) :-
  write('Digite o valor de X: '),
  read(X),
  write('Digite o valor de Y: '),
  read(Y), nl,
  is_cliente(X).

is_cliente(X) :-
    (X == 10 ->
        write('eh igual a 10');
        write('eh diferente de 10')
    ).

maior(X, Y) :-
  (X > Y ->
    write(X), write(' é maior do que '), write(Y);
    write(Y), write(' é maior do que '), write(X)
  ).


start() :- write('Digite o valor de X: '), nl,
           read(X), nl,

           write(X), nl.

mulher(pam).
mulher(maria).
mulher(rafaela).
homem(daniel).

exibir_lista([]). % caso base: lista vazia
exibir_lista([X|Resto]) :- % X é a cabeça da lista, Resto é a cauda
    writeln(X), % imprime o elemento X
    exibir_lista(Resto). % chama recursivamente para o restante da lista