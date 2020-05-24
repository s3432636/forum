<div align="center">
  <h1>Playerly</h1>
  <h3>Discussion board for finding teams and players.</h3>
</div>

## Overview

This is a playerly discussion board for CC 2020 Sem 2.

## Getting started

Following these instructions will get you a copy of Playerly forum up and running on your local machine for development and testing purposes.

### Prerequisites

Before we begin, make sure that you have the following installed first before continuing.
```
Ruby
Rails
Postgres Database
```

### Installation

To get started with Playerly, clone the repository and then install the needed gems:
```
$ bundle install --without production
```

Next, migrate the database:
```
$ rails db:migrate
```

Run the test suite to verify that everything is working correctly:
```
$ rails test
```

If the test suite passes, you'll be ready to run Playerly in a local server:
```
$ rails server
```
