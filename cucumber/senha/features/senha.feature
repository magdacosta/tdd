#language:pt
#encoding: utf-8

Funcionalidade: Descobrir a senha
	
	Afim de descobrir a senha secreta
	Como um jogador
	Eu quero informar os palpites até acertar a senha
		
	Cenario: Dar palpite sem acertos
		Dado uma senha secreta
		Quando eu dou o chute sem acertos
		Entao eu devo ver ''
		
	Cenario: Dar palpite com numero correto na posicao errada
		Dado uma senha secreta
		Quando eu dou o chute que tenha um numero correto na posicao errada
		Entao eu devo ver '-'
		
	Cenario: Dar palpite com numero correto na posicao correta
		Dado uma senha secreta
		Quando eu dou o chute que tenha um numero correto na posicao correta
		Entao eu devo ver '+'
		
	Cenario: Dar palpite acertando dois numeros nas posicoes erradas
		Dado uma senha secreta
		Quando eu dou o chute acertando dois numeros nas posicoes erradas
		Entao eu devo ver '--'
		
	Cenario: Dar palpite acertando um numero na posicao correta e um numero na posica errada - nessa ordem
		Dado uma senha secreta
		Quando eu dou o chute acertando um numero na posicao correta e um numero na posica errada - nessa ordem
		Entao eu devo ver '+-'
