class Romanos2Inteiros

	def initialize
		@num = ""
		@i = 0
		@n = 0
		@mensagem = ""
	end
	
  
	def converter (str)

		strAux = str;
		
		while (strAux[0] == " ")
			strAux = str.slice(1)
		end
		
		if (strAux.index("") != 0) 
			strAux = str.slice(0, str.index(" "))
		end
		
		if (str == "")
			return @mensagem = "Sem dados para converter"
  
		else 
			if (str.to_i > 0)
				@n = str.to_i
				if (@n < 1 || @n > 3999)
					@mensagem = "Informar valor entre 1 ate 3999"
					return @mensagem
				else
					if (@n != str.to_i)
						@mensagem = str + " will be rounded to " + @n
					end
					@mensagem = converts(@n)
					
				end
			
			else
				@num = str;
				if (@num == @num.downcase())
					i = @num.index('u')
					if (i != -1) 
						@num = @num.slice(0, i) + 'v' + @num.slice(i + 1, @num.length - i)
					end
					if (@num.slice(@num.length - 2, 2) == 'ij')
						@num = @num.slice(0, @num.length - 2) + 'ii'
					end
				end
				
				@n = evalRoman(@num)
				
				if (@n == -1)
					@mensagem = str + " nao eh um valor valido"
				else
					@mensagem = @n
				end
			
			end
		end
		
		return @mensagem
	
			  
	end
	
	def evalRoman(num)
	
		i = 0
		h = 0
		n =
		t = 0
		u = 0

		num = num.upcase()
		while (num[i] == 'M') 
			i=i+1
		end
		n = i * 1000
			
		if (num.slice(i, 2) == 'CM') 
			h = 9
			i += 2
		elsif (num.slice(i, 1) == 'D') 
			h = 5
			i = i+1
		elsif (num.slice(i, 2) == 'CD') 
			h = 4
			i += 2
		end
		
		if (h == 0 or h == 5) 
			while (num[i] == 'C') 
				h=h+1
				i=i+1
			end
		end
		n += h * 100;

		if (num.slice(i, 2) == 'XC') 
			t = 9
			i += 2
		elsif (num.slice(i, 1) == 'L') 
			t = 5
			i=i+1
		elsif (num.slice(i, 2) == 'XL')
			t = 4
			i += 2
		end
		
		if (t == 0 or t == 5) 
			while (num[i] == 'X')
				t=t+1
				i=i+1
			end
		end
		n += (t*10)

		if (num.slice(i, 2) == 'IX') 
			u = 9
			i += 2
		elsif (num.slice(i, 1) == 'V')
			u = 5
			i=i+1
		elsif (num.slice(i, 2) == 'IV') 
			u = 4
			i += 2
		end
		
		if (u == 0 or u == 5) 
			while (num[i] == 'I') 
				u=u+1
				i=i+1
			end
		end
		n += u

		if (!((num == convert1000s(n) + convert100s(n) + convert10s(n) + convert1s(n)) ))
			n = -1
		end
			
		return(n)
	
	end
	
	
	def converts(n)
		return (convert1000s(n) + convert100s(n) + convert10s(n) + convert1s(n))
	end
	
	def convert1000s(n)
		return ('MMMM'.slice(0, ( (n / 1000).floor)));
	end

	def convert100s(h) 
		m = ''
		h = ((h % 1000) / 100).floor
		
		if (h == 9) 
			m = 'CM'
		elsif (h > 4) 
			m = 'DCCC'.slice(0, h - 4)
		elsif (h == 4) 
			m = 'CD'
        else 
			m = 'CCC'.slice(0, h)
		end
		return m
	end

	def convert10s(t)
		m = ''
		t = ((t % 100) / 10).floor
		
		if (t == 9)
			m = 'XC'
		elsif (t > 4) 
			m = 'LXXX'.slice(0, t - 4)
		elsif (t == 4) 
			m = 'XL'
        else 
			m = 'XXX'.slice(0, t)
		end
		
		return m
	end

	def convert1s(u) 
		m = ''
		u = u % 10
		
		if (u == 9) 
			m = 'IX'
		elsif (u > 4) 
			m = 'VIII'.slice(0, u - 4)
		elsif (u == 4) 
			m = 'IV'
        else 
			m = 'III'.slice(0, u)   
		end
		return m
	end

end

