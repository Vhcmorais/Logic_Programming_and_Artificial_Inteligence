% RachaCuca - Atividade 1 - Problema: Entregas Rápidas%
% Autor: Vitor Henrique Carvalho de Morais %

% ENTREGAS RÁPIDAS %

/* Cinco motoboys estão lado a lado se preparando para fazer entregas. Cada um fará uma entrega em uma determinada região da cidade.
Descubra, usando as dicas, as características deles e de suas motos, assim como os locais de entrega. */

resolve(S) :- 
    S = entregadores(_, _, _, _, _),
/* 1) O motoboy de capacete Amarelo está em algum lugar entre a moto com a placa BBB-2222 e quem vai para o Centro, nessa ordem. */
	em_algum_lugar_entre(B, A, C, S),
    capacete(B, amarelo),
    placa(A, bbb2222),
    regiao(C, centro),
/* 2) Fagner está exatamente à esquerda do dono da moto menos rodada. */
	exatamente_a_esquerda(D, E, S), 
    nome(D, fagner),
    quilometragem(E, '20mil'),
/* 3) A moto de placa EEE-5555 está em uma das pontas. */
	em_uma_das_pontas(F, S),
    placa(F, eee5555),
/* 4) A moto com 40 mil Km está em algum lugar à direita do motoboy de capacete Amarelo. */
	algum_lugar_a_direita(G, H, S),
    quilometragem(G, '40mil'),
    capacete(H, amarelo),
/* 5) Régis está na quinta posição. */
	quinta_posicao(I, S),
    nome(I, regis),
/* 6) O dono do capacete Azul está em algum lugar entre o quem tem 32 anos e quem está com o capacete Branco, nessa ordem. */
	em_algum_lugar_entre(K, J, L, S),
    capacete(K, azul),
    idade(J, 32),
    capacete(L, branco),
/* 7) Na terceira posição está a moto de placa AAA-1111. */
	terceira_posicao(M, S),
    placa(M, aaa1111),
/* 8) O motoboy de 25 anos está em algum lugar entre o motoboy de capacete Amarelo e o motoboy mais velho, nessa ordem. */
   	em_algum_lugar_entre(O, N, P, S),
   	idade(O, 25), 
   	capacete(N, amarelo),
    idade(P, 37),
/* 9) O motoboy de capacete Amarelo está em algum lugar à esquerda da moto de placa DDD-4444. */ 
	algum_lugar_a_esquerda(Q, R, S),
	capacete(Q, amarelo),
    placa(R, ddd4444),
/* 10) Quem vai para a zona Leste está exatamente à direita de quem vai para a zona Norte. */
	exatamente_a_direita(T, U, S), 
    regiao(T, leste),
    regiao(U, norte),
/* 11) A moto de placa AAA-1111 está com 30 mil Km. */
 	algum_motoboy(V, S),
    placa(V, aaa1111),
    quilometragem(V, '30mil'),
/* 12) Clayton está em algum lugar entre o motoboy que vai para a zona Sul e o Jardel, nessa ordem. */
	em_algum_lugar_entre(B1, A1, C1, S),
    nome(B1, clayton),
    regiao(A1, sul),
    nome(C1, jardel),
/* 13) O motoboy de 28 anos está em algum lugar à direita do motoboy de capacete Amarelo. */
	algum_lugar_a_direita(D1, E1, S),
    idade(D1, 28),
    capacete(E1, amarelo),
/* 14) A moto de placa DDD-4444 está exatamente à esquerda do motoboy que vai para o Centro. */
	exatamente_a_esquerda(F1, G1, S),
    placa(F1, ddd4444),
    regiao(G1, centro),
/* 15) O motoboy de 25 anos está ao lado do motoboy que vai para a zona Leste. */
	ao_lado(H1, I1, S),
    idade(H1, 25),
    regiao(I1, leste),
/* 16) O motoboy do capacete Amarelo está em algum lugar entre a moto com 60 mil Km e o motoboy de 37 anos. */
	em_algum_lugar_entre(K1, J1, L1, S),
    capacete(K1, amarelo),
    quilometragem(J1, '60mil'),
    idade(L1, 37),
/* 17) Na primeira posição está o motoboy de 32 anos. */
	primeira_posicao(M1, S),
    idade(M1, 32),
/* 18) Clayton está exatamente à esquerda do dono do capacete Verde. */
	exatamente_a_esquerda(N1, O1, S),
    nome(N1, clayton),
    capacete(O1, verde),
