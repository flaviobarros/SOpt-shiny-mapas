## Packages
library(BETS)
library(purrr)
library(sf)

## Maps ##
# States
map <- st_read("Brasil/UFEBRASIL.shp", stringsAsFactors = FALSE)

# Baixando as séries
IST <- BETSget(
  c(15925, 15926, 15927, 15928, 15929,
    15930, 15931, 15932, 15933, 15934,
    15935, 15936, 15937, 15938, 15939,
    15940, 15941, 15942, 15943, 15944,
    15945, 15946, 15947, 15948, 15949,
    15950, 15951),
  data.frame = TRUE)

IST1 <- BETSget(
  c(15861, 15862, 15863, 15864, 15865,
    15866, 15867, 15868, 15869, 15870,
    15871, 15872, 15873, 15874, 15875,
    15876, 15877, 15878, 15879, 15880,
    15881, 15882, 15883, 15884, 15885,
    15886, 15887),
  data.frame = TRUE)

IST2 <- BETSget(
  c(15893, 15894, 15895, 15896, 15897,
    15898, 15899, 15900, 15901, 15902,
    15903, 15904, 15905, 15906, 15907,
    15908, 15909, 15910, 15911, 15912,
    15913, 15914, 15915, 15916, 15917,
    15918, 15919),
  data.frame = TRUE)

## Retirando a última observação e transformando em data.frame
IST  <- map_df(.x = IST,  .f = function(x) x[nrow(x),])
IST1 <- map_df(.x = IST1, .f = function(x) x[nrow(x),])
IST2 <- map_df(.x = IST2, .f = function(x) x[nrow(x),])

## Definindo os nomes da variável para o estado
IST$State <- map$NM_ESTADO
IST1$State <- map$NM_ESTADO
IST2$State <- map$NM_ESTADO

## Retendo somente estados e os valores
IST  <- IST[,c(3,2)]
IST1 <- IST1[,c(3,2)]
IST2 <- IST2[,c(3,2)]

## Salvando os data.frames para uso posterior
save(map, file = 'data/map.rda')
save(IST, file = 'data/IST.rda')
save(IST1, file = 'data/IST1.rda')
save(IST2, file = 'data/IST2.rda')
