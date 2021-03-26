# Credicorp Challenge - backend

### Prerequisites

You will need installed on your system:
- Ruby version 3.0.0 or greater.
- Rails version 6.1.3 or greater.
- PostgreSql version 13.2 or greater.

### Configuration
  
  Edit file with username and passowrd in ``config/database.yml``

### Database creation
  ```
  rails db:create
  ```

### Database initialization
```
  rails db:migrate
  rails db:seed
  ```
### How to run the test suite
```
  bundle exec rspec
```

### Run
```
  rails s -b 0.0.0.0 -p 3001
```

### Routes
##### Companies routes
+ *GET /api/v1/companies*
  + Return all companies
  + Query params: tax and company_id
+ *POST /api/v1/companies*
  + Create a company
+ *GET /api/v1/companies/:id*
  + Get a company by id
+ *PUT/PATCH /api/v1/companies/:id*
  + Update a company by id
+ *DELETE /api/v1/companies/:id*
  + Destroy a company by id

##### Receivables routes
+ *GET /api/v1/receivables*
  + Return all receivables
  + Query params: tax and receivable_id
+ *POST /api/v1/receivables*
  + Create a receivable
+ *GET /api/v1/receivables/:id*
  + Get a receivable by id
+ *PUT/PATCH /api/v1/receivables/:id*
  + Update a receivable by id
+ *DELETE /api/v1/receivables/:id*
  + Destroy a receivable by id