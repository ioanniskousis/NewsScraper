# NewsScraper

<!--
*** Thanks for checking out this README Template. If you have a suggestion that would
*** make this better, please fork the repo and create a pull request or simply open
*** an issue with the tag "enhancement".
*** Thanks again! Now go create something AMAZING! :D
-->

<!-- PROJECT SHIELDS -->
<!--
*** I'm using markdown "reference style" links for readability.
*** Reference links are enclosed in brackets [ ] instead of parentheses ( ).
*** See the bottom of this document for the declaration of the reference variables
*** for contributors-url, forks-url, etc. This is an optional, concise syntax you may use.
*** https://www.markdownguide.org/basic-syntax/#reference-style-links
-->

[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]

<!-- PROJECT LOGO -->
<br />
<p align="center">
  <a href="https://github.com/ioanniskousis/NewsScraper">
    <img src="images/microverse.png" alt="Microverse Logo" width="80" height="80">
  </a>
  
  <h3 align="center">NewsScraper</h3>
  
  <p align="center">
    This project is part of the Microverse curriculum in Ruby module!
    <br />
    <a href="https://github.com/ioanniskousis/NewsScraper"><strong>Explore the docs »</strong></a>
    <br />
    <br />
    <a href="https://repl.it/@ioanniskousis/NewsScraper">View Demo</a>
    <a href="https://github.com/ioanniskousis/NewsScraper/issues">Report Bug</a>
    <a href="https://github.com/ioanniskousis/NewsScraper/issues">Request Feature</a>
  </p>
</p>

NewsScraper is an application that gathers content from news websites and shows the results organized in sections of interest.  
By targeting particular mark-up elements, searches for titles and descriptions of news. For each website to search it’s content a configuration file is required which is added to the source modules list. The configuration file uses detailed format described in the configuration section of this document.
At this current version, two news paper sites are configured, the Newsweek and The New York Times websites.  
In order to expand scraping, one can create a new configuration module and add it to the source_modules list.

<!-- TABLE OF CONTENTS -->

## Table of Contents

- [About the Project](#about-the-project)
- [Application Instructions](#application-instructions)
- [Configuration and Expansion](#configuration-and-expansion)
- [Built With](#built-with)
- [Live Version](#live-version)
- [Acknowledgements](#acknowledgements)
- [License](#license)

<!-- ABOUT THE PROJECT -->

## About The Project

The project consists of the following files

- The 'bin' folder

* news_scraper
  The news_scraper is the executable file that controls the program logic and the interface.  
  Uses a loop tracking the status of the program and shows available options depending on each status.  

- The 'lib' folder

* source.rb
  This class controls gathering content from a particular website.

* section.rb
  This class controls gathering content from a particular section.

* article.rb
  This class controls gathering content from a particular article.

* utils.rb
  This file contains helper methods for parsing text and interface format.

* string.rb
  This module provides extension to the String Class.

- The 'resources' folder

* newsweek.rb
  This is a configuration file for the Newsweek website

* nytime.rb
  This is a configuration file for the New York Times website

<!-- ABOUT THE PROJECT -->
## Application Instructions


## Configuration and Expansion

## Development
* Clone the project
```
https://github.com/ioanniskousis/NewsScraper.git
```
* Run the Application

In order to run the application, just type: `news_scraper` and press enter!  

## Testing

In order to run the application, just type: "main" and press enter!

### Built With

This project was built using these technologies.

- Ruby
- Rubocop
- VsCode
- Git-Flow
- nokogiri gem

<!-- LIVE VERSION -->

## Live version

You can see it working [![Run on Repl.it](https://repl.it/badge/github/ioanniskousis/NewsScraper)](https://repl.it/@ioanniskousis/NewsScraper)

<!-- CONTACT -->

## Contributors

:bust_in_silhouette: **Author**
​## Ioannis Kousis

- Github: [@ioanniskousis](https://github.com/ioanniskousis)
- Twitter: [@ioanniskousis](https://twitter.com/ioanniskousis)
- Linkedin: [Ioannis Kousis](https://www.linkedin.com/in/ioannis-kousis-9a5051b4/)
- E-mail: jgkousis@gmail.com

<!-- ACKNOWLEDGEMENTS -->

## Acknowledgements

- [Microverse](https://www.microverse.org/)
- [The Odin Project](https://www.theodinproject.com/)
- [Ruby Documentation](https://www.ruby-lang.org/en/documentation/)

<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->

[contributors-shield]: https://img.shields.io/github/contributors/ioanniskousis/NewsScraper.svg?style=flat-square
[contributors-url]: https://github.com/ioanniskousis/NewsScraper/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/ioanniskousis/NewsScraper.svg?style=flat-square
[forks-url]: https://github.com/ioanniskousis/NewsScraper/network/members
[stars-shield]: https://img.shields.io/github/stars/ioanniskousis/NewsScraper.svg?style=flat-square
[stars-url]: https://github.com/ioanniskousis/NewsScraper/stargazers
[issues-shield]: https://img.shields.io/github/issues/ioanniskousis/NewsScraper.svg?style=flat-square
[issues-url]: https://github.com/ioanniskousis/NewsScraper/issues

<!-- LICENSE -->

## License

📝
This project is [MIT](https://opensource.org/licenses/MIT) licensed.
