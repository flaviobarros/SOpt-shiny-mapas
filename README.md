# Shiny App para mapas

Esse app foi produzido como uma resposta para a seguinte pergunta feita no Stackoverflow em Português: [Como renderizar um mapa de acordo com a escolha no dropdown_menu?](https://pt.stackoverflow.com/questions/359126/r-shiny-e-mapas-como-renderizar-um-mapa-de-acordo-com-a-escolha-no-dropdown-me)

## Estrutura

A estrutura do app conta com dados, arquivos de shapefile, um arquivo de preparação de dados e o app em si.

```
├── app.R
├── Brasil
│   ├── UFEBRASIL.dbf
│   ├── UFEBRASIL.prj
│   ├── UFEBRASIL.sbn
│   ├── UFEBRASIL.sbx
│   ├── UFEBRASIL.shp
│   └── UFEBRASIL.shx
├── data
│   ├── IST1.rda
│   ├── IST2.rda
│   ├── IST.rda
│   └── map.rda
├── preparation.R
└── shiny-maps.Rproj
```

## Como testar

Para testar basta baixar o repositório no seu computador e abrir o projeto no RStudio:

```
git clone git@github.com:flaviobarros/SOpt-shiny-mapas.git
```

## App em funcionamento

![Image of Yaktocat](https://i.stack.imgur.com/gO5hx.gif)
