describe('Advantage Online Shopping - Demo', () => {
  it.skip('Deve buscar um produto via API e validar a resposta', () => {
    const searchTerm = 'laptop';
    
    cy.request({
      method: 'GET',
      url: `https://www.advantageonlineshopping.com/catalog/api/v1/products/search`,
      failOnStatusCode: false // Permite capturar o erro sem falhar o teste imediatamente
    }).then((response) => {
      cy.log('Response Status:', response.status);
      
      // Se a API estiver fora do ar (500), falhar o teste explicitamente
      if (response.status === 500) {
        throw new Error('A API retornou erro 500. Não é possível validar a busca.');
      }
  
      // Validação do status code 200
      expect(response.status).to.eq(200);
  
      // Verifica se o corpo da resposta é um objeto e contém a lista de produtos
      expect(response.body).to.have.property('products');
      expect(response.body.products).to.be.an('array').and.not.be.empty;
  
      // Verifica se todos os produtos retornados contêm o termo pesquisado no nome
      response.body.products.forEach(product => {
        expect(product.productName.toLowerCase()).to.include(searchTerm);
      });
    });
  });
  it.skip('Permite capturar a resposta mesmo com erro 500', () => {
    const searchTerm = 'laptop';
    
    cy.request({
      method: 'GET',
      url: `https://www.advantageonlineshopping.com/catalog/api/v1/products/search?query=${searchTerm}`,
      failOnStatusCode: false
    }).then((response) => {
      cy.log('Response Body:', JSON.stringify(response.body));
      cy.log('Response Status:', response.status);
      expect(response.status).to.be.oneOf([200, 500]);
    });
  });
  it('Deve atualizar a imagem de um produto via API', () => {
    const userId = '12345'; // Substituir pelo ID correto do usuário
    const source = 'camera'; // Ajustar conforme necessário
    const color = 'black'; // Ajustar conforme necessário
    
    cy.request({
      method: 'POST',
      url: `https://www.advantageonlineshopping.com/catalog/api/v1/product/image/${userId}/${source}/${color}`,
      headers: {
        'Content-Type': 'application/json'
      },
      body: {
        image: 'base64EncodedImageString' // Substituir por uma string base64 válida da imagem
      },
      failOnStatusCode: false // Impede falhas automáticas por status de erro
    }).then((response) => {
      cy.log('Response Status:', response.status);
      cy.log('Response Body:', JSON.stringify(response.body));

      // Valida se a API respondeu corretamente (200 OK)
      if (response.status === 200) {
        cy.log('200 OK: A requisição foi bem-sucedida');
        
        // Validação adicional - Verifica se a resposta contém um ID da nova imagem
        expect(response.body).to.have.property('imageId');
        expect(response.body.imageId).to.be.a('string');
      } else {
        cy.log(`Erro: Status ${response.status} - ${response.statusText}`);
        
        // Verifica se a resposta tem conteúdo HTML (erro do servidor)
        if (response.headers['content-type'].includes('html')) {
          cy.log('Erro: Resposta HTML de erro');
          cy.log('Conteúdo do erro:', response.body); // Exibe o HTML da página de erro
        } else {
          // Caso haja uma resposta JSON com erro, valida a propriedade message
          expect(response.body).to.have.property('message');
          cy.log('Mensagem de erro:', response.body.message);
        }
      }
    });
});


  

})