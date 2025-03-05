encoding: UTF-8
#language: pt

Funcionalidade: Testes da API do Advantage Online Shopping

  Cenário: Buscar um produto via API e validar a resposta
    Dado que o usuário realiza uma requisição GET para buscar um produto com o termo "laptop"
    E a API retorna uma resposta
    Quando o status da resposta deve ser 200
    Então o corpo da resposta deve conter a propriedade "products"
    E a lista de produtos deve ser um array não vazio
    E todos os produtos retornados devem conter o termo pesquisado no nome

  Cenário: Capturar a resposta mesmo com erro 500
    Dado que o usuário realiza uma requisição GET para buscar um produto com o termo "laptop"
    Quando a API retorna uma resposta
    Então o status da resposta deve ser 200 ou 500
    E se o status for 500, a resposta deve ser registrada no log

  Cenário: Atualizar a imagem de um produto via API com sucesso
    Dado que o usuário realiza uma requisição POST para atualizar a imagem de um produto
    Quando a API processa a solicitação com sucesso
    Então o status da resposta deve ser 200
    E o corpo da resposta deve conter a propriedade "imageId"
    E "imageId" deve ser uma string válida

  Cenário: Falha ao atualizar a imagem de um produto devido a erro no servidor
    Dado que o usuário realiza uma requisição POST para atualizar a imagem de um produto
    Quando a API retorna um erro
    Então o status da resposta não deve ser 200
    E se o conteúdo da resposta for HTML, deve ser registrado no log
    E se a resposta for JSON, deve conter a propriedade "message"
    E a mensagem de erro deve ser registrada no log
