
def da_boas_vindas
	puts "Bem vindo ao jogo da adivinhação"
	puts "Qual o seu nome?"
	nome = gets
	puts "\n\n\n\n"
	puts "Iremos começar o jogo para você, "+nome
end

def sorteia_numero_secreto
	puts "Escolhendo um número secreto entre 0 e 200..."
	sorteado = 175
	puts "Escolhido! que tal adivinhar hoje nosso número secreto?"
	sorteado
end

def pede_um_numero (tentativa, limite_de_tentativas)
	puts "\n\n\n\n"
	puts "Tentativa "+ tentativa.to_s+" de "+limite_de_tentativas.to_s
	chute = gets
	puts "Será que acertou? Você chutou "+chute
	chute.to_i
end

def verifica_se_acertou(numero_secreto,chute)
	acertou = $numero_secreto == chute

	if acertou
		puts "Acertou!"
		return true
	else
		maior = numero_secreto>chute
		if maior
			puts "O número secreto é maior!"
		else
			puts "O número secreto é menor!"
		end
		false
	end
end


#Invocações principais
da_boas_vindas
numero_secreto = sorteia_numero_secreto

limite_de_tentativas = 5

for tentativa in 1..limite_de_tentativas
	chute = pede_um_numero tentativa, limite_de_tentativas
	break if verifica_se_acertou numero_secreto, chute	
end