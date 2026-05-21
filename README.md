#  **Desafio Técnico - Trainee Cloud & IA**
- Este repositório contém a solução para o Desafio Técnico do Programa Trainee Cloud & IA. O objetivo central é demonstrar conhecimentos práticos em práticas DevOps, conteinerização de aplicações, automação de processos (CI/CD) e noções de infraestrutura em nuvem.

## **O que o programa faz**

O projeto consiste em uma API REST simples desenvolvida em Python. Ela fornece informações básicas e dados de *healthcheck* (status de saúde) do sistema. O grande foco, no entanto, não é apenas a aplicação em si, mas toda a **engenharia ao redor dela**: o empacotamento seguro via Docker, a automação de testes e qualidade de código, e a simulação de uma esteira de entrega contínua (Pipeline CI/CD) pronta para a nuvem.

---

## **Tecnologias e Ferramentas Utilizadas**

| Categoria | Tecnologia | Propósito |
| :--- | :--- | :--- |
| **Linguagem** | Python 3.11 | Desenvolvimento da lógica da aplicação e scripts de teste. |
| **Framework Web** | Flask | Criação rápida e leve das rotas da API REST. |
| **Testes & Qualidade** | Pytest, Flake8 | Execução de testes unitários e validação de formatação de código (linting). |
| **Conteinerização** | Docker, Docker Compose | Empacotamento da aplicação, garantindo execução idêntica em qualquer ambiente. |
| **CI/CD** | GitLab CI | Automação de estágios de validação, construção e simulação de deploy. |
| **Infraestrutura (Bônus)** | Terraform, AWS ECS | Configuração básica de Infraestrutura como Código (IaC) para a nuvem AWS. |

---

## **Como executar o projeto localmente (Terminal/Python)**

Se você deseja rodar a aplicação diretamente na sua máquina utilizando um ambiente virtual Python, siga os passos abaixo.

### **Pré-requisitos**
* Python 3.x instalado.
* Git instalado.

### **Passo a passo**

1. Clone o repositório e acesse a pasta:
   ```bash
   git clone <link-do-seu-repositorio>
   cd trainee-cloud-ia

2. Crie o ambiente virtual (venv):
   ```bash
   python -m venv venv
3. Ative o ambiente virtual:
- Obs: Caso você receba um erro vermelho dizendo que scripts estão desabilitados, execute o comando abaixo apenas uma vez como Administrador para liberar a execução:
   ```bash
   Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser 
   .\venv\Scripts\activate  (no Windows)
   source venv/bin/activate (No Linux/MAC)
4. Instale as dependências:
      ```bash
      pip install -r requirements.txt

5. Execute os testes (Opcional, mas recomendado):
      ```bash
      pytest test_app.py
6. Inicie o servidor local:
      ```bash
      python app.py
-  A aplicação estará disponível na URL: http://localhost:5000

---
## **Como executar o projeto usando Docker**
### **Pré-requisitos**
* Docker Desktop instalado e rodando em segundo plano.

### **Passo a passo**
1. Abra o terminal na raiz do projeto (trainee-cloud-ia).
2. Execute o comando do Docker Compose para construir a imagem e subir o container:
      ```bash 
      docker-compose up --build

3. Aguarde o download das dependências e a inicialização. Quando aparecer a mensagem indicando que o servidor está rodando, acesse no navegador:
- Rota Principal: http://localhost:5000/
- Healthcheck: http://localhost:5000/health
4. Para encerrar a aplicação, pressione Ctrl + C no terminal ou execute docker-compose down.
--- 

## **Como o pipeline funciona (.gitlab-ci.yml)**
- O pipeline foi estruturado em 5 estágios distintos, garantindo que o código só chegue a produção se estiver perfeito:
1. Lint: Executa o flake para garantir que o código Python segue as boas práticas. Falha automaticamente se houver erros de sintaxe graves.
2. Test: Instala as dependências e roda os testes unitários utilizando o pytest.

3. Security (Bônus): Um estágio simulado de SAST para demonstrar a preocupação com a varredura de vulnerabilidades antes da construção da imagem final.

4. Build: Constrói a imagem Docker utilizando a abordagem multi-stage build (garantindo uma imagem mais leve) e faz o push para o GitLab Container Registry de forma automatizada.

5. Deploy: Simula o comando do AWS CLI que atualizaria um serviço no AWS ECS Fargate. Este stage está configurado com regras rígidas para rodar apenas na branch main.

---
## **Decisões técnicas**
- Segurança no Container: Um usuário e grupo específicos (appuser) foram criados para executar a aplicação. Evitar rodar processos como usuário root dentro do container segue o princípio de menor privilégio.
- AWS ECS: A escolha do ECS no script de deploy simulado e a adição do arquivo básico main.tf refletem uma visão orientada a serviços gerenciados em nuvem e a adoção de Infraestrutura como Código (IaC).

## **O que eu faria diferente com mais tempo**
- Observabilidade: Integraria o envio de logs para o AWS CloudWatch
- Testes de Integração: Adicionaria testes automatizados que fizessem chamadas HTTP reais para o container recém-construído no pipeline, antes de homologar a imagem.

## **Uso de Inteligência Artificial**
- Entendimento de Erros: Utilizei IA para decifrar avisos de depreciação do pacote datetime e solucioná-los adequadamente com a classe timezone.
- Sintaxe de Pipeline: Validação da sintaxe do .gitlab-ci.yml para garantir que as estruturas condicionais (rules) e de cache fossem implementadas segundo a documentação mais atualizada do GitLab.
- Resolução de Problemas no Windows: Auxílio rápido para diagnosticar e contornar os bloqueios de execução de scripts (ExecutionPolicy) no PowerShell durante a criação do ambiente virtual.
- O que funcionou bem: A geração de esqueletos estruturais (como a base do Dockerfile) acelerou a entrega, permitindo que o foco ficasse nas boas práticas de segurança, como o bloqueio de acessos root.
---
### *Developed by Yves Esteves* 

