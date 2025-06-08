{HousingPricesProject}


# 🏠 Observatório Imobiliário do Distrito Federal

Este projeto propõe a criação de um **Observatório dos Preços de Imóveis Residenciais no Distrito Federal**, com uma aplicação web interativa desenvolvida em **Shiny**. A base de dados é obtida via **web scraping** do site DF Imóveis, e a análise é feita com modelagem estatística em **R**, incluindo regressões lineares com especificação log-linear.

![Demo do App](Appshiny/www/ipea_project.gif)

---

## 📌 Objetivo

Desenvolver um painel interativo para analisar o mercado imobiliário do DF, respondendo à pergunta:

> **Existe diferença significativa no preço do m² entre Brasília e as demais regiões administrativas?**

---

## 🔍 Visão Geral

- 🐍 Coleta de dados com **Python** via web scraping  
- 📊 Pré-processamento, análise e visualização com **R**  
- 🌐 Aplicação web com **Shiny**  
- 📈 Estimação de **modelos log-lineares com dummies**

---

## ⚙️ Metodologia

### 📥 Coleta de dados
Mais de **21 mil imóveis** foram extraídos do site [DF Imóveis](https://www.dfimoveis.com.br/aluguel/df/brasilia/apartamento) usando Python.

### 🧪 Modelagem estatística
A variável dependente é o log do preço por m², modelado em função de dummies regionais (Brasília é a base de referência).

#### Especificação log-linear:
```math
y_i = \beta_0 + \sum_{j=1}^{J-1} \beta_j \cdot D_{ij} + \varepsilon_i
````
