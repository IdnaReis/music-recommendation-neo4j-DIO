// === CRIAÇÃO DOS NÓS ===
CREATE (:Artista {nome: 'The Weeknd'})
CREATE (:Artista {nome: 'Dua Lipa'})
CREATE (:Artista {nome: 'Drake'})
CREATE (:Artista {nome: 'Billie Eilish'})
CREATE (:Artista {nome: 'Anitta'})

CREATE (:Genero {nome: 'Pop'})
CREATE (:Genero {nome: 'R&B'})
CREATE (:Genero {nome: 'Hip-Hop'})
CREATE (:Genero {nome: 'Funk'})

CREATE (:Musica {titulo: 'Blinding Lights', ano: 2019})
CREATE (:Musica {titulo: 'Levitating', ano: 2020})
CREATE (:Musica {titulo: 'God Plan', ano: 2018})
CREATE (:Musica {titulo: 'Bad Guy', ano: 2019})
CREATE (:Musica {titulo: 'Envolver', ano: 2021})

// === QUERY DE RECOMENDAÇÃO POR GÊNERO ===
MATCH (u:Usuario {nome: 'Ana'})-[:CURTIU]->(m:Musica)-[:PERTENCE_A]->(g:Genero)<-[:PERTENCE_A]-(rec:Musica)
WHERE NOT (u)-[:CURTIU]->(rec)
RETURN DISTINCT rec.titulo AS Recomendacao, g.nome AS Genero

// === MÚSICAS MAIS CURTIDAS ===
MATCH (u:Usuario)-[:CURTIU]->(m:Musica)
RETURN m.titulo AS Musica, COUNT(u) AS TotalCurtidas
ORDER BY TotalCurtidas DESC
