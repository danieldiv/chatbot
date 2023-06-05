finalizar :-
    nl, writeln('Obrigado por utilizar o sistema de atendimento MIDAS!'),
    halt.

informacoes :-
	nl, writeln('Acesse o link abaixo para visualizar o guia medico:'),
	writeln('https://www.site.com.br/guia-medico'), nl,
	writeln('Acesse o link abaixo para visualizar o manual do beneficiario:'),
	writeln('https://www.site.com.br/manual-beneficiario').

hospedagem :-
	nl, writeln('Qual o tipo de hospedagem? '),
	imprimir_valores(tipo_hospedagem).

check_pessoa(Res) :-
    write('Pessoa fisica ou juridica? (f/j): '),
    read(P),
    resposta(P, Res, tipo_pessoa), nl.

pessoa_fisica :-
	writeln('Informe o CPF: '),
	writeln('Informe o nome: '), nl,
	writeln('Escolha o tipo de plano'),
	imprimir_valores(tipo_plano).

pessoa_juridica :-
	writeln('Informe o CNPJ: '),
	writeln('Informe o nome fantasia: '),
	tipo_plano(2, Tipo),
	write('Tipo plano: '),
	writeln(Tipo).

dados_iniciais :-
	check_pessoa(Tipo),

	(Tipo = fisica ->
		pessoa_fisica;
		Tipo = juridica ->
			pessoa_juridica;
			writeln(Tipo),
			not_cliente
	).

idade :-
	nl, writeln('Informe a idade: '),
	write('Deseja informa mais idades? (s/n): '),
	read(Resposta),
	(Resposta = s -> idade; valor_plano).

valor_plano :-
	nl, writeln('Informe o valor do plano: '),
	writeln('Homologar plano? (s/n): '),
	read(Resposta),
	(Resposta = s -> 
		writeln('Plano homologado com sucesso!');
		finalizar).

cadastro :-
	nl, writeln('Cadastro de cliente.'),
	dados_iniciais,
	hospedagem,
	idade.