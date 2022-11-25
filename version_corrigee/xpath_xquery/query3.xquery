(: Requête 3 :)
let $doc := doc("/Users/fchiffol/Downloads/index_person.xml")
for $person in $doc//person
where $person/event/p="Nobel Peace Prize"
order by $person/persName[1]
return $person/persName[1] || " was a " || $person/nationality || " " || $person/occupation[1] || " Nobel Peace Prize" || '&#xa;'

(:
18 results
Angell, Norman was a British  lecturer Nobel Peace Prize
Bourgeois, Léon was a French politician Nobel Peace Prize
Briand, Aristide was a French politician Nobel Peace Prize
Buisson, Ferdinand was a French politician Nobel Peace Prize
Butler, Nicholas Murray was a American philosopher Nobel Peace Prize
Cecil, Robert was a British politician Nobel Peace Prize
Fried, Alfred Hermann was a Austrian pacifist Nobel Peace Prize
Jouhaux, Léon was a French trade unionist Nobel Peace Prize
La Fontaine, Henri was a Belgian politician Nobel Peace Prize
Lange, Christian was a Norwegian historian Nobel Peace Prize
Moneta, Ernesto Teodoro was a Italian journalist Nobel Peace Prize
Passy, Frédéric was a French economist Nobel Peace Prize
Quidde, Ludwig was a German politician Nobel Peace Prize
Renault, Louis was a French jurist Nobel Peace Prize
Rooservelt, Théodore was a American historian Nobel Peace Prize
Root, Elihu was a American politician Nobel Peace Prize
Wilson, Woodrow was a American politician Nobel Peace Prize
d'Estournelles de Constant, Paul was a French diplomat Nobel Peace Prize
:)