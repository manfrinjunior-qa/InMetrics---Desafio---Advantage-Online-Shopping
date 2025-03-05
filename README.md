# InMetrics_Desafio_AdvantageOnlineShopping

## 📌 Sobre o Desafio
Este repositório contém os testes automatizados realizados com Cypress para validação de cenários de uma aplicação web e testes de API.

## 🚀 Configuração do Ambiente

### 1. Requisitos
Antes de iniciar, certifique-se de ter instalado:
- [Node.js (versão recomendada LTS)](https://nodejs.org/)
- [Git](https://git-scm.com/)

### 2. Clonar o Repositório
```bash
git clone https://github.com/manfrinjunior-qa/InMetrics---Desafio---Advantage-Online-Shopping.git
cd nome-do-repositorio
```

### 3. Instalar Dependências
```bash
npm install
```

### 4. Abrir o Cypress (modo interativo)
```bash
npx cypress open
```

### 5. Executar os Testes (modo headless)
```bash
npx cypress run
```

---

## 🔍 Testes de API
Os testes de API estão localizados na pasta `cypress/integration/api/` e foram implementados utilizando Cypress. O exemplo abaixo demonstra um teste de requisição GET para buscar um produto via API e validar a resposta.
```javascript
describe('Advantage Online Shopping - Demo', () => {
  it('Deve buscar um produto via API e validar a resposta', () => {
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
```

---

## 📜 Casos de Teste (Gherkin)
Os cenários de teste estão localizados na pasta `InMetrics - GlobalCards/Casos de Teste/` e foram escritos utilizando a sintaxe Gherkin:

```gherkin
Funcionalidade: Tela de Login no Advantage Online Shopping

  Cenário: Login bem-sucedido com credenciais válidas
    Dado que o usuário acessa a página "www.advantageonlineshopping.com"
    E esteja na tela de login
    E preenche o "Username" inserindo um nome válido
    E preenche o "Password" inserindo uma senha válida
    Quando clica no botão "SIGN IN"
    Então ele deve ser redirecionado para a página inicial
    E deve ver seu nome de usuário exibido no topo da página

  Cenário: Login com senha incorreta
    Dado que o usuário acessa a página "www.advantageonlineshopping.com"
    E esteja na tela de login
    E preenche o "Username" inserindo um nome válido
    E preenche o "Password" inserindo uma senha inválida
    Quando clica no botão "SIGN IN"
    Então a mensagem "Incorrect user name or password." em vermelho aparecera na tela
    E o acesso não será realizado

  Cenário: Login com usuário inexistente
    Dado que o usuário acessa a página "www.advantageonlineshopping.com"
    E esteja na tela de login
    E preenche o "Username" inserindo um nome inválido
    E preenche o "Password" inserindo uma senha válida
    Quando clica no botão "SIGN IN"
    Então a mensagem "Incorrect user name or password." em vermelho aparecera na tela
    E o acesso não será realizado
```

---

## 📌 Considerações Finais
- Os testes foram desenvolvidos com Cypress, seguindo boas práticas de automação de testes.
- Os cenários foram escritos utilizando Gherkin para facilitar a compreensão.
- O desafio abordou testes de aplicação WEB e API para garantir a qualidade da aplicação.

---

## 📎 Contato
Caso tenha dúvidas ou sugestões, entre em contato!

📧 Email: robertomanfrin_junior@hotmail.com

🔗 LinkedIn: https://www.linkedin.com/in/roberto-manfrin-junior-/

🐙 GitHub: [manfrinjunior-qa](https://github.com/manfrinjunior-qa)

