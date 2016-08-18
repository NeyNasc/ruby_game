
def da_boas_vindas
	puts "Bem vindo ao jogo da adivinhação"
	puts "Qual o seu nome?"
	nome = gets.strip
	puts "\n\n\n\n"
	puts "Iremos começar o jogo para você, #{nome}"
end

def sorteia_numero_secreto
	puts "Escolhendo um número secreto entre 0 e 200..."
	sorteado = rand(200)
	puts "Escolhido! que tal adivinhar hoje nosso número secreto?"
	sorteado.to_i
end

def pede_um_numero (chutes, tentativa, limite_de_tentativas)
	puts "\n\n\n\n"
	puts "Tentativa #{tentativa} de #{limite_de_tentativas}"
	puts "Chutes até agora: #{chutes}"
	puts "Entre com o número"
	chute = gets.strip
	puts "Será que acertou? Você chutou #{chute}"
	chute.to_i
end

def verifica_se_acertou(numero_secreto,chute)
	acertou = numero_secreto == chute

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
pontos_ate_asgora = 1000

limite_de_tentativas = 5
chutes =[]
total_de_chutes = 0


for tentativa in 1..limite_de_tentativas
	chute = pede_um_numero chutes, tentativa, limite_de_tentativas
	chutes << chute
	pontos_a_perder = (chute - numero_secreto).abs/2.0

	pontos_ate_asgora -= pontos_a_perder

	break if verifica_se_acertou numero_secreto, chute	
end

puts "Você ganhou #{pontos_ate_asgora} pontos"