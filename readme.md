# MWS - Infraestrutura Kubernetes
### MVP - Tech Challenge (Gestão de Oficina Mecânica)

Este repositório contém o código de **Infraestrutura como Código (IaC)** utilizando Terraform para o provisionamento do cluster Amazon EKS (Kubernetes) e do AWS API Gateway para o sistema MWS.

---

## Organização do Ecossistema (4 Repositórios)
Para atender aos requisitos de desacoplamento, segurança e responsabilidade única, o projeto está estruturado em 4 repositórios distintos:

| Componente | Repositório | Descrição do Componente |
| :--- | :--- | :--- |
| **MWS** | `mws` | Código-fonte dos microsserviços (PHP/Laravel), Dockerfiles e manifestos K8s. |
| **MWS-Serverless-Auth** | `mws-serverless-auth` | Função AWS Lambda para validação de CPF e geração de Token JWT. |
| **MWS-Infra-Kubernetes (Este)** | `mws-infra-Kubernetes` | Código Terraform para provisionamento do cluster Amazon EKS e API Gateway. |
| **MWS-Infra-Database** | `mws-infra-database` | Código Terraform para provisionamento do banco de dados Amazon RDS. |

---

## Arquitetura e Decisões Técnicas (IaC)
O provisionamento via Terraform garante um ambiente padronizado, rastreável e versionado. Os recursos criados por este repositório incluem:

* **Amazon EKS (Elastic Kubernetes Service):** Cluster responsável por orquestrar os microsserviços da aplicação (Node Groups configurados para escalabilidade).
* **AWS API Gateway:** Atua como Single Entry Point, roteando o tráfego externo para o cluster ou para a função Serverless de autenticação.
* **IAM Roles & Security Groups:** Políticas de menor privilégio para garantir a comunicação segura entre o EKS, o API Gateway e o RDS.

---

## Pipeline de CI/CD e Governança
Este repositório utiliza automação completa via **GitHub Actions** para validação e aplicação da infraestrutura.

Fluxo da Pipeline:
1. Pull Request / Push na branch main.
2. `terraform fmt -check`: Validação de formatação do código.
3. `terraform init & terraform validate`: Inicialização e verificação de sintaxe.
4. `terraform plan`: Geração do plano de execução (apresentado no PR).
5. `terraform apply`: Aplicação automática da infraestrutura (apenas na branch main).

**Proteção de Branches:** A branch `main` é protegida. Qualquer alteração deve obrigatoriamente ser submetida via **Pull Request (PR)**.

---

## Instruções de Execução

> **Nota de Contingência Arquitetural:** Devido à limitação/expiração dos créditos da conta de laboratório da AWS Academy durante o ciclo final de desenvolvimento, a execução deste Terraform na nuvem foi suspensa. A aplicação final foi validada utilizando o Kubernetes local (Docker Desktop) como ambiente de fallback funcional.

### Pré-requisitos
* Terraform instalado.
* AWS CLI configurado com credenciais válidas.

### Passos para Validação Local do Terraform
1. Clone este repositório.
2. Inicialize o Terraform:
   ```bash
   terraform init
   ```
3. Verifique o plano de execução:
   ```bash
   terraform plan
   ```
4. Aplique a infraestrutura (Caso possua credenciais ativas):
   ```
   terraform apply -auto-approve
   ```

---

### Documentação e APIs
[Acesse a Documentação no Notion](https://www.notion.so/TECH-CHALLENGE-338b36cb511a80cb9c12d5c70c5682c7?source=copy_link) 

---

## Autor
- Gustavo Pirolo - Cientista da Computação & Junior Development Analyst
- Apelido do Servidor: Gustavo Pirolo - RM371637
