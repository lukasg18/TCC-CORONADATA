var faixaIdade;
var idadeNf = resultIdade;
var lista = ["< 1ANO", "1 A 9 ANOS", "10 A 19 ANOS", "20 A 29 ANOS", "30 A 39 ANOS", "40 A 49 ANOS", "50 A 59 ANOS", "60 A 69 ANOS", "70 A 79 ANOS", "80 A 89 ANOS", "90 OU MAIS" ]

if(idadeNf == "< 10 anos") {
    faixaIdade = lista[1];
} 
else if(idadeNf == ">= 80 anos"){
    faixaIdade = lista[9];
}
else if(idadeNf == "10 a 14 anos"){
    faixaIdade = lista[2];
}
else if(idadeNf == "15 a 19 anos"){
    faixaIdade = lista[2];
}
