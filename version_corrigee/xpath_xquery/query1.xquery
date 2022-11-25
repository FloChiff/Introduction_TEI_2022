(: Requête 1 :)
let $doc := doc("/Users/fchiffol/Downloads/index_person.xml")
for $person in $doc//person
where $person/occupation = "journalist"
return $person/persName[1] || '&#xa;'

(: 
91 results
<persName>Almereyda, Miguel</persName>
<persName>Andrieux, Louis</persName>
<persName>Angell, Norman</persName>
<persName>Cassagnac, Paul Granier de</persName>
<persName>Gauvain, Auguste</persName>
<persName>Aulard, François Victor Alphonse</persName>
<persName>Balzac, Honoré de</persName>
<persName>Barbusse, Henri</persName>
<persName>Barrès, Maurice</persName>
<persName>Blanc, Louis</persName>
<persName>Blum, Léon</persName>
<persName>Boll, Léon</persName>
<persName>Bourdon, Georges</persName>
<persName>Bourget, Paul</persName>
<persName>Briand, Aristide</persName>
<persName>Brieux, Eugène</persName>
<persName>Brisson, Henri</persName>
<persName>Scott, James Brown</persName>
<persName>Calmette, Gaston</persName>
<persName>Cambon, Victor</persName>
<persName>Charmes, Francis</persName>
<persName>Charmes, Gabriel</persName>
<persName>Chartier, Emile</persName>
<persName>Chéradame, André</persName>
<persName>Clémenceau, Georges</persName>
<persName>Cunliffe Owen, Frederick</persName>
<persName>Daudet, Léon</persName>
<persName>Pierrefeu (de), Jean</persName>
<persName>Delcassé, Théophile</persName>
<persName>Deschanel, Paul</persName>
<persName>Dubost, Antonin</persName>
<persName>Duval, Émile-Joseph</persName>
<persName>Fernau, Hermann</persName>
<persName>Ferry, Jules</persName>
<persName>Cook Morehouse, Frederic</persName>
<persName>Gautier, Théophile</persName>
<persName>Gerlach, Hellmuth (von)</persName>
<persName>Goddard, Harold Clarke</persName>
<persName>Holman, Alfred</persName>
<persName>Humbert, Charles</persName>
<persName>Jaurès, Jean</persName>
<persName>Hay, John</persName>
<persName>Kennan, George</persName>
<persName>Klotz, Louis-Lucien</persName>
<persName>Kovalevsky, Maksim</persName>
<persName>Lacaze, Marie-Jean-Lucien</persName>
<persName>Lauzanne, Stéphane</persName>
<persName>Lavedan, Henri</persName>
<persName>Marx, Karl</persName>
<persName>Maúrtua, Victor M.</persName>
<persName>Milyukov, Pavel</persName>
<persName>Millevoye, Lucien</persName>
<persName>Mithouard, Adrien</persName>
<persName>Moneta, Ernesto Teodoro</persName>
<persName>Harmsworth, Alfred</persName>
<persName>Pichon, Stephen</persName>
<persName>Poincaré, Raymond</persName>
<persName>Pressensé, Francis de</persName>
<persName>Quinet, Edgar</persName>
<persName>Renaudel, Pierre</persName>
<persName>Sangnier, Marc</persName>
<persName>Sauerwein, Jules</persName>
<persName>Sembat, Marcel</persName>
<persName>Tardieu, André</persName>
<persName>Téry, Gustave</persName>
<persName>Thiers, Adolphe</persName>
<persName>Ulloa, Alberto</persName>
<persName>Venizelos, Eleftherios</persName>
<persName>Wetterlé, Emile</persName>
<persName>Weill, Georges</persName>
<persName>Zola, Emile</persName>
<persName>Ochs, Adolphe</persName>
<persName>Grelling, Richard</persName>
<persName>Roberts, Elmer</persName>
<persName>Proudhon, Pierre-Joseph</persName>
<persName>Stone, Melville</persName>
<persName>Sjostedt, Erik</persName>
<persName>Capus, Alfred</persName>
<persName>Mézières, Alfred</persName>
<persName>Hervé, Gustave</persName>
<persName>Frossard, Ludovic-Oscar</persName>
<persName>Franklin, Benjamin</persName>
<persName>Krans, Horatio Sheafe</persName>
<persName>Ranc, Arthur</persName>
<persName>Claretie, Jules</persName>
<persName>Baudelaire, Charles</persName>
<persName>Barthou, Léon</persName>
<persName>Ernest-Charles, Jean</persName>
<persName>Brailsford, Henry Noel</persName>
<persName>Mandel, Georges</persName>
<persName>Longuet, Jean</persName>
:)