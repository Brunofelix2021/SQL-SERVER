SELECT *
 
 FROM TB_CLIENTE_CLI CLI
    INNER JOIN TB_VEICULO_VEI VEI
	ON VEI.CLI_CODIGO =CLI.CLI_CODIGO

	INNER JOIN TB_MODELO_MOD MOD_
    ON  VEI.MOD_CODIGO  = MOD_.MOD_CODIGO

	INNER JOIN TB_MARCA_MAR  MAR
	ON MOD_.MAR_CODIGO = MAR.MAR_CODIGO

	INNER JOIN TB_ORCAMENTO_ORC ORC
	ON ORC.VEI_CODIGO = ORC.ORC_CODIGO

	LEFT JOIN TB_PRODUTO_ORCAMENTO_TPO TPO
	ON ORC.ORC_CODIGO = TPO.ORC_CODIGO

	INNER JOIN TB_PRODUTO_SERVICO_TPS TPS
	ON TPS.TPS_CODIGO = ORC.ORC_CODIGO

	INNER JOIN TB_ORDEM_SERVICO_ORD ORD
	ON ORD.ORD_CODIGO = ORC.ORC_CODIGO

	INNER JOIN TB_PRODUTO_ORDEM_SERVICO_POS POS
	ON POS.POS_CODIGO = ORD.ORD_CODIGO

	INNER JOIN 