module Senha

	class Jogo
	  def initialize(output)
	    @output = output
	  end

	  def iniciar(password)
	  	@password = password
	    @output.puts 'Bem vindo ao Senha!'
	    @output.puts 'Informe seu palpite:'
	  end

	  
	  def palpite(chute)
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
		
		@output.puts '+'*posicao_correta + '-'*posicao_errada
	  end

	  
	  def valor_posicao_correta?(chute, index) 
	  	chute[index] == @password[index]
	  end

	  
	  def valor_posicao_errada?(chute, index) 
	  	not @password.nil? and @password.include?(chute[index]) && !valor_posicao_correta?(chute, index)
	  end
	end
	
end
