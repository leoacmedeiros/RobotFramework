*** Settings ***
Resource        ../resource/ResourceProdutoCliente.robot
Test Setup      Abrir navegador
#Test Teardown   Fechar navegador


*** Test Case ***
Cenário 01: Listar Produtos
  Dado que esteja na página home do site
  E passe o mouse por cima da Categoria "Women" no menu principal superior de categorias
  E clique na sub-categoria "Summer Dresses"
  Então irá apresentar os produtos da categoria

Cenário 02: Adicionar Produtos no Carrinho
  Dado que esteja na página home do site
  E digite o nome do produto "t-shirt" no campo de pesquisa
  E clique para pesquisar
  E clique no botão "Add to cart" do produto
  E clique no botão "Proced to checkout"
  Então o produto deve ser adicionado ao carrinho

Cenário 03: Remover Produtos
  Dado que esteja na página home do site
  E digite o nome do produto "t-shirt" no campo de pesquisa
  E clique para pesquisar
  E clique no botão "Add to cart" do produto
  E clique no botão "Proced to checkout"
  E clique no botão de remoção de produtos no produto do carrinho
  Então os produtos devem ser removidos

Cenário 04: Adicionar Cliente
  Dado que esteja na página home do site
  E clique no botão superior direito "Sign in"
  E insira um e-mail válido
  E clique no botão "Create an account"
  E preencha os campos obrigatórios
#   E clique em "Register" para finalizar o cadastro
#   Então a página de gerenciamento da conta deve ser exibida
