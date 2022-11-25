(: Requête 4 :)
let $doc := doc("/Users/fchiffol/Downloads/index_person.xml")
let $doc2 := doc("/Users/fchiffol/Downloads/index_place.xml")
for $person in $doc//person
for $place in $doc2//place
where $place/placeName=$person/death/placeName
order by $person/death/date/@when-iso ascending
return $person/persName[1] || " died in " || replace($person/death/date/@when-iso, '-[0-9][0-9]-[0-9][0-9]', '') || " in " || $place/placeName[1] || ", " || $place/country || '&#xa;'

(: 
317 results
Beer, George Louis died in  in New-York, United States of America
Ptolemy died in  in Alexandria, Egypt
Villagarcía, Adolfo died in  in Lima, Peru
Bosseront d'Anglade, Marie Gabriel Georges died in  in Bordeaux, France
d'Estournelles de Constant, Louis died in  in Paris, France
César, Jules died in 0044 in Rome, Italy
Joan of Arc died in 1431 in Rouen, France
Machiavelli, Niccolò died in 1527 in Florence, Italy
Rabelais, François died in 1553 in Paris, France
Tornielli, Niccolò died in 1651 in Rome, Italy
Fabert (de), Abraham died in 1662 in Sedan, France
Pascal, Blaise died in 1662 in Paris, France
Louis XIV of France died in 1715 in Versailles, France
Duguay-Trouin, René died in 1736 in Paris, France
Dupleix, Joseph François died in 1763 in Paris, France
Lally-Tollendal, Thomas died in 1766 in Paris, France
Tiepolo, Giovanni Battista died in 1770 in Madrid, Spain
Louis XV of France died in 1774 in Versailles, France
Demarteau, Gilles died in 1776 in Paris, France
Voltaire died in 1778 in Paris, France
Gainsborough, Thomas died in 1788 in London, England
Reynolds, Joshua died in 1792 in London, England
Louis XVI of France died in 1793 in Paris, France
Danton, Georges died in 1794 in Paris, France
Beaumarchais, Pierre died in 1799 in Paris, France
Washington, George died in 1799 in Mount Vernon, United Stated of America
Jacob, Georges died in 1814 in Paris, France
Ney, Michel died in 1815 in Paris, France
Staël (de), Germaine died in 1817 in Paris, France
Kerllermann (de), François Christophe died in 1820 in Paris, France
Foy, Maximilien Sebastien died in 1825 in Paris, France
Laplace, Pierre-Simon died in 1827 in Paris, France
Surcouf, Robert died in 1827 in Saint-Malo, France
Constant, Benjamin died in 1830 in Paris, France
La Fayette, Marquis de died in 1834 in Paris, France
Cambronne, Pierre died in 1842 in Nantes, France
Stendhal died in 1842 in Paris, France
Balzac, Honoré de died in 1850 in Paris, France
Gogol, Nikolai died in 1852 in Moscow, Russia
Halévy, Jacques-Fromental died in 1862 in Nice, France
Bra, Théophile died in 1863 in Douai, France
Proudhon, Pierre-Joseph died in 1865 in Passy, 
Baudelaire, Charles died in 1867 in Paris, France
Lamartine, Alphonse de died in 1869 in Paris, France
Quinet, Edgar died in 1875 in Versailles, France
Vittorio Emanuele II of Italy died in 1878 in Rome, Italy
Favre, Jules died in 1880 in Versailles, France
Saint-Victor (de), Paul died in 1881 in Paris, France
Marx, Karl died in 1883 in London, England
Hugo, Victor died in 1885 in Paris, France
Charmes, Gabriel died in 1886 in Paris, France
Wilhelm I of Germany died in 1888 in Berlin, Germany
Franck, César died in 1890 in Paris, France
Lockroy died in 1891 in Paris, France
Renan, Ernest died in 1892 in Paris, France
Ferry, Jules died in 1893 in Paris, France
Carnot, Sadi died in 1894 in Lyon, France
Floquet, Charles died in 1896 in Paris, France
Faure, Félix died in 1899 in Paris, France
Erckmann, Émile died in 1899 in Lunéville, France
Zola, Emile died in 1902 in Paris, France
Gascoyne-Cecil, Robert died in 1903 in Hatfield, England
Carrière, Eugène died in 1906 in Paris, France
de Staal, Georges died in 1907 in Paris, France
Berthelot, Marcellin died in 1907 in Paris, France
Campbell-Bannerman, Henry died in 1908 in London, England
Halévy, Ludovic died in 1908 in Paris, France
Ranc, Arthur died in 1908 in Paris, France
Keller, Emile died in 1909 in Paris, France
Chauchard, Alfred died in 1909 in Paris, France
Edward VII died in 1910 in London, England
Brisson, Henri died in 1912 in Paris, France
Claretie, Jules died in 1913 in Paris, France
Pressensé, Francis de died in 1914 in Paris, France
Déroulède, Paul died in 1914 in Nice, France
Calmette, Gaston died in 1914 in Paris, France
Jaurès, Jean died in 1914 in Paris, France
Laroche, Hippolyte died in 1914 in Le Mans, France
Reymond, Emile died in 1914 in Toul, France
Roberts, Frederick died in 1914 in Saint-Omer, France
Messinesi, Jeanne died in 1915 in Le Mans, France
Boll, Léon died in 1916 in Toulon, France
Charmes, Francis died in 1916 in Paris, France
Davignon, Julien died in 1916 in Nice, France
Gallieni, Joseph died in 1916 in Versailles, France
Roth, Alfred died in 1916 in Somme, France
Bernard, Maurice died in 1916 in Pau, France
Dufayel, Georges died in 1916 in Paris, France
Chadwick, Oliver died in 1917 in Belgium, 
Saint-Gervais (de), Marie died in 1917 in La Flèche, France
Liard, Louis died in 1917 in Paris, France
Degas, Edgar died in 1917 in Paris, France
Moneta, Ernesto Teodoro died in 1918 in Milan, Italy
Millevoye, Lucien died in 1918 in Paris, France
Métin, Albert died in 1918 in San Francisco, United States of America
Liebknecht, Karl died in 1919 in Berlin, Germany
Ulloa, Alberto died in 1919 in Lima, Peru
Gentilliez, Charles died in 1919 in Pau, France
Roll, Alfred Philippe died in 1919 in Paris, France
Haase, Hugo died in 1919 in Berlin, Germany
Queri, Georg died in 1919 in Munich, Germany
Millet, René died in 1919 in Paris, France
Dupuy, Jean died in 1919 in Paris, France
Flourens, Émile died in 1920 in Paris, France
Vallé, Ernest died in 1920 in Paris, France
Poincaré, Lucien died in 1920 in Paris, France
Lalance, Auguste died in 1920 in Mulhouse, France
Richemond, Emile died in 1920 in Paris, France
Carnot, Marie-Adolphe died in 1920 in Paris, France
Fisher, John died in 1920 in London, England
Debove, Georges Maurice died in 1920 in Paris, France
Bucher, Pierre died in 1921 in Strasbourg, France
Dato, Eduardo died in 1921 in Madrid, Spain
Dubost, Antonin died in 1921 in Paris, France
Marchal, Anselme died in 1921 in Paris, France
Maud'Huy, Louis de died in 1921 in Paris, France
Perrier, Edmond died in 1921 in Paris, France
Boutroux, Emile died in 1921 in Paris, France
Benedict XV died in 1922 in Rome, Italy
Cochin, Denys died in 1922 in Paris, France
Deschanel, Paul died in 1922 in Paris, France
Siegfried, Julie died in 1922 in Paris, France
Harmsworth, Alfred died in 1922 in London, England
Lavisse, Ernest died in 1922 in Paris, France
Flandin, Etienne died in 1922 in Paris, France
Siegfried, Jules died in 1922 in Le Havre, France
Bonnier, Gaston died in 1922 in Paris, France
Ribot, Alexandre died in 1923 in Paris, France
Masson, Frédéric died in 1923 in Paris, France
Delcassé, Théophile died in 1923 in Nice, France
Lenfant, Eugène died in 1923 in Paris, France
Bérard, Alexandre died in 1923 in Paris, France
Freycinet, Charles de died in 1923 in Paris, France
Croiset, Alfred died in 1923 in Paris, France
Bon (de), Ferdinand-Jean-Jacques died in 1923 in Paris, France
Steinlen, Théophile died in 1923 in Paris, France
Reynaud, Joseph died in 1924 in Paris, France
Nivelle, Robert died in 1924 in Paris, France
Keufer, Auguste died in 1924 in Paris, France
d'Estournelles de Constant, Paul died in 1924 in Paris, France
Townshend, Charles died in 1924 in Paris, France
Cambon, Paul died in 1924 in Paris, France
Touron, Eugène died in 1924 in Paris, France
Alcan, Felix died in 1925 in Paris, France
Hébrard de Villeneuve, Henri died in 1925 in Paris, France
Michel, André died in 1925 in Paris, France
Hekking, André died in 1925 in Paris, France
Méline, Jules died in 1925 in Paris, France
Mercier, Désiré-Joseph died in 1926 in Brussels, Belgium
Willette, Adolphe died in 1926 in Paris, France
Simon, Henry died in 1926 in Paris, France
Langlet, Jean-Baptiste died in 1927 in Reims, France
Cambon, Victor died in 1927 in Paris, France
Duncan, Isadora died in 1927 in Nice, France
Humbert, Charles died in 1927 in Paris, France
Haig, Douglas died in 1928 in London, England
Diaz, Armando died in 1928 in Rome, Italy
Lemire, Jules Auguste died in 1928 in Hazebrouck, France
Téry, Gustave died in 1928 in Paris, France
Bokanowski, Maurice died in 1928 in Toul, France
Percin, Alexandre died in 1928 in Paris, France
Aulard, François Victor Alphonse died in 1928 in Paris, France
Grelling, Richard died in 1929 in Berlin, Germany
Lamarzelle (de), Gustave died in 1929 in Paris, France
Foch, Ferdinand died in 1929 in Paris, France
Sarrail, Maurice died in 1929 in Paris, France
Brent, Charles died in 1929 in Lausanne, Switzerland
Herrick, Myron died in 1929 in Paris, France
Ménard-Dorian, Aline died in 1929 in Paris, France
Prince, Morton Henry died in 1929 in Boston, United States of America
Tuffier, Théodore died in 1929 in Paris, France
Bulöw, Bernhard von died in 1929 in Rome, Italy
Clémenceau, Georges died in 1929 in Paris, France
Raiberti, Flaminius died in 1929 in Nice, France
Sebert, Hippolyte died in 1930 in Paris, France
Blumenthal, Daniel died in 1930 in Paris, France
Davidson, Randall died in 1930 in London, England
Klotz, Louis-Lucien died in 1930 in Paris, France
Appell, Paul died in 1930 in Paris, France
Mirabaud, Albert died in 1930 in Paris, France
Noël, Charles-Ernest died in 1930 in Paris, France
Joffre, Joseph died in 1931 in Paris, France
Indy, Vincent (d') died in 1931 in Paris, France
Flaissières, Siméon died in 1931 in Marseille, France
Gauvain, Auguste died in 1931 in Pau, France
Forain, Jean-Louis died in 1931 in Paris, France
Wetterlé, Emile died in 1931 in Lausanne, Switzerland
Andrieux, Louis died in 1931 in Paris, France
Couyba, Maurice died in 1931 in Paris, France
Loucheur, Louis died in 1931 in Paris, France
Maginot, André died in 1932 in Paris, France
Chaumet, Charles died in 1932 in Paris, France
Briand, Aristide died in 1932 in Paris, France
Gide, Charles died in 1932 in Paris, France
Ogier, Emile died in 1932 in Paris, France
Doumer, Paul died in 1932 in Paris, France
Thomas, Albert died in 1932 in Paris, France
Piou, Jacques died in 1932 in Paris, France
Jusserand, Jean Jules died in 1932 in Paris, France
Brieux, Eugène died in 1932 in Nice, France
Bernstein, Edouard died in 1932 in Berlin, Germany
Descamps, Édouard died in 1933 in Brussels, Belgium
Batut, Ferdinand de la died in 1933 in Paris, France
Painlevé, Paul died in 1933 in Paris, France
Roux, Pierre-Paul Emile died in 1933 in Paris, France
Loustalot, Louis died in 1933 in Paris, France
Lévy, Raphaël-Georges died in 1933 in Paris, France
Dubail, Augustin died in 1934 in Paris, France
Marchand, Jean-Baptiste died in 1934 in Paris, France
Prince Sixtus of Bourbon-Parma died in 1934 in Paris, France
Delagrave, Charles died in 1934 in Paris, France
Las Cases (de), Emmanuel died in 1934 in Paris, France
Thaw, William died in 1934 in Pittsburgh, United States of America
Léandre, Charles Lucien died in 1934 in Montmartre, 
Barthou, Louis died in 1934 in Marseille, France
Poincaré, Raymond died in 1934 in Paris, France
Menier, Gaston died in 1934 in Paris, France
Fournier, Ernest François died in 1934 in Paris, France
Gosselin, Théodore died in 1935 in Paris, France
Chevalier, Pol died in 1935 in Bar-le-Duc, France
Nourry, Émile died in 1935 in Paris, France
Andréadès, André died in 1935 in Athens, Greece
Moch, Gaston died in 1935 in Paris, France
Dreyfus, Alfred died in 1935 in Paris, France
Gerlach, Hellmuth (von) died in 1935 in Paris, France
Barbusse, Henri died in 1935 in Moscow, Russia
Léon, Xavier died in 1935 in Paris, France
Richet, Charles died in 1935 in Paris, France
Lyon-Caen, Charles died in 1935 in Paris, France
Bourget, Paul died in 1935 in Paris, France
Gutchkov, Alexander died in 1936 in Paris, France
Venizelos, Eleftherios died in 1936 in Paris, France
Robert, Henri died in 1936 in Paris, France
Lasteyrie (de), Charles died in 1936 in Paris, France
Blériot, Louis died in 1936 in Paris, France
Chaptal, Léonie died in 1937 in Paris, France
Costa, Afonso died in 1937 in Paris, France
Dunne, Edward died in 1937 in Chicago, United States of America
Wallace, Mildred Fuller died in 1937 in New-York, United States of America
Franklin-Bouillon, Henry died in 1937 in Paris, France
Habert, Marcel died in 1937 in Paris, France
Lebey, André died in 1938 in Paris, France
Matter, Paul died in 1938 in Paris, France
Cels, Jules died in 1938 in Paris, France
Pédoya, Gustave died in 1938 in Paris, France
Bourdon, Georges died in 1938 in Paris, France
Vandervelde, Emile died in 1938 in Brussels, Belgium
Abrami, Léon died in 1939 in Paris, France
Lévi, Israël died in 1939 in Paris, France
Guépratte, Émile Paul Amable died in 1939 in Brest, France
Bouglé, Célestin died in 1940 in Paris, France
Lavedan, Henri died in 1940 in Paris, France
Béhague (de), Berthe died in 1940 in Paris, France
Bourgeon, Philibert died in 1940 in Dijon, France
Bergson, Henri died in 1941 in Paris, France
Alfonso XIII of Spain died in 1941 in Rome, Italy
Hymans, Paul died in 1941 in Nice, France
Gallois, Lucien died in 1941 in Paris, France
Poisson, Ernest died in 1942 in Paris, France
Baudrillart, Alfred died in 1942 in Paris, France
Targe, Antoine died in 1942 in Vichy, France
Caillaux, Henriette died in 1943 in Mamers, France
Millerand, Alexandre died in 1943 in Versailles, France
Monod, Wilfred died in 1943 in Paris, France
La Fontaine, Henri died in 1943 in Brussels, Belgium
Guernut, Henri died in 1943 in Paris, France
Grandmaison (de), Georges died in 1943 in Paris, France
Ajam, Pierre Maurice died in 1944 in Le Mans, France
Hanotaux, Gabriel died in 1944 in Paris, France
Hervé, Gustave died in 1944 in Paris, France
Hennessy, Jean died in 1944 in Lausanne, Switzerland
Caillaux, Joseph died in 1944 in Mamers, France
Otlet, Paul died in 1944 in Brussels, Belgium
Donnay, Charles Maurice died in 1945 in Paris, France
Faivre, Abel died in 1945 in Nice, France
Frossard, Ludovic-Oscar died in 1946 in Paris, France
Vincent, Daniel died in 1946 in Paris, France
Vincent, Daniel died in 1946 in Paris, France
Dion (de), Jules-Albert died in 1946 in Paris, France
Briat, Edmond died in 1948 in Paris, France
Prudhommeaux, Jules died in 1948 in Versailles, France
Bloch, Camille died in 1949 in Paris, France
Malvy, Louis died in 1949 in Paris, France
Fromageot, Henri died in 1949 in Versailles, France
Lebrun, Albert died in 1950 in Paris, France
Nijinsky, Vaslav died in 1950 in London, England
Sangnier, Marc died in 1950 in Paris, France
Steeg, Théodore died in 1950 in Paris, France
Deyvaux-Gassier, Henri-Paul died in 1951 in Paris, France
Bérenger, Victor Henry died in 1952 in Nice, France
Orlando, Vittorio Emanuele died in 1952 in Rome, Italy
Teck (of), Mary died in 1953 in London, England
Gout, Jean died in 1953 in Paris, France
Fonck, René died in 1953 in Paris, France
Jouhaux, Léon died in 1954 in Paris, France
Lancien, Ferdinand died in 1955 in Finistère, France
Lapradelle (de), Albert Geouffre died in 1955 in Paris, France
Lacaze, Marie-Jean-Lucien died in 1955 in Paris, France
Fouqueray, Charles died in 1956 in Paris, France
Godart, Justin died in 1956 in Paris, France
Rudler, Gustave died in 1957 in Paris, France
Rouché, Jacques died in 1957 in Paris, France
Brailsford, Henry Noel died in 1958 in London, England
Farman, Henri died in 1958 in Paris, France
Bazelaire, Paul died in 1958 in Paris, France
Castellane (de), Stanislas died in 1959 in Paris, France
Sangro y Ros de Olano, Pedro died in 1959 in Madrid, Spain
Buquin, René died in 1961 in La Flèche, France
Chambrun (de), Aldebert died in 1962 in Paris, France
Lovejoy, Arthur Oncken died in 1962 in Baltimore, United States of America
Elisabeth of Belgium died in 1965 in Brussels, Belgium
Puech-Milhau, Marie-Louise died in 1966 in Paris, France
Prado Ugarteche, Manuel died in 1967 in Paris, France
Moutet, Marius died in 1968 in Paris, France
Weill, Georges died in 1970 in Paris, France
Paul-Boncour, Joseph died in 1972 in Paris, France
Edouard VIII of the United Kingdom died in 1972 in Paris, France 
:)