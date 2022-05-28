var faixaIdade;
var idadeNf = resultIdade;
var lista = ["< 1ANO", "1 A 9 ANOS", "10 A 19 ANOS", "20 A 29 ANOS", "30 A 39 ANOS", "40 A 49 ANOS", "50 A 59 ANOS", "60 A 69 ANOS", "70 A 79 ANOS", "80 A 89 ANOS", "90 OU MAIS" ]

if(idadeNf < 1) {
    faixaIdade = lista[0];
} 
else if(idadeNf >= 1 && idadeNf <= 9){
    faixaIdade = lista[1];
}
else if(idadeNf >= 10 && idadeNf <= 19){
    faixaIdade = lista[2];
}
else if(idadeNf >= 20 && idadeNf <= 29){
    faixaIdade = lista[3];
}
else if(idadeNf >= 30 && idadeNf <= 39){
    faixaIdade = lista[4];
}
else if(idadeNf >= 40 && idadeNf <= 49){
    faixaIdade = lista[5];
}
else if(idadeNf >= 50 && idadeNf <= 59){
    faixaIdade = lista[6];
}
else if(idadeNf >= 60 && idadeNf <= 69){
    faixaIdade = lista[7];
}
else if(idadeNf >= 70 && idadeNf <= 79){
    faixaIdade = lista[8];
}
else if(idadeNf >= 80 && idadeNf <= 89){
    faixaIdade = lista[9];
}
else if(idadeNf > 90 ){
    faixaIdade = lista[10];
}
