# bitcoim_price_flutter 🚀

**App Flutter simples para acompanhar o preço do Bitcoin** em tempo real, convertendo os valores para as moedas **Real (BRL)** e **Dólar (USD)** usando uma API pública.

---

## 💡 Sobre o Projeto

Este aplicativo demonstra como integrar APIs REST em Flutter para obter dados financeiros em tempo real. Ele consulta a API da Blockchain para exibir a cotação atual do Bitcoin, atualizando automaticamente os valores convertidos para as principais moedas.

---

## 🔍 Funcionalidades

- Consulta e atualização dos preços do Bitcoin em tempo real  
- Conversão dos valores para Real (BRL) e Dólar (USD)  
- Interface simples, intuitiva e responsiva  
- Exemplo prático de consumo de API REST no Flutter  

---

## ⚙️ Como Funciona

O app faz uma requisição HTTP para o endpoint:

https://blockchain.info/ticker




A resposta traz o preço do Bitcoin em várias moedas, e o app extrai as informações para BRL e USD para exibir ao usuário.

---

## 🛠 Tecnologias e Bibliotecas

- Flutter (Dart)  
- [http package](https://pub.dev/packages/http) para requisições HTTP  
- API pública da Blockchain (Blockchain.info)  

---

## 📲 Como Usar

1. Clone ou baixe este repositório.  
2. Abra no seu editor favorito (ex: VS Code).  
3. Execute `flutter pub get` para instalar dependências.  
4. Rode o app em um dispositivo ou emulador com `flutter run`.  
5. Visualize o preço do Bitcoin atualizado em Real e Dólar.