--Tables
SELECT * FROM constituencywise_details
SELECT * FROM constituencywise_results
SELECT * FROM partywise_results
SELECT * FROM statewise_results
SELECT * FROM states

-- Total Seats
SELECT 
DISTINCT COUNT(parliament_constituency) 
AS Total_Seats FROM constituencywise_results;

--What are the total number of seats available for elections in each state

SELECT  states.State AS State_Name, COUNT(constituencywise_results.Parliament_Constituency) AS Total_Seats
FROM constituencywise_results INNER JOIN statewise_results ON constituencywise_results.Parliament_Constituency = statewise_results.Parliament_Constituency
INNER JOIN states ON statewise_results.State_ID = states.State_ID
GROUP BY states.State;

--Total Seats won by NDA Alliance 
SELECT SUM(CASE WHEN party IN (
	'Bharatiya Janata Party - BJP',
	'Telugu Desam - TDP',
	'Janata Dal  (United) - JD(U)',
	'Shiv Sena - SHS',
	'AJSU Party - AJSUP',
	'Apna Dal (Soneylal) - ADAL',
	'Asom Gana Parishad - AGP',
	'Hindustani Awam Morcha (Secular) - HAMS',
	'Janasena Party - JnP',
	'Janata Dal  (Secular) - JD(S)',
	'Lok Janshakti Party(Ram Vilas) - LJPRV',
	'Nationalist Congress Party - NCP',
	'Rashtriya Lok Dal - RLD',
	'Sikkim Krantikari Morcha - SKM') THEN [WON] ELSE 0 
	END) AS Total_Seats_Won_By_NDA FROM partywise_results;

--Seats won by NDA Aliiance Parties
SELECT party AS Party_name, won AS Seats_Won 
FROM partywise_results
WHERE party IN (
	'Bharatiya Janata Party - BJP',
	'Telugu Desam - TDP',
	'Janata Dal  (United) - JD(U)',
	'Shiv Sena - SHS',
	'AJSU Party - AJSUP',
	'Apna Dal (Soneylal) - ADAL',
	'Asom Gana Parishad - AGP',
	'Hindustani Awam Morcha (Secular) - HAMS',
	'Janasena Party - JnP',
	'Janata Dal  (Secular) - JD(S)',
	'Lok Janshakti Party(Ram Vilas) - LJPRV',
	'Nationalist Congress Party - NCP',
	'Rashtriya Lok Dal - RLD',
	'Sikkim Krantikari Morcha - SKM') 
ORDER BY Seats_Won DESC;


--Total Seats won by I.N.D.I.A Alliance parties 
SELECT	
SUM(CASE
		WHEN Party IN (
			'Indian National Congress - INC',
			'Aam Aadmi Party - AAAP',
			'All India Trinamool Congress - AITC',
			'Communist Party of India  (Marxist) - CPI(M)',
			'Communist Party of India  (Marxist-Leninist)  (Liberation) - CPI(ML)(L)',
			'Communist Party of India - CPI',
			'Dravida Munnetra Kazhagam - DMK',
			'Indian Union Muslim League - IUML',
			'Jammu & Kashmir National Conference - JKN',
			'Jharkhand Mukti Morcha - JMM',
			'Nat  Jammu and Kashmir National Conference - JKN',
			'Kerala Congress - KEC',
			'Marumalarchi Dravida Munnetra Kazhagam - MDMK',
			'Nationalist Congress Party Sharadchandra Pawar - NCPSP',
			'Rashtriya Janata Dal - RJD',
			'Rashtriya Loktantrik Party - RLTP',
			'Revolutionary Socialist Party - RSP',
			'Samajwadi Party - SP',
			'Shiv Sena (Uddhav Balasaheb Thackrey) - SHSUBT',
			'Viduthalai Chiruthaigal Katchi - VCK' )
			THEN [WON] ELSE 0 
		END) AS INDIA_party_won_seats
FROM partywise_results;


--Seats won by I.N.D.I.A. Alliance Parties 
SELECT Party AS Party_Name, Won AS Seats_Won 
FROM partywise_results 
WHERE Party IN ('Indian National Congress - INC',
			'Aam Aadmi Party - AAAP',
			'All India Trinamool Congress - AITC',
			'Communist Party of India  (Marxist) - CPI(M)',
			'Communist Party of India  (Marxist-Leninist)  (Liberation) - CPI(ML)(L)',
			'Communist Party of India - CPI',
			'Dravida Munnetra Kazhagam - DMK',
			'Indian Union Muslim League - IUML',
			'Jammu & Kashmir National Conference - JKN',
			'Jharkhand Mukti Morcha - JMM',
			'Kerala Congress - KEC',
			'Marumalarchi Dravida Munnetra Kazhagam - MDMK',
			'Nationalist Congress Party Sharadchandra Pawar - NCPSP',
			'Rashtriya Janata Dal - RJD',
			'Rashtriya Loktantrik Party - RLTP',
			'Revolutionary Socialist Party - RSP',
			'Samajwadi Party - SP',
			'Shiv Sena (Uddhav Balasaheb Thackrey) - SHSUBT',
			'Viduthalai Chiruthaigal Katchi - VCK' )
