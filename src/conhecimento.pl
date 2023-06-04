op_principal(1, 'Comercial').
op_principal(2, 'Financeiro').
op_principal(3, 'Autorizacao guias').
op_principal(4, 'Manifestacoes').
% op_principal(5, 'Finalizar').

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

op_geral(s, 'Sair').
op_geral(v, 'Voltar').

tipo_pessoa(f, fisica).
tipo_pessoa(j, juridica).