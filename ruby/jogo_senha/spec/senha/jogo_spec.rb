# encoding: utf-8
require 'spec_helper'

module Senha

  describe Jogo do
  	
	let(:output) { double('output').as_null_object }
	
    let(:jogo) { Jogo.new(output) }

    describe "#iniciar" do

	  it "exibe uma mensagem de boas vindas" do
        output.should_receive(:puts).with('Bem vindo ao Senha!')
        jogo.iniciar('1234')
      end

      it "solicita pelo 1o palpite" do
        output = double('output').as_null_object
        jogo = Jogo.new(output)

        output.should_receive(:puts).with('Informe seu palpite:')

        jogo.iniciar('1234')
      end
	  
    end

    describe "#chute" do
	
      context "Sem jogos" do
        it "envia uma marca com ''" do
          jogo.iniciar('1234')
          output.should_receive(:puts).with('')
          jogo.palpite('5555')
        end
      end
	  
    end

     context "acertando 1 numero na posicao errada" do
	 
        it "envia uma marca com '-'" do
          jogo.iniciar('1234')
          output.should_receive(:puts).with('-')
          jogo.palpite('2555')
        end
		
     end

    context "acertando 1 numero na posicao correta" do
	
        it "envia uma marcar com '+'" do
          jogo.iniciar('1234')
          output.should_receive(:puts).with('+')
          jogo.palpite('1555')
        end
		
    end

     context "acertando 2 numeros nas posicoes erradas" do
	 
        it "envia uma marca com '--'" do
          jogo.iniciar('1234')
          output.should_receive(:puts).with('--')
          jogo.palpite('2355')
        end
		
     end

     context "acertando 1 numero na posicao correta e 1 numero na posica errada (nessa ordem)" do
	 
        it "envia uma marca com '+-'" do
          jogo.iniciar('1234')
          output.should_receive(:puts).with('+-')
          jogo.palpite('2535')
        end
		
    end
	
  end
  
end