ORDER BY Seats_Won DESC;

--Add new column field in table partywise_results to get Party Allianz as 
ALTER TABLE partywise_results 
ADD Party_Alliance VARCHAR(100) 
UPDATE partywise_results
SET Party_Alliance = 'NDA'
WHERE Party IN (
	'Bharatiya Janata Party - BJP',
	'Telugu Desam - TDP',
	'Janata Dal  (United) - JD(U)',
	'Shiv Sena - SHS',
	'AJSU Party - AJSUP',
	'Apna Dal (Soneylal) - ADAL',
	'Asom Gana Parishad - AGP',
	'Hindustani Awam Morcha (Secular) - HAMS',
	'Janasena Party - JnP',
	'Janata Dal  (Secular) - JD(S)',
	'Lok Janshakti Party(Ram Vilas) - LJPRV',
	'Nationalist Congress Party - NCP',
	'Rashtriya Lok Dal - RLD',
	'Sikkim Krantikari Morcha - SKM')  
UPDATE partywise_results
SET Party_Alliance = 'I.N.D.I.A'
WHERE Party IN (
	'Indian National Congress - INC',
			'Aam Aadmi Party - AAAP',
			'All India Trinamool Congress - AITC',
			'Communist Party of India  (Marxist) - CPI(M)',
			'Communist Party of India  (Marxist-Leninist)  (Liberation) - CPI(ML)(L)',
			'Communist Party of India - CPI',
			'Dravida Munnetra Kazhagam - DMK',
			'Indian Union Muslim League - IUML',
			'Jammu & Kashmir National Conference - JKN',
			'Jharkhand Mukti Morcha - JMM',
			'Kerala Congress - KEC',
			'Marumalarchi Dravida Munnetra Kazhagam - MDMK',
			'Nationalist Congress Party Sharadchandra Pawar - NCPSP',
			'Rashtriya Janata Dal - RJD',
			'Rashtriya Loktantrik Party - RLTP',
			'Revolutionary Socialist Party - RSP',
			'Samajwadi Party - SP',
			'Shiv Sena (Uddhav Balasaheb Thackrey) - SHSUBT',
			'Viduthalai Chiruthaigal Katchi - VCK' )

UPDATE partywise_results 
SET Party_Alliance = 'OTHER'
WHERE Party_Alliance IS NULL

--Which party alliance (NDA, I.N.D.I.A, OTHER) won the most seats across all states
SELECT Party_Alliance, SUM(WON) FROM partywise_results
GROUP BY Party_Alliance
ORDER BY SUM(WON) DESC;

--Winning candidate's name, their party name, alliance, total votes and the margin of victory for a specific state and constituency 
SELECT constituencywise_results.Winning_Candidate,
	partywise_results.Party,
	partywise_results.Party_Alliance,
	constituencywise_results.Total_Votes,
	constituencywise_results.Margin,
	constituencywise_results.Constituency_Name
