# MoneyCashboard - Parsing of the requirement document

Original objectives expanded into sentences and put onto new lines.

This is a *noun* which might lead to a class or attribute

This is a __verb__ which might lead to a use case or method

## MUST

*User* must be able to __track__ *spending* in an attempt to __be more frugal__ with *money*.

*Developer* has decided to make a *budgeting app* to help *user* __see__ where *money* is being __spent__.

*User* must be able to __CRUD__ *Transactions* (e.g. Create, Retrieve, Update, Delete) with the following properties:

*Transactions* must include a *merchant name* (e.g. Tesco, free text type)

*Transactions* must include a *value* (use a positive number between 0.01 and 10000)

*Transactions* must include a *text tag* (a classification, there should be stored separately, perhaps on a separate table. Starts as *unclassified* but can be __amended__ by user to be any entry of that table)

*User* should be able to __view__ *uncategorised transactions*

*Transactions* should include a *date*

A selection of *Months* should be available to __report__ on all of the *dates*

Ability to __add__ *missing months* where a *transaction* is for a *date* which doesn't match any *month* on the *months list*. This is the ability to __CR__ (not CRUD!) the *months*.

Ability to __CRUD__ the *text tags* except *unclassified* which cannot be __edited__. Start out with a list of 5 or so *text tags* which cannot be __edited or deleted__ if they are in use.

*User* to __display__ / *Application* to __provide__ *various lists*: *all transactions*, *transactions in a month*, *transactions by tag*, *transactions by tag and month*. Each of these should have a *total spend* __calculated__.

## SHOULD

*User* should be able to __set__ a *hard coded budget*. Lets assume that is for *each tagged category* and is *the limit for the monthly spend in that category*

*Database* should __warn__ *user* when *expenditure* for a particular *tag* in a particular *month* is over the *budget*.

## COULD

There should be an option to __add__ in some *new random transactions* to simulate __import__ of a *bank statement* for a new *month* or *months*
