class CucumberSenha

	def inicio(password)
	  	@password = password
	    "Bem vindo ao Senha"
	  end
	
	def palpite(chute)
		reultado = ''
	  	posicao_correta = 0 
	  	posicao_errada = 0 	  	

		(0..3).each do |index|
			if valor_posicao_correta?(chute, index) 
				posicao_correta += 1
			end 
		end
		
		(0..3).each do |index|
			if valor_posicao_errada?(chute, index)
				posicao_errada += 1
			end 
		end
		
		return reultado = '+'*posicao_correta + '-'*posicao_errada
	end
	
	def valor_posicao_correta?(chute, index) 
	  	chute[index] == @password[index]
	end

	  
	def valor_posicao_errada?(chute, index) 
		not @password.nil? and @password.include?(chute[index]) && !valor_posicao_correta?(chute, index)
	end

end


Dado(/^uma senha secreta$/) do
	@jogo = CucumberSenha.new
	@jogo.inicio('1234')
end

Quando(/^eu dou o chute sem acertos$/) do
	@resultado = @jogo.palpite('5555')
end

Entao(/^eu devo ver ''$/) do
	@resultado.should == ''
end



Quando(/^eu dou o chute que tenha um numero correto na posicao errada$/) do
	@resultado = @jogo.palpite('2555')
end

Entao(/^eu devo ver '\-'$/) do
	@resultado.should == '-'
end



Quando(/^eu dou o chute que tenha um numero correto na posicao correta$/) do
	@resultado = @jogo.palpite('1555')
end

Entao(/^eu devo ver '\+'$/) do
	@resultado.should == '+'
end



Quando(/^eu dou o chute acertando dois numeros nas posicoes erradas$/) do
	@resultado = @jogo.palpite('2355')
end

Entao(/^eu devo ver '\--'$/) do
	@resultado.should == '--'
end



Quando(/^eu dou o chute acertando um numero na posicao correta e um numero na posica errada - nessa ordem$/) do
	@resultado = @jogo.palpite('2535')
end

Entao(/^eu devo ver '\+-'$/) do
	@resultado.should == '+-'
end
