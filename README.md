# Desafio Hotmart

---

## Descrição
O desafio consiste em criar um aplicativo IOS, que contém uma lista de estabelecimento para o usuário dos seguintes tipos Coworking, Restaurante, Padaria, Sucos Naturais, Cafeteria, Produtos naturais, Barbearia, Supermercado e Bares.

## Arquitetura
Arquitetura escolhida foi MVP porque o projeto e muito basico com isso não precisar de uma arquitetura bastante robusta igual contém no mercado como MVVM, Clean Architecture e VIPER.


Arquitetura MVP — Model View Presenter

Como qualquer boa arquitetura, o MVP nos ajuda a separar nosso código em camadas para termos um código melhor estruturado.

A Model é a camada responsável pela modelagem e manipulação de dados do seu app. Classes POJO (com atributos públicos) e Beans (com atributos privados e getters/setters) são usadas para modelar dados que vieram de uma fonte remota (JSON de uma API Rest, por exemplo) e que vão ser armazenadas numa base Coredata/Realm/User Defaults em seu app.

A View(ViewController) é a camada responsável por exibir os dados da model na UI e capturar as interações do usuário com o app.

A Presenter irá trabalhar como um meio de campo entre a Model e a View. Ela será responsável por capturar as ações do usuário com a UI, pegar os dados da Model e devolver para a UI. Geralmente, é criado um contrato entre a View e a Presenter para deixar a responsabilidade de cada uma bem definida.

### production

```bash
# Precisar ter o cocoapod instalado na sua maquina."
# Comandos para fazer instalação na sua maquina 
sudo gem install cocoapods

# Depois baixar o projeto pelo git e fazer clone 

git clone https://github.com/thgdigital/desafio-hotmart.git

cd desafio-hotmart/

pod install

```
