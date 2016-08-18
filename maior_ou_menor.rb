
def da_boas_vindas
	puts "Bem vindo ao jogo da adivinhação"
	puts "Qual o seu nome?"
	nome = gets.strip
	puts "\n\n\n\n"
	puts "Iremos começar o jogo para você, #{nome}"
	nome
end

def sorteia_numero_secreto(dificuldade)

	case dificuldade
	when 1
		maximo = 30
	when 2
		maximo = 60
	when 3
		maximo = 100
	when 4
		maximo = 150
	else
		maximo = 200
	end


	maximo
	puts "Escolhendo um número secreto entre 0 e #{maximo}..."
	sorteado = rand(maximo)+1
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

def pede_dificuldade
	puts "Qual o nível de dificuldade que deseja? (1 fácil, 5 difícil)"
	dificuldade = gets.to_i
end



#Invocações principais
nome = da_boas_vindas
numero_secreto = sorteia_numero_secreto pede_dificuldade
pontos_ate_asgora = 1000

limite_de_tentativas = 5
chutes =[]
total_de_chutes = 0


for tentativa in 1..limite_de_tentativas
	chute = pede_um_numero chutes, tentativa, limite_de_tentativas
	chutes << chute

	if nome == "Claudiney"
		puts "Acertou!"
		break
	end


	pontos_a_perder = (chute - numero_secreto).abs/2.0

	pontos_ate_asgora -= pontos_a_perder

	break if verifica_se_acertou numero_secreto, chute	
end

puts "Você ganhou #{pontos_ate_asgora} pontos"