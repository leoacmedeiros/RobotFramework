*** Setting ***
Library   SeleniumLibrary
Library         String

*** Variables ***
${BROWSER}    chrome
${URL}        http://automationpractice.com/index.php
#Tipo Lista
@{TELEFONE}    (61)3351-7788    (61)99914-7258

#Tipo Dicionário
&{PESSOA}    firstName=Leonardo    lastName=Medeiros   email=leonardo@email.com    password=123456teste   company=Mirante

*** Keywords ***
Abrir navegador
   Open Browser   ${URL}  ${BROWSER}
   Maximize Browser Window

Fechar navegador
  Close Browser

#Cenário 01: Listar Produtos
Dado que esteja na página home do site
  Title Should Be    My Store

E passe o mouse por cima da Categoria "Women" no menu principal superior de categorias
  Mouse Over    xpath=//li//a[@title='Women']

E clique na sub-categoria "${CATEGORIA}"
  Click Element    xpath=(//li//a[@title='${CATEGORIA}'])[1]

Então irá apresentar os produtos da categoria
  Wait Until Element Is Visible    xpath=//div[@class='cat_desc']
  Page Should Contain    Summer Dresses

#Cenário 02: Adicionar Produtos no Carrinho
E digite o nome do produto "${NOMEPRODUTO}" no campo de pesquisa
  Input Text    id=search_query_top    ${NOMEPRODUTO}

E clique para pesquisar
  Click Button    name=submit_search

E clique no botão "Add to cart" do produto
  Mouse Over    xpath=//a//img[@src='http://automationpractice.com/img/p/1/1-home_default.jpg']
  Click Element    xpath=(//a//span[text()='Add to cart'])[1]

E clique no botão "Proced to checkout"
  Wait Until Element Is Visible    xpath=//span[contains(text(),'Proceed to checkout')]
  Click Element    xpath=//span[contains(text(),'Proceed to checkout')]

Então o produto deve ser adicionado ao carrinho
  Element Text Should Be    id=summary_products_quantity    1 Product
  Page Should Contain    Total products

# Cenário 03: Remover Produtos
E clique no botão de remoção de produtos no produto do carrinho
  Click Element    xpath=//div//i[@class='icon-trash']

Então os produtos devem ser removidos
  Wait Until Element Is Visible    xpath=//p[@class='alert alert-warning']
  Element Text Should Be    xpath=//p[@class='alert alert-warning']    Your shopping cart is empty.

# Cenário 04: Adicionar Cliente
E clique no botão superior direito "Sign in"
  Click Element    xpath=//div//a[contains(text(),'Sign in')]

E insira um e-mail válido
  ${EMAIL_ALEATORIO}    Generate Random String
  Input Text    id=email_create    ${EMAIL_ALEATORIO}@gmail.com

E clique no botão "Create an account"
  Click Button    id=SubmitCreate

E preencha os campos obrigatórios
  Wait Until Element Is Visible    id=id_gender1
  Click Element                    id=id_gender1
  Input Text                       id=customer_firstname    ${PESSOA.firstName}
  Input Text                       id=customer_lastname     ${PESSOA.lastName}
  Input Text                       id=email                 ${PESSOA.email}
  Input Text                       id=passwd                ${PESSOA.password}

  Select From List By Value          id=days    5
  Scroll Element Into View           id=id_state
  #Wait Until Element Is Visible      id=id_state
  #Element Should Be Focused          id=id_state
  #Get Element Attribute              id=id_state    id
  Select From List By Index          id=id_state    10
  Input Text                         id=phone             ${TELEFONE[0]}
  Input Text                         id=phone_mobile      ${TELEFONE[1]}



# Informar um e-mail válido
#   Wait Until Element Is Visible   id=email_create
#   ${EMAIL}                        Generate Random String
#   Input Text                      id=email_create    ${EMAIL}@testerobot.com
