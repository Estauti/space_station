Este projeto foi desenvolvido para a disciplina de Sistemas Operacionais I, sob orientação do professor Claudinei Dias.

A proposta do projeto é de que cada equipe fosse responsável por apresentar uma proposta de problema e solução que implemente exclusão mútua, filas de execução, ou outro assunto pertinente à matéria. Feito isso, essa documentação seria sorteada para que outra equipe desenvolvesse a solução proposta.

Abaixo, segue a documentação feita pela equipe responsável pela proposta que me foi sorteada. Os autores estão devidamente citados na própria documentação.

<hr>

#### Alunos: André, Phelipe Hass, Samuel J. Ferraz
# FIXBOT

### Objetivo:
Desenvolver um software que mantenha alguns robôs atuando no diagnóstico
e manutenção de uma estação espacial.

### Descrição:
Uma estação espacial, eventualmente é atingida por fragmentos de
meteoros. O diagnóstico e a manutenção que antes era realizado pelos astronautas,
tornou-se uma tarefa perigosa dado o risco de serem atingidos; então será enviado
uma mini-estação com 5 robôs que farão este trabalho (processo).
Cada robô vai ocupar uma posição fixa em uma fila de espera, onde entre
eles haverá um módulo de bateria, uma anterior a ele e uma posterior. Para
trabalhar na estação espacial, eles precisam de dois módulos de bateria (exceto os
das extremidades que usam apenas 1), que ao final do trabalho, às retornam ao
lugar original e voltam para suas posições. As bateria possuem uma tecnologia
específica, que seu tempo de carregamento é irrelevante e pode ser
desconsiderado no processo de gerenciamento do trabalho.
O comportamento dos robôs se resume em esperar um tempo, tentar anexar
a si os módulos de bateria e caso consiga, sair para diagnosticar e fazer alguma
manutenção na estação. Estes módulos devem ser pegos 1 por vez, se não
conseguir reunir os dois módulos, o robô não pode sair.
Como cada um possui uma tarefa específica, para que a estação espacial
não seja comprometida por alguma avaria não consertada, eventualmente todos
devem ir trabalhar. Os robôs das extremidades possuem a mesma instrução de
tarefa, então, para não dar problema, não devem sair ao mesmo tempo.
Cada robô (Thread):

* Vai ocupar uma posição fixa em uma fila de espera.
* Entre um robô e outro, haverá um módulo de bateria.
* Cada robô precisa usar 2 módulos carregados para trabalhar, uma do próximo e uma do anterior. (exceto os das extremidades da fila),
    * Os robôs das extremidades usam apenas 1 módulo carregado.
* Tem dois estados, esperar e sair para trabalhar.

Restrições:
* Para que a estação não seja comprometida, todos os robôs devem trabalhar.

* Um robô de uma extremidade só pode sair se o da outra não sair pois ambos trabalham nos mesmos locais na estação espacial.
* Um robô só pode pegar 1 módulo de bateria por vez.

![sdfsdf](https://i.snag.gy/2Gurla.jpg)