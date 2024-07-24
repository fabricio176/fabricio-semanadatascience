import turtle
import math

# Configuração inicial da tartaruga
t = turtle.Turtle()
t.speed(10)  # Aumentamos a velocidade para desenhar mais rapidamente

# Função para desenhar um padrão geométrico preenchido
def desenhar_padrao(t, tamanho, num_lados, cor):
    t.fillcolor(cor)
    t.begin_fill()
    for _ in range(num_lados):
        t.forward(tamanho)
        t.right(360 / num_lados)
    t.end_fill()

# Configurações do padrão
tamanho_inicial = 100
incremento = 20
num_iteracoes = 10
num_lados = 6   

# Cores para o padrão
cores = ['red', 'orange', 'yellow', 'green', 'blue', 'purple']

# Desenhar o padrão repetitivo e colorido
for i in range(num_iteracoes):
    cor = cores[i % len(cores)]  # Alternar entre as cores da lista
    desenhar_padrao(t, tamanho_inicial + i * incremento, num_lados, cor)
    t.right(360 / num_lados)

# Esconder a tartaruga e finalizar
t.hideturtle()
turtle.done()