describe Romanos2Inteiros do
	r2i = Romanos2Inteiros.new
	
	describe "Conversao de 1(hum) algarismo" do
		it "Quando receber 'I' deve retornar 1" do
			expect(r2i.converter('I')).to eq 1
		end
		it "Quando receber 'V' deve retornar 5" do
			expect(r2i.converter('V')).to eq 5
		end
		it "Quando receber 'X' deve retornar 10" do
			expect(r2i.converter('X')).to eq 10
		end
		it "Quando receber 'L' deve retornar 50" do
			expect(r2i.converter('L')).to eq 50
		end
		it "Quando receber 'C' deve retornar 100" do
			expect(r2i.converter('C')).to eq 100
		end
		it "Quando receber 'D' deve retornar 500" do
			expect(r2i.converter('D')).to eq 500
		end
		it "Quando receber 'M' deve retornar 1000" do
			expect(r2i.converter('M')).to eq 1000
		end
	end
	
	describe "Conversao de 2(dois) algarismos iguais" do
		it "Quando receber 'II' deve retornar 2" do
			expect(r2i.converter('II')).to eq 2
		end
		it "Quando receber 'XX' deve retornar 20" do
			expect(r2i.converter('XX')).to eq 20
		end
		it "Quando receber 'CX' deve retornar 110" do
			expect(r2i.converter('CX')).to eq 110
		end
	end
	
	describe "Conversao de 3(tres) algarismos iguais" do
		it "Quando receber 'III' deve retornar 3" do
			expect(r2i.converter('III')).to eq 3
		end
		it "Quando receber 'XXX' deve retornar 30" do
			expect(r2i.converter('XXX')).to eq 30
		end
		it "Quando receber 'CCC' deve retornar 300" do
			expect(r2i.converter('CCC')).to eq 300
		end
	end
	
	describe "Conversao de varios algarismos diferentes" do
		it "Quando receber 'MMCCCLVI' deve retornar 2356" do
			expect(r2i.converter('MMCCCLVI')).to eq 2356
		end
		it "Quando receber 'CDL' deve retornar 450" do
			expect(r2i.converter('CDL')).to eq 450
		end
		it "Quando receber 'MMMCCCXCIX' deve retornar 3399" do
			expect(r2i.converter('MMMCCCXCIX')).to eq 3399
		end
	end
	
	describe "Conversao de algarismos invalidos" do
		it "Quando receber 'S' deve retornar: S nao eh um valor valido" do
			expect(r2i.converter('S')).to eq "S nao eh um valor valido"
		end
		it "Quando receber 'VV' deve retornar: VV nao eh um valor valido" do
			expect(r2i.converter('VV')).to eq "VV nao eh um valor valido"
		end
		it "Quando receber 'IC' deve retornar: IC nao eh um valor valido" do
			expect(r2i.converter('IC')).to eq "IC nao eh um valor valido"
		end
		it "Quando receber 'VVV' deve retornar: VVV nao eh um valor valido" do
			expect(r2i.converter('VVV')).to eq "VVV nao eh um valor valido"
		end
		it "Quando receber 'IIII' deve retornar: IIII nao eh um valor valido" do
			expect(r2i.converter('IIII')).to eq "IIII nao eh um valor valido"
		end
		it "Quando receber 'XXXXX' deve retornar: XXXXX nao eh um valor valido" do
			expect(r2i.converter('XXXXX')).to eq "XXXXX nao eh um valor valido"
		end
	end
	
	describe "Validando o Limite ate 3999" do
		it "Quando receber MMMMCMXCIX deve retornar 3999" do
			expect(r2i.converter('MMMCMXCIX')).to eq 3999
		end
	end
	
	describe "Conversao inteiros para romanos" do
		it "Quando receber 400 deve retornar CD" do
			expect(r2i.converter('400')).to eq "CD"
		end
		it "Quando receber 11 deve retornar XI" do
			expect(r2i.converter('11')).to eq "XI"
		end
		it "Quando receber 50 deve retornar L" do
			expect(r2i.converter('50')).to eq "L"
		end
		it "Quando receber 3999 deve retornar MMMCMXCIX" do
			expect(r2i.converter('3999')).to eq "MMMCMXCIX"
		end
	end
	
	describe "Validando o limite de 1 a 3999" do
		it "Quando receber 10000 deve retornar: Informar valor entre 1 ate 3999" do
			expect(r2i.converter('10000')).to eq "Informar valor entre 1 ate 3999"
		end
		it "Quando receber 4000 deve retornar: Informar valor entre 1 ate 3999" do
			expect(r2i.converter('4000')).to eq "Informar valor entre 1 ate 3999"
		end
		it "Quando receber 5000 deve retornar: Informar valor entre 1 ate 3999" do
			expect(r2i.converter('5000')).to eq "Informar valor entre 1 ate 3999"
		end
	end
			
	
end
