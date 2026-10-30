# Sistema de Gestão Academia FitLife

Sistema de banco de dados relacional desenvolvido para gerenciamento operacional de academias e acompanhamento de alunos.

---

## Sumário

* [Sobre o Projeto](#sobre-o-projeto)
* [Objetivo do Sistema](#objetivo-do-sistema)
* [Tecnologias Utilizadas](#tecnologias-utilizadas)
* [Modelagem Relacional (Diagrama EER)](#modelagem-relacional-diagrama-eer)
* [Estrutura do Banco de Dados](#estrutura-do-banco-de-dados)
* [Consultas SQL Implementadas](#consultas-sql-implementadas)
* [Como Executar o Projeto](#como-executar-o-projeto)

---

## Sobre o Projeto

O FitLife Database System é uma solução de modelagem e implementação de banco de dados para a Academia FitLife (Atividade III - SEDUC). O projeto engloba desde a conceituação das regras de negócio até a normalização de dados e execução de consultas analíticas.

---

## Objetivo do Sistema

* Automação do Controle de Planos: Gerenciamento centralizado de matrículas e seus status financeiro.
* Acompanhamento Físico: Histórico de evolução biológica dos alunos (peso e % de gordura).
* Gestão de Aulas e Instrutores: Alocação de profissionais por modalidade e controle de reservas de vagas.
* Eliminação de Redundâncias: Estruturação normalizada garantindo a integridade dos dados.

---

## Tecnologias Utilizadas

* SGBD: MySQL 8.0
* Ferramenta de Modelagem: MySQL Workbench
* Linguagem: SQL (DDL, DML e DQL)
* Versionamento: Git & GitHub

---

## Modelagem Relacional (Diagrama EER)

O esquema relacional foi projetado observando as Regras de Normalização (1FN até 4FN):

![Diagrama EER](diagrama_eer.png)

---

## Estrutura do Banco de Dados

O banco de dados fitlife_db conta com 7 tabelas integradas por chaves estrangeiras (FK):

* planos: Cadastro dos pacotes comerciais, durações e mensalidades.
* alunos: Informações pessoais e de contato dos membros.
* instrutores: Registro dos profissionais de educação física e CREF.
* matriculas: Vínculo entre alunos e planos de acesso.
* modalidades_aulas: Catálogo de turmas, horários e capacidade máxima.
* agendamentos_aulas: Controle de inscrições dos alunos nas aulas coletivas.
* avaliacoes_fisicas: Registro de métricas e histórico de avaliações corporais.

---

## Consultas SQL Implementadas

O projeto dispõe de 15 consultas analíticas cobrindo:
* Junções de tabelas (INNER JOIN, LEFT JOIN).
* Funções de agregação (SUM, AVG, COUNT) e agrupamento (GROUP BY, HAVING).
* Subconsultas e ordens de classificação (ORDER BY).

> Os prints de comprovação da execução das 15 consultas estão organizados na pasta `/resultados_consultas`.

---

## Como Executar o Projeto

1. Clone este repositório:
   ```bash
   git clone [https://github.com/SEU_USUARIO/fitlife-database-system.git](https://github.com/SEU_USUARIO/fitlife-database-system.git)
