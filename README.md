# Desafio Pet shop


Temos uma Pet Shop especializada em cachorros e queremos uma listagem simples, mas com filtro básicos, dos animais (cachorros) que já passaram pela Pet Shop.
	
Cada animal tem uma raça (você pode obter a listagem de raças em http://www.portalfilhotes.com.br/racas-de-a-z/), gênero (macho/fêmea), castrado (sim/não), data de nascimento, nome, nome do dono, telefone do dono e data da última vez que passou pela Pet Shop.

Para testar o software você precisa desenvolver também um gerador de 1.000 cachorros aleatórios para a Pet Shop

### Solução
 
Foi desenvolvida uma API em rails 5 com sistema de busca inteligente, consumida por um frontend desenvolvido em angular 2.

#### Tecnologias
* Elasticsearch
* Rails 5.x
* Angular 2.x
* Bootstrap 3.x
* NgxPagination

#### Pré-requisitos
- Ruby 2.3.3 - [Instalação](https://gorails.com/setup/ubuntu/14.04#ruby)
- Rails 5.0.2 - [Instalação](https://gorails.com/setup/ubuntu/14.04#rails)
- Angular CLI - [Instalação & Requisitos](https://github.com/angular/angular-cli#installation)
- Elasticsearch - [Instalação Elasticsearch & Requisitos](https://www.elastic.co/guide/en/elasticsearch/reference/current/install-elasticsearch.html)

#### Instalação Elasticsearch
1. Primeiro instale o Java (É uma dependência do ElasticSearch): ``` sudo apt-get install default-jdk ```
2. Agora baixe o elasticsearch: ``` wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-5.0.0.deb ```
3. Instale o pacote: ``` sudo dpkg -i elasticsearch-5.0.0.deb```
4. Vamos dar o start no ElasticSearch, primeiro rode: ```ps -p 1```
   
![alt text](https://i1.wp.com/onebitcode.com/wp-content/uploads/2016/11/Captura-de-tela-de-2016-11-05-00-16-01.png?resize=330%2C53)

  Caso o resultado seja como na imagem, rode: ```sudo systemctl start elasticsearch.service```
  Caso o resultado seja “init”, rode: ```sudo -i service elasticsearch start```

5. Qualquer problema na instalação acesse - [Instalação Elasticsearch](https://www.elastic.co/guide/en/elasticsearch/reference/current/install-elasticsearch.html)

#### API
1. Acesse o diretório 'api'
2. Instale as dependências com o comando: ```bundle install ```
3. Crie o banco de dados: ``` rake db:create db:migrate ```
4. Caso o elasticsearch não esteja rodando, rode ele: ```sudo systemctl start elasticsearch.service``` ou ```sudo -i service elasticsearch start```

<b> Povoando banco de dados </b>

5. Para gerar os cachorros é necessario que o elasticsearch esteja rodando, gere através: ``` rake pet:gen ```

> Para gerar os cachorros foi gerada uma task que faz o parse no site através da lib Nokogiri, e armazena as raças no array, é utilizada a gem Faker para gerar
>dados aleatórios para povoar o banco.

6. Por ultimo start o servidor, através do comando: ``` rails server ``` ou ``` rails s ```
Não se esqueça de manter o terminal aberto.

----------

#### Front 
1. Acesse o diretório 'front'
2. Rode o comando para instalar as dependencias: ``` npm install ``` 
3. Inicie o aplicativo: ``` ng serve --open ```

----------
#### Melhorias que gostaria de ter adicionado
- Melhorar a experiência de usuário na pesquisa, trabalhando com os termos mais pesquisados.
- Melhorar a inteligência da sugestão. 

----------
#### Imagens do aplicativo em funcionamento
Busca por nome
![alt text](https://github.com/flaviolpgjr/desafio_petshop/blob/master/images/img1.png)
Busca por nome, raça e dono
![alt text](https://github.com/flaviolpgjr/desafio_petshop/blob/master/images/img3.png)
Usuário digitou a palavra pastor errado, repare que ele identificou que o usuario queria digitar pastor, e sugeriu a correção.
![alt text](https://github.com/flaviolpgjr/desafio_petshop/blob/master/images/img2.png)
