Estou testando o R no VSCode. Para isso, escrevi um código de exemplo para a modelagem ecológica com a qual estou trabalhando, mais especificamente em relação à degradação de PET com C.reinhardtii.

Existem algumas formas de modelar a degradação do plástico com C.reinhardtii

A equação Monod é muito utilizada para descrever a a relação entre a taxa de um processo biológico e a concentração de um substrato limitante.Por exemplo, no caso da degradação do plástico com C.reinhardtii, a equação Monod pode ser usada pra modelar a taxa de degradação(ou crescimento) como uma função da concentração do plástico. A equação é dada por:

μ = μmax * [S] / (Ks + [S]

onde μ é a taxa específica do crecimento da C.reinhardtii, μmax é a taxa específica máxima de crescimento, [S] é a concentração do plástico, e Ks é a constante de meia-saturação.

Outra forma de modelar é com a Equação de Michaelis-Menten, que é semelhante com a de Monod, mas é usada para descrever a cinética da enzima. No caso da degradação do plástico, estamos utilizando PETase e MHETase A equação é dada por:

v = (Vmax * [S]) / (Km + [S])

onde v é a taxa de degradação do plástico,Vmax é a taxa máxima de degradação do plástico, [S] é a concentração de plástico e Km é a constante de Michaelis-Menten.

Outra forma de modelar seria com a equação de crescimento logístico, que é usada para modelar o crescimento de populações sujeitas a limitações de recursos.No caso de C.reinhardtii, a disponibilidade de plástico pode ser considerada um recurso limitante.A equação é dada por:

dN/dt = rN * (1 - (N/K))

onde N é a densidade populacional de C.reinhardtii, t é o tempo, r é a taxa de crescimento intrínseca e K é a capacidade de carga do ambiente

Podemos modelar combinando essas equações ou utilizando-as individualmente, levando em consideração fatores como disponibilidade de nutrientes, cinética enzimática e dinâmica populacional.

Aqui o meu objetivo será escrever um código de exemplo do crescimento de C.reinhardtii e a degradação do plástico usando a equação de crescimento logístico, em que o plástico será considerado como substrato limitante para o crescimento da C.reinhardtii.
