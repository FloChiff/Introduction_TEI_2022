let $doc := doc("/Users/fchiffol/Downloads/index_place.xml") 
(: On définit une constante qui indique que l'index des lieux sera compris dans une variable qui s'appelera doc et qu'on devra appeler avec le signe $ :)
for $place in $doc//place
(: On définit une variable $place qui comprendra le contenu de chacune des balises "place" dans l'index :)
order by $place/@type descending
(: On ordonne le résultat par ordre alphabétique inversé (de Z à A), en prenant comme référence le type du lieu :)
return $place/placeName[1] || " is a " || $place/@type || '&#xa;'
(: On aura comme résultat une phrase, grâce à l'utilisation d'une technique pour concaténer, qui permet d'imprimer plusieurs éléments ensemble. Ici, le résultat contiendra le premier nom de lieu, chaine de texte donnée et le type du lieu :)
(: L'élément de fin permet d'assurer que les résultats soient donnés ligne par ligne :)