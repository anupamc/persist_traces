## Getting Started

1. Clone the repo

   ```
   $ git clone git@github.com:anupamc/persist_traces.git
   $ cd rails-api-example
   ```

2. Install dependencies

   ```
   $ bundle install
   ```

3. Watch the specs pass

   ```
   $ bundle exec rspec
   ... 0 failures

4. Starting the web server
 	 
 	 ```
   $ rails s
   ```

## To perform CRUD on the restful resource "trace" in postman

   POST : localhost:3000/traces

   Body:

   [{ "latitude": 32.9377784729004, "longitude": -117.230392456055 }, 
		{ "latitude": 32.937801361084, "longitude": -117.230323791504 }, 
		{ "latitude": 32.9378204345703, "longitude": -117.230278015137 }, 
		{ "latitude": 32.9378204345703, "longitude": -117.230239868164 }]

	GET : localhost:3000/traces/1

	PUT : localhost:3000/traces/1
   
	Body:

   { "latitude": 32.9377784729004, "longitude": -57.230392456055 }

  DELETE : localhost:3000/traces/1