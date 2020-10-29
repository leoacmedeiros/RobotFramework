*** Settings ***
Resource         ../resource/Resource.robot
Test Setup       Abrir navegador
Test Teardown    Fechar navegador

*** Test Case ***
Caso de Teste 01: Pesquisar produto existente
  Dado que estou na página home do site
  Quando eu pesquisar pelo produto "Blouse"
  Então o produto "Blouse" deve ser listado na página de resultado da busca

Caso de Teste 02: Pesquisar produto não existente
  Dado que estou na página home do site
  Quando eu pesquisar pelo produto "itemNaoExistente"
  Então a página deve exibir a mensagem "No results were found for your search "produtoNãoExistente""

*** Keywords ***
  Dado que estou na página home do site
    Acessar a página home do site

  Quando eu pesquisar pelo produto "${PRODUTO}"
    Digitar o nome do produto "${PRODUTO}" no campo de pesquisa
    Clicar no botão pesquisar

  Então o produto "${PRODUTO}" deve ser listado na página de resultado da busca
    Conferir se o produto "${PRODUTO}" foi listado no site

  Então a página deve exibir a mensagem "${PRODUTO_NAO_EXISTENTE}"
    Conferir mensagem de erro "${PRODUTO_NAO_EXISTENTE}"