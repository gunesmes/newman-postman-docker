## INSTALL
You need node first, check this https://nodejs.org/en/download/

Then install Postman and Newman as Node package

```
npm install -g newman
npm install -g newman-reporter-html
```

## RUN

First restore test database then run the newman test.


```
mesut@MESUTs-MBP ~/D/tps-services> ruby restore_data.rb & newman run tps.postman_collection.json -e tps-local.postman_environment.json --reporters cli,html --reporter-html-template report-template.hbs

#  * * * * * * RESTORE TEST DATA  * * * * *

# DELETE ALL THE RECORDS IN THE FOLLOWING TABLE
NOTICE:  truncate cascades to table "payment_options"
NOTICE:  truncate cascades to table "user_vehicles"
NOTICE:  truncate cascades to table "sessions"
NOTICE:  truncate cascades to table "sessions"
NOTICE:  truncate cascades to table "sessions"
NOTICE:  truncate cascades to table "user_vehicles"
NOTICE:  truncate cascades to table "sessions"
NOTICE:  truncate cascades to table "user_vehicles"
NOTICE:  truncate cascades to table "sessions"

# INSERT INITIAL DATA FOR THE FOLLOWING TABLES

# INSERT A USER

# INSERT A SECOND USER

# INSERT THREE VEHICLES

# INSERT A PAYMENT OPTIONS

# INSERT TWO USER_VEHICLE FOR USER 1

# INSERT ONE USER_VEHICLE FOR USER 2

#  * * * * * * RESTORE COMPLETED  * * * * *
newman

tps

→ delete vehicle
  DELETE http://localhost:9000/user/2/vehicles/2 [200 OK, 333B, 33ms]
  ✓  Status code is 200

→ createUser
  POST http://localhost:9000/user [201 Created, 615B, 22ms]
  ✓  Status code is 201
  ✓  id should be equal to 3
  ✓  beamerId should not be equal to null
  ✓  createdAt should include Europe/Istanbul
  ✓  updatedAt should include Europe/Istanbul

→ update vehicle
  PUT http://localhost:9000/user/1/vehicles/3 [200 OK, 547B, 38ms]
  ✓  Status code is 200
  ✓  vehicleId should be equal to 3

→ Get vehicles
  GET http://localhost:9000/user/1/vehicles [200 OK, 742B, 19ms]
  ✓  Status code is 200
  ✓  Number of vehicles should be equal to 2
  ✓  First vehicle's userId and vehicleId should be equal to 1
  ✓  Second vehicle's userId and vehicleId should be equal to 1 and 3 respectively

→ create vehicle
  POST http://localhost:9000/user/1/vehicles [201 Created, 544B, 36ms]
  ✓  Status code is 201
  ✓  userId of the vehicle should be equal to 1
  ✓  vehicleId of the vehicle should be equal to 4

┌─────────────────────────┬──────────┬──────────┐
│                         │ executed │   failed │
├─────────────────────────┼──────────┼──────────┤
│              iterations │        1 │        0 │
├─────────────────────────┼──────────┼──────────┤
│                requests │        5 │        0 │
├─────────────────────────┼──────────┼──────────┤
│            test-scripts │        5 │        0 │
├─────────────────────────┼──────────┼──────────┤
│      prerequest-scripts │        0 │        0 │
├─────────────────────────┼──────────┼──────────┤
│              assertions │       15 │        0 │
├─────────────────────────┴──────────┴──────────┤
│ total run duration: 304ms                     │
├───────────────────────────────────────────────┤
│ total data received: 970B (approx)            │
├───────────────────────────────────────────────┤
│ average response time: 29ms                   │
└───────────────────────────────────────────────┘


```