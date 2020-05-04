/*
	3.Rewrite the query in Listing 13-25 using the ts_rank_cd() function instead of ts_rank().
	 According to the PostgreSQL documentation, ts_rank_cd() computes cover density, 
	 which takes into account how close the lexeme search terms are to each other.
	 Does using the ts_rank_cd() function significantly change the results?
*/

SELECT president,
         speech_date,
         ts_rank(search_speech_text,
                 to_tsquery('war')) AS score
  FROM president_speeches
  WHERE search_speech_text @@ to_tsquery('war')
  ORDER BY score DESC
  LIMIT 5;

SELECT president,
         speech_date,
         ts_rank_cd(search_speech_text,
                 to_tsquery('war')) AS score
  FROM president_speeches
  WHERE search_speech_text @@ to_tsquery('war')
  ORDER BY score DESC
  LIMIT 5;









