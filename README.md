# desenvolvimento_mobile_p1
Nome: João Pedro Marques Martins
RGM: 802.366

Projeto P1

Este software foi desenvolvido como parte da Prova1 do sexto semestre de Engenharia de Software na diciplina de Programação para Dispositivos Móveis e tem como objetivo oferecer uma solução eficiente e intuitiva para a gestão de contatos telefônicos. Trata-se de um aplicativo desenvolvido em Flutter, projetado para atender às necessidades dos usuários que buscam uma ferramenta prática e moderna para organizar seus contatos.

Entre as principais funcionalidades do aplicativo estão o cadastro de novos contatos, a listagem completa com detalhes de cada contato, além de opções para editar e excluir informações já cadastradas. A interface é projetada com foco na usabilidade, oferecendo uma experiência fluida e amigável, permitindo que os usuários naveguem facilmente por todas as funções, de forma que o aplicativo siga padrões de qualidade que garantem uma experiência agradável, promovendo a satisfação dos usuários ao gerenciar suas agendas de contatos.


Uso e Configuração - ReadMe

Neste momento, o aplicativo encontra-se concluido, com todas as suas funcionalidades devidamente operacionais. O aplicativo foi desenvolvido 100% utilizando Flutter nativo, portanto não há dependências ou configurações extras que precisam ser feitas.


Uso

Na primeira tela, a Principal, temos a lista de contatos já cadastrados (caso não haja nenhum, estará vazia, logicamente), e também um botão para cadastrar novos contatos.

Na tela de Cadastro podemos então inserir os campos devidos necessário para o registro, não podendo deixar os campos vazios ou incompletos. Uma máscara será aplicada automaticamente para o telefone, e o usuário será impedido de informar um email inválido.

Uma vez salvo, o contato aparecerá na tela principal com o nome, email e telefone, e junto de cada contato, um botão para editar/excluir.

O usuário, uma vez na tela de edição, pode mudar, respeitando os campos e as máscaras, as informações daquele contato selecionado. Dois botões aparecem em baixo: Salvar e Excluir. O botão salvar vai garantir que as modificações sejam salvas, e o botão excluir aparecerá uma janela de confirmação. Caso a opção de confirmação for apertada, o contato não estará mais disponível na tela principal.
