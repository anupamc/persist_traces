## Getting Started

1. Clone the repo

   ```
   $ git clone git@github.com:anupamc/persist_traces.git
   $ cd persist_traces
   ```

2. Install dependencies

   ```
   $ bundle install
   ```

3. Watch the specs pass

   ```
   $ rspec spec
   ... 0 failures

4. Starting the web server
 	 
 	 ```
   $ rails s
   ```

## To perform CRUD on the restful resource "trace" in postman

   POST : localhost:3000/traces

	 GET : localhost:3000/traces/1

	 PUT : localhost:3000/traces/1

   DELETE : localhost:3000/traces/1