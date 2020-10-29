*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${BROWSER}      chrome
${URL}          http://automationpractice.com/index.php


*** Keywords ***
#### Setup e Teardown ####

Abrir navegador
    Open Browser    ${URL}   ${BROWSER}
    Maximize Browser Window

Fechar navegador
    Close Browser

### passo-a-passo # Caso de teste 1
Acessar a página home do site
  Title Should Be   My Store

Digitar o nome do produto "${PRODUTO}" no campo de pesquisa
  Input Text    id=search_query_top    ${PRODUTO}

Clicar no botão pesquisar
  Click Element    name=submit_search

Conferir se o produto "${PRODUTO}" foi listado no site
  Wait Until Element Is Visible     xpath=//span[contains(text(),'result has been found.')]
  Title Should Be                   Search - My Store
  Page Should Contain Image         xpath=//img[@src='http://automationpractice.com/img/p/7/7-home_default.jpg']
  Page Should Contain Link          xpath=//*[@id='center_column']//a[@class='product-name'][contains(text(),'${PRODUTO}')]
  Element Should Contain            xpath=(//a[@class='product-name'][contains(text(),'Blouse')])[2]    ${PRODUTO}


  ### passo-a-passo # Caso de teste 2
Conferir se a página home foi exibida
  Page Should Contain Image    xpath=//a//img[@src='http://automationpractice.com/img/logo.jpg']

Conferir mensagem de erro "${PRODUTO_NAO_EXISTENTE}"
  Wait Until Element Is Visible    xpath=//p[contains(text(),'No results were found for your search')]
  Element Should Be Visible    xpath=//p[contains(text(),'No results were found for your search')]
