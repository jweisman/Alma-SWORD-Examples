# Alma SWORD Samples

This repository contains samples of how to call the [Alma SWORD](https://developers.exlibrisgroup.com/alma/integrations/sword) implementation from several programming environments. For each example, the sword user, password and on-behalf-of parameters need to be configured.

For more information on these samples, see this [blog post](https://developers.exlibrisgroup.com/blog/Getting-Started-with-SWORD-Digital-Deposits).

## CURL

Update the shell script with your parameters and then run it.
`$ ./sword.sh`

## PHP

First, git clone the PHP client:
`$ git clone https://github.com/swordapp/swordappv2-php-library.git client`

Then update the parameters and run the script:
`$ php sword.php`

## Ruby

First, install the dependencies:
`$ bundle install`

Then update the parameters and run the script:
`$ bundle exec ruby sword.rb`

## Node

First, install the dependencies:
`$ npm install`

Then update the parameters and run the script:
`$ node sword.js`