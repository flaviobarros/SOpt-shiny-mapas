## Packages
library(BETS)
library(purrr)
library(sf)

## Maps ##
# States
map <- st_read("Brasil/UFEBRASIL.shp", stringsAsFactors = FALSE)

# Séries
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

IST2<-BETSget(
  c(15893, 15894, 15895, 15896, 15897,
    15898, 15899, 15900, 15901, 15902,
    15903, 15904, 15905, 15906, 15907,
    15908, 15909, 15910, 15911, 15912,
    15913, 15914, 15915, 15916, 15917,
    15918, 15919),
  data.frame = TRUE)

IST <- map_df(.x = IST, .f = tail)
IST1 <- map_df(.x = IST, .f = tail)
IST2 <- map_df(.x = IST, .f = tail)

library(purrr)


# Criando os data.frames
IST <- data.frame(States = map$NM_ESTADO,
                  I = c(IST$`ACRE`$value,
                        IST$`ALAGOAS`$value,
                        IST$`AMAPÁ`$value,
                        IST$`AMAZONAS`$value,
                        IST$`BAHIA`$value,
                        IST$`CEARÁ`$value,
                        IST$`DISTRITO FEDERAL`$value,
                        IST$`ESPIRITO SANTO`$value,
                        IST$`GOIÁS`$value,
                        IST$`MARANHÃO`$value,
                        IST$`MATO GROSSO`$value,
                        IST$`MATO GROSSO DO SUL`$value,
                        IST$`MINAS GERAIS`$value,
                        IST$`PARÁ`$value,
                        IST$`PARAÍBA`$value,
                        IST$`PARANÁ`$value,
                        IST$`PERNAMBUCO`$value,
                        IST$`PIAUÍ`$value,
                        IST$`RIO DE JANEIRO`$value,
                        IST$`RIO GRANDE DO NORTE`$value,
                        IST$`RIO GRANDE DO SUL`$value,
                        IST$`RONDÔNIA`$value,
                        IST$`RORAIMA`$value,
                        IST$`SANTA CATARINA`$value,
                        IST$`SÃO PAULO`$value,
                        IST$`SERGIPE`$value,
                        IST$`TOCANTINS`$value)
)

IST1 <- data.frame(States = map$NM_ESTADO,
                   I = c(IST1$`ACRE`$value,
                         IST1$`ALAGOAS`$value,
                         IST1$`AMAPÁ`$value,
                         IST1$`AMAZONAS`$value,
                         IST1$`BAHIA`$value,
                         IST1$`CEARÁ`$value,
                         IST1$`DISTRITO FEDERAL`$value,
                         IST1$`ESPIRITO SANTO`$value,
                         IST1$`GOIÁS`$value,
                         IST1$`MARANHÃO`$value,
                         IST1$`MATO GROSSO`$value,
                         IST1$`MATO GROSSO DO SUL`$value,
                         IST1$`MINAS GERAIS`$value,
                         IST1$`PARÁ`$value,
                         IST1$`PARAÍBA`$value,
                         IST1$`PARANÁ`$value,
                         IST1$`PERNAMBUCO`$value,
                         IST1$`PIAUÍ`$value,
                         IST1$`RIO DE JANEIRO`$value,
                         IST1$`RIO GRANDE DO NORTE`$value,
                         IST1$`RIO GRANDE DO SUL`$value,
                         IST1$`RONDÔNIA`$value,
                         IST1$`RORAIMA`$value,
                         IST1$`SANTA CATARINA`$value,
                         IST1$`SÃO PAULO`$value,
                         IST1$`SERGIPE`$value,
                         IST1$`TOCANTINS`$value)
)

IST2 <- data.frame(States = map$NM_ESTADO,
                   I = c(IST2$`ACRE`$value,
                         IST2$`ALAGOAS`$value,
                         IST2$`AMAPÁ`$value,
                         IST2$`AMAZONAS`$value,
                         IST2$`BAHIA`$value,
                         IST2$`CEARÁ`$value,
                         IST2$`DISTRITO FEDERAL`$value,
                         IST2$`ESPIRITO SANTO`$value,
                         IST2$`GOIÁS`$value,
                         IST2$`MARANHÃO`$value,
                         IST2$`MATO GROSSO`$value,
                         IST2$`MATO GROSSO DO SUL`$value,
                         IST2$`MINAS GERAIS`$value,
                         IST2$`PARÁ`$value,
                         IST2$`PARAÍBA`$value,
                         IST2$`PARANÁ`$value,
                         IST2$`PERNAMBUCO`$value,
                         IST2$`PIAUÍ`$value,
                         IST2$`RIO DE JANEIRO`$value,
                         IST2$`RIO GRANDE DO NORTE`$value,
                         IST2$`RIO GRANDE DO SUL`$value,
                         IST2$`RONDÔNIA`$value,
                         IST2$`RORAIMA`$value,
                         IST2$`SANTA CATARINA`$value,
                         IST2$`SÃO PAULO`$value,
                         IST2$`SERGIPE`$value,
                         IST2$`TOCANTINS`$value)
)

save(map, file = 'data/map.rda')
save(IST, file = 'data/IST.rda')
save(IST1, file = 'data/IST1.rda')
save(IST2, file = 'data/IST2.rda')