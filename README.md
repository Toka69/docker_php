# Docker Template - PHP project

## Version 1.0.2 - May 2020

*   This stack provides a development environment ready to run a PHP project.
*   Prerequisite : to have Docker and Docker-Compose installed on your machine - [Docker Install](https://docs.docker.com/install/)
*   Preferred Operating System to use it : Linux / Mac OSx

-------------------------------------------------------------------------------------------------------------------------------------

Realized thanks to Yann LUCAS [(see GitHub)](https://github.com/drixs6o9) support.

Maintained and adapted by Adrien PIERRARD [(see GitHub)](https://github.com/WizBhoo).

-------------------------------------------------------------------------------------------------------------------------------------

### The Docker-Compose / Containers provided :

*   Nginx / Nginx Proxy
*   PHP 7.2 fpm alpine version
*   MySQL (PHP container allows SQLite if preferred) : ready to be used with MySQL 8
*   PHPMyAdmin
*   Blackfire - to allow you to analyze your website performance with Blackfire companion (performance tests and graph analysis)

Some containers have specifications to be mentioned :

*   PHP is provided with a usual toolkit to allow you to manage your project from the PHP container shell and following component are available too :

    *   Composer
    *   Zsh / Ho-My-Zsh
    *   PHP Probe for Blackfire => please refer to instruction below to know how to setup Blackfire
    *   A pre-setup php.ini will be copied during PHP container building

*   Blackfire-agent and Blackfire CLI tools are already provided in the Blackfire container (PHP Probe as mentioned above is setup with PHP)

    *   You need to create an account on [Blackfire](https://blackfire.io/) to obtain ID and TOKEN keys for client and server.
    *   Then copy and rename the .env.dist file as .env file to put your personal keys inside.
    *   Don't forget to install Blackfire companion for Chrome or Firefox.
    *   To know more about how to install Blackfire (also locally in your machine for example), please refer to [Blackfire Installation](https://blackfire.io/docs/up-and-running/installation)

-------------------------------------------------------------------------------------------------------------------------------------

## How to launch your project environment

*   So easy !!! You just have to clone this repository in your preferred project directory.

```
git clone https://github.com/WizBhoo/docker_php_project.git
```

*   Go to the docker_php cloned folder with your terminal (you can rename it as you want)

<blockquote>
Note that Make command is available thanks to the Makefile provided.

To know which commands are available use "make help" in your terminal.
</blockquote>

*   Use appropriate make command to build containers and launch the docker environment

*   Well done, you are ready to work on your PHP project ! Look into the php_project folder created... and init git with a first commit.

-------------------------------------------------------------------------------------------------------------------------------------

## Advanced configuration

*   Two virtual hosts are defined for locally use : [mon-site.localhost](http://mon-site.localhost) (site homepage)  &  [pma.localhost](http://pma.localhost) (PHPMyAdmin interface).

*   In the docker-compose file you will find environment variables for MySQL and PHPMyAdmin. You can edit them at your convenience.

-------------------------------------------------------------------------------------------------------------------------------------

## Contact

Thanks in advance for Star contribution.

Any question / trouble ?

Please send me an [e-mail](mailto:apierrard.contact@gmail.com) ;-)
