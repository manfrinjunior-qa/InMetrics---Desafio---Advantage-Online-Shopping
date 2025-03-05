encoding: UTF-8
#language: pt

Funcionalidade: Busca de produtos pelo ícone de busca;

	Cenário: Usuário busca um produto existente pelo ícone de busca (Utilizando ENTER)
	    Dado que o usuário acessa o site "Advantage Online Shopping"
	    E o ícone de busca está visível
	    E o usuário clica no ícone de busca
	    E digita "tablet" no campo de pesquisa
	    Quando pressiona a tecla "ENTER" ou clica no botão de pesquisa
	    Então o sistema exibe uma lista de produtos relacionados ao termo "laptop"
	    E os produtos exibem nome, preço e imagem corretamente

	Cenário: Usuário busca um produto existente pelo ícone de busca (Utilazando o icone buscar)
	    Dado que o usuário acessa o site "Advantage Online Shopping"
	    E o ícone de busca está visível
	    E o usuário clica no ícone de busca
	    E digita "tablet" no campo de pesquisa
	    Quando clicar no icone "PESQUISAR"
	    Então o sistema exibe uma lista de produtos relacionados ao termo "laptop"
	    E os produtos exibem nome, preço e imagem corretamente

	Cenário: Usuário busca um produto inexistente
	    Dado que o usuário acessa o site "Advantage Online Shopping"
	    E o ícone de busca está visível
	    E o usuário clica no ícone de busca
	    E digita "produtoInexistente123" no campo de pesquisa
	    Quando pressiona "ENTER" ou clica no botão de pesquisa
	    Então o sistema exibe a mensagem "No results for produtoInexistente123"
	    E nenhum produto é encontrado

  	Cenário: Usuário tenta buscar sem inserir um termo
	    Dado que o usuário acessa o site "Advantage Online Shopping"
	    E o ícone de busca está visível
	    E o usuário clica no ícone de busca
	    Quando pressiona "ENTER" sem digitar nada
	    Então o sistema exibe uma mensagem "Search result: '' "
	    E exibe todos os produtos da plataforma em tela.


Funcionalidade: Busca de produtos navegando pela plataforma

	  Cenário: Usuário localiza um produto navegando pela categoria
	    Dado que o usuário acessa o site "Advantage Online Shopping"
	    E os menus de categorias estão visíveis na página inicial
	    E o usuário clica na categoria "Tablets"
	    E o sistema exibe a lista de produtos da categoria "Tablets"
	    Quando os produtos exibem nome, preço e imagem corretamente
	    Então o usuário clica em um produto da lista
	    E o sistema redireciona para a página de detalhes do produto

	  Cenário: Usuário acessa uma categoria sem produtos disponíveis
	    Dado que o usuário acessa o site "Advantage Online Shopping"
	    E os menus de categorias estão visíveis na página inicial
	    Quando o usuário clica em uma categoria vazia "Acessórios Raros"
	    E o sistema exibe a mensagem "Nenhum produto disponível nesta categoria"

	  Cenário: Falha ao carregar os produtos da categoria
	    Dado que o usuário acessa o site "Advantage Online Shopping"
	    E os menus de categorias estão visíveis na página inicial
	    Quando ocorre um erro no carregamento da categoria "Headphones"
	    Então o sistema exibe a mensagem "Erro ao carregar os produtos. Tente novamente mais tarde."