FROM constituencywise_results INNER JOIN partywise_results ON constituencywise_results.Party_ID = partywise_results.Party_ID
INNER JOIN statewise_results ON constituencywise_results.Parliament_Constituency = statewise_results.Parliament_Constituency
INNER JOIN States ON statewise_results.State_ID = states.State_ID
WHERE constituencywise_results.Constituency_Name = 'MAHBUBNAGAR';
 

 --What is the distribution of EVM votres vs postal votes for candidates in specific constituency
 SELECT constituencywise_details.Candidate,
 constituencywise_details.EVM_Votes,
 constituencywise_details.Postal_Votes,
 constituencywise_details.Total_Votes,
 constituencywise_results.Constituency_Name
 FROM constituencywise_results INNER JOIN constituencywise_details
 ON constituencywise_results.Constituency_ID = constituencywise_details.Constituency_ID
 WHERE constituencywise_results.Constituency_Name = 'AMETHI';

 --Which parties won the seats in a state and how many seats did each party win  
 SELECT  partywise_results.Party, COUNT(constituencywise_results.Constituency_ID) AS Seats_Won
 FROM partywise_results INNER JOIN constituencywise_results ON partywise_results.Party_ID = constituencywise_results.Party_ID
 INNER JOIN statewise_results ON constituencywise_results.Parliament_Constituency = statewise_results.Parliament_Constituency 
 INNER JOIN states ON statewise_results.State_ID = states.State_ID
 WHERE states.State = 'KARNATAKA'
 GROUP BY partywise_results.Party
 ORDER BY Seats_Won DESC;

 --What is the total number of seats won by each party alliance(NDA, I.N.D.I.A and OTHER) in each state
 SELECT states.State, SUM(CASE WHEN partywise_results.Party_Alliance = 'NDA' THEN 1 ELSE 0 END) AS Seats_Won_BY_NDA,
	SUM(CASE WHEN partywise_results.Party_Alliance = 'I.N.D.I.A' THEN 1 ELSE 0 END) AS Seats_Won_BY_INDIA,
	SUM(CASE WHEN partywise_results.Party_Alliance = 'OTHER' THEN 1 ELSE 0 END) AS Seats_Won_BY_OTHER
 FROM partywise_results INNER JOIN constituencywise_results ON partywise_results.Party_ID = constituencywise_results.Party_ID
 INNER JOIN statewise_results ON constituencywise_results.Parliament_Constituency = statewise_results.Parliament_Constituency 
 INNER JOIN states ON statewise_results.State_ID = states.State_ID
 GROUP BY states.State;

 --Which candidate received the highest number of evm votes in each constituency 
SELECT TOP 10
    cr.Constituency_Name,
    cd.Constituency_ID,
    cd.Candidate,
    cd.EVM_Votes
FROM 
    constituencywise_details cd
JOIN 
    constituencywise_results cr ON cd.Constituency_ID = cr.Constituency_ID
WHERE 
    cd.EVM_Votes = (
        SELECT MAX(cd1.EVM_Votes)
        FROM constituencywise_details cd1
        WHERE cd1.Constituency_ID = cd.Constituency_ID
    )
ORDER BY 
    cd.EVM_Votes DESC;


--Which candidate won and which candidate was the runner up in each constituency of state 
WITH RankedCandidates AS (
    SELECT 
        cd.Constituency_ID,
        cd.Candidate,
        cd.Party,
        cd.EVM_Votes,
        cd.Postal_Votes,
        cd.EVM_Votes + cd.Postal_Votes AS Total_Votes,
        ROW_NUMBER() OVER (PARTITION BY cd.Constituency_ID ORDER BY cd.EVM_Votes + cd.Postal_Votes DESC) AS VoteRank
    FROM 
        constituencywise_details cd
    JOIN 
        constituencywise_results cr ON cd.Constituency_ID = cr.Constituency_ID
    JOIN 
        statewise_results sr ON cr.Parliament_Constituency = sr.Parliament_Constituency
    JOIN 
        states s ON sr.State_ID = s.State_ID
    WHERE 
        s.State = 'Maharashtra'
)

SELECT 
    cr.Constituency_Name,
    MAX(CASE WHEN rc.VoteRank = 1 THEN rc.Candidate END) AS Winning_Candidate,
    MAX(CASE WHEN rc.VoteRank = 2 THEN rc.Candidate END) AS Runnerup_Candidate
FROM 
    RankedCandidates rc
JOIN 
    constituencywise_results cr ON rc.Constituency_ID = cr.Constituency_ID
GROUP BY 
    cr.Constituency_Name
ORDER BY 
    cr.Constituency_Name;

--For a state, what are the total number of seats, total number of candidates, total number of parties, total votes(including EVM and postal) and breakdown of EVM and postal votes
SELECT COUNT(DISTINCT constituencywise_details.Constituency_ID) AS Total_Seats,  COUNT(DISTINCT constituencywise_details.Candidate) AS Total_Candidates, 
COUNT(DISTINCT partywise_results.Party) AS Total_Parties, 
SUM(constituencywise_details.Total_Votes) AS Total_Votes, SUM(constituencywise_details.EVM_Votes) AS Total_EVM_Votes, SUM(constituencywise_details.Postal_Votes) AS Total_Postal_Votes
FROM constituencywise_details INNER JOIN constituencywise_results ON constituencywise_details.Constituency_ID = constituencywise_results.Constituency_ID
INNER JOIN partywise_results ON constituencywise_results.Party_ID = partywise_results.Party_ID 
INNER JOIN statewise_results ON constituencywise_results.Parliament_Constituency = statewise_results.Parliament_Constituency 
INNER JOIN states ON statewise_results.State_ID = states.State_ID 
WHERE states.State = 'Telangana';