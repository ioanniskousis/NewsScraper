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

NewsScraper is an application that gathers content from news websites, shows the results organized in sections of interest and performs searching.  
By targeting particular mark-up elements, searches for titles and descriptions of news. For each website to search it’s content a configuration file is required which is added to the source modules list. The configuration file uses detailed format described in the configuration section of this document.
At this current version, two news paper sites are configured, the Newsweek and The New York Times websites.  
In order to expand scraping, one can create a new configuration module and add it to the source modules list.

<!-- TABLE OF CONTENTS -->

## Table of Contents

- [About the Project](#about-the-project)
- [Application Instructions](#application-instructions)
- [Configuration and Expansion](#configuration-and-expansion)
- [Development](#development)
- [Testing](#testing)
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

  The program starts listing the available sources.  
  By selecting a source typing it's relevant number the configured sections list appear.  
  By selecting a section typing it's relevant number a list of  articles of the selected section appears showing their headers.  
  By selecting an article typing it's relevant number the header and description of the selected article appears.  
  Consecutive pressing the return key returns to the initial screen with the list of sources.  
  Entering 's' lets to provide a text to be searched in either all sources or the particular selected source.

## Configuration and Expansion  

Configuration modules are Hash instances extensions.  
To extend a hash with a particular module the extend method is selected by a hash instance providing the class name in the module. Then the setup method of the module is selected by the hash.  
The setup method of the extension fills the hash with three key-value pairs. 
  * The :caption key with value an arbitrary entry that identifies the source
  * The :url key with value the URL of the targeted website
  * The :section_hashes key and value an array of hashes each with following entries
    * :section_id or :section_class to target a section in the mark-up using either the id of the element or it's css class
    * :title_tag or :title_class to target the element containing the title of the section, using either the id of the element or it's css class. If no :section_id nor :section_class are given, then a :title key is required with an arbitrary value. In this case the scraping for articles is performed into the total mark-up of the site.
    * :article_tag or :article_class to target the elements of the section containing article content, using either the element's tag or it's css class
    * :article_header_tag or :article_header_class to target the header of the article, using either the element's tag or it's css class
    * :article_desc_tag or :article_desc_class to target the description of the article, using either the element's tag or it's css class

In order to expand the program so it can scrap news from other website, a configuration module has to be created according to the two provided templates and do the following changes in the news_scraper file
  * Add an entry after the 'require_relative' entries pointing the configuration file  
      ```
      require_relative '<new_configuration_file>'
      ```
  * Add code similar to 
      ```
      <new_hash> = {}
      <new_hash>.extend(<new_class>)
      <new_hash>.setup
      ```
  * Create an instance of Source Class providing the new_hash and add the instance to the sources array
      ```
      @sources << Source.new(<new_hash>)
      ```

## Development
  * Clone the project
  ```
  https://github.com/ioanniskousis/NewsScraper.git
  ```
  * Run the Application

  In order to run the application, just type: `news_scraper` and press enter!  

## Testing

  Test units are in spec/scraper_spec.rb file.  
  Tests are applied so they depend on the content of the web sites which may vary.  
  Please note that news websites change their content on a fast pace and in a case that some tests fail due to this reason, you main apply the following changes in the spec/scraper_spec.rb file.  
    * Change lines 66, 67 and 68 so constant strings refer to existing content in the actual articles headings  
    * Change lines 94, 95 and 96 so constant strings refer to existing content in the actual articles description  

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