Funcionalidade: Inclusão de produto no carrinho pela plataforma;


	  Cenário: Usuário adiciona um produto ao carrinho a partir da página inicial
	    Dado que o usuário acessa o site "Advantage Online Shopping"
	    E a página inicial exibe uma lista de produtos
	    E o usuário clica no botão "Adicionar ao carrinho" de um produto
	    Quando o sistema exibe uma notificação confirmando a adição do produto
	    Então o ícone do carrinho exibe a quantidade correta de itens

	  Cenário: Usuário adiciona um produto ao carrinho pela página de detalhes do produto
	    Dado que o usuário acessa o site "Advantage Online Shopping"
	    E navega até a página de detalhes de um produto
	    Quando o usuário clica no botão "Adicionar ao carrinho"
	    Então o sistema exibe uma notificação confirmando a adição do produto
	    E o ícone do carrinho exibe a quantidade correta de itens

	  Cenário: Usuário adiciona múltiplas unidades de um produto ao carrinho
	    Dado que o usuário acessa o site "Advantage Online Shopping"
	    E navega até a página de detalhes de um produto
	    E o usuário seleciona a quantidade "3"
	    Quando clica no botão "Adicionar ao carrinho"
	    Então o sistema exibe uma notificação confirmando a adição do produto
	    E o ícone do carrinho exibe a quantidade correta de itens

	  Cenário: Usuário tenta adicionar um produto sem estoque ao carrinho
	    Dado que o usuário acessa o site "Advantage Online Shopping"
	    E navega até a página de detalhes de um produto sem estoque
	    Quando o usuário clica no botão "Adicionar ao carrinho"
	    Então o sistema exibe a mensagem "Produto indisponível no momento"

	  Cenário: Usuário visualiza o carrinho após adicionar produtos
	    Dado que o usuário adicionou produtos ao carrinho
	    E o usuário clica no ícone do carrinho
	    Quando o sistema exibe a lista de produtos adicionados
	    Então cada produto exibe nome, quantidade, preço e imagem corretamente

	  Cenário: Usuário adiciona um produto e continua comprando
	    Dado que o usuário acessa o site "Advantage Online Shopping"
	    E navega até a página de detalhes de um produto
	    Quando o usuário clica no botão "Adicionar ao carrinho"
	    E seleciona a opção "Continuar comprando"
	    Então o sistema mantém os itens no carrinho sem redirecionar para a página de checkout



Funcionalidade: Validação dos produtos incluídos no carrinho na tela de pagamento

	  Cenário: Usuário visualiza os produtos no carrinho antes de finalizar a compra
	    Dado que o usuário adicionou produtos ao carrinho
	    E o usuário acessa a página do carrinho
	    Quando o sistema exibe a lista de produtos adicionados com nome, quantidade, preço unitário e total
	    Então o valor total da compra deve ser calculado corretamente

	  Cenário: Usuário segue para a tela de pagamento e valida os produtos no resumo do pedido
	    Dado que o usuário tem produtos no carrinho
	    E o usuário acessa a tela de pagamento
	    Quando o sistema exibe um resumo do pedido com os produtos adicionados
	    Então o nome, quantidade e preço de cada produto devem estar corretos
	    E o total da compra deve incluir impostos e taxas corretamente

	  Cenário: Usuário altera a quantidade de um produto na tela do carrinho antes de prosseguir para pagamento
	    Dado que o usuário tem produtos no carrinho
	    E o usuário acessa a página do carrinho
	    Quando altera a quantidade de um produto para "3"
	    Então o sistema atualiza automaticamente o preço total do item
	    E o total geral da compra é recalculado corretamente

	  Cenário: Usuário remove um produto do carrinho antes de prosseguir para pagamento
	    Dado que o usuário tem produtos no carrinho
	    E o usuário acessa a página do carrinho
	    E remove um produto da lista
	    Quando o sistema exibe uma mensagem confirmando a remoção do produto
	    Então o produto removido não deve mais aparecer no resumo do pedido na tela de pagamento
	    E o total da compra deve ser atualizado corretamente

	  Cenário: Usuário tenta finalizar a compra com o carrinho vazio
	    Dado que o usuário acessa a página do carrinho
	    E o carrinho está vazio
	    Quando o usuário tenta prosseguir para o pagamento
	    Então o sistema exibe a mensagem "Seu carrinho está vazio. Adicione produtos antes de continuar."

	  Cenário: Usuário realiza logout e faz login novamente para verificar se os produtos permanecem no carrinho
	    Dado que o usuário adicionou produtos ao carrinho
	    E o usuário faz logout 
	    Quando realizar login novamente
	    Então o sistema mantém os produtos no carrinho corretamente
	    E os itens devem estar visíveis na tela de pagamento ao prosseguir com a compra

	  Cenário: Usuário acessa a tela de pagamento e verifica o valor do frete
	    Dado que o usuário tem produtos no carrinho
	    E acessa a tela de pagamento
	    Quando informa o endereço de entrega
	    Então o sistema exibe o valor do frete baseado no endereço informado
	    E o valor total da compra inclui o frete corretamente
