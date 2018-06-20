//fonction qui renvoie le nombre de voyelle dans une phrase

function nbr_voys1(str){
  let tab = ['a','A','e','E','i','I','o','O','u','U','y','Y'];
  let cpt = 0;
  for (x=0;x<str.length;x++){
    for (j=0;j<tab.length;j++){
      if(str[x]==tab[j]){
        cpt=cpt+1;
      }
    }
  }
  return cpt;
}

//fonction qui renvoie le nombre de caractere speciaux dans une phrase

function nbr_carac(str){
  let tab = [' ','/','*','+','-',',',';','.'];
  let cpt = 0;
  for (x=0;x<str.length;x++){
    for (j=0;j<tab.length;j++){
      if(str[x]==tab[j]){
        cpt=cpt+1;
      }
    }
  }
  return cpt;
}

//fonction qui renvoie le nombre consonnes dans une phrase

function nbr_cons1(str){
  return str.length - nbr_voys1(str) - nbr_carac(str);
}


//On declare les vraibales globales que l'on va utiliser (passage par effet de bord)

let s = document.getElementById("textF").value;
let a = 2;
let b = 3;


//la fonction qui s'execute lors de click sur le bouton

function clicked(){
  var d = new Promise(function myPromiseLogic(success,error,progress){ //On cree une promise qui recupere la valuer saissie par l'utilisateur et met à jour la variable s
    success(s=document.getElementById("textF").value)}).then(function(){
    Promise.all([cons,voys])}).then(function(){ //On attend la fin des deux promise (cons et voys qui calculent le nbr de voyelles et le nbr de consonnes) puis on affiche les réslatat à l'interrieur des balises <p>
      document.getElementById("count").innerHTML=a;
      document.getElementById("count2").innerHTML=b;
    });

    var cons = new Promise(function myPromiseLogic(success,error,progress){
      success(a=nbr_cons1(s))

    });
    
    var voys = new Promise(function myPromiseLogic(success,error,progress){
      success(b=nbr_voys1(s))
  })
}

  