/* 19) Jardel está em algum lugar à esquerda da moto com 20 mil Km. */
 	algum_lugar_a_esquerda(P1, Q1, S),
    nome(P1, jardel),
    quilometragem(Q1, '20mil'),
/* 20) Quem vai para a zona Norte está em algum lugar entre a moto de placa BBB-2222 e quem vai para a zona Oeste, nessa ordem. */
	em_algum_lugar_entre(T1, R1, U1, S),
    regiao(T1, norte),
    placa(R1, bbb2222),
    regiao(U1, oeste),
/* FALTANTES */
    algum_motoboy(V1, S),
    capacete(V1, vermelho),
    algum_motoboy(A2, S),
    nome(A2, odair),
    algum_motoboy(B2, S),
    idade(B2, 20),
    algum_motoboy(C2, S),
    quilometragem(C2, '50mil'),
    algum_motoboy(D2, S),
    placa(D2, ccc3333).
    
/* REGRAS E ESTRUTURAS */

capacete(motoboy(C, _, _, _, _, _), C).
nome(motoboy(_, N, _, _, _, _), N).
idade(motoboy(_, _, I, _, _, _), I).
regiao(motoboy(_, _, _, R, _, _), R).
quilometragem(motoboy(_, _, _, _, Q, _), Q).
placa(motoboy(_, _, _, _, _, P), P).

primeira_posicao(X, entregadores(X, _, _, _, _)).
terceira_posicao(X, entregadores(_, _, X, _, _)).
quinta_posicao(X, entregadores(_, _, _, _, X)).

algum_motoboy(X, entregadores(X, _, _, _, _)).
algum_motoboy(X, entregadores(_, X, _, _, _)).
algum_motoboy(X, entregadores(_, _, X, _, _)).
algum_motoboy(X, entregadores(_, _, _, X, _)).
algum_motoboy(X, entregadores(_, _, _, _, X)).

exatamente_a_direita(X,Y, entregadores(Y,X,_,_,_)).
exatamente_a_direita(X,Y, entregadores(_,Y,X,_,_)).
exatamente_a_direita(X,Y, entregadores(_,_,Y,X,_)).
exatamente_a_direita(X,Y, entregadores(_,_,_,Y,X)).
exatamente_a_esquerda(X,Y,S) :-
    exatamente_a_direita(Y,X,S).

em_algum_lugar_entre(M,I,F, entregadores(I,M,F,_,_)).
em_algum_lugar_entre(M,I,F, entregadores(I,M,_,F,_)).
em_algum_lugar_entre(M,I,F, entregadores(I,M,_,_,F)).
em_algum_lugar_entre(M,I,F, entregadores(I,_,M,F,_)).
em_algum_lugar_entre(M,I,F, entregadores(I,_,M,_,F)).
em_algum_lugar_entre(M,I,F, entregadores(I,_,_,M,F)).
em_algum_lugar_entre(M,I,F, entregadores(_,I,M,F,_)).
em_algum_lugar_entre(M,I,F, entregadores(_,I,M,_,F)).
em_algum_lugar_entre(M,I,F, entregadores(_,I,_,M,F)).
em_algum_lugar_entre(M,I,F, entregadores(_,_,I,M,F)).

algum_lugar_a_esquerda(X,Y, entregadores(X,Y,_,_,_)).
algum_lugar_a_esquerda(X,Y, entregadores(X,_,Y,_,_)).
algum_lugar_a_esquerda(X,Y, entregadores(X,_,_,Y,_)).
algum_lugar_a_esquerda(X,Y, entregadores(X,_,_,_,Y)).
algum_lugar_a_esquerda(X,Y, entregadores(_,X,Y,_,_)).
algum_lugar_a_esquerda(X,Y, entregadores(_,X,_,Y,_)).
algum_lugar_a_esquerda(X,Y, entregadores(_,X,_,_,Y)).
algum_lugar_a_esquerda(X,Y, entregadores(_,_,X,Y,_)).
algum_lugar_a_esquerda(X,Y, entregadores(_,_,X,_,Y)).
algum_lugar_a_esquerda(X,Y, entregadores(_,_,_,X,Y)).
algum_lugar_a_direita(X,Y,S) :-
    algum_lugar_a_esquerda(Y,X,S).

ao_lado(X,Y,S) :-
    exatamente_a_esquerda(X,Y,S);
    exatamente_a_esquerda(Y,X,S).

em_uma_das_pontas(X, entregadores(X,_,_,_,_)).
em_uma_das_pontas(X, entregadores(_,_,_,_,X)).