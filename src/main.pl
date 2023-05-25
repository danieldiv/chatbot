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