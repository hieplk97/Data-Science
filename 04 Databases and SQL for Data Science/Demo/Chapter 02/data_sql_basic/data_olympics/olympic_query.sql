SELECT CountryName FROM olympic.country;

SELECT DISTINCT CountryName FROM olympic.country JOIN olympic.medals ON olympic.country.CountryCode = olympic.medals.CountryCode WHERE olympic.medals.Medal = 'Gold';

SELECT * FROM olympic.medals WHERE olympic.medals.Medal = 'Gold' ORDER BY CountryCode DESC, Athlete DESC;