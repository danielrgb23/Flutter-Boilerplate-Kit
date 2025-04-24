# Flutter Boilerplate Kit

Um kit inicial para projetos Flutter, projetado para acelerar o desenvolvimento de aplicativos móveis com uma arquitetura limpa, suporte à internacionalização (i18n) e integração de ferramentas essenciais.
Ja vem preconfigurado 

- ✅ Pronto para Android e iOS: configuração de plataforma já realizada
- 🎨 Tema de ícone de app incluso
- 🛠️ Ferramenta recomendada para gerar ícones: icon.kitchen

## 🚀 Recursos
🌍 **Internacionalização (i18n) com suporte a múltiplos idiomas**

⚙️ **GetX para gerenciamento de estado e navegação**

🔔 **BotToast para notificações e feedback visual**

🧱 **Arquitetura modular e escalável**

🌗 **Tema personalizado com suporte a ícones**

📱 **Configuração pronta para Android e iOS**

🧪 **Suporte a testes unitários e de widget**

## 📁 Estrutura do Projeto

```bash
lib/
├── common/
│   └── mixins/
│       └── l10n_mixin.dart
├── inherited/
│   └── messaging.dart
├── l10n/
│   ├── app_localizations.dart
│   └── intl_pt.arb
├── pages/
│   └── teste.dart
├── utils/
│   └── navigator_service.dart
└── main.dart
```

## 🛠️ Configuração

1. Clone o repositóro:

   ```bash
   git clone https://github.com/danielrgb23/Flutter-Boilerplate-Kit.git
   cd Flutter-Boilerplate-Kit
   ```

2. Instale as dependêncis:

   ```bash
   flutter pub get
   ```

3. Gere os arquivos de localizaço:

   ```bash
   flutter gen-l10n
   ```

4. Execute o aplicatio:

   ```bash
   flutter run
   ```

## 🌐 Internacionalização (i18)

Este projeto utiliza o sistema de internacionalização do Fluter.
- Os arquivos `.arb` estão localizados em `lib/l10/`.
- Para adicionar um novo idioma, crie um novo arquivo `.arb` (por exemplo, `intl_en.arb`) e adicione as traduções correspondenes.


## 📌 Futuras Atualizações

- 🔄 **Gerenciamento de estado**:
  - Exemplo com **GetX** ou **MobX** (dependendo da preferência do usuário/empresa)

- 🌐 **Service Layer**:
  - Cliente HTTP genérico
  - Interceptor de erros
  - Suporte a mocking para testes

- 🎨 **Theme & UI**:
  - Paleta de cores e tipografia customizadas
  - Componentes reutilizáveis (botões, cards, campos de formulário, etc.)

- 🧪 **Testes**:
  - Testes unitários e de widget prontos para rodar

- 🧹 **Lint/Format**:
  - Arquivo `analysis_options.yaml` com regras de análise de código
  - Script pré-configurado com `flutter format`

- ⚙️ **CI/CD**:
  - Suporte a **GitHub Actions** (ou outra solução) com workflows para:
    - Rodar formatter e linter
    - Executar testes
    - Fazer build de debug/release

## 📄 Licença

Este projeto está licenciado sob a [MIT License](LICENSE).

## 🙌 Contribindo

Contribuições são bem-vindas! Sinta-se à vontade para abrir issues ou enviar pull reuests.
