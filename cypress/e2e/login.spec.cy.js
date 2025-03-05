describe('Advantage Online Shopping - Demo', () => {
  it('Login - Sucess', () => {
    cy.visit('https://www.advantageonlineshopping.com/#/')
    cy.get('#menuUserLink').click()
    cy.get('[a-hint="Username"] > .inputContainer > .ng-pristine').type('RMJTeste1')
    cy.get('[a-hint="Password"] > .inputContainer > .ng-pristine').type('Admin123')
    cy.get('.left > .ng-pristine').click()
    cy.get('#sign_in_btn').click()
  })

  it('Deve realizar a busca de um produto', () => {
    cy.visit('https://www.advantageonlineshopping.com/#/')
    cy.wait(1000);
    cy.get('#mobileSearch > .roboto-medium').type('Laptops{enter}')
    cy.url().should('include', '#/search/?viewAll=Laptops');
    cy.get('.select').contains('Laptops')

  })
  it('Incluir produto no carrinho;', () => {
    cy.visit('https://www.advantageonlineshopping.com/#/')
    cy.wait(1000); 
    cy.get('#mobileSearch > .roboto-medium').type('Laptops{enter}')
    cy.wait(1000); 
    cy.url().should('include', '#/search/?viewAll=Laptops');
    cy.get('.select').contains('Laptops')
    cy.visit('https://www.advantageonlineshopping.com/#/category/Laptops/1');
    cy.get('.categoryRight li img').should('be.visible');
    cy.get('.categoryRight li') 
      .its('length') 
      .then((numProducts) => {
        const randomIndex = Math.floor(Math.random() * numProducts);
        cy.get('.categoryRight li').eq(randomIndex).click(); 
      });
    cy.get('[name="save_to_cart"]').should('be.visible').click();
    cy.get('#checkOutPopUp').click()
    cy.contains('ORDER PAYMENT').should('be.visible'); 
  

  })
  it('Validar os produtos incluídos no carrinho na tela de pagamento.;', () => {
    cy.visit('https://www.advantageonlineshopping.com/#/')
    cy.get('#menuUserLink').click()
    cy.get('[a-hint="Username"] > .inputContainer > .ng-pristine').type('RMJTeste1')
    cy.get('[a-hint="Password"] > .inputContainer > .ng-pristine').type('Admin123')
    cy.get('.left > .ng-pristine').click()
    cy.get('#sign_in_btn').click()
    cy.wait(1000);
    cy.get('#shoppingCartLink').click()
    cy.get('.select').contains('SHOPPING CART')
    cy.url().should('include', '/#/shoppingCart');
    cy.get('#checkOutButton').click()
    cy.url().should('include', '#/orderPayment');
    cy.get('.select').contains('ORDER PAYMENT')
    cy.get('.roboto-medium.totalValue').invoke('text').then((totalText) => {
      const total = parseFloat(totalText.replace('$', ''));
      expect(total).to.be.greaterThan(0);
    });
  })
  

})