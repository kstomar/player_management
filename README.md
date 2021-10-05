# Player Management 

## Table of contents

* Dependencies
* Set up
* Contributing
* Branches

## Dependencies

* Ruby '2.7.1'
* Rails '~>6.1.4'
* SQL Database: PostgreSQL
* Elasticsearch

## Set up

* Install PostgreSQL

	https://www.postgresql.org/docs/11/tutorial-install.html

* Install Elasticsearch

    https://www.elastic.co/guide/en/elasticsearch/reference/current/install-elasticsearch.html


* Clone the repo.
```
    git clone https://github.com/kstomar/player_management.git
```

* Install dependencies
```
	cd player_management
	bundle install
```
    
* Add database configuration and add your system user.
```
    database.yml
```

* Create database.

```
    rails db:create
```
* Migrate database.

```
    rails db:migrate
```
* Seed database.

```
    rails db:seed
```

* Reindex all models - Rails only.

```
    bundle exec rails searchkick:reindex:all RAILS_ENV=development                                                   
```
## Contributing

In order to contribute, developer should follow following guidelines.

* Take fresh pull from *main* branch.
* Create a new branch 
* Update your branches daily with *main* to prevent merge conflicts

## Branches

* _main:  This contains release code base. Merging into this will push the
 code to live application.
