## INSTALL
You need node first, check this https://nodejs.org/en/download/

Then install Postman and Newman as Node package

`npm install -g newman`
`npm install -g newman-reporter-html`

## RUN

```
mesut@MESUTs-MBP ~/P/p/newman-postman-docker> newman run newman-postman-docker.postman_collection.json -e local-env.postman_environment.json --reporters cli,html --reporter-html-template report-template.hbs
newman

newman-postman-docker

→ delete vehicle
  DELETE http://localhost:9000/user/2/vehicles/2 [200 OK, 333B, 82ms]
  ✓  Status code is 200

→ createUser
  POST http://localhost:9000/user [201 Created, 615B, 24ms]
  ✓  Status code is 201
  ✓  id should be equal to 3
  ✓  id should not be equal to null
  ✓  createdAt should include Europe/Istanbul
  ✓  updatedAt should include Europe/Istanbul

┌─────────────────────────┬──────────┬──────────┐
│                         │ executed │   failed │
├─────────────────────────┼──────────┼──────────┤
│              iterations │        1 │        0 │
├─────────────────────────┼──────────┼──────────┤
│                requests │        2 │        0 │
├─────────────────────────┼──────────┼──────────┤
│            test-scripts │        4 │        0 │
├─────────────────────────┼──────────┼──────────┤
│      prerequest-scripts │        2 │        0 │
├─────────────────────────┼──────────┼──────────┤
│              assertions │        6 │        0 │
├─────────────────────────┴──────────┴──────────┤
│ total run duration: 213ms                     │
├───────────────────────────────────────────────┤
│ total data received: 243B (approx)            │
├───────────────────────────────────────────────┤
│ average response time: 53ms                   │
└───────────────────────────────────────────────┘
``