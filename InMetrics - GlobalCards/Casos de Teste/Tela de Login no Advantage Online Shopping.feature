encoding: UTF-8
#language: pt

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

  Cenário: Tentativa de login sem preencher os campos obrigatórios
    Dado que o usuário acessa a página "www.advantageonlineshopping.com"
    E esteja na tela de login
    E não preenche os campos "USERNAME/PASSWORD"
    Quando tentar clica no botão "SIGN IN"
    Então o botão "SIGN IN" não estará habilitado
    E não conseguirá acessar a plataforma 

  Cenário: Logout do usuário logado
    Dado  que o usuário está logado no sistema
    E ele clica na opção "PERFIL"
    Quando clicar na opção "SING OUT" 
    Então ele deve ser deslogado
    E a opção de "USERNAME/PASSWORD" deve ser exibida novamente

  Cenário: Lembrar credenciais de login
    Dado que o usuário acessa a página "www.advantageonlineshopping.com"
    E esteja na tela de login
    E preenche o "Username" inserindo um nome válido
    E preenche o "Password" inserindo uma senha válida
    E clicar na opção "REMEMBER ME"
    Quando clica no botão "SIGN IN"
    Então os campos "USERNAME/PASSWORD" será salvos
    E ao acessar novamente mostará em tela.

  Cenário: Recuperação de senha
    Dado que o usuário acessa a página de login
    E tenha esquecido o "USERNAME/PASSWORD"
    E clica na opção "FORGOT YOUR PASSWORD?"
    E ser direcionado a tela "Recuperar Acesso" 
    E ao inserir seu e-mail de recuperação
    Quando clica no botão "ENVIAR"
    Então ele deve receber um e-mail com instruções para redefinir sua senha

  Cenário: Login com múltiplas tentativas falhas
    Dado que o usuário acessa a página de login
    E ele insere credenciais inválidas três vezes consecutivas
    Então sua conta deve ser temporariamente bloqueada
    E ele deve ver uma mensagem informando sobre o bloqueio

  Cenário: Login bem-sucedido com Facebook
    Dado que o usuário acessa a página "www.advantageonlineshopping.com"
    E esteja na tela de login    
    Quando clica no botão "SING IN WITH FACEBOOK"
    E autoriza o acesso à conta do Facebook
    Então ele deve ser redirecionado para a página inicial do Advantage Online Shopping
    E seu nome de usuário deve estar visível no topo da página

  Cenário: Login via Facebook com conta não autorizada
    Dado que o usuário acessa a página "www.advantageonlineshopping.com"
    E esteja na tela de login    
    Quando ele clica no botão "SING IN WITH FACEBOOK"
    E nega a autorização de acesso à conta do Facebook
    Então ele deve permanecer na tela de login
    E uma mensagem de erro deve ser exibida informando que o acesso foi negado

  Cenário: Login via Facebook com falha na autenticação
    Dado que o usuário acessa a página "www.advantageonlineshopping.com"
    E esteja na tela de login    
    Quando clica no botão "SING IN WITH FACEBOOK"
    E ocorre um erro na autenticação do Facebook
    Então ele deve ver uma mensagem de erro informando a falha na autenticação
    E deve permanecer na tela de login

  Cenário: Exibição correta da tela de login em dispositivos móveis
    Dado que o usuário acessa a página "www.advantageonlineshopping.com" em um dispositivo móvel
    E a página é carregada
    E os campos de login e botões devem ser ajustados corretamente para o tamanho da tela
    E preenche o "Username" inserindo um nome válido
    E preenche o "Password" inserindo uma senha inválida
    Quando clica no botão "SING IN WITH FACEBOOK"
	Então ele deve ser redirecionado para a página inicial
    E deve ver seu nome de usuário exibido no topo da página
    E a página ajustada para dispositivos móveis

  Cenário: Exibição correta da tela de login em tablets
    Dado que o usuário acessa a tela de login em um tablet
    E a página é carregada
    E os campos de login devem estar centralizados e bem distribuídos
    E preenche o "Username" inserindo um nome válido
    E preenche o "Password" inserindo uma senha inválida
    Quando clica no botão "SING IN WITH FACEBOOK"
	Então ele deve ser redirecionado para a página inicial
    E deve ver seu nome de usuário exibido no topo da página
    E a página ajustada para dispositivos móveis

