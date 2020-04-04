[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![License: CC BY-NC-SA 4.0][license-shield]][license-url]

<br />
<p align="center">
  <h3 align="center">COVID-19 Docker</h3>

  <p align="center">
    Dockerization for the <a href="https://github.com/COVID-19-Bulgaria/covid-scraper">covid-scraper</a> project.
    <br />
    <a href="https://coronavirus-bulgaria.org/"><strong>Live Demo</strong></a>
    <br />
    <br />
    <a href="https://github.com/COVID-19-Bulgaria/covid-docker/issues">Report Bug</a>
    ·
    <a href="https://github.com/COVID-19-Bulgaria/covid-docker/issues">Request Feature</a>
  </p>
</p>

## Table of Contents

* [About the Project](#about-the-project)
  * [Built With](#built-with)
* [Getting Started](#getting-started)
  * [Prerequisites](#prerequisites)
  * [Installation](#installation)
* [Usage](#usage)
* [Roadmap](#roadmap)
* [Contributing](#contributing)
* [License](#license)
* [Contact](#contact)

## About The Project

This project aims to provide an easy setup for development and production environments.
Docker Compose is used for development and Docker Swarm is reusing the compose configuration to spawn the production services.

### Built With
* [Docker](https://www.docker.com/)
* [Docker Compose](https://docs.docker.com/compose/)

## Getting Started

To get a local copy up and running follow these simple example steps.

### Prerequisites

* Docker
* Docker Compose

### Installation

1. Clone the repo
```sh
git clone https://github.com/COVID-19-Bulgaria/covid-docker.git
```
2. Create a configuration file
```sh
cp env-example .env
```
3. Alter the `.env` file with configuration that suites your setup
4. Add `id_rsa` and `id_rsa.pub` files in the `applications/covid-scraper/ssh` folder

## Usage

Run the project:
```sh
docker-compose up
```

Run only specific services:
```sh
docker-compose up database redis
```

Stop all running containers:
```sh
docker-compose down
```

Adminer is accessible on http://localhost:8080 while the sidekiq web interface could be found on http://localhost:9292.

## Roadmap

See the [open issues](https://github.com/COVID-19-Bulgaria/covid-docker/issues) for a list of proposed features (and known issues).

## Contributing

Contributions are what make the open source community such an amazing place to be learn, inspire, and create. Any contributions you make are **greatly appreciated**.

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## License

[![Creative Commons License](https://i.creativecommons.org/l/by-nc-sa/4.0/88x31.png)](http://creativecommons.org/licenses/by-nc-sa/4.0/)
Project is distributed under [Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License](http://creativecommons.org/licenses/by-nc-sa/4.0/).

## Contact

Veselin Stoyanov:
[![LinkedIn][linkedin-shield]][linkedin-url]

[contributors-shield]: https://img.shields.io/github/contributors/COVID-19-Bulgaria/covid-docker.svg?style=flat-square
[contributors-url]: https://github.com/COVID-19-Bulgaria/covid-docker/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/COVID-19-Bulgaria/covid-docker.svg?style=flat-square
[forks-url]: https://github.com/COVID-19-Bulgaria/covid-docker/network/members
[stars-shield]: https://img.shields.io/github/stars/COVID-19-Bulgaria/covid-docker.svg?style=flat-square
[stars-url]: https://github.com/COVID-19-Bulgaria/covid-docker/stargazers
[issues-shield]: https://img.shields.io/github/issues/COVID-19-Bulgaria/covid-docker.svg?style=flat-square
[issues-url]: https://github.com/COVID-19-Bulgaria/covid-docker/issues
[license-shield]: https://img.shields.io/badge/License-CC%20BY--NC--SA%204.0-lightgrey.svg?style=flat-square
[license-url]: https://creativecommons.org/licenses/by-nc-sa/4.0/
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?logo=linkedin&color=blue
[linkedin-url]: https://www.linkedin.com/in/stoyanovv/
