% Sistema de Papelaria 
:- dynamic produto/5, cont_produto/1.

cont_produto(4).

% Definição - produto(id, nome, peça, preço, estoque).
produto(1, "caderno", "unidade", 10.10, 100).
produto(2, "lápis", "unidade", 2.30, 200).
produto(3, "lapiseira", "unidade", 7.90, 25).
produto(4, "papel sulfite", "resma", 35.90, 79).

% Predicados - Deleção de produtos
deleta_produto_por_Id(Id) :-
    retractall(produto(Id,_,_,_,_)).

deleta_produto_por_nome(Nome) :-
    retractall(produto(_,Nome,_,_,_)).

% Predicados - Inserção de Produtos
insere_produto(Nome,Unidade,Preco,Estoque) :-
    retract(cont_produto(N)),
    Nsoma is N+1,
    assert(cont_produto(Nsoma)),
    assert(produto(Nsoma, Nome, Unidade, Preco, Estoque)).

% Predicados - Compra de Produtos