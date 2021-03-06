% Fatos de progenitor
progenitor('Maria', 'Rodrigo').
progenitor('Maria', 'Helena').
progenitor('José', 'Rodrigo').
progenitor('José', 'Helena').
progenitor('Renata', 'Marcelo').
progenitor('Renata', 'Raquel').
progenitor('Paulo', 'Marcelo').
progenitor('Paulo', 'Raquel').
progenitor('Helena', 'Augusto').
progenitor('Helena', 'Flávia').
progenitor('Marcelo', 'Augusto').
progenitor('Marcelo', 'Flávia').
progenitor('Suzana', 'Carla').
progenitor('Suzana', 'João').
progenitor('Augusto', 'Carla').
progenitor('Augusto', 'João').
progenitor('Flávia', 'Viviane').
progenitor('Flávia', 'Humberto').
progenitor('Timóteo', 'Viviane').
progenitor('Timóteo', 'Humberto').
% Fatos de masculino
masculino('José').
masculino('Paulo').
masculino('Rodrigo').
masculino('Marcelo').
masculino('Augusto').
masculino('Timóteo').
masculino('João').
masculino('Humberto').
% Fatos de feminino
feminino('Maria').
feminino('Renata').
feminino('Helena').
feminino('Raquel').
feminino('Suzana').
feminino('Flávia').
feminino('Carla').
feminino('Viviane').
% Regra pai
pai(Pai, Filho_a) :-
   masculino(Pai),
   progenitor(Pai, Filho_a).
% Regra mãe
mae(Mae, Filho_a) :-
    feminino(Mae),
    progenitor(Mae, Filho_a).
% Regra filho
filho(Filho, Pai_Mae) :-
    masculino(Filho),
    progenitor(Pai_Mae, Filho).
% Regra filha
filha(Filha, Pai_Mae) :-
    feminino(Filha),
    progenitor(Pai_Mae, Filha).
% Regra avô
avoo(Avo, Neto_a) :-
    masculino(Avo),
    progenitor(Avo, Pai_Mae),
    progenitor(Pai_Mae, Neto_a).
% Regra avó
avoa(Avo, Neto_a) :-
    feminino(Avo),
    progenitor(Avo, Mae_a),
    progenitor(Mae_a, Neto_a).

avoa(Avo, Neto_a) :-
    feminino(Avo),
    progenitor(Avo, Mae_a),
    progenitor(Mae_a, Neto_a).
% Regra neto
neto(Neto, Avo_a) :-
    masculino(Neto),
    progenitor(Pai_Mae, Neto),
    progenitor(Avo_a, Pai_Mae).
% Regra neta
neta(Neta, Avo_a) :-
    feminino(Neta),
    progenitor(Pai_Mae, Neta),
    progenitor(Avo_a, Pai_Mae).
% Regra bisavô
bisavoo(Bisavo, Bisneto_a) :-
    masculino(Bisavo),
    progenitor(Bisavo, Avo_a),
    progenitor(Avo_a, Pai_Mae),
    progenitor(Pai_Mae, Bisneto_a).
% Regra bisavó
bisavoa(Bisavo, Bisneto_a) :-
    feminino(Bisavo),
    progenitor(Bisavo, Avo_a),
    progenitor(Avo_a, Pai_Mae),
    progenitor(Pai_Mae, Bisneto_a).
% Regra bisneto
bisneto(Bisneto, Bisavo_a) :-
    masculino(Bisneto),
    progenitor(Pai_Mae, Bisneto),
    progenitor(Avo_a, Pai_Mae),
    progenitor(Bisavo_a, Avo_a).
% Regra bisneta
bisneta(Bisneta, Bisavo_a) :-
    feminino(Bisneta),
    progenitor(Pai_Mae, Bisneta),
    progenitor(Avo_a, Pai_Mae),
    progenitor(Bisavo_a, Avo_a).
% Regra irmaos
irmaos(Irmao1, Irmao2) :-
    progenitor(Pai_Mae1, Irmao1),
    progenitor(Pai_Mae2, Irmao2),
    Pai_Mae1==Pai_Mae2.
% Regra irmão
irmao(Irmao, Irmao_a) :-
    masculino(Irmao),
    progenitor(Pai_Mae1, Irmao),
    progenitor(Pai_Mae2, Irmao_a),
    Pai_Mae1==Pai_Mae2.
% Regra irmã
irma(Irma, Irmao_a) :-
    feminino(Irma),
    progenitor(Pai_Mae1, Irma),
    progenitor(Pai_Mae2, Irmao_a),
    Pai_Mae1==Pai_Mae2.
% Regra tio
tio(Tio, Sobrinho_a) :-
    masculino(Tio),
    progenitor(Pai_Mae, Sobrinho_a),
    irmaos(Tio, Pai_Mae).
% Regra tia
tia(Tia, Sobrinho_a) :-
    feminino(Tia),
    progenitor(Pai_Mae, Sobrinho_a),
    irmaos(Tia, Pai_Mae).
% Regra sobrinho
sobrinho(Sobrinho, Tio_a) :-
% Regra sobrinha
sobrinha(Sobrinha, Tio_a) :-
% Regra primo
primo(Primo, Primo_a) :-
% Regra prima
prima(Prima, Primo_a) :-
% Regra casados
casados(Esposo, Esposa) :-
casados(Esposa, Esposo) :-
% Regra sogro
sogro(Sogro, Genro_Nora) :-
% Regra sogra
sogra(Sogra, Genro_Nora) :-
    feminino(Sogra),
    progenitor(Sogra, Filho_a),
    progenitor(Filho_a, Neto_a),
    progenitor(Genro_Nora, Neto_a).

sogra(Sogra, Genro_Nora) :-
	progenitor(Genro_Nora, Neto_a),
    progenitor(Sogra, Filho_a_Sogra),
    progenitor(Filho_a_Sogra, Neto_a),
	feminino(Sogra).

?- sogra(X, 'Marcelo'), write(X), nl.
% Regra genro
genro(Genro, Sogro_a) :-
% Regra nora
nora(Nora, Sogro_a) :-
% Regra cunhado
cunhado(Cunhado, Conjugue) :-
% Regra cunhada
cunhada(Cunhada, Conjugue) :-
