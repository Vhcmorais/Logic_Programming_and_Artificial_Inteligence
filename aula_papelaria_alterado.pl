% Sistema de Papelaria 
:- dynamic produto/3, cont_produto/1, estoque/2, preco/2.

cont_produto(4).

% Definição - Estoque dos produtos
estoque(1, 100).
estoque(2, 200).
estoque(3, 25).
estoque(4, 79).

% Definição - Preço dos produtos
preco(1, 10.10).
preco(2, 2.30).
preco(3, 7.90).
preco(4, 35.00).


% Definição - produto(id, nome, peça, preço, estoque).
produto(1, "caderno", "unidade", 10.10, 100).
produto(2, "lápis", "unidade", 2.30, 200).
produto(3, "lapiseira", "unidade", 7.90, 25).
produto(4, "papel sulfite", "resma", 35.90, 79).

% Predicados - Deleção de produtos
deleta_produto_por_Id(Id) :-
    retract(produto(Id,_,_)),
    retract(estoque(Id,_)),
    retract(preco(Id,_)).

deleta_produto_por_nome(Nome) :-
    retract(produto(Id,Nome,_)),
    retract(estoque(Id,_)),
    retract(preco(Id,_)).

% Predicados - Inserção de Produtos
insere_produto(Nome,Unidade,Preco,Estoque) :-
    retract(cont_produto(N)),
    Nsoma is N+1,
    assert(cont_produto(Nsoma)),
    assert(produto(Nsoma, Nome, Unidade)),
    assert(estoque(Nsoma,Estoque)),
    assert(preco(Nsoma,Preco)).

% Predicados - Testes
teste_insere_produto :-
    listing(produto),
    listing(preco),
    listing(estoque),
    insere_produto("vareta", "peça", 8.45, 1000),
    listing(produto),
    listing(preco),
    listing(estoque).
