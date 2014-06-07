Feature: Registration
	


Scenario: Successfull Registration
	Given I open application
	And I press "registracija"
	When I enter "FirstUser1@mail.com" into "mail"
	And I enter "pass1word" into "password"
	And I enter "pass1word" into "confirmPassword"
	And I enter "myCompany" into "company"
	And I enter "00000000011" into "oib"
	And I press "btnRegister"
	Then there is validation message "Odjava" into "btnLogout"
	And I press "btnLogout"

	Scenario: Registration with no data
	Given I open application
	And I press "registracija"
	When I enter "" into "mail"
	And I enter "" into "password"
	And I enter "" into "confirmPassword"
	And I enter "" into "company"
	And I enter "" into "oib"
	And I press "btnRegister"
	Then there is validation message "Email mora biti ispunjeno" into "errMsg1"
	And there is validation message "Lozinka mora biti ispunjeno" into "errMsg2"
	And there is validation message "Ime tvrtke mora biti ispunjeno" into "errMsg3"
	And there is validation message "OIB nije odgovarajuće dužine (mora imati 11 karaktera)" into "errMsg4"

Scenario: Registration with already registered user
	Given I open application
	And I press "registracija"
	When I enter "FirstUser1@mail.com" into "mail"
	And I enter "pass1word" into "password"
	And I enter "pass1word" into "confirmPassword"
	And I enter "myCompany" into "company"
	And I enter "01010101010" into "oib"
	And I press "btnRegister"
	Then there is validation message "Email je zauzeto" into "errMsg"

	Scenario: Registration with already registered OIB
	Given I open application
	And I press "registracija"
	When I enter "notRegistered1@mail.com" into "mail"
	And I enter "pass1word" into "password"
	And I enter "pass1word" into "confirmPassword"
	And I enter "myCompany" into "company"
	And I enter "00000000011" into "oib"
	And I press "btnRegister"
	Then there is validation message "OIB je zauzeto" into "errMsg"

	Scenario: Registration with no mail
	Given I open application
	And I press "registracija"
	When I enter "" into "mail"
	And I enter "pass1word" into "password"
	And I enter "pass1word" into "confirmPassword"
	And I enter "myCompany" into "company"
	And I enter "00000000001" into "oib"
	And I press "btnRegister"
	Then there is validation message "Email mora biti ispunjeno" into "errMsg"

	Scenario: Registration with no password
	Given I open application
	And I press "registracija"
	When I enter "notRegistered1@mail.com" into "mail"
	And I enter "" into "password"
	And I enter "" into "confirmPassword"
	And I enter "myCompany" into "company"
	And I enter "00000000001" into "oib"
	And I press "btnRegister"
	Then there is validation message "Lozinka mora biti ispunjeno" into "errMsg"

	Scenario: Registration with no company name
	Given I open application
	And I press "registracija"
	When I enter "notRegistered1@mail.com" into "mail"
	And I enter "pass1word" into "password"
	And I enter "pass1word" into "confirmPassword"
	And I enter "" into "company"
	And I enter "00000000001" into "oib"
	And I press "btnRegister"
	Then there is validation message "Ime tvrtke mora biti ispunjeno" into "errMsg"

	Scenario: Registration with no OIB
	Given I open application
	And I press "registracija"
	When I enter "notRegistered1@mail.com" into "mail"
	And I enter "pass1word" into "password"
	And I enter "pass1word" into "confirmPassword"
	And I enter "myCompany" into "company"
	And I enter "" into "oib"
	And I press "btnRegister"
	Then there is validation message "OIB nije odgovarajuće dužine (mora imati 11 karaktera)" into "errMsg"

	Scenario: Registration with invalid mail format
	Given I open application
	And I press "registracija"
	When I enter "notRegistered" into "mail"
	And I enter "pass1word" into "password"
	And I enter "pass1word" into "confirmPassword"
	And I enter "myCompany" into "company"
	And I enter "00000000001" into "oib"
	And I press "btnRegister"
	Then there is validation message "Email nije ispravan" into "errMsg"

	Scenario: Registration with invalid password confirmation
	Given I open application
	And I press "registracija"
	When I enter "notRegistered1@mail.com" into "mail"
	And I enter "pass1word" into "password"
	And I enter "password" into "confirmPassword"
	And I enter "myCompany" into "company"
	And I enter "00000000001" into "oib"
	And I press "btnRegister"
	Then there is validation message "Lozinka se ne slaže sa svojom potvrdom" into "errMsg"

	Scenario: Registration with invalid password length 
	Given I open application
	And I press "registracija"
	When I enter "notRegistered1@mail.com" into "mail"
	And I enter "12345" into "password"
	And I enter "12345" into "confirmPassword"
	And I enter "myCompany" into "company"
	And I enter "00000000001" into "oib"
	And I press "btnRegister"
	Then there is validation message "Lozinka je prekratak (ne manje od 6 karaktera)" into "errMsg"

	Scenario: Registration with invalid OIB length, less then 11 characters 
	Given I open application
	And I press "registracija"
	When I enter "notRegistered1@mail.com" into "mail"
	And I enter "pass1word" into "password"
	And I enter "pass1word" into "confirmPassword"
	And I enter "myCompany" into "company"
	And I enter "123456" into "oib"
	And I press "btnRegister"
	Then there is validation message "OIB nije odgovarajuće dužine (mora imati 11 karaktera)" into "errMsg"

    Scenario: Registration with invalid OIB length, more then 11 characters 
	Given I open application
	And I press "registracija"
	When I enter "notRegistered1@mail.com" into "mail"
	And I enter "pass1word" into "password"
	And I enter "pass1word" into "confirmPassword"
	And I enter "myCompany" into "company"
	And I enter "12345678987654321" into "oib"
	And I press "btnRegister"
	Then there is validation message "OIB nije odgovarajuće dužine (mora imati 11 karaktera)" into "errMsg"

	Scenario: Open Login page from Registration
	Given I open application
	And I press "registracija"
	When I press "linkLogin"
	Then there is validation message "Dobrodošli u Biser" into "validationLogin"

	Scenario: Open Forgot Password page from Registration
	Given I open application
	And I press "registracija"
	When I press "linkForgotPasword"
	Then there is validation message "Zaboravili ste lozinku?" into "validationForgotPass"

