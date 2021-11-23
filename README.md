# MagiDash Dashboards

### Running the environment

To run the environment, run `docker-compose up --force-recreate` in the terminal.

Once the environment is running, in another shell you should be able to run `./smoke_tests.sh` which will test that the api service returns at least one dashboard and it has the correct properties.

The api is available on `http://localhost/3001`, the client is available on `http://localhost/3000` and the mysql server is available on mysql:3306. These ports can be easily changed in the .env file, however be aware that the `./smoke_tests.sh` file will also need updating.

I had to make some modifications to how `./smoke_tests.sh` determined whether the result of the api call was null as when I first ran it, the tests came back as passing despite me not even having a database linked to my api yet.

## Improvements I would make if I had more time

- I would like to have added more tests other than just the smoke_tests, using the JavaScript testing framework Jest for both the front and backend
- Better styling of the front end
