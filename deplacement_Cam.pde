/* Pour manipuler la camera 

- Touche haut : + zoom, - Touche bas : - zoom
- Touche droite : deplacement dans le y positif, touche z : deplacement dans le y negatif
- touche gauche : deplacement dans le x positif, touche a : deplacement dans le x negatif

*/

/**
 afficher et cacher pylones : p
 afficher et cacher lignes electriques : l

**/

void keyPressed() {
  
  float decalage = 15;
  // haut pour zoomer
  if (keyCode == 38){
        
    if(zposCam >= -200){
      zposCam -= decalage;
    }
  }
  // bas pour dezoomer
  if (keyCode == 40){
     zposCam += decalage;
  }
  // gauche
   if (keyCode == 37){
     yPosCam -= decalage;
  }
  
  
  // touche a 
  if (keyCode == 81){
     xPosCam -= decalage;
  }
  
  // droite
  if (keyCode == 39){
     yPosCam += decalage;
  }
  
  // touche z
  if (keyCode == 87){
     xPosCam += decalage;
  }
  
    // touche p
  if (keyCode == 80){
     afficherModelePylones = !afficherModelePylones;
  }
  
  
    // touche p
  if (keyCode == 76){
     afficherModeleLignes = !afficherModeleLignes;
  }
  
  
}
