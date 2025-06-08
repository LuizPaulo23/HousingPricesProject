#' @title: Modelagem: modelo log-log (modelar apenas preço dos alugueis)
#' @author: Luiz Paulo Tavares

base::rm(list = ls())
graphics.off()

# Passando Brasilia para base de referência:

db$location <- stats::relevel(factor(db$location), ref = "Brasilia")

# Function de segmentação amostral \*

get_modo = function(modo_imovel, type_imovel, database = db){

          db_filtrado = db %>% filter(modo == modo_imovel &
                                      property_type == type_imovel)

    return(db_filtrado)

}

aluguel_apartamento = get_modo("aluguel", "Apartamento")
aluguel_casa = get_modo("aluguel", "Casa")
venda_apartamento = get_modo("venda", "Apartamento")
venda_casa = get_modo("venda", "Casa")

# EDA \*

# ggplot2::ggplot(data = db_aluguel,
#                 aes(x = log(size),
#                     y = log(price))) +
#   geom_point(aes(color = location), pch = 19) +
#   geom_smooth(method = "lm", color = "black") +
#   theme_minimal()


model_aluguel_apartamento = lm(formula = log(price_m2) ~ factor(location), data = aluguel_apartamento)
model_aluguel_casa  = lm(formula = log(price_m2) ~ factor(location), data = aluguel_casa )
model_venda_apartamento = lm(formula = log(price_m2) ~ factor(location), data = venda_apartamento)
model_venda_casa = lm(formula = log(price_m2) ~ factor(location), data = venda_casa)


# Exportando modelo

stargazer::stargazer(model_aluguel_apartamento,
                     model_aluguel_casa)

stargazer::stargazer(model_venda_apartamento,
                     model_venda_casa)

